// See http://iphonedevwiki.net/index.php/Logos

#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import "NSRunLoop+XYExtensions.h"
#import "AwemeApiHeaders.h"
#import "MBProgressHUD+XYHUD.h"
#import "BridgingHelper.h"
#import "XYAwemeManager.h"
#import "XYSimulatedTouch.h"
#import "UIAlertController+XYExtensions.h"
#import "XYVideoDownloader.h"

/*
 {
 "log_pb": {
 "impr_id": "20200129101722010012033045056C213D"
 },
 "status_code": 2147,
 "status_msg": "发言太快了，请你控计里寄几～"
 }
 */

/*
 {
 "status_code": 2150,
 "status_msg": "手速太快了，休息一下吧～",
 "log_pb": {
 "impr_id": "2020012910161301000807704803798469"
 }
 }
 */


#define kAwemeDylibNotificationName "com.enba.preferencesChanged"

static void notificationCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
    XYAwemeManager *manager = [XYAwemeManager manager];
    manager.authorizedToDownload = @YES;
}


%hook AWEFeedTableViewController

// 记录最后自动滑动的位置
%property (nonatomic) NSIndexPath *xy_lastAutoScrollIndexPath;
%property (nonatomic, strong) XYVideoDownloader *xy_downloader;

#pragma mark - Timer methods
%new
- (void)xy_startAutoPlayNext {
    if (self.viewIsDisappear == YES) {
        return;
    }
    if ([UIApplication sharedApplication].applicationState != UIApplicationStateActive) {
        return;
    }
    if (XYAwemeManager.manager.isAutoPlayNext == NO) {
        [self.view xy_showMessage:@"自动播放已关闭\n可去设置中开启哦！"];
        return;
    }
    self.isStartPlayNext = YES;
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(xy_automaticPlayNext) object:nil];
    
    if ((self.autoScrollCount + 1) % 70 == 0) {
        [self.view xy_hideHUD];
        [self.view xy_showMessage:@"滑动视频多久啦\n去微信看看吧!"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [XYAwemeManager openWechat];
        });
        
        self.autoScrollCount += 1;
        return;
    }
    
    // 15秒容易出现手【手速太快了，休息一下吧～】, 导致无法点赞
    // 让下一次执行的时间随机
    CGFloat delay = MAX(arc4random_uniform(19), 11);
    CGFloat delayTime = 3.0;
    NSString *message = [NSString stringWithFormat:@"自动播放已开启\n可在设置中以关闭\n当前播放第%ld个", self.autoScrollCount ];
    if (self.autoScrollCount > 80) {
        delay = MAX(arc4random_uniform(35), 18);
        message = [NSString stringWithFormat:@"超过80次自动化速度将会被降低\n当前播放第%ld个", self.autoScrollCount];
    }
    if ((self.autoScrollCount + 1) % 55 == 0) {
        // 每55 次 就休息一次
        delay = MAX(arc4random_uniform(260), 160);
        message = [NSString stringWithFormat:@"休息%1.f秒\当前播放第%ld个", delay, self.autoScrollCount];
        delayTime = delay;
    }
    
    if ((self.autoScrollCount + 1) % 70 == 0) {
        [self xy_refreshNewVideosWithBlock:^{
            [self performSelector:@selector(xy_automaticPlayNext) withObject:nil afterDelay:delay inModes:@[NSDefaultRunLoopMode]];
        }];
    }
    else {
        [self performSelector:@selector(xy_automaticPlayNext) withObject:nil afterDelay:delay inModes:@[NSDefaultRunLoopMode]];
    }
    
    
    [self.view xy_hideHUD];
    [self.view xy_showMessage:message delayTime:delayTime];
    XYLog(@"当前播放第%ld个", self.autoScrollCount);
}

%new
- (void)xy_stopAutoPlayNext {
    
    self.isStartPlayNext = NO;
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(xy_automaticPlayNext) object:nil];
    
    [self.view xy_hideHUD];
    [self.view xy_showMessage:[NSString stringWithFormat:@"自动播放已关闭\n去设置中开启\n当前播放第%ld个", self.autoScrollCount]];
    XYLog(@"当前已停止播放");
}


%new
- (void)xy_automaticPlayNext {
    // [[[UIApplication sharedApplication].delegate window] rootViewController]
    XYLog(@"%@", self.navigationController.viewControllers);
    // "<AWEFeedRootViewController: 0x10fc43460>"
    __block NSString *logInfo = @"";
    @try {
        UITableView *tableView = MSHookIvar<UITableView*>(self, "_tableView");
        NSIndexPath *visibleIndexPath = [tableView indexPathsForVisibleRows].firstObject;
        if (!visibleIndexPath) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self xy_startAutoPlayNext] ;
            });
            return;
        }
        // 先滚动下去 再滚动上去 再滚动下去
        
        dispatch_block_t completionBlock = ^{
            if ([XYAwemeManager isLogin] == NO) {
                 // 未登陆
                self.autoScrollCount += 1;
                [self xy_startAutoPlayNext];
                return;
            }
            
            id visibleCell = [tableView visibleCells].firstObject;
            // AWEFeedLiveStreamTableViewCell 直播的cell
            // 视频cell AWEFeedViewCell
            if (!visibleCell) {
                // 不存在播放中的视频
                self.autoScrollCount += 1;
                [self xy_startAutoPlayNext];
                return;
            }
            if ([visibleCell isKindOfClass:NSClassFromString(@"AWEFeedLiveStreamTableViewCell")]) {
                // 当前在直播中，忽略
                self.autoScrollCount += 1;
                [self xy_startAutoPlayNext];
                return;
            }
            
            AWEFeedCellViewController *viewController = MSHookIvar<AWEFeedCellViewController*>(visibleCell, "_viewController");
            AWEAwemePlayInteractionViewController *iVC = viewController.interactionController;
            
            // 如果是没有账号的广告或者正在直播 直接划过去
            if (iVC.model.isNoAccountAd == YES || iVC.model.isLive == YES) {
                self.autoScrollCount += 1;
                [self xy_startAutoPlayNext];
                return;
            }
            
            // 模拟点赞完成后的回调
            void (^likeCompletion)(void) = ^{
                
                if ((self.autoScrollCount + 1) % 8 == 0) {//点赞所有
                    [self xy_likeAllVideosByUserDetailVCWithBlock:^{
                        self.autoScrollCount += 1;
                        [self xy_startAutoPlayNext];
                    }];
                }
                else
                    if ((self.autoScrollCount + 1) % 12 == 0) {
                    [self xy_reportVideoWithInteractionViewController:iVC block:^{
                        self.autoScrollCount += 1;
                        [self xy_startAutoPlayNext];
                    }];
                }
                // 每 7次 收藏一波音乐
                else if ((self.autoScrollCount + 1) % 9 == 0) {
                    logInfo = @"(self.autoScrollCount + 1) % 7 == 0";
                    
                    [self xy_collectionMusicWithInteractionViewController:iVC block:^{
                        self.autoScrollCount += 1;
                        [self xy_startAutoPlayNext];
                    }];
                    
                }
                // 每8次评论
                else if ((self.autoScrollCount + 1) % 7 == 0) {
                    logInfo = @"(self.autoScrollCount + 1) % 8 == 0";
                    // 弹出评论列表评论
                    [self xy_commentWithInteractionViewController:iVC block:^{
                        self.autoScrollCount += 1;
                        [self xy_startAutoPlayNext];
                    }];
                }
                // 每11次 评论+关注
                else if ((self.autoScrollCount + 1) % 10 == 0) {
                    logInfo = @"(self.autoScrollCount + 1) % 11 == 0";
                    // 弹出评论列表评论
                    [self xy_commentWithInteractionViewController:iVC block:^{
                        if (iVC.model.isAds == YES) {
                            // 如果是广告，忽略
                            self.autoScrollCount += 1;
                            [self xy_startAutoPlayNext];
                            return;
                        }
                        if (iVC.model.author.followStatus == 1) {
                            // 已关注就不再打开详情页了
                            self.autoScrollCount += 1;
                            [self xy_startAutoPlayNext];
                            return;
                        }
                        [self xy_followCurrentUserWithInteractionViewController:iVC block:^{
                            self.autoScrollCount += 1;
                            [self xy_startAutoPlayNext];
                        }];
                    }];
                }
                // 每12次 进入搜索页搜索当前用户，并且关注他
                else if ((self.autoScrollCount + 1) % 13 == 0) {
                    logInfo = @"(self.autoScrollCount + 1) % 13 == 0";
                    // 搜索当前视频的作者，并关注
                    [self xy_searchWithKeyword:nil block: ^{
                        // 有bug，多次被调用评论了
                        // 关注完成后，点赞该视频
                        // 弹出评论列表评论
                        //                        [self xy_commentWithInteractionViewController:iVC block:^{
                        self.autoScrollCount += 1;
                        [self xy_startAutoPlayNext];
                        //                        }];
                    }];
                }
                // 每15次 关注一波
                else if ((self.autoScrollCount + 1) % 15 == 0) {
                    logInfo = @"(self.autoScrollCount + 1) % 15 == 0";
                    if (iVC.model.author.followStatus == 1) {
                        // 已关注就不再打开详情页了
                        self.autoScrollCount += 1;
                        [self xy_startAutoPlayNext];
                    }
                    else {
                        [self xy_followCurrentUserWithInteractionViewController:iVC block:^{
                            self.autoScrollCount += 1;
                            [self xy_startAutoPlayNext];
                        }];
                    }
                    
                }
                else {
                    self.autoScrollCount += 1;
                    [self xy_startAutoPlayNext];
                }
                
            };
            
            // 每6次就有一次不点赞，防止被认为=机器人
            // 点赞 独立
            if ((self.autoScrollCount + 1) % 6 != 0) {
                logInfo = @"(self.autoScrollCount + 1) % 6 != 0";
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(arc4random_uniform(6) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self xy_likeWithInteractionViewController:iVC block:likeCompletion];
                });
            }
            else {
                likeCompletion();
            }
            
        };
        
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:visibleIndexPath.row + 1 inSection:visibleIndexPath.section];
        
        // 滚动到下一个视频
        if ((self.autoScrollCount + 1) % 2 == 0) {
            logInfo = @"(self.autoScrollCount + 1) % 2 == 0";
            // 直接滚过去
            [self xy_scrollToIndexPath:nextIndexPath completion: ^{
                
                dispatch_async(dispatch_get_main_queue(), completionBlock);
                
            }];
        }
        else {
            // 先滚动到下一个，再滚到上一个，再滚到下一个
            [self xy_scrollToIndexPath:nextIndexPath completion: ^{
                [self xy_scrollToIndexPath:visibleIndexPath completion: ^{
                    [self xy_scrollToIndexPath:nextIndexPath completion: ^{
                        
                        dispatch_async(dispatch_get_main_queue(), completionBlock);
                        
                    }];
                }];
            }];
        }
        
    } @catch (NSException *exception) {
        XYLog(@"catch出错了%@", exception.reason);
        [self.view xy_hideHUD];
        [self.view xy_showMessage:[NSString stringWithFormat:@"出错了%@\%@", exception.reason, logInfo]];
    } @finally {
        //        [self.view xy_hideHUD];
        //        [self.view xy_showMessage:[NSString stringWithFormat:@"finally出错了\%@", logInfo]];
    }
}

%new
- (void)xy_refreshNewVideosWithBlock:(void (^)(void))block {
    dispatch_async(dispatch_get_main_queue(), ^{
        // 切换到首页的控制器
        AWETabbarControllerConfig *tabbarConfig = [NSClassFromString(@"AWETabbarControllerConfig") performSelector:@selector(sharedInstance)];
        [tabbarConfig.feedButton onTouchUpInside:tabbarConfig.feedButton.singleTapGes];
        // 进入用户的首页
        [tabbarConfig.feedController.navigationController popToRootViewControllerAnimated:NO];
                   
       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 下拉刷新
            CGPoint feedButtonPoint = [tabbarConfig.feedButton convertPoint:tabbarConfig.feedButton.frame.origin toView:[UIApplication sharedApplication].delegate.window];
            // 点击 首页的tabbar 执行下拉刷新
            [[XYSimulatedTouch sharedInstance] touchesWithPoint:feedButtonPoint];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                 if (block) {
                     block();
                 }
            });
       });
    });
}

%new
- (void)xy_logoutWithBlock:(void (^)(void))block {
    // 退出登陆
    if ([XYAwemeManager isLogin] == NO) {
        if (block) {
            block();
        }
        return;
    }
    AWETabBarController *rootViewController = (AWETabBarController *)[[[UIApplication sharedApplication].delegate window] rootViewController];
    if (![rootViewController isKindOfClass:NSClassFromString(@"AWETabBarController")]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (block) {
                block();
            }
        });
        return;
    }
    
    // 切换到我的控制器
    AWETabbarControllerConfig *tabbarConfig = [NSClassFromString(@"AWETabbarControllerConfig") performSelector:@selector(sharedInstance)];
    [tabbarConfig.homepageButton onTouchUpInside:tabbarConfig.homepageButton.singleTapGes];
    // 进入用户的首页
    [tabbarConfig.userHomeController.navigationController popToRootViewControllerAnimated:NO];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        AWEUserHomeViewController *userHomeController = (AWEUserHomeViewController *)tabbarConfig.userHomeController;
                   
        // 展开侧边栏控制器slid vc
        [userHomeController  sliderMenuButtonClicked:nil];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
            // 进入设置页面
            [userHomeController.profileSettingSliderVC.viewModel tapSettingCell];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                // 找到设置控制器
                __block AWESettingsTableViewController *settingsVC = nil;
                [userHomeController.navigationController.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if ([obj isKindOfClass:NSClassFromString(@"AWESettingsTableViewController")]) {
                        settingsVC = obj;
                        *stop = YES;
                    }
                }];
                
                if (settingsVC == nil) {
                    if (block) {
                        block();
                    }
                    return;
                }
                
                if (userHomeController.navigationController.topViewController != settingsVC) {
                    [userHomeController.navigationController popToViewController:settingsVC animated:NO];
                }
                
                [[XYSimulatedTouch sharedInstance] swapUp];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    
                    
                    // 查找退出cell 的 所处的indexPath
                    NSIndexPath *logoutIndexPath = nil;
                    for (NSInteger i = 0; i < [settingsVC.viewModel sectionDataArray].count; i++) {
                        AWESettingSectionModel *sectionModel =[settingsVC.viewModel sectionDataArray][i];
                        
                        for (NSInteger p = 0; p < sectionModel.itemArray.count; p++) {
                            AWESettingItemModel *item = sectionModel.itemArray[p];
                            if ([item.identifier isEqualToString:@"logout"]) {
                                logoutIndexPath = [NSIndexPath indexPathForRow:p inSection:i];
                                break;
                            }
                        }
                    }
                    
                    if (logoutIndexPath == nil) {
                        if (block) {
                            block();
                        }
                        return;
                    }
                    
                    // 点击退出cell
                    [settingsVC tableView:settingsVC.tableView didSelectRowAtIndexPath:logoutIndexPath];
                    
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        
                        UIAlertController *alertController = [UIAlertController xy_topAlertController];
                        if (!alertController) {
                            if (block) {
                                block();
                            }
                            return;
                        }
                        
                        // 找到alertController 上的确定按钮，并点击确定，完成退出登陆功能
                        BOOL isSuccess = [alertController xy_performActionBlockWithActionTitle:@"confirm"];
                        if (!isSuccess) {
                            if (block) {
                                block();
                            }
                            return;
                        }
                        
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            
                            
                            if (block) {
                                block();
                            }
                        });
                    });
                });
            });
        });
    });
}

%new
- (void)xy_loginWithBlock:(void (^)(void))block {
    // 登陆
    if ([XYAwemeManager isLogin] == YES) {
        if (block) {
            block();
        }
        return;
    }
    
    AWETabBarController *rootViewController = (AWETabBarController *)[[[UIApplication sharedApplication].delegate window] rootViewController];
    if (![rootViewController isKindOfClass:NSClassFromString(@"AWETabBarController")]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (block) {
                block();
            }
        });
        return;
    }
    
    // 切换到我的控制器，未登陆时会进入到登陆页面
    AWETabbarControllerConfig *tabbarConfig = [NSClassFromString(@"AWETabbarControllerConfig") performSelector:@selector(sharedInstance)];
    [tabbarConfig.homepageButton onTouchUpInside:tabbarConfig.homepageButton.singleTapGes];
    
    
    AWELoginWindowManager *manager = [NSClassFromString(@"AWELoginWindowManager") performSelector:@selector(sharedManager)];
//    [manager makeKeyAndVisible];
//    [manager requestSettings];
    
   
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         UIWindow *window = [manager loginWindow];
//         UIViewController *rootViewController = [manager rootViewController];
        
        UINavigationController *loginNav = window.rootViewController.presentedViewController;
        if (!loginNav || ![loginNav isKindOfClass:[UINavigationController class]]) {
            if (block) {
                block();
            }
            return;
        }
       __block DYOneLoginViewController *loginVC = nil;
       [loginNav.viewControllers enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
           if ([obj isKindOfClass:NSClassFromString(@"DYOneLoginViewController")]) {
               *stop = YES;
               loginVC = (DYOneLoginViewController *)obj;
           }
       }];
       if (loginVC == nil) {
           if (block) {
               block();
           }
           return;
       }
        // 担心此时 DYOneLoginViewController 不在顶部显示，所以重新pop到此页面
        [loginNav popToViewController:loginVC animated:YES];
         
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 点击第一个登陆页面底部的 以以前账号登陆，push 到第二个登陆页面 DYQuickLoginViewController
            [loginVC otherLoginAction];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                // 在 DYQuickLoginViewController页登陆

                 __block DYQuickLoginLoadingViewController *quickLoginLoadingVC = nil;
                [loginNav.viewControllers enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if ([obj isKindOfClass:NSClassFromString(@"DYQuickLoginLoadingViewController")]) {
                        *stop = YES;
                        quickLoginLoadingVC = (DYQuickLoginLoadingViewController *)obj;
                    }
                }];
                if (quickLoginLoadingVC == nil) {
                    if (block) {
                        block();
                    }
                    return;
                }
                
                // 担心此时 DYOneLoginViewController 不在顶部显示，所以重新pop到此页面
                [loginNav popToViewController:quickLoginLoadingVC animated:NO];
                
                __block DYQuickLoginViewController *quickLoginVC = nil;
                [quickLoginLoadingVC.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if ([obj isKindOfClass:NSClassFromString(@"DYQuickLoginViewController")]) {
                        *stop = YES;
                        quickLoginVC = (DYQuickLoginViewController *)obj;
                    }
                }];
                
                if (quickLoginVC == nil) {
                    if (block) {
                        block();
                    }
                    return;
                }
                
                // 获取 DYQuickLoginViewController 实例
                // 点击其他手机号码登陆
                [quickLoginVC.quickLoginView SMSLoginAction];

                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    
                    // 进入 手机号登陆页面DYSMSLoginV2Step1ViewController，这里输入手机号码和验证码，登陆
                    __block DYSMSLoginV2Step1ViewController *loginV2Step1ViewController  = nil;
                    [loginNav.viewControllers enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        if ([obj isKindOfClass:NSClassFromString(@"DYSMSLoginV2Step1ViewController")]) {
                            *stop = YES;
                            loginV2Step1ViewController = (DYSMSLoginV2Step1ViewController *)obj;
                        }
                    }];
                    if (loginV2Step1ViewController == nil) {
                        if (block) {
                            block();
                        }
                        return;
                    }
                    [loginNav popToViewController:loginV2Step1ViewController animated:NO];
                    
                    // 弹出键盘
                    [loginV2Step1ViewController.phoneNumberInputView becomeFirstResponder];
                    
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                       
                        // 输入手机号
                        [loginV2Step1ViewController.phoneNumberInputView.textField setFormattedText: @"13136588041"];
                        // 必须调一下此方法才能 让直接填充的手机号有效
                        [loginV2Step1ViewController.phoneNumberInputView didChangeValue];
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            // 执行下一步 获取验证码
                            [loginV2Step1ViewController loginAction:loginV2Step1ViewController.loginButton];
                            
                            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                
                                // 图形验证码未解决，未搞定图形验证码
                                // SGMVerificationManager
                               
                                // 将验证码填充到输入框
                                __block CGRect keyboardFrame = [XYAwemeManager getCurrentKeyboardFrame];
                                // 防止还没有获取验证码，就去查找了，这里循环去获取
                                // 每次滑动延迟delayTime秒执行
                                CGFloat delayTime = 0;
                                // 滑动一次的时间预估为2秒时间
                                const CGFloat stagger = 0.5;
                                // 每次滑动的周期为 delayTime + stagger == 3秒
                                __block BOOL needsBreak = NO;
                                for (long i = 0; i < 10; i++) {
                                    if (needsBreak) {
                                        break;
                                    }
                                    else {
                                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                            if (CGRectEqualToRect(CGRectZero, keyboardFrame)) {
                                                keyboardFrame = [XYAwemeManager getCurrentKeyboardFrame];
                                            }
                                            else {
                                                needsBreak = YES;;
                                            }
                                        });
                                        delayTime += stagger;
                                    }
                                }
                                
                                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((delayTime + 0.5) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                    // 获取键盘的inputView 相对屏幕的坐标
                                    CGFloat inputViewHeight = 33.0;
                                    CGFloat inputViewY = [UIScreen mainScreen].bounds.size.height - keyboardFrame.size.height + inputViewHeight * 0.5;
                                    CGFloat inputViewX = [UIScreen mainScreen].bounds.size.width * 0.5;
                                    // 模拟器点击键盘上的验证码位置
                                    [[XYSimulatedTouch sharedInstance] touchesWithPoint:CGPointMake(inputViewX, inputViewY)];
                                    if (block) {
                                        block();
                                    }
                                });
                            });
                        });
                    });
                });
            });
        });
    });
    
}

%new
- (void)xy_likeAllVideosByUserDetailVCWithBlock:(void (^)(void))block {
    
    // 打开用户主页
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UITableView *tableView = MSHookIvar<UITableView*>(self, "_tableView");
        NSIndexPath *visibleIndexPath = [tableView indexPathsForVisibleRows].firstObject;
        if (visibleIndexPath == nil) {
            if (block) {
                block();
            }
            return;
        }
        id visibleCell = [tableView visibleCells].firstObject;
        if (!visibleCell || ![visibleCell isKindOfClass:NSClassFromString(@"AWEFeedViewCell")]) {
            if (block) {
                block();
            }
            return;
        }
        
        // 去用户主页，点赞她的所有作品
        AWEFeedCellViewController *viewController = MSHookIvar<AWEFeedCellViewController*>(visibleCell, "_viewController");
        AWEAwemePlayInteractionViewController *iVC = viewController.interactionController;
        if ([iVC.model.author.userID isEqualToString: [XYAwemeManager currentAuthUser].userID]) {
            if (block != nil) {
                block();
            }
            return;
        }
        
        [XYAwemeManager playVideoWithUserId:iVC.model.author.userID videoIndex:0 preloadedUser:iVC.model.author completion:^(AWEUserDetailViewController * _Nonnull detailVC) {
            
        }];
    });
}


%new
- (void)xy_randomlikeByUserDetailVCWithBlock:(void (^)(void))block {
    
    // 去用户主页，随机点赞她的前面的一个作品
    
    // 打开用户主页
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UITableView *tableView = MSHookIvar<UITableView*>(self, "_tableView");
        NSIndexPath *visibleIndexPath = [tableView indexPathsForVisibleRows].firstObject;
        if (visibleIndexPath == nil) {
            if (block) {
                block();
            }
            return;
        }
        id visibleCell = [tableView visibleCells].firstObject;
        if (!visibleCell || ![visibleCell isKindOfClass:NSClassFromString(@"AWEFeedViewCell")]) {
            if (block) {
                block();
            }
            return;
        }
        
        AWEFeedCellViewController *viewController = MSHookIvar<AWEFeedCellViewController*>(visibleCell, "_viewController");
        AWEAwemePlayInteractionViewController *iVC = viewController.interactionController;
        [XYAwemeManager playVideoWithUserId:iVC.model.author.userID videoIndex:0 preloadedUser:iVC.model.author completion:^(AWEUserDetailViewController * _Nonnull detailVC) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                __block AWEAwemeDetailTableViewController *feedController = nil;
                 [self.navigationController.viewControllers enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                     if ([obj isKindOfClass:NSClassFromString(@"AWEAwemeDetailTableViewController")]) {
                         *stop = YES;
                         feedController = (AWEAwemeDetailTableViewController *)obj;
                     }
                 }];
                 if (feedController == nil) {
                     [detailVC.navigationController popToRootViewControllerAnimated:YES];
                     if (block) {
                         block();
                     }
                     return;
                 }
                 
                 UITableView *tableView = MSHookIvar<UITableView*>(feedController, "_tableView");
                 NSIndexPath *visibleIndexPath = [tableView indexPathsForVisibleRows].firstObject;
                 if (visibleIndexPath == nil) {
                     [detailVC.navigationController popToRootViewControllerAnimated:YES];
                     if (block) {
                         block();
                     }
                     return;
                 }
                 id visibleCell = [tableView visibleCells].firstObject;
                 if (!visibleCell || ![visibleCell isKindOfClass:NSClassFromString(@"AWEAwemeDetailTableViewCell")]) {
                     [detailVC.navigationController popToRootViewControllerAnimated:YES];
                     if (block) {
                         block();
                     }
                     return;
                 }
                 
                 AWEAwemeDetailCellViewController *viewController = MSHookIvar<AWEAwemeDetailCellViewController*>(visibleCell, "_viewController");
                 AWEAwemePlayInteractionViewController *iVC = viewController.interactionController;
                
                 
                 [self xy_likeWithInteractionViewController:iVC block:^{
                     static BOOL flag = NO;
                     if (flag == NO) {
                         
                         [self xy_reportVideoWithInteractionViewController:iVC block:^{
                             [detailVC.navigationController popToRootViewControllerAnimated:YES];
                             if (block) {
                                 block();
                             }
                         }];
                     }
                     else {
                         
                          [self xy_commentWithInteractionViewController:iVC block:^{
                               [detailVC.navigationController popToRootViewControllerAnimated:YES];
                               if (block) {
                                 block();
                               }
                           }];
                     }
                     flag = !flag;
                    
                 }];
            });
        }];
    });
}


%new
- (void)xy_reportVideoWithInteractionViewController:(AWEAwemePlayInteractionViewController *)iVC block:(void (^)(void))block  {
    dispatch_async(dispatch_get_main_queue(), ^{
        
        __block AWEAwemeShareViewController *shareVC = [self xy_getShareViewController];
        
        if (shareVC != nil) {
            [shareVC dismiss];
            shareVC = nil;
        }
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            UITableView *tableView = MSHookIvar<UITableView*>(self, "_tableView");
//            NSIndexPath *visibleIndexPath = [tableView indexPathsForVisibleRows].firstObject;
//            if (visibleIndexPath == nil) {
//                if (block) {
//                    block();
//                }
//                return;
//            }
//            id visibleCell = [tableView visibleCells].firstObject;
//            if (!visibleCell || ![visibleCell isKindOfClass:NSClassFromString(@"AWEFeedViewCell")]) {
//                if (block) {
//                    block();
//                }
//                return;
//            }
//
//            AWEFeedCellViewController *viewController = MSHookIvar<AWEFeedCellViewController*>(visibleCell, "_viewController");
//            AWEAwemePlayInteractionViewController *iVC = viewController.interactionController;
            
            // 弹出评论列表评论 是为了获取到评论列表数据的
            [iVC performCommentAction];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                NSArray<AWECommentModel *> *models = iVC.commentVC.listManager.dataList;
                NSInteger index = MAX(arc4random_uniform((uint32_t)models.count), models.count / 3);
                NSString *commentStr = nil;
                if (index < models.count) {
                    commentStr = models[index].content;
                }
                [iVC.commentVC closeBtnClicked:nil];
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        
                    // 弹出分享控制面板
                    [iVC.presenter onShareButtonClicked:nil];
                    // 手动创建，并显示分享面板
                    //        AWEAwemeShareViewController *shareVC = [NSClassFromString(@"AWEAwemeShareViewController") new];
                    //        [shareVC showOnWindow:[[UIApplication sharedApplication].delegate window] enableMask:NO  completion:nil];
                    
                    // 获取shareViewController ，它被添加在delegate.window 上
                    shareVC = [self xy_getShareViewController];
                    
                    if (shareVC == nil) {
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            if (block) {
                                block();
                            }
                        });
                        return;
                    }
                    
                    
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        AWEShareIconAndTitleCell *reportCell = nil;
                        // 转发视频
                        for (UIView *view in shareVC.firstLineView.subviews) {
                            // 找到
                            if ([view isKindOfClass:NSClassFromString(@"AWEShareIconAndTitleCell")]) {
                                AWEShareIconAndTitleCell *cell = (AWEShareIconAndTitleCell *)view;
                                if ([cell.titleLabel.text isEqualToString:@"转发"]) {
                                    reportCell = cell;
                                    break;
                                }
                            }
                        }
                        
                        
                        if (reportCell == nil) {
                            [shareVC dismiss];
                            [self.view xy_hideHUD];
                            [self.view xy_showMessage:@"此视频没找到转发按钮！"];
                            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                if (block) {
                                    block();
                                }
                            });
                            return;
                        }
                        
                        // 找到cell 后 执行点击事件
                        [reportCell tapGestureRecognized];
                        
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            // 获取正在显示的评论弹框
                            AWECommentListInputView *commentInputView = nil;
                            for (UIView *subview in [[UIApplication sharedApplication].delegate window].subviews) {
                                // 找到
                                if ([subview isKindOfClass:NSClassFromString(@"AWECommentListInputView")]) {
                                    commentInputView = (AWECommentListInputView *)subview;
                                    break;
                                }
                            }
                            
                            if (commentInputView == nil) {
                                if (block) {
                                    block();
                                }
                                return;
                            }
                            
                            [commentInputView.textView becomeFirstResponder];
                            
                            // 添加转发的文本
                            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                NSArray *emjList = @[@"[衰]", @"[闭嘴]", @"[机智]", @"[小鼓掌]", @"[灵机一动]", @"[耶]", @"[捂脸]", @"[疑问]", @"[困]", @"[送心]", @"[小鼓掌]", @"[偷笑]"];
                                NSInteger index = (NSInteger)arc4random_uniform((uint32_t)emjList.count);
                                // 添加转发内容
                                NSString *text = @"[送心]";
                                if (commentStr.length != 0) {
                                    text = [NSString stringWithFormat:@"%@%@ %@", emjList[index], commentStr, commentInputView.model.author.nickname];
                                    
                                }
                                else  {
                                    text = BridgingHelper.nextReportComment;
//                                    text = [[RandomComments sharedInstance] getRandomReport];
                                }
//                                else {
//                                    text = [NSString stringWithFormat:@"%@%@,%@", commentInputView.model.author.nickname, emjList[index], commentInputView.model.descriptionString];
//                                }
                                
                                if (text.length > 20) {
                                    text = [NSString stringWithFormat:@"[送心]%@[小鼓掌]", [text substringToIndex:15]];
                                }
                                
                                commentInputView.textView.text = text;
                                
                                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                    
                                    // 确定转发
                                    [commentInputView.delegate commentInputViewShouldReturn:commentInputView];
                                    
                                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                        
                                        if (block) {
                                            block();
                                        }
                                        
                                    });
                                });
                            });
                            
                        });
                        
                    });
                    
                });
                
            });
        });
    });
    
}
     
%new
// 获取当前显示的分享控制面板
- (AWEAwemeShareViewController *)xy_getShareViewController {
    // 获取shareViewController ，它被添加在delegate.window 上
    AWEAwemeShareViewController *shareVC;
    for (UIView *subview in [[UIApplication sharedApplication].delegate window].subviews) {
        UIViewController *vc = [XYAwemeManager viewControllerFromView:subview];
        if (vc && [vc isKindOfClass:NSClassFromString(@"AWEAwemeShareViewController")]) {
            shareVC = (AWEAwemeShareViewController *)vc;
            break;
        }
    }
    return shareVC;
}


%new
- (void)xy_searchWithKeyword:(NSString *)keyword1 block:(void (^)(void))block {
    
    __block NSString *keyword = keyword1;
    dispatch_async(dispatch_get_main_queue(), ^{
        if (keyword == nil) {
            UITableView *tableView = MSHookIvar<UITableView*>(self, "_tableView");
            id visibleCell = [tableView visibleCells].firstObject;
            if (visibleCell && [visibleCell isKindOfClass:NSClassFromString(@"AWEFeedViewCell")]) {
                AWEFeedCellViewController *viewController = MSHookIvar<AWEFeedCellViewController*>(visibleCell, "_viewController");
                AWEAwemePlayInteractionViewController *iVC = viewController.interactionController;
                keyword = iVC.model.author.nickname;
            }
        }
        if (keyword == nil) {
            keyword = @"新年";
        }
        
        [self.navigationController popToRootViewControllerAnimated:NO];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            AWEFeedRootViewController *rootVc = (AWEFeedRootViewController *)self.navigationController.viewControllers.firstObject;
            if (![rootVc isKindOfClass:NSClassFromString(@"AWEFeedRootViewController")]) {
                if (block) {
                    block();
                }
                return;
            }
            
            // 如果已经存在搜索页则忽略
            for (UIViewController *vc in self.navigationController.viewControllers) {
                if ([vc isKindOfClass:NSClassFromString(@"AWESearchViewController")]) {
                    if (block) {
                        block();
                    }
                    return;
                }
            }
            
            // 跳转到搜索页
            [rootVc.contentViewController onDiscoverButtonClicked:nil];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                XYLog(@"%@", self.navigationController.viewControllers);
                AWESearchViewController *searchVC = nil;
                for (NSInteger i = self.navigationController.viewControllers.count - 1; i >= 0; i--) {
                    UIViewController *vc = self.navigationController.viewControllers[i];
                    if ([vc isKindOfClass:NSClassFromString(@"AWESearchViewController")]) {
                        searchVC = (AWESearchViewController *)vc;
                        break;
                    }
                }
                
                if (searchVC == nil) {
                    if (block) {
                        block();
                    }
                    return;
                }
                
                // 抖音搜索 每天都有上限 谨慎使用
                searchVC.searchBar.text = keyword;
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [searchVC searchBarSearchButtonClicked:searchVC.searchBar];
                    
                    //                 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    //                searchVC.searchResultViewController.viewControllerEndRefreshDataBlock = ^(UIViewController *vc, id resultData) { // 这里会在每个控制器刷新完成数据后回调，会执行多次， 有bug，所以执行完成之后释放，只一次
                    //
                    //                };
                    //                 });
                    
                    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(xy_swapSearchViewControllerWithBlock:) object:block];
                    [self performSelector:@selector(xy_swapSearchViewControllerWithBlock:) withObject:block afterDelay:3.0];
                });
            });
            
        });
    });
}
%new
- (void)xy_swapSearchViewControllerWithBlock:(void (^)(void))block {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        AWESearchViewController *searchVC = nil;
        for (NSInteger i = self.navigationController.viewControllers.count - 1; i >= 0; i--) {
            UIViewController *vc = self.navigationController.viewControllers[i];
            if ([vc isKindOfClass:NSClassFromString(@"AWESearchViewController")]) {
                searchVC = (AWESearchViewController *)vc;
                break;
            }
        }
        
        if (searchVC == nil) {
            // 这里不再执行block，因为可能已经退出了
            return;
        }
        
        NSUInteger foundIdx = [searchVC.searchResultViewController.childControllers indexOfObjectPassingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            BOOL ret = NO;
            if ([obj isKindOfClass:NSClassFromString(@"AWESearchUserViewController")]) {
                *stop = YES;
                ret = YES;
            }
            return ret;
        }];
        
        void (^ completion)(void) = ^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [searchVC.navigationController popViewControllerAnimated:YES];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    if (block) {
                        block();
                    }
                });
            });
        };
        
        if (foundIdx != NSNotFound) {
            AWESearchUserViewController *userResultVC = (AWESearchUserViewController *)searchVC.searchResultViewController.childControllers[foundIdx];
            [searchVC.searchResultViewController.slidingViewController scrollToIndex:foundIdx animated:YES];
            // 关注 第一个用户
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                if (userResultVC.manager.userArray.count == 0) {
                    completion();
                    return;
                }
                
                
                NSInteger foundIdx = [userResultVC.manager.userArray indexOfObjectPassingTest:^BOOL(AWESearchUser *  _Nonnull searchUserModel, NSUInteger idx, BOOL * _Nonnull stop) {
                    BOOL ret = NO;
                    if (searchUserModel.userInfo.followStatus == 0) {
                        ret = YES;
                        *stop = YES;
                    }
                    return ret;
                }];
                
                if (foundIdx == NSNotFound) {
                    // 没找到未关注得 忽略掉
                    completion();
                    return;
                }
                AWESearchUser *searchUserModel = userResultVC.manager.userArray[foundIdx];
                
                [userResultVC followUser:searchUserModel indexPath:[NSIndexPath indexPathForRow:foundIdx inSection:0]];
                
                // 关注完成后 等待6秒退出
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    
                    [[XYSimulatedTouch sharedInstance] swapUp];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        completion();
                    });
                });
            });
        }
        else {
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [[XYSimulatedTouch sharedInstance] swapLeft];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    completion();
                });
            });
        }
    });
}


%new
- (void)xy_commentWithInteractionViewController:(AWEAwemePlayInteractionViewController *)iVC block:(void (^)(void))block {
    
    if ([[XYAwemeManager manager] isCloseAutoComment] == YES) {
        // 关闭自动评论，直接结束
        dispatch_async(dispatch_get_main_queue(), ^{
            if (block) {
                block();
            }
        });
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
                   
        // 弹出评论列表评论
        [iVC performCommentAction];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
            [[XYSimulatedTouch sharedInstance] swapUp];
        
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                // 为某个评论点赞
                NSIndexPath *indexPath = iVC.commentVC.tableView.indexPathsForVisibleRows.firstObject;
                if (indexPath != nil) {
                    AWECommentPanelBaseCell *cell = (AWECommentPanelBaseCell *)[iVC.commentVC.tableView visibleCells][arc4random_uniform(iVC.commentVC.tableView.visibleCells.count)];
                    // 点赞
                    [cell likeButtonTapped];
                }
                
                if ([[XYAwemeManager manager] isCloseUniqueComment] == NO) {
                    // 如果已经评论过，则退出
                    NSInteger foundUserIdx = [iVC.commentVC.listManager.dataList indexOfObjectPassingTest:^BOOL(AWECommentModel *  _Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {
                        if ([model.author.userID isEqualToString:[XYAwemeManager currentAuthUser].userID]) {
                            *stop = YES;
                            return YES;
                        }
                        return NO;
                    }];
                    
                    if (foundUserIdx != NSNotFound) {
                        // 已经评论过的，不再评论，关闭评论弹框
                        [iVC.commentVC closeBtnClicked:nil];
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            if (block) {
                                block();
                            }
                            
                        });
                        return;
                    }
                    
                }
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                   
                    
                    [iVC.commentVC.commentInputView.textView becomeFirstResponder];
                    
                    // 去评论
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        NSArray *emjList = @[@"[衰]", @"[闭嘴]", @"[机智]", @"[小鼓掌]", @"[灵机一动]", @"[耶]", @"[捂脸]", @"[疑问]", @"[困]", @"[送心]", @"[小鼓掌]", @"[偷笑]"];
                        NSInteger emjIndex = (NSInteger)arc4random_uniform((uint32_t)emjList.count);
                        NSString *commentStr = nil;
                        // 发评论: 原评论大于10条再使用，不然能看出明显的重复评论
                        if (self.autoScrollCount % 5 != 0 && iVC.commentVC.listManager.dataList.count > 30) {
                           // 第一种. 复制评论列表并做微修改发表，防止被抖音认为是重复的评论
                            NSArray<AWECommentModel *> *models = iVC.commentVC.listManager.dataList;
                            NSInteger index = MAX(arc4random_uniform((uint32_t)models.count), models.count / 3);
                            commentStr = models[index].content;
                             if (emjIndex % 2 == 0) {
                                commentStr = [NSString stringWithFormat:@"%@%@%@", commentStr, @"😂", emjList[emjIndex]];
                            }
                        }
                        else {
                            // 第二种. 随机生成评论
//                           commentStr = [[RandomComments sharedInstance] getRandomComment];
                            commentStr = BridgingHelper.nextComment;
                        }
                    
                       iVC.commentVC.commentInputView.textView.text = [NSString stringWithFormat:@"%@%@", emjList[emjIndex], commentStr];
                        
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            [iVC.commentVC commentInputViewShouldReturn:iVC.commentVC.commentInputView];
                            
                            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                
                                
                                // 发送完成后 关闭评论弹框
                                [iVC.commentVC closeBtnClicked:nil];
                                
                                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                    
                                    if (block) {
                                        block();
                                    }
                                    
                                });
                                
                            });
                        });
                    });
                });
            });
     });
  });
}

%new
- (void)xy_collectionMusicWithInteractionViewController:(AWEAwemePlayInteractionViewController *)iVC block:(void (^)(void))block {
    dispatch_async(dispatch_get_main_queue(), ^{
                   [iVC.presenter enterMusicDetail:nil];
                   
                   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        __block AWEMusicDetailViewController *musicVC = nil;
        [self.navigationController.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:NSClassFromString(@"AWEMusicDetailViewController")]) {
                *stop = YES;
                musicVC = (AWEMusicDetailViewController *)obj;
            }
        }];
        
        [musicVC onCollectionBtnClicked:nil];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (musicVC != nil) {
                [musicVC.navigationController popViewControllerAnimated:YES];
            }
            else {
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if (block) {
                    block();
                }
            });
        });
    });
                   
                   });
}

%new
- (void)xy_likeWithInteractionViewController:(AWEAwemePlayInteractionViewController *)iVC block:(void (^)(void))block {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        // 直接执行点赞的事件, 可能会取消赞，所以不使用此方法
        if (iVC.model.userDigged == NO) {
            [iVC performLikeAction];
            // 执行btn 的TouchUpInside 无效
            //                        [iVC.likeButton sendActionsForControlEvents:UIControlEventTouchUpInside];
            
            // 触发双击事件
            //                        [iVC onVideoPlayerViewDoubleClicked:viewController.tapGesture];
        }
        else {
            XYLog(@"已经点过赞！");
        }
        // 没5次就有一次不点赞，防止被认为=机器人
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (block) {
                block();
            }
        });
    });
    
    
}

%new
- (void)xy_followCurrentUserWithInteractionViewController:(AWEAwemePlayInteractionViewController *)iVC block:(void (^)(void))block {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        /* 三种关注方式：
         * 1. 在首页的非纯模式（pureMode）下，通过首页的关注按钮关注
         * 2. 跳转到用户主页，点击关注
         * 3. 通过视频cell，拿到user，进入搜索页，搜索nickname，再关注
         这里只用前两种
         */
                   
       static BOOL flag = NO;
        
        if (flag == YES) {
            if ([[XYAwemeManager manager] isCloseFollow] == YES) {
                // 关闭关注，直接退出
                if (block) {
                    block();
                }
                return;
            }
            // 第一种关注方式 在首页的非纯模式（pureMode）下，通过首页的关注按钮关注
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [iVC.presenter onFollowViewClicked:nil];
                
                if (iVC.model.userDigged == YES) {
                    if (block) {
                        block();
                    }
                }
                else {
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        // 直接执行点赞的事件
                        [iVC performLikeAction];
                        
                        if (block) {
                            block();
                        }
                    });
                }
            });
            
            flag = NO;
            return;
        }
                   
        flag = YES;
        
        
        // 第二种关注方式： 跳转到用户主页，点击关注
        // 打开用户主页并关注
        AWEUserDetailViewController *detailVC = [XYAwemeManager createUserProfilePageWithUserId:iVC.model.author.userID preloadedUser:iVC.model.author];
        [self.navigationController pushViewController:(UIViewController *)detailVC animated:YES];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            void (^ exitUserDetailVcBlock)(void) = ^{
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    // 退出用户主页
                    [detailVC backBtnClicked:nil];
                    
                    if (iVC.model.userDigged == YES) {
                        if (block) {
                            block();
                        }
                    }
                    else {
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            // 直接执行点赞的事件
                            [iVC performLikeAction];
                            
                            if (block) {
                                block();
                            }
                        });
                    }
                });
            };
            
            if ([[XYAwemeManager manager] isCloseFollow] == YES) {
                // 关闭关注，直接退出
                exitUserDetailVcBlock();
                return;
            }
            
            
            // 关注
            if (detailVC.profileHeaderVC.profileHeaderView.extraViewController.isCurrentUser == YES) {
                // 是自己就忽略
                exitUserDetailVcBlock();
                return;
            }
            if (detailVC.profileHeaderVC.profileHeaderView.extraViewController.relationView.followStatus == 1) {
                // 已经关注 忽略
                exitUserDetailVcBlock();
                return;
            }
            [detailVC.profileHeaderVC.profileHeaderView.extraViewController.relationView.relationTitleBtn sendActionsForControlEvents:UIControlEventTouchUpInside];
            
            // 或者 //[detailVC.profileHeaderVC.profileHeaderView.extraViewController relationBtnClicked:nil];
            
            exitUserDetailVcBlock();
        });
        
    });
    
}


%new
- (void)xy_scrollToIndexPath:(NSIndexPath *)indexPath completion:(void (^)(void))completion {
    dispatch_block_t block = ^{
        
        UITableView *tableView = MSHookIvar<UITableView*>(self, "_tableView");
        NSInteger totalCount = [tableView.dataSource tableView:self.tableView numberOfRowsInSection:indexPath.section];
        
        if (indexPath.row > totalCount - 1) {
            // 刷到底了，可以做下拉刷新或者切换关注和推荐tab ，暂时未实现
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.view xy_showMessage:@"已经滑到最后一个了，歇一会吧！"];
                if (completion) {
                    completion();
                }
            });
            return;
        }
        
        NSIndexPath *visibleIndexPath = tableView.indexPathsForVisibleRows.lastObject;
        if (visibleIndexPath == nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion();
                }
            });
            return;
        }
        
        if (visibleIndexPath && [visibleIndexPath isEqual:indexPath]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion();
                }
            });
            return;
        }
        
        if (visibleIndexPath && visibleIndexPath.section != indexPath.section) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion();
                }
            });
            return;
        }
        
        // 下面两个滑动屏幕的方法的效果会有小差异，随机使用
        // 滑动5次就有4次使用XYSimulatedTouch 去执行，但是有时候XYSimulatedTouch不好使（当xy_lastAutoScrollIndexPath != indexPath）
        if (indexPath.row % 5 != 1 && self.xy_lastAutoScrollIndexPath != indexPath) {
            long diff =  abs(indexPath.row - visibleIndexPath.row);
            CGPoint startPoint, endPoint;
            if (indexPath.row > visibleIndexPath.row) {
                // 向上滑动
                startPoint = CGPointMake(tableView.frame.size.width * 0.35, tableView.frame.size.height * 0.7);
                endPoint = CGPointMake(tableView.frame.size.width * 0.35, tableView.frame.size.height * 0.37);
            }
            else {
                // 向下滑动
                startPoint = CGPointMake(tableView.frame.size.width * 0.32, tableView.frame.size.height * 0.3);
                endPoint = CGPointMake(tableView.frame.size.width * 0.36, tableView.frame.size.height * 0.67);
            }
            
            
            [[XYSimulatedTouch sharedInstance] swapWithPoint:startPoint endPoint:endPoint count:diff completion:completion];
            
        }
        else {
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:1.0f];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            //        [tableView setContentOffset:CGPointMake(tableView.contentOffset.x, [UIScreen mainScreen].bounds.size.height * (visibleIndexPath.row + 1)) animated:YES];
            [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
            [UIView commitAnimations];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MAX(arc4random_uniform(5), 2) * NSEC_PER_SEC)), dispatch_get_main_queue(), completion);
        }
        self.xy_lastAutoScrollIndexPath = indexPath;
    };
    
    dispatch_async(dispatch_get_main_queue(), block);
}
%new
- (void)xy_toggleAutoPlayNext {
    if (self.isStartPlayNext == NO) {
        [self xy_startAutoPlayNext];
    }
    else {
        [self xy_stopAutoPlayNext];
    }
}

#pragma mark - Orig methods

- (BOOL)isScrolledAutomatically {
    BOOL ret = %orig;
    ret = YES;
    return ret;
}
- (void)preloadNextCellIfNeeded {
    %orig;
}

- (void)scrollViewDidScroll:(id)arg1 {
    %orig;
}

- (void)viewDidDisappear:(_Bool)arg1 {
    %orig;
    self.viewIsDisappear = YES;
    [self xy_stopAutoPlayNext];
}
- (void)viewWillDisappear:(_Bool)arg1 {
    %orig;
}
- (void)viewDidAppear:(_Bool)arg1 {
    %orig;
    self.viewIsDisappear = NO;
    [self xy_startAutoPlayNext];
}
- (void)viewWillAppear:(_Bool)arg1 {
    %orig;
}

- (void)_addNotifications {
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(xy_startAutoPlayNext) name:@"XYFeedTableVideoPlayEndNotification" object:nil];
    %orig;
}



%new
- (BOOL)isStartPlayNext {
    return [objc_getAssociatedObject(self, @selector(isStartPlayNext)) boolValue];
}

%new
- (void)setIsStartPlayNext:(BOOL)value {
    objc_setAssociatedObject(self, @selector(isStartPlayNext), @(value), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

%new
- (BOOL)viewIsDisappear {
    return [objc_getAssociatedObject(self, @selector(viewIsDisappear)) boolValue];
}

%new
- (void)setViewIsDisappear:(BOOL)value {
    objc_setAssociatedObject(self, @selector(viewIsDisappear), @(value), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
%new
- (int)autoScrollCount {
    return [objc_getAssociatedObject(self, @selector(autoScrollCount)) intValue];
}

%new
- (void)setAutoScrollCount:(int)value {
    objc_setAssociatedObject(self, @selector(autoScrollCount), @(value), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


%new
- (void)xy_motionShakeNotification {
    //    [self xy_toggleAutoPlayNext];
}

%new
- (void)xy_didBecomeActiveNotification {
    [self xy_startAutoPlayNext];
}

%new
- (void)xy_willResignActiveNotification {
    [self xy_stopAutoPlayNext];
}

%new
- (void)xy_savePhoto:(NSNotification *)notify {
    UITableView *tableView = MSHookIvar<UITableView*>(self, "_tableView");
    id visibleCell = [tableView visibleCells].firstObject;
    if (visibleCell && [visibleCell isKindOfClass:NSClassFromString(@"AWEFeedViewCell")]) {
        AWEFeedCellViewController *viewController = MSHookIvar<AWEFeedCellViewController*>(visibleCell, "_viewController");
        AWEAwemePlayInteractionViewController *iVC = viewController.interactionController;
        AWEAwemeModel *model = iVC.model;
        AWEVideoModel *video = model.video;
        AWEURLModel *playURL = video.playURL;
        NSArray *originURLList = playURL.originURLList;
        NSString *url = originURLList.firstObject;
        // 下载这个链接
        if (self.xy_downloader == nil) {
            self.xy_downloader = [XYVideoDownloader new];
            __weak typeof(self) weakSelf = self;
            [self.xy_downloader downloadFileWithUrl:[NSURL URLWithString:url] completion:^(BOOL isSuccess){
                weakSelf.xy_downloader = nil;
            }];
        }
        else {
            [self.view xy_showMessage:@"正在下载中..."];
        }
//        XYLog(@"%@", model);
    }
}

- (void)viewDidLoad {
    %orig;
    
    self.autoScrollCount = 0;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(xy_motionShakeNotification) name:@"UIEventSubtypexy_motionShakeNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(xy_didBecomeActiveNotification) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(xy_willResignActiveNotification) name:UIApplicationWillResignActiveNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(xy_savePhoto:) name:@"CustomSavePhoto" object:nil];
}

%end

%hook AWEAwemePlayInteractionViewController

// 执行点赞按钮的事件，如果已经点赞则取消点赞
- (void)performLikeAction {
    %orig;
}

// 双击 视频view时调用, 由AWEFeedCellViewController 的 tapGesture 触发
- (void)onVideoPlayerViewDoubleClicked:(UITapGestureRecognizer *)tapGes {
    %orig;
}
%end

%hook AWEFeedCellViewController

// UITapGestureRecognizer 的事件 target 是 AWEFeedCellViewController
- (void)_onVideoPlayerViewClicked:(UITapGestureRecognizer *)tapGes {
    %orig;
}
%end


%hook AWECommentListViewController

/// 点击评论发送按钮调的方法
- (void)sendCommentContent:(id)arg1 inputView:(id)arg2 isRetry:(_Bool)arg3 {
    %orig;
}

/// 为某个评论点赞调用的方法
- (void)likeCommentAtIndexPath:(NSIndexPath *)indexPath isLike:(BOOL)isLike {
    %orig;
}

- (void)closeBtnClicked:(id)arg1 {
    %orig;
}
%end

%hook AWEUserDetailViewController


- (void)followBtnClicked {
    %orig;
}

- (void)dealloc {
    %orig;
}

- (id)init {
    id vc = %orig;
    return vc;
}

- (void)unfollowed { // 取消关注完成后回调
    %orig;
}
- (void)followed { // 关注完成后回调
    %orig;
}

- (void)backBtnClicked:(id)arg1 {
    %orig;
}

/// 来自 AWEUserDetailViewControllerProtocol, 按照这个协议创建AWEUserDetailViewController，并push 即可
- (void)setUser:(AWEUserModel *)user {
    %orig;
}

/// 来自 AWEUserDetailViewControllerProtocol, 按照这个协议创建AWEUserDetailViewController，并push 即可
- (void)setUserID:(NSString *)userID {
    %orig;
}
/// 来自 AWEUserDetailViewControllerProtocol, 按照这个协议创建AWEUserDetailViewController，并push 即可
- (void)setPreloadedUser:(AWEUserModel *)arg1 {
    %orig;
}

%end

%hook AWECommentPanelBaseCell

- (void)likeButtonTapped {
    %orig;
}

%end

%hook AWEProfileHeaderExtraViewController
- (void)relationBtnClicked:(id)arg1 { //self->_relationView->_relationTitleBt
    %orig;// 点击关注按钮的调用  _followStatus = 1 为关注了  _followStatus = 0 未关注
}
%end

%hook AWEUserRelationView
- (void)updateRelationWithFollowStatus:(long long)arg1 followerStatus:(long long)arg2 animated:(_Bool)arg3 {
    %orig;
}
%end

%hook AWEMusicDetailViewController
// 点击收藏按钮的回调
- (void)onCollectionBtnClicked:(id)arg1 {
    %orig;
}
%end


%hook AWEAwemePlayInteractionPresenter
// 点击视频播放页 音乐按钮 进入 音乐详情页
- (void)enterMusicDetail:(UITapGestureRecognizer *)tapGesture {
    %orig;
}

- (void)p_goToPersonalPage:(id)arg1 gestureRecognizer:(id)arg2 {
    %orig;
}
// 取消关注 按钮的点击手势
- (void)onUnFollowViewClicked:(UITapGestureRecognizer *)arg1 {
    %orig;
}
// 关注 按钮的点击手势
- (void)onFollowViewClicked:(UITapGestureRecognizer *)arg1 {
    %orig;
}

// 点击音乐按钮的事件
- (void)onMusicButtonClicked:(id)arg1 {
    %orig;
}
// 点击分享按钮的事件
- (void)onShareButtonClicked:(id)arg1 {
    %orig;
}
// 点击评论按钮的事件
- (void)onCommentButtonClicked:(id)arg1 {
    %orig;
}
// 点击喜欢按钮的事件
- (void)onLikeButtonClicked:(id)arg1 {
    %orig;
}

%end

/// 和水印相关的两个方法

%hook AWEShareServiceUtils

///  分享和保存视频到相册时调用的，可以去除水印logo和尾部水印
+(void)_shareAwemeForSaveVideo:(id)arg2 forBTDShareType:(long long)arg3 preprocess:(id)arg4 delegateType:(unsigned long long)arg5 completion:(id)arg6
{
    // 下载需要的视频源地址
    AWEAwemeModel *data = arg2;
    AWEVideoModel *model = data.video;
    if ([XYAwemeManager manager].isRemovedWatermark == YES) {
        // 不要水印logo
        [model setHasWatermark:NO];
    }
    if(model.endWatermarkDownloadURL != nil && [XYAwemeManager manager].isRemovedEndWatermark == YES)
    {
        // 不要尾部水印
        [model setHasEndWatermark:NO];
    }
    %orig(data, arg3, arg4, arg5, arg6);
}
%end

%hook AWEDynamicWaterMarkExporter
// 去除尾部水印
+ (NSArray *)watermarkLogoImageArray {
    if ([XYAwemeManager manager].isRemovedWatermark == YES) {
        // 不要水印logo
        return @[];
    }
    return %orig;
}
%end

//%hook AWEDynamicWaterMarkExporter
//
//+(void)addWaterMarkWithUrl:(id)arg2 composeOptions:(long long)arg3 model:(id)arg4 needSaveToAlbum:(bool)arg5 userName:(id)arg6 videoOutputSize:(struct CGSize)arg7 edgeData:(id)arg8 canDirectAddVideoheader:(bool)arg9 progress:(id)arg10 complete:(id)arg11 onlyForCrop:(bool)arg12 watermarkTaskType:(unsigned long long)arg13 removeSourceFile:(bool)arg14 {
//    AWEAwemeModel *model = arg4;
//    model.xy_fileURL = arg2;
//    %orig(arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
//}
//
//-(void)waterMarkExporterFinished:(id)arg2
//{
//    AWEAwemeModel *model = [self model];
//    if ([XYAwemeManager manager].hasWatermark) {
//        %orig(arg2);
//    }
//    else if (model.xy_fileURL) {
//        %orig(model.xy_fileURL);
//    }
//    else {
//        %orig(arg2);
//    }
//}
//%end
//
//%hook AWEUserModel
//
//- (BOOL)authorizedToDownload
//{
//    if([XYAwemeManager manager].authorizedToDownload)
//    {
//        return YES;
//    }
//    else
//    {
//        return %orig;
//    }
//}
//%end

%hook AWEFeedContainerViewController
/// 点击主页 搜索按钮的手势 的action，target 为 AWEFeedContainerViewController， view 为 AWEDiscoverFeedEntranceView
/// 用于调转到搜索页的
/// 另一个action 为 awe_UITracker_gestureRecognizer， target 是 AWEDiscoverFeedEntranceView
- (void)onDiscoverButtonClicked:(id)arg1 {
    %orig;
}

%end

%hook AWEDiscoverFeedEntranceView
// 点击主页 搜索按钮的手势 的action，target 为 AWEDiscoverFeedEntranceView
// 用于统计用户记录的
- (void)awe_UITracker_gestureRecognizer:(id)arg1 {
    // 不实现了
    //    %orig;
}
%end

%hook AWESearchResultViewController
// 执行搜索的方法
- (void)searchWithKeyword:(id)arg1 tabType:(unsigned long long)arg2 enterMethod:(id)arg3 onlyShowSug:(_Bool)arg4 completion:(id)arg5 {
    %orig(arg1, arg2, arg3, arg4, arg5);
}

- (void)excuteSearch:(_Bool)arg1 onlyShowSug:(_Bool)arg2 isSearchByUserClick:(_Bool)arg3 enterMethod:(id)arg4 extraLogParams:(id)arg5 completion:(id)arg6 {
    %orig;
}
- (void)searchWithKeyword:(id)arg1 tabType:(unsigned long long)arg2 enterMethod:(id)arg3 completion:(id)arg4 {
    %orig;
}

- (void)viewControllerEndRefreshData:(id)arg1 searchData:(id)arg2 {
    %orig(arg1, arg2);
    XYLog(@"%@", self.navigationController.viewControllers);
    if (self.viewControllerEndRefreshDataBlock) {
        self.viewControllerEndRefreshDataBlock(arg1, arg2);
    }
    // 只执行一次block
    self.viewControllerEndRefreshDataBlock = nil;
}

%new
- (void)setViewControllerEndRefreshDataBlock:(void (^ )(UIViewController *vc, id searchData))block {
    objc_setAssociatedObject(self, @selector(viewControllerEndRefreshDataBlock), block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

%new
- (void (^ )(UIViewController *vc, id searchData))viewControllerEndRefreshDataBlock {
    return objc_getAssociatedObject(self, @selector(viewControllerEndRefreshDataBlock));
}

%end

%hook AWESearchViewController

- (void)updateSearchBarWithKeyword:(id)arg1 {
    %orig(arg1);
}
%end

%hook UIView
+ (void)awe_UITracker_run {
    %orig;
}
- (void)awe_UITracker_gestureRecognizer:(id)arg1 {
    %orig(arg1);
}
- (void)awe_UITracker_addGestureRecognizer:(id)arg1 {
    // 不让记录用户行为
    %orig(arg1);
}
%end

%hook AWESearchUserViewController

- (void)didFinishUnFollowUser:(id)arg1 status:(long long)arg2 error:(id)arg3 {
    %orig;
}
- (void)didFinishFollowUser:(id)arg1 status:(long long)arg2 error:(id)arg3 {
    %orig;
}
- (void)unfollowUser:(id)arg1 indexPath:(id)arg2 {
    %orig;
}
- (void)followUser:(id)arg1 indexPath:(id)arg2 {
    %orig;
}

%end

%hook DYOneLoginViewController
- (void)loginWithPlatform:(unsigned long long)arg1 {
    %orig(arg1);
}
- (void)oneLogin {
    %orig;
}
- (void)otherLoginAction {
    %orig;
}
- (void)closeAction {
    %orig;
}
- (id)initWithRouterModel:(DYRouterModel *)arg1  {
    id obj = %orig(arg1);
    return obj;
}

%end

%hook DYRouterModel

+ (id)instanceWithBackStrategy:(unsigned long long)arg1 bindStrategy:(unsigned long long)arg2 platformContext:(unsigned long long)arg3 phoneContext:(id)arg4 ticketModel:(id)arg5 {
    return %orig;
}
+ (id)instanceWithBackStrategy:(unsigned long long)arg1 platformContext:(unsigned long long)arg2 bindStrategy:(unsigned long long)arg3 ticketModel:(id)arg4 {
    return %orig;
}
+ (id)instanceWithBackStrategy:(unsigned long long)arg1 bindStrategy:(unsigned long long)arg2 ticketModel:(id)arg3 {
    return %orig;
}
+ (id)instanceWithBackStrategy:(unsigned long long)arg1 platformContext:(unsigned long long)arg2 ticketModel:(id)arg3 {
    return %orig;
}
+ (id)instanceWithBackStrategy:(unsigned long long)arg1 emailContext:(id)arg2 passwordContext:(id)arg3 {
    return %orig;
}
+ (id)instanceWithBackStrategy:(unsigned long long)arg1 emailContext:(id)arg2 ticketModel:(id)arg3 {
    return %orig;
}
+ (id)instanceWithBackStrategy:(unsigned long long)arg1 phoneContext:(id)arg2 ticketModel:(id)arg3 {
    return %orig;
}
+ (id)instanceWithBackStrategy:(unsigned long long)arg1 ticketModel:(id)arg2 {
    return %orig;
}
+ (id)instanceWithBuilder:(id)arg1 {
    return %orig;
}
+ (id)instanceWithBlock:(CDUnknownBlockType)block {
    return %orig;
}

%end


/// 抖音的分享面板
%hook AWEAwemeShareViewController

- (void)showOnWindow:(id)arg1 enableMask:(_Bool)arg2 completion:(CDUnknownBlockType)arg3 {
     %orig;
    XYLog(@"%@", self);
    NSMutableArray *array = self.secondLineShareChannels;
    // 21000是自保存
    
    AWEShareChannel *action = [[NSClassFromString(@"AWEShareChannel") alloc] initWithType:21000 option:3];
    [array addObject:action];
    [self _updateSecondLineView];
}

- (void)dismiss {
     %orig;
}
- (void)shareViewTapped:(AWEShareIconAndTitleCell *)cell {
    if (cell.shareType == 21000) {
        [self dismiss];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"CustomSavePhoto" object:nil];
    }
    else if (cell.shareType == 107 || [cell.titleLabel.text isEqualToString:@"保存至相册"]) { // 保存相册
        if ([[XYAwemeManager manager] isRemovedWatermark] == YES) {
            [self dismiss];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"CustomSavePhoto" object:nil];
        }
        else {
            %orig;
        }
    }
    else {
        %orig;
    }
}
%end

%hook AWEFeedVideoButton


- (void)setTouchUpInsideBlock:(id)block {
    %orig;
}

- (id)touchUpInsideBlock {
    return %orig;
}

%end

%hook AWEIMShareButtonExtension
- (void)p_handleResultAvatars:(id)arg1 lastShareUserId:(id)arg2 completeHandler:(id)block {
    %orig;
}
- (void)p_startFetchingTranspondModelsWithLastShareUserId:(id)arg1 completeHandler:(CDUnknownBlockType)arg2 isAuthorShareNotPublicAweme:(_Bool)block {
    %orig;
}
- (void)getShareToIMAvatarImageWithCompleteHandler:(id)arg1 isAuthorShareNotPublicAweme:(_Bool)arg2 {
    %orig;
}
%end

%hook AWECommentListInputView
- (_Bool)textFieldShouldReturn:(id)arg1 {
    return %orig;
}
- (void)textFieldDidChanged:(id)arg1 {
    %orig;
}

- (void)atBtnClicked:(id)arg1 {
    %orig;
}
%end

%hook AWEShareIconAndTitleCell

+ (id)shareItemWithType:(long long)type styleOption:(unsigned long long)option {
    AWEShareIconAndTitleCell *cell = %orig;
    if (type == 21000) {
        // 自定义的类型哦
        cell.titleLabel.text = @"自保存";
        cell.iconImageView.image = [UIImage imageNamed:@"icon_discovery_favi"];
//        NSString * path = [[NSBundle mainBundle] pathForResource:@"AWEIM" ofType:@"bundle"];
//        NSString *secondP = [path stringByAppendingPathComponent:@"im_share_board_aweme_friends.ong"];
//        NSString *imgNameFile = [secondP stringByAppendingPathComponent:@"im_share_board_aweme_friends"];
//        image = [UIImage imageWithContentsOfFile:imgNameFile];
//        [UIImage imageNamed:@""]
//        + (nullable UIImage *)imageNamed:(NSString *)name inBundle:(nullable NSBundle *)bundle compatibleWithTraitCollection:(nullable UITraitCollection *)traitCollection
//        if (resourcePath){
//            NSBundle *bundle2 = [NSBundle bundleWithPath:resourcePath];
//            if (bundle2){
//                bundle = bundle2;
//            }
//        }
//        cell.iconImageView.image =
    }
    return cell;
}
+ (id)shareItemWithType:(long long)arg1 {
    id obj = %orig;
    return obj;
}
- (void)configTitleAndIconAlpha:(double)arg1 {
    %orig;
}
- (void)configTitleColorWithFromType:(_Bool)arg1 {
    %orig;
}
- (void)tapGestureRecognized {
    %orig;
}

%end

%hook AWELongVideoControlModel

- (long long)preventDownloadType {
    bool preventDownloadType = %orig;
    // 与禁止下载视频的有关的hook
    if ([XYAwemeManager manager].isRemovePreventDownload == YES) {
        preventDownloadType = 0;
    }
    return preventDownloadType;
}

- (bool)allowDownload {
    bool allowDownload = %orig;
    // 与禁止下载视频的有关的hook
    if ([XYAwemeManager manager].isRemovePreventDownload == YES) {
        allowDownload = YES;
    }
    return allowDownload;
}

//- (void)setAllowDownload:(bool)allowDownload {
//    %orig(true);
//}
//- (void)setPreventDownloadType:(long long)preventDownloadType {
//    %orig(0);
//}

%end

%hook AVMDLDataLoader
- (_Bool)_supportPoxy:(NSString *)url {
    // 此url 的视频可以直接下载
    XYLog(@"AVMDLDataLoader, url: %@", url);
    [UIPasteboard generalPasteboard].string = url;
    bool ret = %orig;
    return ret;
}
- (id)getCacheFileInfo:(id)arg1 filePath:(id)arg2 {
    id ret = %orig;
    return ret;
}
- (id)getCacheFileInfo:(id)arg1 {
    id ret = %orig;
    return ret;
}
- (void)stop {
    %orig;
}
- (void)start:(id *)arg1 {
    %orig;
}
%end

//%hook AWEShareService
//+ (_Bool)isShareDownloadDisabledForShareType:(id)arg1 forTargetType:(unsigned long long)arg2 {
//    bool ret = %orig;
//    return false;
//}
//+ (_Bool)isShareDownloadDisabled {
//    bool ret = %orig;
//    return false;
//}
//%end

%hook AWEENV
+ (_Bool)isDebugEnv {
    bool isDebugEnv = %orig;
    XYLog(@"isDebugEnv:%ld", isDebugEnv);
    return NO;
}
+ (_Bool)isBetaEnv {
    bool isBetaEnv = %orig;
    XYLog(@"isBetaEnv:%ld", isBetaEnv);
    return NO;
}
+ (_Bool)isTestEnv {
    bool isTestEnv = %orig;
    XYLog(@"isTestEnv:%ld", isTestEnv);
    return NO;
}
+ (_Bool)isI18N {
    bool isI18N = %orig;
    XYLog(@"isI18N:%ld", isI18N);
    return isI18N;
}
+ (_Bool)isTiktok {
    bool isTiktok = %orig;
    XYLog(@"isTiktok:%ld", isTiktok);
    return isTiktok;
}
+ (_Bool)isMusically {
    bool isMusically = %orig;
    XYLog(@"isMusically:%ld", isMusically);
    return isMusically;
}
+ (_Bool)isDouyin {
    bool isDouyin = %orig;
    XYLog(@"isDouyin:%ld", isDouyin);
    return isDouyin;
}
+ (id)plistChannel {
    id plistChannel = %orig;
    XYLog(@"plistChannel:%@", plistChannel);
    return plistChannel;
}
+ (_Bool)isTestFlight {
    bool isTestFlight = %orig;
    XYLog(@"isTestFlight:%ld", isTestFlight);
    return isTestFlight;
}
+ (_Bool)isStaff {
    bool isStaff = %orig;
    XYLog(@"isStaff:%ld", isStaff);
    return isStaff;
}
+ (long long)channel {
    bool channel = %orig;
    XYLog(@"channel:%ld", channel);
    return channel;
}
+ (long long)product {
    bool product = %orig;
    XYLog(@"product:%ld", product);
    return product;
}
+ (_Bool)isDebugEvn {
    bool isDebugEvn = %orig;
    XYLog(@"isDebugEvn:%ld", isDebugEvn);
    return NO;
}
+ (_Bool)isBetaEvn {
    bool isBetaEvn = %orig;
    XYLog(@"isBetaEvn:%ld", isBetaEvn);
    return NO;
}
+ (_Bool)isTestEvn {
    bool isTestEvn = %orig;
    XYLog(@"isTestEvn:%ld", isTestEvn);
    return NO;
}
%end

%hook AWEAwemeModel
- (_Bool)disableDownload {
    BOOL ret =  %orig;
    return ret;
}
%end

%hook AWESlidingTabbarView

- (void)tabButtonClicked:(id)arg1 {
    %orig;
}
%end

// 用户权限相关
%hook BDDiamondAfterHeatManager
+ (BDDiamondAfterHeatManager *)sharedInstance {
    return %orig;
}

// 登陆完成后的事件
- (void)userLoginAction {
    %orig;
    // 登陆完成后修复屏幕无法响应的bug
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 修复登陆完成后，AWELoginWindow 不消失，导致无法响应触摸事件
        if ([[UIApplication sharedApplication].keyWindow isKindOfClass: NSClassFromString(@"AWELoginWindow")]) {
            [UIApplication sharedApplication].keyWindow.hidden = YES;
            [[UIApplication sharedApplication].delegate.window makeKeyAndVisible];
        }
    });
    
}

// 用户退出完成后调用
- (void)userLogoutAction {
    %orig;
}

// 用户改变后清理
- (void)clearHeatCacheData {
    %orig;
}
 // 当前登陆的用户id，未登陆时是空字符串或者nil
- (NSString *)currentLoginUID {
   id uid =  %orig; // @"104843708584"
    return uid;
}

%end


%hook AWELoginWindowManager
+ (AWELoginWindowManager *)sharedManager {
    id manager = %orig;
    return manager;
}

- (void)requestSettings {
    %orig;
}
- (id)loginSettingsModelArray {
    id settingsModel = %orig;
    return settingsModel;
}
- (void)dismiss {
    %orig;
}
- (void)didFinishLogin {
    %orig;
}
- (void)showLoginViewControllerWithParamsDict:(id)arg1 {
    %orig;
}
- (void)makeKeyAndVisible {
    %orig;
}

%end



// 私聊的类
%hook AWEIMMessageBaseViewController

/// 私聊发送文本的方法
/// @param content 发送的内容
/// @param users 内容中提到的用户
/// @param textView textView 视图
- (void)didSendContent:(NSString *)content mentionUsers:(NSArray *)users textView:(id)textView userInfo:(id)userInfo {
    %orig;
}
%end

%hook AWEIMMessageListViewController

- (void)setConversation:(AWEIMMessageConversation *)conversation {
    %orig;
}

%end

%hook AWEIMLoginManager

- (void)sdk_reloginWithToken:(id)arg1 userID:(id)arg2 {
    %orig;
}
- (void)sdk_loginWithToken:(id)arg1 userID:(id)arg2 secUserID:(id)arg3 {
    %orig;
}
- (void)sdk_logout {
    %orig;
}
- (void)sdk_config {
    %orig;
}
- (void)manuallyKickOffPuller {
    %orig;
}
- (void)sendIMGetTokenMonitorDataSuccess:(_Bool)arg1 error:(id)arg2 {
    %orig;
}
- (void)p_fetchLocalToken {
    %orig;
}
- (void)p_saveToken {
    %orig;
}

%end

////  以下主要为了防越狱检测

%hook TTInstallDeviceHelper

+ (long long)timeStamp {
    return %orig;
}
+ (void)saveOpenUDIDToKeychain:(id)arg1 {
     %orig;
}
+ (id)fetchOpenUDIDFromKeychain {
    return %orig; // cef18ac57ce679a7b89fd58af6f7b92e32ccf04e
}
+ (id)resolutionString {
    return %orig; // 1125*2436
}
+ (struct CGSize)resolution {
    return %orig;
}
+ (double)screenScale {
    return %orig;
}
+ (double)ssOnePixel {
    return %orig;
}
+ (id)openUDID {
    return %orig; // e1431d0390874afa1d7675a7ef9c6de279b71264
}

+ (id)currentLanguage {
    return %orig; // zh
}
+ (id)MACAddress {
    return %orig; // 02:00:00:00:00:00
}
+ (float)OSVersionNumber {
    return %orig;
}
+ (id)idfvString {
    return %orig; // D98761C3-EFE9-4874-BD19-A32D5D46AC9D
}
+ (id)idfaString {
    return %orig; // FD811FA4-CBA4-4683-8BB6-053F9AE1396E
}
+ (unsigned long long)getDeviceType {
    return %orig; // 2
}
+ (_Bool)isJailBroken {
    BOOL isJailBroken = %orig; // 会在启动时调用，验证是否为越狱设备，如果是越狱设备不能登陆
    return NO;
}
+ (id)platformName {
    return %orig; // iphone
}

%end

%hook ANSMetadata
- (BOOL)computeIsJailbroken {
    BOOL ret = %orig; // NO 启动时调用 通过调用栈，得知调用了[NSFileManager fileExistsAtPath:@"/Applications/Cydia.app"]
    return NO;
}
%end
%hook HMDInfo
- (BOOL)isJailBroken {
    BOOL ret = %orig; // NO 启动时调用, 播放下一个视频时会掉这个方法，此方法调用频繁，验证是否为越狱设备，如果是越狱设备不能登陆
    return NO;
}
%end

%hook UIDevice /// UIDevice+BTDAdditions
- (BOOL)btd_isJailBroken {
    BOOL ret = %orig;
    return NO;
}
%end

%hook NSFileManager
// 反越狱检测
- (BOOL)fileExistsAtPath:(NSString *)event {
    NSString *cydiaPath = @"/Applications/Cydia.app";
    NSString *aptPath = @"/private/var/lib/apt";
    NSString *applications = @"/User/Applications";
    NSString *mobile = @"/Library/MobileSubstrate/MobileSubstrate.dylib";
    NSString *bash = @"/bin/bash";
    NSString *sshd =@"/usr/sbin/sshd";
    NSString *sd = @"/etc/apt";
   if ([event hasPrefix:@"/Applications"]||[event hasPrefix:@"/var/lib/dpkg/info"]||[event hasPrefix:@"/var/root"]||[event hasPrefix:@"/usr/bin/"]||[event hasPrefix:@"/Library/ApplicationSupport"]||[event hasPrefix:@"/var/mobile/Library"]||[event hasPrefix:@"/var/touchelf/"]||[event hasPrefix:@"/var/mobile/GFaker"]||[event hasPrefix:@"/var/mobile/nztdata"]||[event hasPrefix:@"/var/mobile/NZTResult.plist"]||[event hasPrefix:@"/var/mobile/Media/"]||[event hasPrefix:@"/var/mobile/awzdata"]||[event hasPrefix:@"/var/mobile/hdFaker"]||[event hasPrefix:@"/var/mobile/iGrimace"]||[event hasPrefix:aptPath]||[event hasPrefix:cydiaPath] || [event hasPrefix:applications] || [event hasPrefix:mobile] || [event hasPrefix:bash] || [event hasPrefix:sshd] || [event hasPrefix:bash] || [event hasPrefix:sd]) {
        XYLog(@"9999999==%@=",event);
        return NO;
   }
    return  %orig;
}
%end

%hook NSString

/// 反逆向检测
- (BOOL)containsString:(NSString *)str {
    static NSString *mobile = @"/Library/MobileSubstrate/MobileSubstrate.dylib";
    static NSString *mobile1 = @"/Library/MobileSubstrate";
    if ([str hasPrefix:mobile] || [str hasPrefix:mobile1]) {
        return NO;
    }
    return %orig;
}

%end


//%hook AWEPassportServiceImp
//- (_Bool)isVCDEnable {
//    bool isVCDEnable = %orig;
//    return false;
//}
//%end

/*               AWEAwemeDetailTableViewController begin          */
/*                   单独为某个用户的全部视频点赞和评论                  */
%hook AWEAwemeDetailTableViewController

// 记录最后自动滑动的位置
%property (nonatomic) NSIndexPath *xy_lastAutoScrollIndexPath;
%property (nonatomic, strong) XYVideoDownloader *xy_downloader;

#pragma mark - Timer methods
%new
- (void)xy_startAutoPlayNext {
    if (self.viewIsDisappear == YES) {
        return;
    }
    if ([UIApplication sharedApplication].applicationState != UIApplicationStateActive) {
        return;
    }
    if ([self.currentDisplayingAweme.author.userID isEqualToString: [XYAwemeManager currentAuthUser].userID]) {
        // 当前用户就不执行此脚本了
        [self.view xy_showMessage:@"当前用户不执行此用户详情的脚本"];
        return;
    }
    if (XYAwemeManager.manager.isAutoPlayNext == NO) {
        [self.view xy_showMessage:@"用户详情自动播放已关闭\n可去设置中开启哦！"];
        return;
    }
    self.isStartPlayNext = YES;
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(xy_automaticPlayNext) object:nil];
    
    if (XYAwemeManager.manager.isMaxPlayLimitOfUserprofile == YES) {
        if (self.maxScrollCount == 0) {
            self.maxScrollCount = MAX(1, arc4random_uniform(15));
        }
        
        if (self.autoScrollCount >= self.maxScrollCount) {
            // 刷到底了，结束，返回
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD xy_showMessage:@"够了，再见！"];
                [self.navigationController popToRootViewControllerAnimated:YES];
                XYAwemeManager.manager.executedUserId = nil;
            });
            return;
            
        }
    }
    
    if ((self.autoScrollCount + 1) % 70 == 0) {
        [self.view xy_hideHUD];
        [self.view xy_showMessage:@"滑动视频多久啦\n去微信看看吧!"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [XYAwemeManager openWechat];
        });
        
        self.autoScrollCount += 1;
        return;
    }
    
    // 15秒容易出现手【手速太快了，休息一下吧～】, 导致无法点赞
    // 让下一次执行的时间随机
    CGFloat delay = MAX(arc4random_uniform(19), 11);
    CGFloat delayTime = 3.0;
    NSString *message = [NSString stringWithFormat:@"用户详情自动播放已开启\n可在设置中以关闭\n当前播放第%ld个", self.autoScrollCount ];
    if (self.autoScrollCount > 80) {
        delay = MAX(arc4random_uniform(35), 18);
        message = [NSString stringWithFormat:@"用户详情超过80次自动化速度将会被降低\n当前播放第%ld个", self.autoScrollCount];
    }
    if ((self.autoScrollCount + 1) % 55 == 0) {
        // 每55 次 就休息一次
        delay = MAX(arc4random_uniform(260), 160);
        message = [NSString stringWithFormat:@"用户详情休息%1.f秒\当前播放第%ld个", delay, self.autoScrollCount];
        delayTime = delay;
    }
    
    [self performSelector:@selector(xy_automaticPlayNext) withObject:nil afterDelay:delay inModes:@[NSDefaultRunLoopMode]];
    
    [self.view xy_hideHUD];
    [self.view xy_showMessage:message delayTime:delayTime];
    XYLog(@"当前播放第%ld个", self.autoScrollCount);
}

%new
- (void)xy_stopAutoPlayNext {
    
    self.isStartPlayNext = NO;
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(xy_automaticPlayNext) object:nil];
    
    [self.view xy_hideHUD];
    [self.view xy_showMessage:[NSString stringWithFormat:@"用户详情自动播放已关闭\n去设置中开启\n当前播放第%ld个", self.autoScrollCount]];
    XYLog(@"当前已停止播放");
}

%new
- (void)xy_automaticPlayNext {
    // [[[UIApplication sharedApplication].delegate window] rootViewController]
    XYLog(@"%@", self.navigationController.viewControllers);
    // "<AWEFeedRootViewController: 0x10fc43460>"
    __block NSString *logInfo = @"";
    @try {
        UITableView *tableView = MSHookIvar<UITableView*>(self, "_tableView");
        NSIndexPath *visibleIndexPath = [tableView indexPathsForVisibleRows].firstObject;
        if (!visibleIndexPath) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self xy_startAutoPlayNext] ;
            });
            return;
        }
        
        __weak typeof(self) weakSelf = self;
        dispatch_block_t completionBlock = ^{
            if (weakSelf == nil) {
                return;
            }
            if ([XYAwemeManager isLogin] == NO) {
                 // 未登陆
                weakSelf.autoScrollCount += 1;
                [weakSelf xy_startAutoPlayNext];
                return;
            }
            
            id visibleCell = [tableView visibleCells].firstObject;
            // AWEFeedLiveStreamTableViewCell 直播的cell
            // 视频cell AWEFeedViewCell
            if (!visibleCell) {
                // 不存在播放中的视频
                weakSelf.autoScrollCount += 1;
                [weakSelf xy_startAutoPlayNext];
                return;
            }
            
            if (![visibleCell isKindOfClass:NSClassFromString(@"AWEAwemeDetailTableViewCell")]) {
                // 不是AWEAwemeDetailTableViewCell，忽略
                weakSelf.autoScrollCount += 1;
                [weakSelf xy_startAutoPlayNext];
                return;
            }

            if ([visibleCell isKindOfClass:NSClassFromString(@"AWEFeedLiveStreamTableViewCell")]) {
                // 当前在直播中，忽略
                weakSelf.autoScrollCount += 1;
                [weakSelf xy_startAutoPlayNext];
                return;
            }
            AWEAwemeDetailCellViewController *viewController = MSHookIvar<AWEAwemeDetailCellViewController*>(visibleCell, "_viewController");
            AWEAwemePlayInteractionViewController *iVC = viewController.interactionController;
            
            // 如果是没有账号的广告或者正在直播 直接划过去
            if (iVC.model.isNoAccountAd == YES || iVC.model.isLive == YES) {
                weakSelf.autoScrollCount += 1;
                [weakSelf xy_startAutoPlayNext];
                return;
            }
            
            // 模拟点赞完成后的回调
            void (^likeCompletion)(void) = ^{
                if (weakSelf == nil) {
                    return;
                }
                // 每次评论
                if ((weakSelf.autoScrollCount) % 4 == 1) {
                    // 弹出评论列表评论
                    [weakSelf xy_commentWithInteractionViewController:iVC block:^{
                        weakSelf.autoScrollCount += 1;
                        [weakSelf xy_startAutoPlayNext];
                    }];
                }
                else {
                    weakSelf.autoScrollCount += 1;
                    [weakSelf xy_startAutoPlayNext];
                }
            };
            
            // 每6次就有一次不点赞，防止被认为=机器人
            // 点赞 独立
            if ((weakSelf.autoScrollCount + 1) % 6 != 0) {
                logInfo = @"(self.autoScrollCount + 1) % 6 != 0";
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(arc4random_uniform(6) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [weakSelf xy_likeWithInteractionViewController:iVC block:likeCompletion];
                });
            }
            else {
                likeCompletion();
            }
            
        };
        
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:visibleIndexPath.row + 1 inSection:visibleIndexPath.section];
        
        // 滚动到下一个视频
        // 直接滚过去
        [self xy_scrollToIndexPath:nextIndexPath completion: ^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if (completionBlock != nil) {
                    completionBlock();
                }
            });
        }];
        
    } @catch (NSException *exception) {
        XYLog(@"catch出错了%@", exception.reason);
        [self.view xy_hideHUD];
        [self.view xy_showMessage:[NSString stringWithFormat:@"出错了%@\%@", exception.reason, logInfo]];
    }
}

%new
- (void)xy_likeWithInteractionViewController:(AWEAwemePlayInteractionViewController *)iVC block:(void (^)(void))block {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        // 直接执行点赞的事件, 可能会取消赞，所以不使用此方法
        if (iVC.model.userDigged == NO) {
            [iVC performLikeAction];
            // 执行btn 的TouchUpInside 无效
            //                        [iVC.likeButton sendActionsForControlEvents:UIControlEventTouchUpInside];
            
            // 触发双击事件
            //                        [iVC onVideoPlayerViewDoubleClicked:viewController.tapGesture];
        }
        else {
            XYLog(@"已经点过赞！");
        }
        // 没5次就有一次不点赞，防止被认为=机器人
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (block) {
                block();
            }
        });
    });
    
    
}

%new
- (void)xy_scrollToIndexPath:(NSIndexPath *)indexPath completion:(void (^)(void))completion {
    dispatch_block_t block = ^{
        
        UITableView *tableView = MSHookIvar<UITableView*>(self, "_tableView");
        NSInteger totalCount = [tableView.dataSource tableView:self.tableView numberOfRowsInSection:indexPath.section];
        
        if (indexPath.row > totalCount - 1) {
            // 刷到底了，结束，返回
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD xy_showMessage:@"用户详情已经滑到最后一个了，现在返回吧"];
                [self.navigationController popToRootViewControllerAnimated:YES];
                XYAwemeManager.manager.executedUserId = nil;
                dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion();
                }
                });
            });
            return;
        }
        
        NSIndexPath *visibleIndexPath = tableView.indexPathsForVisibleRows.lastObject;
        if (visibleIndexPath == nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion();
                }
            });
            return;
        }
        
//        if (visibleIndexPath && [visibleIndexPath isEqual:indexPath]) {
//            dispatch_async(dispatch_get_main_queue(), ^{
//                if (completion) {
//                    completion();
//                }
//            });
//            return;
//        }
        
        if (visibleIndexPath && visibleIndexPath.section != indexPath.section) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion();
                }
            });
            return;
        }
        
        // 下面两个滑动屏幕的方法的效果会有小差异，随机使用
        // 滑动5次就有4次使用XYSimulatedTouch 去执行，但是有时候XYSimulatedTouch不好使（当xy_lastAutoScrollIndexPath != indexPath）
        if (self.xy_lastAutoScrollIndexPath != indexPath) {
            long diff =  abs(indexPath.row - visibleIndexPath.row);
            CGPoint startPoint, endPoint;
            if (indexPath.row > visibleIndexPath.row) {
                // 向上滑动
                startPoint = CGPointMake(tableView.frame.size.width * 0.35, tableView.frame.size.height * 0.7);
                endPoint = CGPointMake(tableView.frame.size.width * 0.35, tableView.frame.size.height * 0.37);
            }
            else {
                // 向下滑动
                startPoint = CGPointMake(tableView.frame.size.width * 0.32, tableView.frame.size.height * 0.3);
                endPoint = CGPointMake(tableView.frame.size.width * 0.36, tableView.frame.size.height * 0.67);
            }
            
            
            [[XYSimulatedTouch sharedInstance] swapWithPoint:startPoint endPoint:endPoint count:diff completion:completion];
            
        }
        else {
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:1.0f];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            //        [tableView setContentOffset:CGPointMake(tableView.contentOffset.x, [UIScreen mainScreen].bounds.size.height * (visibleIndexPath.row + 1)) animated:YES];
            [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
            [UIView commitAnimations];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MAX(arc4random_uniform(5), 2) * NSEC_PER_SEC)), dispatch_get_main_queue(), completion);
        }
        self.xy_lastAutoScrollIndexPath = indexPath;
    };
    
    dispatch_async(dispatch_get_main_queue(), block);
}

%new
- (void)xy_commentWithInteractionViewController:(AWEAwemePlayInteractionViewController *)iVC block:(void (^)(void))block {
    
    if ([[XYAwemeManager manager] isCloseAutoComment] == YES) {
        // 关闭自动评论，直接结束
        dispatch_async(dispatch_get_main_queue(), ^{
            if (block) {
                block();
            }
        });
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
                   
        // 弹出评论列表评论
        [iVC performCommentAction];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
            [[XYSimulatedTouch sharedInstance] swapUp];
        
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                // 为某个评论点赞
                NSIndexPath *indexPath = iVC.commentVC.tableView.indexPathsForVisibleRows.firstObject;
                if (indexPath != nil) {
                    AWECommentPanelBaseCell *cell = (AWECommentPanelBaseCell *)[iVC.commentVC.tableView visibleCells][arc4random_uniform(iVC.commentVC.tableView.visibleCells.count)];
                    // 点赞
                    [cell likeButtonTapped];
                }
                
                if ([[XYAwemeManager manager] isCloseUniqueComment] == NO) {
                    // 如果已经评论过，则退出
                    NSInteger foundUserIdx = [iVC.commentVC.listManager.dataList indexOfObjectPassingTest:^BOOL(AWECommentModel *  _Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {
                        if ([model.author.userID isEqualToString:[XYAwemeManager currentAuthUser].userID]) {
                            *stop = YES;
                            return YES;
                        }
                        return NO;
                    }];
                    
                    if (foundUserIdx != NSNotFound) {
                        // 已经评论过的，不再评论，关闭评论弹框
                        [iVC.commentVC closeBtnClicked:nil];
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            if (block) {
                                block();
                            }
                            
                        });
                        return;
                    }
                    
                }
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                   
                    
                    [iVC.commentVC.commentInputView.textView becomeFirstResponder];
                    
                    // 去评论
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        NSArray *emjList = @[@"[衰]", @"[闭嘴]", @"[机智]", @"[小鼓掌]", @"[灵机一动]", @"[耶]", @"[捂脸]", @"[疑问]", @"[困]", @"[送心]", @"[小鼓掌]", @"[偷笑]"];
                        NSInteger emjIndex = (NSInteger)arc4random_uniform((uint32_t)emjList.count);
                        NSString *commentStr = nil;
                        // 发评论: 原评论大于10条再使用，不然能看出明显的重复评论
                        if (self.autoScrollCount % 5 != 0 && iVC.commentVC.listManager.dataList.count > 30) {
                           // 第一种. 复制评论列表并做微修改发表，防止被抖音认为是重复的评论
                            NSArray<AWECommentModel *> *models = iVC.commentVC.listManager.dataList;
                            NSInteger index = MAX(arc4random_uniform((uint32_t)models.count), models.count / 3);
                            commentStr = models[index].content;
                             if (emjIndex % 2 == 0) {
                                commentStr = [NSString stringWithFormat:@"%@%@%@", commentStr, @"😂", emjList[emjIndex]];
                            }
                        }
                        else {
                            // 第二种. 随机生成评论
//                           commentStr = [[RandomComments sharedInstance] getRandomComment];
                            commentStr = BridgingHelper.nextComment;
                        }
                    
                       iVC.commentVC.commentInputView.textView.text = [NSString stringWithFormat:@"%@%@", emjList[emjIndex], commentStr];
                        
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            [iVC.commentVC commentInputViewShouldReturn:iVC.commentVC.commentInputView];
                            
                            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                
                                
                                // 发送完成后 关闭评论弹框
                                [iVC.commentVC closeBtnClicked:nil];
                                
                                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                    
                                    if (block) {
                                        block();
                                    }
                                    
                                });
                                
                            });
                        });
                    });
                });
            });
     });
  });
}


/*
 void * -[AWEAwemeDetailTableViewController awemeModel](void * self, void * _cmd) {
     r0 = [self currentDisplayingAweme];
     return r0;
 }
 */

- (void)viewDidDisappear:(_Bool)arg1 {
    %orig;
    self.viewIsDisappear = YES;
    [self xy_stopAutoPlayNext];
}
- (void)viewWillDisappear:(_Bool)arg1 {
    %orig;
}
- (void)viewDidAppear:(_Bool)arg1 {
    %orig;
    self.viewIsDisappear = NO;
    [self xy_startAutoPlayNext];
}
- (void)viewWillAppear:(_Bool)arg1 {
    %orig;
}

%new
- (BOOL)isStartPlayNext {
    return [objc_getAssociatedObject(self, @selector(isStartPlayNext)) boolValue];
}

%new
- (void)setIsStartPlayNext:(BOOL)value {
    objc_setAssociatedObject(self, @selector(isStartPlayNext), @(value), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

%new
- (BOOL)viewIsDisappear {
    return [objc_getAssociatedObject(self, @selector(viewIsDisappear)) boolValue];
}

%new
- (void)setViewIsDisappear:(BOOL)value {
    objc_setAssociatedObject(self, @selector(viewIsDisappear), @(value), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
%new
- (int)autoScrollCount {
    return [objc_getAssociatedObject(self, @selector(autoScrollCount)) intValue];
}

%new
- (void)setAutoScrollCount:(int)value {
    objc_setAssociatedObject(self, @selector(autoScrollCount), @(value), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (AWEAwemeModel *)currentDisplayingAweme {
    id model = %orig;
    return model;
}

//%new
//- (NSIndexPath *)xy_lastAutoScrollIndexPath {
//    return objc_getAssociatedObject(self, @selector(xy_lastAutoScrollIndexPath));
//}
//
//%new
//- (void)setXy_lastAutoScrollIndexPath:(NSIndexPath *)value {
//    objc_setAssociatedObject(self, @selector(xy_lastAutoScrollIndexPath), @(value), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}


%new
- (int)maxScrollCount {
    return [objc_getAssociatedObject(self, @selector(maxScrollCount)) intValue];
}
%new
- (void)setMaxScrollCount:(int)value {
    objc_setAssociatedObject(self, @selector(maxScrollCount), @(value), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
%new
- (void)xy_didBecomeActiveNotification {
    [self xy_startAutoPlayNext];
}

%new
- (void)xy_willResignActiveNotification {
    [self xy_stopAutoPlayNext];
}

%new
- (void)xy_savePhoto:(NSNotification *)notify {
    UITableView *tableView = MSHookIvar<UITableView*>(self, "_tableView");
    id visibleCell = [tableView visibleCells].firstObject;
    if (visibleCell && [visibleCell isKindOfClass:NSClassFromString(@"AWEAwemeDetailTableViewCell")]) {
        AWEFeedCellViewController *viewController = MSHookIvar<AWEFeedCellViewController*>(visibleCell, "_viewController");
        AWEAwemePlayInteractionViewController *iVC = viewController.interactionController;
        AWEAwemeModel *model = iVC.model;
        AWEVideoModel *video = model.video;
        AWEURLModel *playURL = video.playURL;
        NSArray *originURLList = playURL.originURLList;
        NSString *url = originURLList.firstObject;
        // 下载这个链接
        if (self.xy_downloader == nil) {
            self.xy_downloader = [XYVideoDownloader new];
            __weak typeof(self) weakSelf = self;
            [self.xy_downloader downloadFileWithUrl:[NSURL URLWithString:url] completion:^(BOOL isSuccess){
                weakSelf.xy_downloader = nil;
            }];
        }
        else {
            [self.view xy_showMessage:@"正在下载中..."];
        }
//        XYLog(@"%@", model);
    }
}

- (void)viewDidLoad {
    %orig;
    
    self.autoScrollCount = 0;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(xy_didBecomeActiveNotification) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(xy_willResignActiveNotification) name:UIApplicationWillResignActiveNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(xy_savePhoto:) name:@"CustomSavePhoto" object:nil];
}

%end


/*               AWEAwemeDetailTableViewController  end         */

%hook AWEUIResponder

+ (id)topViewControllerForController:(id)arg1 {
    id vc = %orig;
    return vc;
}
+ (id)topViewController {
    id vc = %orig;
    return vc;
}

%end


%hook TIMCurrentUserManager

%end

%hook AWEProfilePreloadManager
+ (id)sharedInstance {
    id ret = %orig;
    return ret;
}
- (void)p_preloadPostWorks {
    %orig;
}
- (void)p_preloadUserInfo {
    %orig;
}
- (void)loadPostWorksAfterEnterUserDetailWithSuccessCompletion:(id)block1 failCompletion:(id)block2 {
    %orig;
}
- (void)loadUserAfterEnterUserDetailWithSuccessCompletion:(id)block1 failCompletion:(id)block2 {
    %orig;
}
- (_Bool)hasPreload:(id)block2 {
    BOOL ret = %orig;
    return ret;
}
- (void)preloadPostWorksAndUserInfo:(NSString *)userInfo {
    %orig;
}
- (id)preloadedPostDataManager {
    id ret = %orig;
    return ret;
}
- (id)preloadedProfileResponse {
    id ret = %orig;
    return ret;
}
- (id)preloadedUser {
    id ret = %orig;
    return ret;
}
- (void)setUserID:(NSString *)userID {
    %orig;
}

- (void)setUser:(AWEUserModel *)user {
    %orig;
}
%end

%hook AWEMusicDetailHeaderView

- (void)setAudioModel:(id)model {
    %orig;
}

%end

%hook HTSLive4LayerContainerView

- (void)layoutSubviews {
    %orig;
    
    if ([XYAwemeManager manager].isHideLiveBarrages == YES) {
            HTSLivePopupContainer *popupContainer = MSHookIvar<HTSLivePopupContainer*>(self, "_popupContainer");
            popupContainer.hidden = YES;

            UIView *rtlNormalAnimationContainer = MSHookIvar<HTSEventForwardingView*>(self, "_rtlNormalAnimationContainer");
            rtlNormalAnimationContainer.hidden = YES;
        
            UIView *rtlNormalMediaDecorationContainer = MSHookIvar<HTSEventForwardingView*>(self, "_rtlNormalMediaDecorationContainer");
            rtlNormalMediaDecorationContainer.hidden = YES;
        
            UIView *rtlNormalContentContainer = MSHookIvar<HTSEventForwardingView*>(self, "_rtlNormalContentContainer");
            rtlNormalContentContainer.hidden = YES;
            UIView *animationContainer = MSHookIvar<HTSEventForwardingView*>(self, "_animationContainer");
            animationContainer.hidden = YES;
        
            UIView *rtlNormalMediaContainer = MSHookIvar<HTSEventForwardingView*>(self, "_rtlNormalMediaContainer");
            rtlNormalMediaContainer.hidden = YES;
    }
    
    if ([XYAwemeManager manager].isLivePureMode == YES) {
        UIView *contentContainer = MSHookIvar<HTSEventForwardingView*>(self, "_contentContainer");
        contentContainer.hidden = YES;
    }
}

%end

%ctor
{
    notificationCallback(NULL, NULL, NULL, NULL, NULL);
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                    NULL,
                                    notificationCallback,
                                    CFSTR(kAwemeDylibNotificationName),
                                    NULL,
                                    CFNotificationSuspensionBehaviorCoalesce);
    %init(_ungrouped);
    
}

// See http://iphonedevwiki.net/index.php/Logos

#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import "NSRunLoop+XYExtensions.h"
#import "AwemeApiHeaders.h"
#import "MBProgressHUD+XYHUD.h"
#import "RadomComments.h"
#import "XYAwemeManager.h"
#import "XYSimulatedTouch.h"

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
%property (nonatomic, strong) NSIndexPath *xy_lastAutoScrollIndexPath;
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
    
    if ((self.autoScrollCount + 1) % 80 == 0) {
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
    CGFloat delay = MAX(arc4random_uniform(36), 15);
    CGFloat delayTime = 3.0;
    NSString *message = [NSString stringWithFormat:@"自动播放已开启\n可在设置中以关闭\n当前播放第%ld个", self.autoScrollCount ];
    if (self.autoScrollCount > 100) {
        delay = MAX(arc4random_uniform(80), 50);
        message = [NSString stringWithFormat:@"超过100次自动化速度将会被降低\n当前播放第%ld个", self.autoScrollCount];
    }
    if ((self.autoScrollCount + 1) % 30 == 0) {
        // 每30 次 就延长一下时间
        delay = MAX(arc4random_uniform(360), 180);
        message = [NSString stringWithFormat:@"休息%1.f秒\当前播放第%ld个", delay, self.autoScrollCount];
        delayTime = delay;
    }
    
    
    [self performSelector:@selector(xy_automaticPlayNext) withObject:nil afterDelay:delay inModes:@[NSDefaultRunLoopMode]];
    
    [self.view xy_hideHUD];
    [self.view xy_showMessage:message delayTime:delayTime];
    NSLog(@"当前播放第%ld个", self.autoScrollCount);
}

%new
- (void)xy_stopAutoPlayNext {
    
    self.isStartPlayNext = NO;
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(xy_automaticPlayNext) object:nil];
    
    [self.view xy_hideHUD];
    [self.view xy_showMessage:[NSString stringWithFormat:@"自动播放已关闭\n去设置中开启\n当前播放第%ld个", self.autoScrollCount]];
    NSLog(@"当前已停止播放");
}


%new
- (void)xy_automaticPlayNext {
    // [[[UIApplication sharedApplication].delegate window] rootViewController]
    NSLog(@"%@", self.navigationController.viewControllers);
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
                return;
                // 每 10次 收藏一波音乐
                if ((self.autoScrollCount + 1) % 8 == 0) {
                    logInfo = @"(self.autoScrollCount + 1) % 10 == 0";
                    
                    [self xy_collectionMusicWithInteractionViewController:iVC block:^{
                        self.autoScrollCount += 1;
                        [self xy_startAutoPlayNext];
                    }];
                    
                }
                // 每14次 关注一波
                else if ((self.autoScrollCount + 1) % 5 == 0) {
                    logInfo = @"(self.autoScrollCount + 1) % 14 == 0";
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
        NSLog(@"catch出错了%@", exception.reason);
        [self.view xy_hideHUD];
        [self.view xy_showMessage:[NSString stringWithFormat:@"出错了%@\%@", exception.reason, logInfo]];
    } @finally {
        //        [self.view xy_hideHUD];
        //        [self.view xy_showMessage:[NSString stringWithFormat:@"finally出错了\%@", logInfo]];
    }
}

%new
- (void)xy_loginWithBlock:(void (^)(void))block {
    
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
        
        [[XYSimulatedTouch sharedInstance] swapUp];
        
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
             
             dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
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
        
          AWESearchUser *searchUserModel = userResultVC.manager.userArray[0];
           if (searchUserModel.userInfo.followStatus == 1) {
               // 已关注 忽略
              completion();
              return;
          }
        
                [userResultVC followUser:searchUserModel indexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        
                // 关注完成后 等待6秒退出
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        
                      [[XYSimulatedTouch sharedInstance] swapUp];
                    
                       completion();
                    });
            });
            completion();
        }
        else {
                   
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [[XYSimulatedTouch sharedInstance] swapLeft];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        
                      [[XYSimulatedTouch sharedInstance] swapLeft];
                       completion();
                    });
            });
        }
        
        
        
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
//                   [iVC performLikeAction]; // tiktok 没有 performLikeAction 这个方法
                   // 执行btn 的TouchUpInside 无效
                   //                        [iVC.likeButton sendActionsForControlEvents:UIControlEventTouchUpInside];
                   
                   // 触发双击事件
                    [iVC onVideoPlayerViewDoubleClicked:nil];
                   }
                   else {
                   NSLog(@"已经点过赞！");
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
        
      // 第一种关注方式 在首页的非纯模式（pureMode）下，通过首页的关注按钮关注
            [iVC.presenter onFollowViewClicked:nil];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
                if (iVC.model.userDigged == YES) {
                    if (block) {
                        block();
                    }
                }
                else {
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        // 直接执行点赞的事件
                        [iVC onVideoPlayerViewDoubleClicked:nil];
                        
                        if (block) {
                            block();
                        }
                    });
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
%end

%hook AWEAwemeModel

- (BOOL)preventDownload {
    BOOL flag = %orig;
    return flag;
}

- (BOOL)allowDownloadWithoutWatermark {
    BOOL flag = %orig;
    return true;
}

%end

%hook AWEShareBasePanelController
- (void)notifyExtensionsWithSelector:(SEL)arg1 {
    %orig;
}
- (void)addExtension:(id)arg1 {
    %orig;
}
%end

%hook AWEShareCollectionView // 分享面板的
- (void)sendEvents:(unsigned long long)arg1 toItemAtIndexPath:(NSIndexPath *)indexPath {
    %orig; // arg1==8
}
- (void)collectionView:(id)arg1 didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    AWEShareItem *item = self.items[indexPath.row];
    if ([item.shareType isEqualToString:@"custom_download"]) {
        UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"保存相册" message:@"如果保存就选择好的" preferredStyle:UIAlertControllerStyleAlert];
        [alertVc addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"CustomSavePhoto" object:nil];
        }]];
        [alertVc addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        
        [[XYAwemeManager topViewController] presentViewController:alertVc animated:true completion:nil];
    }
    else {
        %orig;
    }
}

- (id)initWithItems:(NSArray<AWEShareItem *> *)items hostView:(id)hostView {
    NSMutableArray<AWEShareItem *> *itemsM = [items mutableCopy];
    Class AWEShareItem = NSClassFromString(@"AWEShareItem");
    id downloadItem = [[AWEShareItem alloc] initWithType:@"custom_download"];
    [downloadItem setValue:@YES forKey:@"enabled"];
    [downloadItem setValue:@"下载" forKey:@"title"];
    [downloadItem setValue:items.lastObject.image forKey:@"image"];
    [itemsM addObject:downloadItem];
    
    id obj = %orig(itemsM, hostView);
    return obj;
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

+ (void)composeWithFileURL:(id)arg1 awemeModel:(id)arg2 options:(long long)arg3 watermarkTaskType:(unsigned long long)arg4 shouldMuteVideo:(_Bool)arg5 needSaveToAlbum:(_Bool)arg6 removeLocalFile:(_Bool)arg7 edgeData:(id)arg8 {
    %orig;
}

+ (void)downloadVideoWithURLGoup:(id)arg1 seed:(long long)arg2 destinationURL:(id)arg3 progress:(id)arg4 completionHandler:(id)arg5 {
    %orig;
}
+ (void)downloadVideoWithURLGoup:(id)arg1 destinationURL:(id)arg2 progress:(id)arg3 completionHandler:(id)arg4 {
    %orig;
}

+ (void)trackWatermarkShareDownloadEventWithShareType:(long long)arg1 downloadURLs:(id)arg2 hasWatermark:(_Bool)arg3 hasEndWatermark:(_Bool)arg4 {
    %orig;
}

%end

%hook AWEVideoModel

- (id)downloadURL {
    id obj = %orig;
    return obj;
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

+ (id)endingWaterMarkLogoImage {
    id obj = %orig;
    return obj;
}

- (AWEAwemeModel *)model {
    id obj = %orig;
    return obj;
}

+ (void)addWaterMarkWithUrl:(id)arg1 composeOptions:(long long)arg2 model:(id)arg3 shouldMuteVideo:(_Bool)arg4 needSaveToAlbum:(_Bool)arg5 userName:(id)arg6 videoOutputSize:(struct CGSize)arg7 edgeData:(id)arg8 canDirectAddVideoheader:(_Bool)arg9 progress:(CDUnknownBlockType)arg10 complete:(CDUnknownBlockType)arg11 onlyForCrop:(_Bool)arg12 watermarkTaskType:(unsigned long long)arg13 removeSourceFile:(_Bool)arg14 {
    %orig;
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

%hook AVMDLDataLoader
- (_Bool)_supportPoxy:(NSString *)url {
    // 此url 的视频可以直接下载
    NSLog(@"AVMDLDataLoader, url: %@", url);
    if (![url hasPrefix: @"https://api-"]) { // 注意：api 是播放的链接无法直接下载
        [UIPasteboard generalPasteboard].string = url;
    }
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
    NSLog(@"%@", self.navigationController.viewControllers);
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
//    %orig;
}
- (void)awe_UITracker_gestureRecognizer:(id)arg1 {
//    %orig(arg1);
}
- (void)awe_UITracker_addGestureRecognizer:(id)arg1 {
    // 不让记录用户行为
//    %orig(arg1);
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
    return %orig;
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
        NSLog(@"9999999==%@=",event);
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

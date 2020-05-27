//
//  XYAwemeManager.m
//  AwemeDylib
//
//  Created by xiaoyuan on 2020/1/29.
//  Copyright © 2020 enba. All rights reserved.
//

#import "XYAwemeManager.h"
#import "MBProgressHUD+XYHUD.h"
#include <sys/stat.h>
#import "AwemeApiHeaders.h"
#import "AwemeApiHeaders1.h"

#define kRemovedEndWatermarkkKey @"com.enba.removedEndWatermark"
#define kRemovedWatermarkKey @"com.enba.removedWatermark"
#define kAuthorizedToDownload @"com.enba.authorizedToDownload"
#define kCounrtyCode @"com.enba.counrtyCode"
#define kRemovePreventDownloadKey @"com.enba.removePreventDownload"
#define kAutoPlayNextKey @"com.enba.autoPlayNext"
#define kPureModetKey @"com.enba.pureMode"
#define kLivePureModetKey @"com.enba.livePureMode"
#define kMaxPlayLimitOfUserprofile @"com.enba.maxPlayLimitOfUserprofile"
#define kIsCloseAutoComment @"com.enba.isCloseAutoComment"
#define kIsCloseUniqueComment @"com.enba.isCloseUniqueComment"
#define kIsCloseFollow @"com.enba.isCloseFollow"


@interface XYAwemeManager ()

@property (nonatomic, assign) CGRect keyboardFrame;

@end

@implementation XYAwemeManager

+ (instancetype)manager {
    static id _instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [self new];
    });
    return _instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboarWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboarDidShowNotification:) name:UIKeyboardDidShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboarWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

- (void)setIsRemovedEndWatermark:(BOOL)isRemovedEndWatermark {
    [[NSUserDefaults standardUserDefaults] setBool:isRemovedEndWatermark forKey:kRemovedEndWatermarkkKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)isRemovedEndWatermark {
    return [[[NSUserDefaults standardUserDefaults] valueForKey:kRemovedEndWatermarkkKey] boolValue];
}
- (void)setIsRemovedWatermark:(BOOL)isRemovedWatermark {
    [[NSUserDefaults standardUserDefaults] setBool:isRemovedWatermark forKey:kRemovedWatermarkKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)isRemovedWatermark {
    return [[[NSUserDefaults standardUserDefaults] valueForKey:kRemovedWatermarkKey] boolValue];
}

- (void)setAuthorizedToDownload:(NSNumber *)authorizedToDownload {
    [[NSUserDefaults standardUserDefaults] setValue:authorizedToDownload forKey:kAuthorizedToDownload];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSNumber *)authorizedToDownload {
    return [[NSUserDefaults standardUserDefaults] valueForKey:kAuthorizedToDownload];
}

- (void)setIsRemovePreventDownload:(BOOL)isRemovePreventDownload {
    [[NSUserDefaults standardUserDefaults] setBool:isRemovePreventDownload forKey:kRemovePreventDownloadKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)isRemovePreventDownload {
    return [[NSUserDefaults standardUserDefaults] boolForKey:kRemovePreventDownloadKey];
}

- (void)setCountryCode:(NSString *)countryCode {
    [[NSUserDefaults standardUserDefaults] setValue:countryCode forKey:kCounrtyCode];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)countryCode {
    NSString *countryCode = [[NSUserDefaults standardUserDefaults] valueForKey:kCounrtyCode];
    if (countryCode == nil) {
        countryCode = @"JP";
    }
    return countryCode;
}

- (void)setIsAutoPlayNext:(BOOL)isAutoPlayNext {
    [[NSUserDefaults standardUserDefaults] setValue:@(isAutoPlayNext) forKey:kAutoPlayNextKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)isAutoPlayNext {
    NSNumber *isAutoPlay = [[NSUserDefaults standardUserDefaults] valueForKey:kAutoPlayNextKey];
    if (isAutoPlay == nil) {
        return YES;
    }
    return isAutoPlay.boolValue;
}


- (void)setIsPureMode:(BOOL)isPureMode {
    [[NSUserDefaults standardUserDefaults] setBool:isPureMode forKey:kPureModetKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)isPureMode {
    return [[NSUserDefaults standardUserDefaults] boolForKey:kPureModetKey];
}

- (void)setIsLivePureMode:(BOOL)isLivePureMode {
    [[NSUserDefaults standardUserDefaults] setBool:isLivePureMode forKey:kLivePureModetKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)isLivePureMode {
    return [[NSUserDefaults standardUserDefaults] boolForKey:kLivePureModetKey];
}

- (void)setIsMaxPlayLimitOfUserprofile:(BOOL)isMaxPlayLimitOfUserprofile {
    [[NSUserDefaults standardUserDefaults] setBool:isMaxPlayLimitOfUserprofile forKey:kMaxPlayLimitOfUserprofile];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)isMaxPlayLimitOfUserprofile {
    NSNumber *num = [[NSUserDefaults standardUserDefaults] objectForKey:kMaxPlayLimitOfUserprofile];
    if (num == nil) {
        return YES;
    }
    return num.boolValue;
}

- (BOOL)isCloseAutoComment {
    return [[NSUserDefaults standardUserDefaults] boolForKey:kIsCloseAutoComment];
}

- (void)setIsCloseAutoComment:(BOOL)isCloseAutoComment {
    [[NSUserDefaults standardUserDefaults] setBool:isCloseAutoComment forKey:kIsCloseAutoComment];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

- (BOOL)isCloseUniqueComment {
    return [[NSUserDefaults standardUserDefaults] boolForKey:kIsCloseUniqueComment];
}

- (void)setIsCloseUniqueComment:(BOOL)isCloseUniqueComment {
    [[NSUserDefaults standardUserDefaults] setBool:isCloseUniqueComment forKey:kIsCloseUniqueComment];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

- (void)setIsCloseFollow:(BOOL)isCloseFollow {
    [[NSUserDefaults standardUserDefaults] setBool:isCloseFollow forKey:kIsCloseFollow];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)isCloseFollow {
    return [[NSUserDefaults standardUserDefaults] boolForKey:kIsCloseFollow];
}

- (NSDictionary *)getCarrierInfo {
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistFile = [bundle pathForResource:@"countryCode" ofType:@"plist"];
    NSArray *list = [NSArray arrayWithContentsOfFile:plistFile];
    
    NSString *countryCode = [[XYAwemeManager manager] countryCode];
    for (NSInteger index = 0; index < list.count; index ++) {
        NSDictionary *dataDic = list[index];
        if ([countryCode.lowercaseString isEqualToString:[dataDic[@"code"] lowercaseString]]) {
            return dataDic;
        }
    }
    return nil;
}

+ (void)openWechat {
    NSURL * url = [NSURL URLWithString:@"weixin://"];
    BOOL canOpen = [[UIApplication sharedApplication] canOpenURL:url];
    //先判断是否能打开该url
    if (canOpen) {   //打开微信
        if (@available(iOS 10.0, *)) {
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        } else {
            [[UIApplication sharedApplication] openURL:url];
        }
    }else {
        [MBProgressHUD xy_showMessage:@"您的设备未安装微信APP"];
    }
}

//是否越狱
+ (BOOL)isPrisonBreak
{
    if ([self isSimulator]) return NO;
    
    bool pb = NO;
    
    // 常见越狱文件
    NSArray *pathArray = @[
        @"/Applications/Cydia.app",
        @"/Library/MobileSubstrate/MobileSubstrate.dylib",
        @"/bin/bash",
        @"/usr/sbin/sshd",
        @"/etc/apt"
    ];
    for (int i = 0; i < pathArray.count; i++) {
        NSString *path = pathArray[i];
        if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
            pb = YES;
        }
    }

    // 读取系统所有的应用名称
    if ([[NSFileManager defaultManager] fileExistsAtPath:@"/User/Applications/"]){
        pb = YES;
    }
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://"]]) {
        pb = YES;
    }
    

    struct stat stat_info;
    //使用stat系列函数检测Cydia等工具
    if (0 == stat("/Applications/Cydia.app", &stat_info)) {
        pb = YES;
    }
    
    // 读取环境变量
    char *checkInsertLib = getenv("DYLD_INSERT_LIBRARIES");
    if (checkInsertLib) {
        pb = YES;
    }
    
    return pb;
}
+ (BOOL)isSimulator {
#if TARGET_OS_SIMULATOR
    return YES;
#else
    return NO;
#endif
}

// 判断IPA包二进制文件是否被更改，被二次打包
+ (BOOL)isSecondIPA {
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSDictionary *info = [bundle infoDictionary];
    if ([info objectForKey: @"SignerIdentity"] != nil){
        //存在这个key，则说明被二次打包了
        return YES;
    }
    
    return NO;
}


+ (BOOL)isLogin {
    
    AWEUserModel *user = [self currentAuthUser];
    return user.userID != nil;
    // 10.4.1以后 BDDiamondAfterHeatManager这个类找不到了
//    BDDiamondAfterHeatManager *manager = [NSClassFromString(@"BDDiamondAfterHeatManager") performSelector:@selector(sharedInstance)];
//    if ([manager currentLoginUID].length == 0) {
//        return NO;
//    }
    return YES;
}

+ (AWEUserModel *)currentAuthUser {
     // "AWEUserStorageCacheUserKey", DATA XREF=+[AWEUserStorage getUser]+176, +[AWEUserStorage saveUser:]+212, +[AWEUserStorage clearUser]+108
    id AWEUserStorage = NSClassFromString(@"AWEUserStorage");
    AWEUserModel *user = [AWEUserStorage performSelector:@selector(getUser)];
    NSLog(@"当前登陆的用户信息: %@", user);
    return user;
}

// 通过View获取View的所在控制器
+ (UIViewController *)viewControllerFromView:(UIView *)view {

    UIResponder *responder = [view nextResponder];
    while(responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return(UIViewController *)responder;
        }
        responder = [responder nextResponder];
    }
    return nil;

}

- (void)keyboarDidShowNotification:(NSNotification *)notify {
    // 通过通知对象获取键盘frame: [value CGRectValue]
    NSDictionary *useInfo = [notify userInfo];
    NSValue *value = [useInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    self.keyboardFrame = [value CGRectValue];
}

- (void)keyboarWillHideNotification:(NSNotification *)notify {
    self.keyboardFrame = CGRectZero;
}

+ (CGRect)getCurrentKeyboardFrame {
    return [XYAwemeManager manager].keyboardFrame;
}
+ (AWEUserDetailViewController *)createUserProfilePageWithUserId:(NSString *)userId preloadedUser:(id)preloadedUser {
    AWEUserDetailViewController *detailVC = [[ NSClassFromString(@"AWEUserDetailViewController") alloc] init];
    detailVC.userID = userId;
    [detailVC setPreloadedUser: preloadedUser];
    return detailVC;
}

+ (AWEUserDetailViewController *)showUserProfilePageWithUserId:(NSString *)userId preloadedUser:(AWEUserModel *)preloadedUser segment:(nonnull NSString *)segment completion:(nonnull void (^)(AWEUserDetailViewController *vc))completion {
    return [self showUserProfilePageWithUserId:userId preloadedUser:preloadedUser toNavitaionController:[self topViewController].navigationController segment:segment completion:completion];
}

+ (AWEUserDetailViewController *)showUserProfilePageWithUserId:(NSString *)userId preloadedUser:(AWEUserModel *)preloadedUser toNavitaionController:(UINavigationController *)nac segment:(nonnull NSString *)segment completion:(nonnull void (^)(AWEUserDetailViewController *vc))completion {
    AWEUserDetailViewController *detailVC = [[ NSClassFromString(@"AWEUserDetailViewController") alloc] init];
    detailVC.userID = userId;
    [detailVC setPreloadedUser: preloadedUser];
    
    [nac pushViewController:detailVC animated:true];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 跳转到作品tab
        AWESlidingTabButton *postworkButton;
        for ( AWESlidingTabButton *btn in detailVC.tabView.buttonArray) {
            // segment 比如作品
            if ([[btn titleForState:UIControlStateNormal] containsString:segment]) {
                postworkButton = btn;
                break;
            }
        }
        
        if (postworkButton == nil) {
            // 没有找到segment，就返回
            [nac popToRootViewControllerAnimated:YES];
            if (completion) {
                completion(detailVC);
            }
            return;
        }
        
        // 切换到作品列
        [detailVC.tabView tabButtonClicked:postworkButton];
        if (completion) {
            completion(detailVC);
        }
    });
    
    return detailVC;
}

+ (AWEUserDetailViewController *)playVideoWithUserId:(NSString *)userId videoIndex:(NSInteger)index preloadedUser:(AWEUserModel *)preloadedUser completion:(void (^)(AWEUserDetailViewController * _Nonnull))completion {
    return [self showUserProfilePageWithUserId:userId preloadedUser:preloadedUser segment:@"作品" completion:^(AWEUserDetailViewController * _Nonnull detailVC) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                // 点击作品的第一个视频，进入播放列表页,注意：第0组可能没数据
                NSInteger numberOfSections = [detailVC.postVC.collectionView numberOfSections];
                NSInteger rowCount = 0;
                for (NSInteger i = 0; i < numberOfSections; i++) {
                    rowCount += [detailVC.postVC.collectionView.dataSource collectionView:detailVC.postVC.collectionView numberOfItemsInSection:i];
                }
                if (rowCount <= 1) {
                    [detailVC.navigationController popToRootViewControllerAnimated:YES];
                    if (completion) {
                        completion(detailVC);
                    }
                    return;
                }
                
                // 点击第1个作品，进入播放页
                // 防止点击超出 显示的外围外
                NSInteger clickRow = index;
                NSArray<NSIndexPath *> *indexPathsForVisibleItems = detailVC.postVC.collectionView.indexPathsForVisibleItems;
//                NSInteger firstDisplayIndex = indexPathsForVisibleItems.firstObject.item;
//                 NSInteger lastDisplayIndex = indexPathsForVisibleItems.lastObject.item;
//                clickRow = MAX(firstDisplayIndex, MIN(lastDisplayIndex, clickRow));
                // 随机
//                NSInteger clickRow = MAX(firstDisplayIndex, MIN(lastDisplayIndex, arc4random_uniform(rowCount)));
                
                clickRow = MAX(0, MIN(rowCount, clickRow));
                
                [detailVC.postVC collectionView:detailVC.postVC.collectionView didSelectItemAtIndexPath:[NSIndexPath indexPathForRow:clickRow inSection:indexPathsForVisibleItems.firstObject.section]];
                if (completion) {
                    completion(detailVC);
                }
            });
        }];
}


+ (UIViewController *)topViewController {
    return [NSClassFromString(@"AWEUIResponder") topViewController];
}

@end

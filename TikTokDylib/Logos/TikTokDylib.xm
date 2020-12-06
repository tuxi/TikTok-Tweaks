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
%property (nonatomic, strong) XYVideoDownloader *xy_downloader;

//- (void)viewDidLoad {
//    %orig;
//
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(xy_savePhoto:) name:@"CustomSavePhoto" object:nil];
//}

- (void)viewDidDisappear:(BOOL)animated {
    %orig;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"CustomSavePhoto" object:nil];

}

- (void)viewWillAppear:(BOOL)animated {
    %orig;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(xy_savePhoto:) name:@"CustomSavePhoto" object:nil];
}

%new
- (void)xy_savePhoto:(NSNotification *)notify {
    
//    id topVc = [XYAwemeManager topViewController];
//    if (![topVc isKindOfClass:NSClassFromString(@"AWEFeedRootViewController")]) {
//        return;
//    }
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
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [[NSNotificationCenter defaultCenter] postNotificationName:@"CustomSavePhoto" object:nil];
            });
        }]];
        [alertVc addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        
        [[XYAwemeManager topViewController] presentViewController:alertVc animated:NO completion:nil];
    }
    else {
        %orig;
    }
}

- (id)initWithItems:(NSArray<AWEShareItem *> *)items hostView:(id)hostView {
    // 增加下载视频按钮
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

- (AWEAwemeModel *)currentDisplayingAweme {
    id model = %orig;
    return model;
}

//- (void)viewDidLoad {
//    %orig;
//
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(xy_savePhoto:) name:@"CustomSavePhoto" object:nil];
//}

- (void)viewDidDisappear:(BOOL)animated {
    %orig;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"CustomSavePhoto" object:nil];

}

- (void)viewWillAppear:(BOOL)animated {
    %orig;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(xy_savePhoto:) name:@"CustomSavePhoto" object:nil];
}

%new
- (void)xy_savePhoto:(NSNotification *)notify {
//    id topVc = [XYAwemeManager topViewController];
//    if (![topVc isKindOfClass:NSClassFromString(@"AWEAwemeDetailTableViewController")]) {
//        return;
//    }
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
    }
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

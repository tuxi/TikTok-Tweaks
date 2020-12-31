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

- (_Bool)alertIfCanNotComment {
    return NO;
}
%end


%hook AWEAwemeBaseViewController
- (_Bool)alertIfNotValid {
    return NO;
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
- (_Bool)canBeReposted {
    return YES;
}
- (_Bool)videoCommentStauts {
    return YES;
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


/*-------------------直播相关-----------------------*/
%hook AWELiveInteractViewController
- (void)viewDidLoad {
    %orig;
    NSLog(@"AWELiveInteractViewController CALLED");
    
    /*
     AWELiveInteractViewController: AWELiveCommentInputView *_commentInputView
     AWELiveCommentInputView: AWEGrowingTextView *textView
     AWEGrowingTextView: AWETextViewInternal *internalTextView
     AWETextViewInternal: NSString *placeholder,
     
     // This is for testing. You can see the text can be set to over 50 characters.
     self.commentInputView.textView.internalTextView.placeholder = @"TEST 123";
     self.commentInputView.textView.internalTextView.text = @"123456789101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899100123456789101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899100123456789101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899100123456789101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899100123456789101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899100123456789101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899100123456789101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899100123456789101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899100123456789101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899100123456789101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899100123456789101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899100123456789101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899100🐶";
     */
    
    // Adding New button
//    UIButton *newChatButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    UIImage *chatImage = [[UIImage imageNamed:@"ic_home_like_after.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [newChatButton setBackgroundImage:chatImage forState:UIControlStateNormal];
//    [newChatButton addTarget:self action:@selector(newChatButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
//
//    newChatButton.frame = CGRectMake(0, 0, 25, 25);
//    [self.commentInputView addSubview: newChatButton];
}

//%new
//- (void)newChatButtonTapped:(UIButton*)button {
//    // When the heart button is tapped, bring up an alertController with a textfield.
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Type more than 50 Characters here" message:@"Tap Send after tapping Done" preferredStyle:UIAlertControllerStyleAlert];
//
//    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
//        textField.autocorrectionType = UITextAutocorrectionTypeYes;
//        textField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
//        textField.placeholder = @"Say something epic...";
//
//        // Check if the user has typed something in the internalTextView.
//        if ( [self.commentInputView.textView.internalTextView.text length] != 0) {
//            textField.text = self.commentInputView.textView.internalTextView.text;
//        }
//    }];
//
//    UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"Done" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        //NSLog(@"Chat message is %@", [[alertController textFields][0] text]);
//        self.commentInputView.textView.internalTextView.text = [[alertController textFields][0] text];
//
//        // After the user taps Done, bring up the previous textView to send the message.
//        [self.commentInputView.textView.internalTextView becomeFirstResponder];
//    }];
//
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//        //NSLog(@"Canelled");
//    }];
//
//    [alertController addAction: doneAction];
//    [alertController addAction: cancelAction];
//    [self presentViewController:alertController animated:YES completion:nil];
//}

%end



@interface AWEAppLiveSettingManager : NSObject
+ (_Bool)disableNewPayment;
+ (id)newWalletConf;
+ (_Bool)showSkylightAnimation;
+ (_Bool)disableLiveCDNNodeSelection;
+ (_Bool)isLivePodcast;
+ (double)liveResH;
+ (double)liveResW;
+ (double)liveFps;
+ (double)liveMinBitrate;
+ (double)liveMaxBitrate;
+ (double)liveDefaultBitrate;
@end

%hook AWEAppLiveSettingManager
+ (_Bool)disableNewPayment {
    bool val = %orig;
    NSLog(@"[AWEAppLiveSettingManager disableNewPayment], returnValue: %d", val);
    return %orig;
}
// called when wallet cell is tapped from settings
+ (id)newWalletConf {
    id val = %orig;
    NSLog(@"[AWEAppLiveSettingManager newWalletConf], returnValue: %@", val);
    return %orig;
}
+ (_Bool)showSkylightAnimation {
    bool val = %orig;
    NSLog(@"[AWEAppLiveSettingManager showSkylightAnimation], returnValue: %d", val);
    return %orig;
}
+ (_Bool)disableLiveCDNNodeSelection {
    bool val = %orig;
    NSLog(@"[AWEAppLiveSettingManager disableLiveCDNNodeSelection], returnValue: %d", val);
    return %orig;
}

+ (_Bool)isLivePodcast {
    bool val = %orig;
    NSLog(@"[AWEAppLiveSettingManager isLivePodcast], returnValue: %d", val);
    return %orig;
}
+ (double)liveResH {
    double val = %orig;
    NSLog(@"[AWEAppLiveSettingManager liveResH], returnValue: %lf", val);
    return %orig;
}
+ (double)liveResW {
    double val = %orig;
    NSLog(@"[AWEAppLiveSettingManager liveResW], returnValue: %lf", val);
    return %orig;
}
+ (double)liveFps {
    double val = %orig;
    NSLog(@"[AWEAppLiveSettingManager liveFps], returnValue: %lf", val);
    return %orig;
}
+ (double)liveMinBitrate {
    double val = %orig;
    NSLog(@"[AWEAppLiveSettingManager liveMinBitrate], returnValue: %lf", val);
    return %orig;
}
+ (double)liveMaxBitrate {
    double val = %orig;
    NSLog(@"[AWEAppLiveSettingManager liveMaxBitrate], returnValue: %lf", val);
    return %orig;
}
+ (double)liveDefaultBitrate {
    double val = %orig;
    NSLog(@"[AWEAppLiveSettingManager liveDefaultBitrate], returnValue: %lf", val);
    return %orig;
}
%end



@interface AWELiveSetting : NSObject
+ (_Bool)shouldCheckCoins:(_Bool)arg1;
+ (void)setBarrageCoins:(long long)arg1;
+ (long long)barrageCoins;
+ (void)setUserAllCoins:(long long)arg1;
+ (long long)userAllCoins;
@end

%hook AWELiveSetting

// Called when any gift is tapped. Returns 0, or false.
+ (_Bool)shouldCheckCoins:(_Bool)arg1 {
    //NSLog(@"shouldCheckCoins, %d", arg1);
    return %orig;
}
+ (void)setBarrageCoins:(long long)arg1 {
    NSLog(@"setBarrageCoins, %lld", arg1);
    %orig;
}

+ (long long)barrageCoins {
    NSLog(@"barrageCoins");
    return %orig;
}
////// important Changing arg1 will show change your coint ammount in the bottom
// Called when app opens. Gets called when you enter a live room too, gets called when AWELiveGiftListViewController appears
+ (void)setUserAllCoins:(long long)arg1 {
    arg1 = 10000000;
    //[self setBarrageCoins: arg1];
    // NSLog(@"setUserAllCoins: %lld", arg1);
    //%orig (arg1);
    %orig;
}
// This actually does something and lets you tap an icon. The original returned val is 0.
+ (long long)userAllCoins {
    //long long val = %orig;
    // NSLog(@"userAllCoins: %lld", val);
    // long long modifiedVal = 10000000;
    // [self setBarrageCoins: modifiedVal];
    
    // return modifiedVal;
    return %orig;
}
%end



@interface AWELiveTrackEventManager : NSObject
+ (void)trackLiveClickPresent:(id)arg1 isAnchor:(_Bool)arg2 enterFrom:(id)arg3 presentID:(id)arg4 presentCoins:(id)arg5;
+ (void)trackLiveSendPresentSuccess:(id)arg1 isAnchor:(_Bool)arg2 enterFrom:(id)arg3 presentID:(id)arg4 presentCoins:(id)arg5;
@end

%hook AWELiveTrackEventManager

// This is called when a gift is tapped
+ (void)trackLiveClickPresent:(id)arg1 isAnchor:(_Bool)arg2 enterFrom:(id)arg3 presentID:(id)arg4 presentCoins:(id)arg5 {
    %orig;
    //NSLog(@"!!!!!!!!!!!!!!!!");
    //NSLog(@"arg1: %@, arg2: %d, arg3: %@, arg4: %@, arg5: %@", NSStringFromClass([arg1 class]), arg2, NSStringFromClass([arg3 class]), NSStringFromClass([arg4 class]), NSStringFromClass([arg5 class]));
    NSLog(@"trackLiveClickPresent");
    
}
+ (void)trackLiveSendPresentSuccess:(id)arg1 isAnchor:(_Bool)arg2 enterFrom:(id)arg3 presentID:(id)arg4 presentCoins:(id)arg5 {
    %orig;
    NSLog(@"trackLiveSendPresentSuccess!!");
}
%end

@interface AWELiveSendGiftPackage : NSObject
- (void)resetWithPresent:(id)arg1;
@property(copy, nonatomic) NSString *requestId;
@property(nonatomic) long long count;
@property(nonatomic) long long coins;
@property(nonatomic) long long pid;
@end

%hook AWELiveSendGiftPackage
// This is called after (void)_prepareClickTrackWithPreseent:(id)arg1
- (void)resetWithPresent:(id)arg1 {
    // arg1 is of type AWELivePresentModel
    // count: 0, coins: 0, pid: 0 this depends on the gift you're sending. so for a DQ, count: 1, coins: 5000, pid: 5232
    NSLog(@"resetWithPresent, arg1: %@", NSStringFromClass([arg1 class]));
    NSLog(@"count: %lld, coins: %lld, pid: %lld", self.count, self.coins, self.pid);
    NSLog(@"******");
    
    // Commenting this out ignnores the black notification
    %orig;
}
%end


@interface AWELiveGiftListDataController : NSObject
//@property(retain, nonatomic) AWELiveSendPresentResponseModel *sendPresentResponseModel; // @synthesize sendPresentResponseModel=_sendPresentResponseModel;
//@property(retain, nonatomic) AWELivePresentListResponseModel *giftListModel; // @synthesize giftListModel=_giftListModel;
- (void)sendPresent:(id)arg1 presentID:(id)arg2 count:(long long)arg3 completion:(id)arg4;
- (void)filterDisplayPresentList;
- (void)_getFreePresentListWithPresentList:(id)arg1 completion:(id)arg2;
- (void)getSandBoxGiftListModel:(id)arg1 completion:(id)arg2;
- (void)getGiftListModelWithCompletion:(id)arg1 roomID:(id)arg2;
- (void)getGiftListModelWithRoom:(id)arg1 completion:(id)arg2;
@end

%hook AWELiveGiftListDataController

// This gets called when any gift is tapped or after _performSendRequest()
- (void)sendPresent:(id)arg1 presentID:(id)arg2 count:(long long)arg3 completion:(id)arg4 {
    // arg1: __NSCFNumber, arg2: __NSCFNumber,
    // This is in control of the black notification that says "not enough coins" ignoring %orig will take care of that.
    NSLog(@"sendPresent.. arg1: %@, arg2: %@, arg3: %lld", arg1, arg2, arg3);
    //%orig;
    %orig(arg1, arg2, arg3, NULL);
    
}
- (void)filterDisplayPresentList {
    NSLog(@"filterDisplayPresentList");
    %orig;
}
//arg1 is of type AWELivePresentModel, arg2 is ?? Called when gift box is tapped
- (void)_getFreePresentListWithPresentList:(id)arg1 completion:(id)arg2 {
    //NSLog(@"_getFreePresentListWithPresentList.. arg1: %@, arg2: %@", arg1, arg2);
    %orig;
}
- (void)getSandBoxGiftListModel:(id)arg1 completion:(id)arg2 {
    NSLog(@"getSandBoxGiftListModel.. arg1: %@, arg2: %@", arg1, arg2);
    %orig;
}
// ? not sure. Called when gift box is tapped
- (void)getGiftListModelWithCompletion:(id)arg1 roomID:(id)arg2 {
    // NSLog(@"getGiftListModelWithCompletion.. arg1: %@, arg2: %@", arg1, arg2);
    %orig;
}
//arg1 is AWELiveRoomModel, where coins =0. arg2 is? Called when gift box is tapped
- (void)getGiftListModelWithRoom:(id)arg1 completion:(id)arg2 {
    //NSLog(@"getGiftListModelWithRoom.. arg1: %@, arg2: %@", arg1, arg2);
    %orig;
}
%end


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////?
// AWELiveSendGiftController
@interface AWELiveSendGiftController : NSObject
@property(nonatomic) _Bool isDuringSendCollecting;
@property(nonatomic) _Bool isDuringClickCollecting;
//@property(nonatomic) __weak id <AWELiveSendGiftControllerDelegate> delegate; // @synthesize delegate=_delegate;
@property(retain, nonatomic) AWELiveGiftListDataController *dataController;
@property(retain, nonatomic) AWELiveRoomModel *roomModel;
- (_Bool)isAnchor;
- (void)_performSendRequest;
- (void)_prepareSendRequestWithPresent:(id)arg1;
- (void)_performClickTrack;
- (void)_prepareClickTrackWithPreseent:(id)arg1;
- (void)willSendGiftInCollectionView:(id)arg1 atIndexPath:(id)arg2;
@end

%hook AWELiveSendGiftController

// This returns 0
- (_Bool)isAnchor {
    bool val = %orig;
    NSLog(@"isAnchor: %d", val);
    return %orig;
}
// Called after didSendPresent()
- (void)_performSendRequest {
    NSLog(@"_performSendRequest");
    %orig;
}
// CALLED after _performSendRequest()
- (void)_prepareSendRequestWithPresent:(id)arg1 {
    // arg1 is of type AWELivePresentModel
    
    NSLog(@"_prepareSendRequestWithPresent: arg1: %@", arg1);
    // NSLog(@"_prepareSendRequestWithPresent: dataType arg1: %@", NSStringFromClass([arg1 class]));
    %orig;
}
// Called after willSendGiftInCollectionView:(id)arg1 atIndexPath:(id)arg2
- (void)_performClickTrack {
    NSLog(@"_performClickTrack");
    %orig;
}

// CAlled after _performClickTrack
- (void)_prepareClickTrackWithPreseent:(id)arg1 {
    //arg1 is of type AWELivePresentModel.
    NSLog(@"_prepareClickTrackWithPreseent: arg1: %@", arg1);
    // NSLog(@"_prepareClickTrackWithPreseent: dataType arg1: %@", NSStringFromClass([arg1 class]));
    %orig;
}

// IMPORTANT
- (void)willSendGiftInCollectionView:(id)arg1 atIndexPath:(id)arg2 {
    //arg1 is of type UICollectionView, arg2 is of type NSIndexPath
    NSLog(@"willSendGiftInCollectionView: arg1: %@, arg2: %@", arg1, arg2);
    //NSLog(@"willSendGiftInCollectionView: dataType arg1: %@, dataType: arg2: %@", NSStringFromClass([arg1 class]), NSStringFromClass([arg2 class]));
    %orig;
}
%end

@interface AWELiveGiftListBottomLandscapeView : UIView
- (void)refreshWalletCoins:(long long)arg1;
@end

%hook AWELiveGiftListBottomLandscapeView
- (void)refreshWalletCoins:(long long)arg1 {
    long long val = arg1;
    NSLog(@"refreshWalletCoins, arg1: %lld", val);
    %orig;
}

%end

@interface AWELiveGiftFansEnterView : UIView
- (void)handleProcessWithIntimacy:(id)arg1 presentCoins:(long long)arg2 animationFinishBlock:(id)arg3;
@end

%hook AWELiveGiftFansEnterView
- (void)handleProcessWithIntimacy:(id)arg1 presentCoins:(long long)arg2 animationFinishBlock:(id)arg3 {
    NSLog(@"handleProcessWithIntimacy, arg1: %@, coins: %lld", arg1, arg2);
    NSLog(@"handleProcessWithIntimacy, arg1 Type: %@", NSStringFromClass([arg1 class]));
    
    %orig;
    
}

%end


@interface AWELiveFreePresentPropertyManager : NSObject
@property(nonatomic) long long coins; // @synthesize coins=_coins;
+ (id)sharedInstace;

- (void)_consumeFansFreePresentWithPresentId:(id)arg1 count:(long long)arg2;
- (void)setFansFreePresent:(id)arg1;
- (void)consumeFreePresentWithPresentId:(id)arg1 propertIDs:(id)arg2 count:(long long)arg3;
- (id)useFreePresentWithPresentId:(id)arg1 count:(long long)arg2;
- (long long)freeCountForPresentId:(id)arg1;
- (void)fetchFreePresentListWithCompletion:(id)arg1;
- (id)init;
@end

%hook AWELiveFreePresentPropertyManager
- (void)_consumeFansFreePresentWithPresentId:(id)arg1 count:(long long)arg2 {
    NSLog(@"_consumeFansFreePresentWithPresentId... coins: %lld", self.coins);
    %orig;
}
// Called when gift option shows up.
- (void)setFansFreePresent:(id)arg1 {
    //arg1 ??
    //NSLog(@"setFansFreePresent... arg1: %@, arg1Type: %@ coins: %lld", arg1, NSStringFromClass([arg1 class]), self.coins);
    %orig;
}
- (void)consumeFreePresentWithPresentId:(id)arg1 propertIDs:(id)arg2 count:(long long)arg3 {
    NSLog(@"consumeFreePresentWithPresentId... coins: %lld", self.coins);
    %orig;
}
// Called when gift tapped, count is 0.
- (id)useFreePresentWithPresentId:(id)arg1 count:(long long)arg2 {
    //id val = %orig;
    // NSLog(@"useFreePresentWithPresentId... coins: %lld", self.coins);
    // NSLog(@"useFreePresentWithPresentId, arg1: %@", val);
    return %orig;
}
// Gets called often, return val is 0. RETURNING 1 MAKES ALL GIFTS LABELED FREE.
- (long long)freeCountForPresentId:(id)arg1 {
    //long long val = %orig;
    //NSLog(@"freeCountForPresentId... coins: %lld, arg1: %@, returnval: %lld", self.coins, NSStringFromClass([arg1 class]), val) ;
    //return 1;
    return %orig;
}
- (void)fetchFreePresentListWithCompletion:(id)arg1 {
    NSLog(@"fetchFreePresentListWithCompletion... coins: %lld", self.coins);
    %orig;
}
// Called when button present tapped
- (id)init {
    NSLog(@"init... coins: %lld", self.coins);
    //self.coins = 100000;
    return %orig;
}
%end


// CONTROLLER GIFT
@interface AWELiveGiftListViewController : UIViewController
- (void)viewDidLoad;
- (void)refreshWalletCoins;
- (void)didFinishSendPresentRequestWithTotalCoins:(long long)arg1;
- (void)didSendPresent:(id)arg1;
- (void)collectionView:(id)arg1 didSelectItemAtIndexPath:(id)arg2;
- (id)collectionView:(id)arg1 cellForItemAtIndexPath:(id)arg2;
- (void)rechargeClicked:(id)arg1;
- (void)rechargeSuccessNotiAction;
- (void)_handleFansProcess:(id)arg1 presentCoins:(long long)arg2;

- (void)_fetchGiftListDataAndReloadUI:(_Bool)arg1;
@property(retain, nonatomic) AWELiveSendGiftController *sendGiftController; // hmm..!!
@property(retain, nonatomic) AWELiveGiftListDataController *dataController;
//@property(nonatomic, assign) id <AWELiveSendGiftControllerDelegate> delegate;
@property(nonatomic, assign) id  delegate;
@end

// Controllers for sending gifts

%hook AWELiveGiftListViewController
- (void)viewDidLoad {
    %orig;
}
- (void)refreshWalletCoins {
    %orig;
    NSLog(@"refreshWalletCoins");
}
- (void)didFinishSendPresentRequestWithTotalCoins:(long long)arg1 {
    %orig;
    NSLog(@"didFinishSendPresentRequestWithTotalCoins: totalCoins%lld", arg1);
}
// Called after resetWithPresent()
- (void)didSendPresent:(id)arg1 {
    // arg1 is of type AWELivePresentModel
    %orig;
    NSLog(@"didSendPresent, %@",NSStringFromClass([arg1 class]));
}
// Called when cell for gifts are tapped
- (void)collectionView:(id)arg1 didSelectItemAtIndexPath:(id)arg2 {
    //%orig;
    NSLog(@"didSelectItem");
    
    //[self rechargeSuccessNotiAction];
    //long long totalCoins = 100000;
    // [self didSendPresent: NULL];
    //[self didFinishSendPresentRequestWithTotalCoins: totalCoins];
    //[self.sendGiftController _performSendRequest];
    //[self.sendGiftController _performClickTrack];
    // 1 [self.sendGiftController _prepareSendRequestWithPresent:arg1];
    //2 [self.sendGiftController _prepareClickTrackWithPreseent:arg1];
    
    /// THIS IS IMPORTANT:  This shows the animation.
    //%orig;
    [self.sendGiftController willSendGiftInCollectionView:arg1 atIndexPath:arg2]; //AWELiveSendGiftController
    
    // [self didFinishSendPresentRequestWithTotalCoins:100000];
}
- (void)_handleFansProcess:(id)arg1 presentCoins:(long long)arg2 {
    NSLog(@"_handleFansProcess...arg1: %@, presentCOins: %lld", arg1, arg2);
    %orig;
}

- (void)_fetchGiftListDataAndReloadUI:(_Bool)arg1 {
    // arg1 is false when entering live room, arg1 is true when the present button is tapped to display all gifts
    //NSLog(@"_fetchGiftListDataAndReloadUI...arg1: %d", arg1);
    %orig;
}


/*
 - (id)collectionView:(id)arg1 cellForItemAtIndexPath:(id)arg2 {
 
 NSLog(@"%@", NSStringFromClass([arg1 class]));
 NSLog(@"%@", NSStringFromClass([arg2 class]));
 return %orig;
 }*/

// Called when "Buy Coins" button is tapped.
- (void)rechargeClicked:(id)arg1 {
    %orig;
    NSLog(@"rechargeClicked");
}
- (void)rechargeSuccessNotiAction {
    %orig;
    NSLog(@"rechargeSuccessNotiAction");
}

%end


@interface AWELiveWalletManager : NSObject
+ (void)alertForNobalance:(id)arg1 triggerReason:(id)arg2;
+ (id)_getWalletWebURL:(_Bool)arg1;
+ (void)transitionToWalletPageFrom:(_Bool)arg1;
+ (void)getMyWalletWithFinishBlock:(id)arg1;

@end

// CAlled when wallet cell is tapped in settings
%hook AWELiveWalletManager
// Called when user has no coin balance!
+ (void)alertForNobalance:(id)arg1 triggerReason:(id)arg2 {
    NSLog(@"[AWELiveWalletManager alertForNobalance], arg1: %@, reason: %@", arg1, arg2);
    %orig;
}
+ (id)_getWalletWebURL:(_Bool)arg1 {
    //arg1 is true
    //id val = %orig;
    //NSLog(@"[AWELiveWalletManager _getWalletWebURL], arg1: %d, return val: %@", arg1, val);
    return %orig;
}
+ (void)transitionToWalletPageFrom:(_Bool)arg1 {
    // arg1 is true
    //NSLog(@"[AWELiveWalletManager transitionToWalletPageFrom], arg1: %d", arg1);
    %orig;
}

// This is called when entering live room and when tapping presents button
+ (void)getMyWalletWithFinishBlock:(id)arg1 {
    //NSLog(@"[AWELiveWalletManager getMyWalletWithFinishBlock], arg1: %@", arg1);
    %orig;
}
%end

@interface AWELiveFansClubMeResponseModel : AWEBaseApiModel
@end


@interface AWELiveMyWalletModel : AWEBaseApiModel {
    _Bool _canWithdraw;
    AWEUserModel *_user;
    long long _diamondCount;
    long long _totalIncome;
    long long _todayIncome;
    long long _withdrawLimit;
    long long _withdrawalDiamond;
}
+ (id)userJSONTransformer;
+ (id)JSONKeyPathsByPropertyKey;
@property(nonatomic) _Bool canWithdraw;
@property(nonatomic) long long withdrawalDiamond;
@property(nonatomic) long long withdrawLimit; // @synthesize withdrawLimit=_withdrawLimit;
@property(nonatomic) long long todayIncome; // @synthesize todayIncome=_todayIncome;
@property(nonatomic) long long totalIncome; // @synthesize totalIncome=_totalIncome;
@property(nonatomic) long long diamondCount; // @synthesize diamondCount=_diamondCount;
@property(retain, nonatomic) AWEUserModel *user; // @synthesize user=_user;
@end

%hook AWELiveMyWalletModel
// Both called when entering live room

+ (id)userJSONTransformer {
    
    //NSLog(@"userJSONTransformer.....userJSONTransformer");
    return %orig;
}
+ (id)JSONKeyPathsByPropertyKey {
    //NSLog(@"userJSONTransformer.....JSONKeyPathsByPropertyKey");
    return %orig;
}
%end

@interface AWEAppShareSettingManager : NSObject
+ (id)downloadForbiddenToast;
+ (_Bool)selfSeeingShouldForbidWaterMarkWhenDownload;
+ (_Bool)forbidDownloadLocal;
+ (_Bool)downloadCheckStatus;
@end

%hook AWEAppShareSettingManager
+ (id)downloadForbiddenToast {
    id val = %orig;
    NSLog(@"[AWEAppShareSettingManager] downloadForbiddenToast, returnval: %@", val);
    return %orig;
}
+ (_Bool)selfSeeingShouldForbidWaterMarkWhenDownload {
    bool val = %orig;
    NSLog(@"[AWEAppShareSettingManager] selfSeeingShouldForbidWaterMarkWhenDownload, returnval: %d", val);
    return %orig;
}
+ (_Bool)forbidDownloadLocal {
    bool val = %orig;
    NSLog(@"[AWEAppShareSettingManager] forbidDownloadLocal, returnval: %d", val);
    return %orig;
}
+ (_Bool)downloadCheckStatus {
    bool val = %orig;
    NSLog(@"[AWEAppShareSettingManager] downloadCheckStatus, returnval: %d", val);
    return %orig;
}
%end

/*
 _       _________          _______
 ( \      \__   __/|\     /|(  ____ \
 | (         ) (   | )   ( || (    \/
 | |         | |   | |   | || (__
 | |         | |   ( (   ) )|  __)
 | |         | |    \ \_/ / | (
 | (____/\___) (___  \   /  | (____/\
 (_______/\_______/   \_/   (_______/
 - Display the "live" option when the + button is tapped at the Tab Bar.
 */

%hook AWEVideoRecorderController
- (_Bool)shouldEnableLive {
    BOOL shouldEnableLive = %orig;
    NSLog(@"是否可以直播·%ld", shouldEnableLive);
    return YES;
}
%end

%hook AWELiveRoomConfigModel
- (_Bool)enableHourlyList:(_Bool)arg1 {
    _Bool ret = %orig;
    NSLog(@"enableHourlyList %ld", ret);
    return ret;
}
- (_Bool)enableFansClub:(_Bool)arg1 {
    _Bool ret = %orig;
    NSLog(@"enableFansClub %ld", ret);
    return ret;
}
- (_Bool)enableSendBarrage:(_Bool)arg1 {
    _Bool ret = %orig;
    NSLog(@"enableSendBarrage %ld", ret);
    return ret;
}
- (_Bool)enableSendShortcutGift:(_Bool)arg1 {
    _Bool ret = %orig;
    NSLog(@"enableSendShortcutGift %ld", ret);
    return ret;
}
- (_Bool)enableSendGiftGuide:(_Bool)arg1 {
    _Bool ret = %orig;
    NSLog(@"enableSendGiftGuide %ld", ret);
    return ret;
}
- (_Bool)enableSendGift:(_Bool)arg1 {
    _Bool ret = %orig;
    NSLog(@"enableSendGift %ld", ret);
    return ret;
}
- (_Bool)enableSendComment:(_Bool)arg1 {
    _Bool ret = %orig;
    NSLog(@"enableSendComment %ld", ret);
    return ret;
}
- (_Bool)enableShare:(_Bool)arg1 {
    _Bool ret = %orig;
    NSLog(@"enableShare %ld", ret);
    return ret;
}
- (_Bool)enableEmoji:(_Bool)arg1 {
    _Bool ret = %orig;
    NSLog(@"enableEmoji %ld", ret);
    return ret;
}
%end

%hook IESLiveDeviceInfo // app 启动时调用
+ (id)carrierMCCMNC {
    id obj = %orig;
    return obj;
}
+ (id)carrierMNC {
    id obj = %orig;
    return obj;
}
+ (id)carrierMCC {
    id obj = %orig;
    return obj;
}
+ (id)carrierName {
    id obj = %orig;
    return obj;
}
%end

/*-------------------直播相关-----------------------*/


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

// See http://iphonedevwiki.net/index.php/Logos

/**
 * @author Xiaoyuan
 */
#import <UIKit/UIKit.h>
#import "TikTokHeaders.h"
#import "TikTokDylib-Swift.h"
#import "MBProgressHUD.h"
#import <Photos/Photos.h>

%group Settings
%hook TTKSettingsViewController

- (void)viewDidLoad {
    %orig;
    [self xy_addSettingsBtn];
}

%new
- (void)xy_goSettings {
    XYSettingsViewController *settingVc = [[XYSettingsViewController alloc] init];
    [[UIApplication.sharedApplication topViewController].navigationController pushViewController:settingVc animated:true];
}
%new
- (void)xy_addSettingsBtn {
    
    NSUInteger index = [self.view.subviews indexOfObjectPassingTest:^BOOL(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:NSClassFromString(@"AWENavigationBar")]) {
            *stop = YES;
            return YES;
        }
        return NO;
    }];
    
    if (index != NSNotFound) {
        UIButton *settingsBtn = [UIButton new];
        [settingsBtn setTitle:@"设置规则" forState:UIControlStateNormal];
        [settingsBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        settingsBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [settingsBtn addTarget:self action:@selector(xy_goSettings) forControlEvents:UIControlEventTouchUpInside];
        AWENavigationBar *bar = self.view.subviews[index];
        [bar.contentView addSubview:settingsBtn];
        settingsBtn.translatesAutoresizingMaskIntoConstraints = NO;
        [settingsBtn.centerYAnchor constraintEqualToAnchor:bar.contentView.centerYAnchor].active = YES;
        [settingsBtn.trailingAnchor constraintEqualToAnchor:bar.contentView.trailingAnchor constant:-20].active = YES;
    }
}

%end
%end

%group DownloadBypass
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
%end

/// 管理视频预加载任务的类，从此类可以学到抖音如何预加载视频的
%hook _TTVideoEnginePreloadManager
- (void)_addTask:(id)arg1 vid:(id)arg2 preSize:(long long)arg3 urlItem:(id)arg4 vidItem:(id)arg5 videoModeltem:(id)arg6 {
    %orig;
}
%end

/// 抖音的通用分享面板，初始情况下会使用这个，后面可能会使用TTKSharePanelViewController
%hook AWESharePanelController

%new
- (void)xy_downloadWithAweme:(id)target {
    if (target == nil) {
        return;
    }
    if ([target isKindOfClass:%c(AWEAwemeModel)]) {
        AWEAwemeModel *model = target;
        if (model.awemeType == 68) {
            // 是图片列表
            UIWindow *window = [UIApplication sharedApplication].delegate.window;
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:true];
            hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.65];
            hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
            hud.label.text = @"准备下载";
            hud.label.font = [UIFont systemFontOfSize:12];
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                dispatch_group_t group = dispatch_group_create();
                NSArray<AWEImageAlbumImageModel *> *albumImages = model.albumImages;
                __block NSError *_error = nil;
                int index = 0;
                for (AWEImageAlbumImageModel *model in albumImages) {
                    NSURL *url = [NSURL URLWithString: model.urlList.firstObject];
                    if (url == nil) {
                        continue;
                    }
                    dispatch_group_enter(group);
                    dispatch_async(dispatch_get_main_queue(), ^{
                        hud.label.text = [NSString stringWithFormat:@"%d/%ld", index+1, albumImages.count];
                    });
                    NSData *data = [NSData dataWithContentsOfURL:url];
                    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
                        [[PHAssetCreationRequest creationRequestForAsset] addResourceWithType:PHAssetResourceTypePhoto data:data options:nil];
                    } completionHandler:^(BOOL success, NSError * _Nullable error) {
                        dispatch_group_leave(group);
                        _error = error;
                    }];
                    index += 1;
                }
                dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self dismissViewControllerAnimated: YES completion: nil];
                    if (_error) {
                        hud.label.text = [NSString stringWithFormat:@"下载有错误%@", _error.localizedDescription];
                    } else {
                        hud.label.text = @"下载图片成功";
                    }
                    [hud hideAnimated:true afterDelay:0.5];
                });
            });
            
        }
        else {
            // 是视频
            AWEVideoModel *video = model.video;
            NSURL *url = [video xy_url];
            if (url == nil) {
                return;
            }
            XYVideoDownloader *downloader = [XYVideoDownloader shared];
            __weak typeof(self) weakSelf = self;
            [downloader downloadWithURL:url completion:^(BOOL isSuccess, NSError *error){
                [weakSelf dismissViewControllerAnimated: YES completion: nil];
            }];
        }
    } else if ([target isKindOfClass:%c(AWEMusicModel)]) {
        // 是音乐
        AWEMusicModel *model = target;
        NSURL *url = [model xy_url];
        XYVideoDownloader *downloader = [XYVideoDownloader shared];
        __weak typeof(self) weakSelf = self;
        [downloader downloadWithURL:url completion:^(BOOL isSuccess, NSError *error){
            [weakSelf dismissViewControllerAnimated: YES completion: nil];
        }];
    }
}

- (void)viewDidLoad {
    %orig;
    NSMutableArray *allItems = [self.viewModel.firstRowItems mutableCopy];
    [allItems addObjectsFromArray: self.viewModel.secondRowItems];
    NSMutableArray *secondRowItems = [self.viewModel.secondRowItems mutableCopy];
    AWEShareBaseChannel *itemDelegate = nil;
    for (AWEShareItem *item in allItems) {
        if (item.delegate != nil) {
            itemDelegate = item.delegate;
            break;
        }
    }
    if (!itemDelegate) {
        return;
    }
    AWEShareContext *context = itemDelegate.context;
    id target = context.target;
    __weak typeof(self) weakSelf = self;
    // 21000是自保存
    AWEShareItem *action = [[NSClassFromString(@"AWEShareItem") alloc] initWithType:@"custom_download"];
    action.title = context.targetType == 3 ? @"保存音乐" : @"保存原视频";
    action.image = (UIImage *)[[secondRowItems firstObject] image];
    action.iconName = [[secondRowItems firstObject] iconName];
    [action registerHandler: ^{ // 点击保存原版的事件
        [weakSelf xy_downloadWithAweme: target];
    } forEvents: 1];
    [secondRowItems addObject:action];
   
    self.viewModel.secondRowItems = secondRowItems;
    [self.secondRowView setValue:secondRowItems forKey:@"items"];
    [self.secondRowView reloadData];
}

%end


// 29.0.0 的分享面板
%hook TTKSharePanelViewController

- (void) viewDidAppear:(BOOL)arg1 {
    %orig;
}

%new
- (void)xy_downloadWithAweme:(id)target {
    if ([target isKindOfClass:%c(AWEAwemeModel)]) {
        AWEAwemeModel *model = target;
        if (model.awemeType == 68) {
            UIWindow *window = [UIApplication sharedApplication].delegate.window;
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:true];
            hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.65];
            hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
            hud.label.text = @"准备下载";
            hud.label.font = [UIFont systemFontOfSize:12];
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                dispatch_group_t group = dispatch_group_create();
                NSArray<AWEImageAlbumImageModel *> *albumImages = model.albumImages;
                __block NSError *_error = nil;
                int index = 0;
                for (AWEImageAlbumImageModel *model in albumImages) {
                    NSURL *url = [NSURL URLWithString: model.urlList.firstObject];
                    if (url == nil) {
                        continue;
                    }
                    dispatch_group_enter(group);
                    dispatch_async(dispatch_get_main_queue(), ^{
                        hud.label.text = [NSString stringWithFormat:@"%d/%ld", index+1, albumImages.count];
                    });
                    NSData *data = [NSData dataWithContentsOfURL:url];
                    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
                        [[PHAssetCreationRequest creationRequestForAsset] addResourceWithType:PHAssetResourceTypePhoto data:data options:nil];
                    } completionHandler:^(BOOL success, NSError * _Nullable error) {
                        dispatch_group_leave(group);
                        _error = error;
                    }];
                    index += 1;
                }
                dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self dismissViewControllerAnimated: YES completion: nil];
                    if (_error) {
                        hud.label.text = [NSString stringWithFormat:@"下载有错误%@", _error.localizedDescription];
                    } else {
                        hud.label.text = @"下载图片成功";
                    }
                    [hud hideAnimated:true afterDelay:0.5];
                });
            });
        } else {
            // 是视频
            AWEVideoModel *video = model.video;
            NSURL *url = [video xy_url];
            if (url == nil) {
                return;
            }
            XYVideoDownloader *downloader = [XYVideoDownloader shared];
            __weak typeof(self) weakSelf = self;
            [downloader downloadWithURL:url completion:^(BOOL isSuccess, NSError *error){
                [weakSelf dismissViewControllerAnimated: YES completion: nil];
            }];
        }
    } else if ([target isKindOfClass:%c(AWEMusicModel)]) {
        // 是音乐
        AWEMusicModel *model = target;
        NSURL *url = [model xy_url];
        XYVideoDownloader *downloader = [XYVideoDownloader shared];
        __weak typeof(self) weakSelf = self;
        [downloader downloadWithURL:url completion:^(BOOL isSuccess, NSError *error){
            [weakSelf dismissViewControllerAnimated: YES completion: nil];
        }];
    }
}

- (void)viewDidLoad {
    %orig;
}

- (void) setViewModel:(TTKSharePanelViewModel *)viewModel {
    NSMutableArray *allItems = [viewModel.firstRowItems mutableCopy];
    [allItems addObjectsFromArray: viewModel.secondRowItems];
    NSMutableArray *secondRowItems = [viewModel.secondRowItems mutableCopy];
    AWEShareBaseChannel *itemDelegate = nil;
    for (AWEShareItem *item in allItems) {
        if (item.delegate != nil) {
            itemDelegate = item.delegate;
            break;
        }
    }
    if (itemDelegate) {
        AWEShareContext *context = itemDelegate.context;
        id target = context.target;
        __weak typeof(self) weakSelf = self;
        // 21000是自保存
        AWEShareItem *action = [[NSClassFromString(@"AWEShareItem") alloc] initWithType:@"custom_download"];
        action.title = context.targetType == 3 ? @"保存音乐" : @"保存原视频";
        action.image = (UIImage *)[[secondRowItems firstObject] image];
        action.iconName = [[secondRowItems firstObject] iconName];
        [action registerHandler: ^{ // 点击保存原版的事件
            [weakSelf xy_downloadWithAweme: target];
        } forEvents: 1];
        [secondRowItems addObject:action];
       
        viewModel.secondRowItems = secondRowItems;
        [self.tableView reloadData];
    }
    %orig(viewModel);
}

%end

%hook AWEShareItem
- (id)initWithType:(id)arg1 {
    id obj = %orig;
    return obj;
}
%end


%hook AWEVideoModel
%new
- (NSURL *)xy_url {
    // h264URL 比 playURL的链接视频质量更高，更清晰, 但h264URL可能是nil
    AWEURLModel *videoURL = self.h264URL;
    if (!videoURL) {
        videoURL = self.playURL;
    }
    NSArray *originURLList = videoURL.originURLList;
    NSURL *url = [NSURL URLWithString: originURLList.firstObject];
    return url;
}
%end

%hook AWEMusicModel
%new
- (NSURL *)xy_url {
    AWEURLModel *musicURL = self.playURL;
    NSArray *originURLList = musicURL.originURLList;
    NSURL *url = [NSURL URLWithString: originURLList.firstObject];
    return url;
}

%end
%end

%group SSLPinningBypass

/// 网络请求是通过 TTNetworkManagerChromium，继承自 TTNetworkManager
%hook TTNetworkManagerChromium

- (id)requestForJSONWithURL_:(id)arg1 params:(id)arg2 method:(id)arg3 needCommonParams:(_Bool)arg4 headerField:(id)arg5 requestSerializer:(Class)arg6 responseSerializer:(Class)arg7 autoResume:(_Bool)arg8 verifyRequest:(_Bool)arg9 isCustomizedCookie:(_Bool)arg10 callback:(void (^)(NSError *error, id responeDict, long long arg))arg11 callbackWithResponse:(CDUnknownBlockType)arg12 dispatch_queue:(id)arg13 {
    // 除直播间以外点击关注用户，无法正常关注，直播间内可以，我发觉直播间内走的是webcast，暂时还未解决
    /*
     GET
     https://api-va.tiktokv.com/aweme/v1/commit/follow/user/
     {
         "channel_id" = 3;
         from = 19;
         "from_pre" = 13;
         "previous_page" = "homepage_hot";
         "sec_user_id" = "MS4wLjABAAAAS2624esnn7gm-UXv5PU7qri0YvwvNuldMUSUMYzBMw-FnxGEa77G0xrE5AHYHeuj";
         type = 1;
         "user_id" = 7021688606235591685;
     }
     */
    
    void (^completion)(NSError *, id, long long) = ^(NSError *error, id responeDict, long long arg){
        if (responeDict) {
            NSLog(@"responeDict: %@", responeDict);
        } else {
            NSLog(@"请求失败: %@", error);
        }
        if (arg11) {
            arg11(error, responeDict, arg);
        }
    };
    
    // 返回TTHttpTaskChromium
    TTHttpTaskChromium *obj = %orig(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, completion, arg12, arg13);
    obj.skipSSLCertificateError = YES;
    return obj;
}

// 用户的区域 我的手机显示cn
- (NSString *)userRegion {
    id region = %orig;
    NSLog(@"userRegion: %@", region);
    return [XYPreferenceManager.shared.countryCode lowercaseString] ?: @"us";
}
%end

%hook TTHttpTask // 一个http 请求的任务
- (id)init {
    TTHttpTask *obj = %orig;
    obj.skipSSLCertificateError = YES;
    return obj;
}

// ‼️重要
// 通过设置skipSSLCertificateError，可绕过SSL pinning，通过charles 对抖音和TikTok app抓包
- (void)setSkipSSLCertificateError:(BOOL)value {
    %orig(YES);
}
%end

%hook TTHttpRequestChromium
- (id)initWithURL:(id)arg1 method:(id)arg2 multipartForm:(id)arg3 {
    TTHttpRequestChromium *obj = %orig;
    return obj;
}
%end

%hook TTConcurrentHttpTask // 继承自 TTHttpTask
+ (id)buildBinaryConcurrentTask:(id)arg1 params:(id)arg2 method:(id)arg3 needCommonParams:(_Bool)arg4 headerField:(id)arg5 enableHttpCache:(_Bool)arg6 requestSerializer:(Class)arg7 responseSerializer:(Class)arg8 autoResume:(_Bool)arg9 isCustomizedCookie:(_Bool)arg10 headerCallback:(CDUnknownBlockType)arg11 dataCallback:(CDUnknownBlockType)arg12 callback:(CDUnknownBlockType)arg13 callbackWithResponse:(CDUnknownBlockType)arg14 redirectCallback:(CDUnknownBlockType)arg15 progress:(id *)arg16 dispatch_queue:(id)arg17 redirectHeaderDataCallbackQueue:(id)arg18 concurrentRequestConfig:(id)arg19 {
    TTConcurrentHttpTask *task = %orig;
    return task;
}
+ (id)buildJSONConcurrentTask:(id)arg1 params:(id)arg2 method:(id)arg3 needCommonParams:(_Bool)arg4 headerField:(id)arg5 requestSerializer:(Class)arg6 responseSerializer:(Class)arg7 autoResume:(_Bool)arg8 verifyRequest:(_Bool)arg9 isCustomizedCookie:(_Bool)arg10 callback:(CDUnknownBlockType)arg11 callbackWithResponse:(CDUnknownBlockType)arg12 dispatch_queue:(id)arg13 concurrentRequestConfig:(id)arg14 {
    TTConcurrentHttpTask *task = %orig;
    return task;
}
%end

%hook TTNetworkUtil
+ (_Bool)parseIfConcurrentRequestSwitchEnabled:(id)arg1 switchName:(id)arg2 {
    BOOL ret = %orig;
    return ret;
}

+ (id)URLString:(id)arg1 appendCommonParams:(id)arg2 {
    id url = %orig;
    return url;
}
%end

%end

%group CoreLogic
%hook AWEAwemeModel
- (id)initWithDictionary:(id)arg1 error:(id *)arg2 {
    id orig = %orig;
    return XYPreferenceManager.shared.shouldPlayAds && self.isAds ? nil : orig;
}

- (id)init {
    id orig = %orig;
    return XYPreferenceManager.shared.shouldPlayAds && self.isAds ? nil : orig;
}

- (BOOL)progressBarDraggable {
    return XYPreferenceManager.shared.showProgressBar || %orig;
}
- (BOOL)progressBarVisible {
    return XYPreferenceManager.shared.showProgressBar || %orig;
}
%end

%hook AWEPlayVideoPlayerController
- (void)playerWillLoopPlaying:(id)arg1 {
    if (XYPreferenceManager.shared.isAutoPlayNextVideoWhenPlayEnded) {
        if ([self.container.parentViewController isKindOfClass:%c(AWEFeedTableViewController)] ||
            [self.container.parentViewController isKindOfClass:%c(AWENewFeedTableViewController)]) {
            // Fixed bug: 22.8.0 AWENewFeedTableViewController
            // 播放完成后 自动滚动到下一个视频
            [((id)self.container.parentViewController) scrollToNextVideo];
            return;
        }
    }
    %orig;
}
%end

%hook AWEFeedContainerViewController
static AWEFeedContainerViewController *__weak sharedInstance;
%property (nonatomic, assign) BOOL isUIHidden;

- (id)init {
    id orig = %orig;
    self.isUIHidden = FALSE;
    sharedInstance = orig;
    return orig;
}

%new
+ (AWEFeedContainerViewController *)sharedInstance {
    return sharedInstance;
}
%end

%hook AWEPlayInteractionViewController

- (void)viewDidLoad {
    %orig;
}

- (void)stopLoadingAnimation {
    %orig;
}
%end
%end

%group JailbreakBypass
%hook AppsFlyerUtils
+ (BOOL)isJailbrokenWithSkipAdvancedJailbreakValidation:(BOOL)arg1 {
    return NO;
}
%end

%hook TTAdSplashDeviceHelper
+ (BOOL)isJailBroken {
    return NO;
}
%end

%hook TTInstallUtil
+ (BOOL)isJailBroken {
    return NO;
}
%end

%hook PIPOIAPStoreManager
- (BOOL)_pipo_isJailBrokenDeviceWithProductID:(id)arg1 orderID:(id)arg2 {
    return NO;
}
%end

%hook UIDevice
+ (BOOL)btd_isJailBroken {
    return NO;
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

%hook NSFileManager
// 反越狱检测
- (BOOL)fileExistsAtPath:(NSString *)event {
    NSArray<NSString *> *array = @[@"/Application/Cydia.app",
                                   @"/Library/MobileSubstrate/MobileSubstrate.dylib",
                                   @"/bin/bash",
                                   @"/usr/sbin/sshd",
                                   @"/etc/apt",
                                   @"/usr/bin/ssh",
                                   @"/private/var/lib/apt",
                                   @"/private/var/lib/cydia",
                                   @"/private/var/tmp/cydia.log",
                                   @"/Applications/WinterBoard.app",
                                   @"/var/lib/cydia",
                                   @"/private/etc/dpkg/origins/debian",
                                   @"/bin.sh",
                                   @"/private/etc/apt",
                                   @"/etc/ssh/sshd_config",
                                   @"/private/etc/ssh/sshd_config",
                                   @"/Applications/SBSetttings.app",
                                   @"/private/var/mobileLibrary/SBSettingsThemes/",
                                   @"/private/var/stash",
                                   @"/usr/libexec/sftp-server",
                                   @"/usr/libexec/cydia/",
                                   @"/usr/sbin/frida-server",
                                   @"/usr/bin/cycript",
                                   @"/usr/local/bin/cycript",
                                   @"/usr/lib/libcycript.dylib",
                                   @"/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist",
                                   @"/System/Library/LaunchDaemons/com.ikey.bbot.plist",
                                   @"/Applications/FakeCarrier.app",
                                   @"/Library/MobileSubstrate/DynamicLibraries/Veency.plist",
                                   @"/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist",
                                   @"/usr/libexec/ssh-keysign",
                                   @"/usr/libexec/sftp-server",
                                   @"/Applications/blackra1n.app",
                                   @"/Applications/IntelliScreen.app",
                                   @"/Applications/Snoop-itConfig.app",
                                   @"/var/lib/dpkg/info"];
    
    NSInteger index = [array indexOfObjectPassingTest:^BOOL(NSString *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        BOOL ret = [event hasPrefix:obj];
        if (ret) {
            *stop = YES;
        }
        return ret;
    }];
    if (index != NSNotFound) {
        NSLog(@"9999999==%@=",event);
        return NO;
    }
    return  %orig;
}
%end
%hook AWESecurityConfig
- (NSString *)secret {
    id secret = %orig; // a3668f0afac72ca3f6c1697d29e0e1bb1fef4ab0285319b95ac39fa42c38d05f
    return secret;
}
- (id)init {
    id instance = %orig;
    return instance;
}
+ (id) licenseForAppId:(id)arg1 {
    id obj = %orig;
    return obj;
}
- (id)sgm_installChannel {
    id obj = %orig;
    return @"App Store";
}
%end
%hook NSKeyedUnarchiver
+ (id)unarchiveObjectWithData:(NSData *)data{
    
    
    id result =%orig;
    if(![result isKindOfClass:[NSData class]]){
//        XYDebugLog(@"unarchiveObjectWithData = %@ %@ class = %@ ", @"NSKeyedUnarchiver",[result  class] ,result);
        if([result isKindOfClass:[NSDictionary class]]){
            NSMutableDictionary *dic =   [[NSMutableDictionary alloc] initWithDictionary:result];
            if([dic objectForKey:@"SignInfo"]){
                if (![dic[@"SignInfo"] containsString:@"AppStore"]) {
                    dic[@"SignInfo"]= @"AppStore";
                }
            }
            return dic;
        }
    }
//    else{
//        XYDebugLog(@"archivedDataWithRootObject = %@ %@ class = %@",@"NSKeyedUnarchiver",[result  class] ,@"NSKeyedUnarchiver");
//    }
    return result;
}

%end
%hook AWEAPMManager
+ (void) attachInfo:(id)arg1 forKey:(id)arg2 {
    %log;
    %orig;
}
+ (void) enableInternalNetworkRequest:(BOOL)arg1 {
    %log;
    %orig;
}

+ (id) signInfo {
    %log;
   id obj = %orig; // SelfSign(NKW67GFDHM)(å­è¿ æ¨)
//    return obj;
    return @"AppStore";
    //obj    __NSCFString *    "SelfSign(NKW67GFDHM)(å­\U0000009dè¿\U0000009c æ\U0000009d¨)"    0x0000000282d99140
}
%end

%hook GULAppEnvironmentUtil
+(bool)isFromAppStore {
    %log;
    BOOL res = %orig;
    return YES;
}
+(bool)isAppStoreReceiptSandbox {
    %log;
    BOOL res = %orig;
    return NO;
}
+(bool)isAppExtension {
    %log;
    BOOL res = %orig;
    return YES;
}
%end

%end
%group BundleIdByPass
%hook TTInstallSandBoxHelper
+ (id)bundleIdentifier {
    NSString *orig = %orig;
    NSLog(@"orig bundleIdentifier: %@", orig);
    return @"com.zhiliaoapp.musically";
}
%end
%end


%hook AWEStartupTimingMonitorManager
+ (void)start {
    %orig; // 到这里就结束调试了，初步判断此方法做了反调试
}
%end

%group SkipLiving
%hook AWENewFeedTableViewController


- (void)viewDidLoad {
    %orig;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(xy_updatePureMode) name:@"xyNeedsSetPureModeNotification" object:nil];
    [self performSelector:@selector(xy_updatePureMode)];
}

%new
- (void)xy_updatePureMode {
    self.pureMode = XYPreferenceManager.shared.isPureMode;
}

- (void) play {
    %orig;
}

- (void)playVideo:(id)arg1 {
    %orig;
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(scrollToNextVideo) object:nil];
    AWEAwemeModel *model = [self currentAweme];
    if (model.liveStreamURL && model.room) { // 当是直播预览时，5秒后跳过
        if (XYPreferenceManager.shared.isAutoPlayNextVideoWhenPlayLiveRoom) {        
            [self performSelector:@selector(scrollToNextVideo) withObject:nil afterDelay:5.0];
        }
    }
    NSLog(@"AWEAwemeModel");
}

- (void)setPureMode:(BOOL)pureMode {
    %orig;
}

%end

%end


%ctor {
    %init(Settings);
    %init(DownloadBypass);
    %init(SSLPinningBypass);
    %init(CoreLogic);
    %init(JailbreakBypass);
    %init(BundleIdByPass);
    %init(SkipLiving);
    %init(_ungrouped);
}


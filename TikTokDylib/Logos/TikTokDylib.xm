// See http://iphonedevwiki.net/index.php/Logos

#import <UIKit/UIKit.h>

/**
 * @author Xiaoyuan
 */

#include "TikTokHeaders.h"
#import "XYVideoDownloader.h"
#import "XYConfigSettingsViewController.h"
#import "TikTokDylib-Swift.h"

%group Settings
%hook TTKSettingsViewController

- (void)viewDidLoad {
    %orig;
    [self xy_addSettingsBtn];
}

%new
- (void)xy_goSettings {
    XYConfigSettingsViewController *settingVc = [[XYConfigSettingsViewController alloc] init];
    UIViewController *tabbarVc = UIApplication.sharedApplication.keyWindow.rootViewController;
    UINavigationController *hookNavi = [[UINavigationController alloc] initWithRootViewController:settingVc];
    [tabbarVc presentViewController:hookNavi animated:YES completion:nil];
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
/// 分享面板
%hook AWEIMDirectTranspondViewController

%new
- (void)xy_downloadAweme {
    AWEAwemeModel *aweme = self.shareContext.target;
    AWEVideoModel *video = aweme.video;
    AWEURLModel *playURL = video.playURL;
    NSArray *originURLList = playURL.originURLList;
    NSString *url = originURLList.firstObject;
    // 下载这个链接
    XYVideoDownloader *downloader = [XYVideoDownloader sharedInstance];
    __weak typeof(self) weakSelf = self;
    [downloader downloadFileWithUrl:[NSURL URLWithString:url] completion:^(BOOL isSuccess){
        [weakSelf dismissAnimated: YES completion: nil];
    }];
}


- (void)viewDidLoad {
    %orig;
    
    UIButton *downloadBtn = [UIButton new];
    downloadBtn.frame = CGRectMake(10, 3, 65, 35);
    [downloadBtn setTitle:@"下载" forState:UIControlStateNormal];
    [downloadBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    downloadBtn.backgroundColor = UIColor.purpleColor;
    downloadBtn.layer.cornerRadius = 6;
    downloadBtn.layer.masksToBounds = YES;
    downloadBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.topView addSubview:downloadBtn];
    [downloadBtn addTarget:self action:@selector(xy_downloadAweme) forControlEvents:UIControlEventTouchUpInside];
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
%end

/// 管理视频预加载任务的类，从此类可以学到抖音如何预加载视频的
%hook _TTVideoEnginePreloadManager
- (void)_addTask:(id)arg1 vid:(id)arg2 preSize:(long long)arg3 urlItem:(id)arg4 vidItem:(id)arg5 videoModeltem:(id)arg6 {
    %orig;
}
%end
%end



%group SSLPinningBypass

/// 网络请求是通过 TTNetworkManagerChromium，继承自 TTNetworkManager
%hook TTNetworkManagerChromium

- (id)requestForJSONWithResponse:(id)arg1 params:(id)arg2 method:(id)arg3 needCommonParams:(_Bool)arg4 headerField:(id)arg5 requestSerializer:(Class)arg6 responseSerializer:(Class)arg7 autoResume:(_Bool)arg8 verifyRequest:(_Bool)arg9 isCustomizedCookie:(_Bool)arg10 callback:(CDUnknownBlockType)arg11 callbackQueue:(id)arg12 {
    TTHttpTaskChromium *obj = %orig; // 返回TTHttpTaskChromium
    obj.skipSSLCertificateError = YES;
    return obj;
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
        if ([self.container.parentViewController isKindOfClass:%c(AWEFeedTableViewController)]) {
            // 播放完成后 自动滚动到下一个视频
            [((AWEFeedTableViewController *)self.container.parentViewController) scrollToNextVideo];
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

%ctor {
    %init(Settings);
    %init(DownloadBypass);
    %init(SSLPinningBypass);
    %init(CoreLogic);
    %init(JailbreakBypass);
    %init(BundleIdByPass);
    %init(_ungrouped);
}


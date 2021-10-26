#line 1 "/Users/xiaoyuan/Desktop/work/tweaks/TikTok/TikTokDylib/Logos/TikTokDylib.xm"


#import <UIKit/UIKit.h>





#include "TikTokHeaders.h"
#import "TikTokDylib-Swift.h"


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class AWEPlayInteractionViewController; @class AVMDLDataLoader; @class AWEIMDirectTranspondViewController; @class _TTVideoEnginePreloadManager; @class TTNetworkManagerChromium; @class TTAdSplashDeviceHelper; @class NSFileManager; @class NSString; @class TTInstallSandBoxHelper; @class TTKSettingsViewController; @class AWEFeedTableViewController; @class AppsFlyerUtils; @class UIDevice; @class AWEPlayVideoPlayerController; @class AWEStartupTimingMonitorManager; @class TTInstallUtil; @class AWEFeedContainerViewController; @class PIPOIAPStoreManager; @class TTHttpTask; @class AWEAwemeModel; 
static void (*_logos_meta_orig$_ungrouped$AWEStartupTimingMonitorManager$start)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void _logos_meta_method$_ungrouped$AWEStartupTimingMonitorManager$start(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$AWEFeedTableViewController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("AWEFeedTableViewController"); } return _klass; }
#line 12 "/Users/xiaoyuan/Desktop/work/tweaks/TikTok/TikTokDylib/Logos/TikTokDylib.xm"
static void (*_logos_orig$Settings$TTKSettingsViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL TTKSettingsViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Settings$TTKSettingsViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL TTKSettingsViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Settings$TTKSettingsViewController$xy_goSettings(_LOGOS_SELF_TYPE_NORMAL TTKSettingsViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Settings$TTKSettingsViewController$xy_addSettingsBtn(_LOGOS_SELF_TYPE_NORMAL TTKSettingsViewController* _LOGOS_SELF_CONST, SEL); 


static void _logos_method$Settings$TTKSettingsViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL TTKSettingsViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$Settings$TTKSettingsViewController$viewDidLoad(self, _cmd);
    [self xy_addSettingsBtn];
}


static void _logos_method$Settings$TTKSettingsViewController$xy_goSettings(_LOGOS_SELF_TYPE_NORMAL TTKSettingsViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    XYSettingsViewController *settingVc = [[XYSettingsViewController alloc] init];
    [[UIApplication.sharedApplication topViewController].navigationController pushViewController:settingVc animated:true];
}

static void _logos_method$Settings$TTKSettingsViewController$xy_addSettingsBtn(_LOGOS_SELF_TYPE_NORMAL TTKSettingsViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    
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




static void _logos_method$DownloadBypass$AWEIMDirectTranspondViewController$xy_downloadAweme(_LOGOS_SELF_TYPE_NORMAL AWEIMDirectTranspondViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$DownloadBypass$AWEIMDirectTranspondViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL AWEIMDirectTranspondViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$DownloadBypass$AWEIMDirectTranspondViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWEIMDirectTranspondViewController* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$DownloadBypass$AVMDLDataLoader$_supportPoxy$)(_LOGOS_SELF_TYPE_NORMAL AVMDLDataLoader* _LOGOS_SELF_CONST, SEL, NSString *); static _Bool _logos_method$DownloadBypass$AVMDLDataLoader$_supportPoxy$(_LOGOS_SELF_TYPE_NORMAL AVMDLDataLoader* _LOGOS_SELF_CONST, SEL, NSString *); static void (*_logos_orig$DownloadBypass$_TTVideoEnginePreloadManager$_addTask$vid$preSize$urlItem$vidItem$videoModeltem$)(_LOGOS_SELF_TYPE_NORMAL _TTVideoEnginePreloadManager* _LOGOS_SELF_CONST, SEL, id, id, long long, id, id, id); static void _logos_method$DownloadBypass$_TTVideoEnginePreloadManager$_addTask$vid$preSize$urlItem$vidItem$videoModeltem$(_LOGOS_SELF_TYPE_NORMAL _TTVideoEnginePreloadManager* _LOGOS_SELF_CONST, SEL, id, id, long long, id, id, id); 




static void _logos_method$DownloadBypass$AWEIMDirectTranspondViewController$xy_downloadAweme(_LOGOS_SELF_TYPE_NORMAL AWEIMDirectTranspondViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    AWEAwemeModel *aweme = self.shareContext.target;
    AWEVideoModel *video = aweme.video;
    AWEURLModel *playURL = video.playURL;
    NSArray *originURLList = playURL.originURLList;
    NSString *url = originURLList.firstObject;
    
    XYVideoDownloader *downloader = [XYVideoDownloader shared];
    __weak typeof(self) weakSelf = self;
    [downloader downloadWithURL:[NSURL URLWithString:url] completion:^(BOOL isSuccess, NSError *error){
        [weakSelf dismissAnimated: YES completion: nil];
    }];
}


static void _logos_method$DownloadBypass$AWEIMDirectTranspondViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWEIMDirectTranspondViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$DownloadBypass$AWEIMDirectTranspondViewController$viewDidLoad(self, _cmd);
    
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





static _Bool _logos_method$DownloadBypass$AVMDLDataLoader$_supportPoxy$(_LOGOS_SELF_TYPE_NORMAL AVMDLDataLoader* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSString * url) {
    
    NSLog(@"AVMDLDataLoader, url: %@", url);
    if (![url hasPrefix: @"https://api-"]) { 
        [UIPasteboard generalPasteboard].string = url;
    }
    bool ret = _logos_orig$DownloadBypass$AVMDLDataLoader$_supportPoxy$(self, _cmd, url);
    return ret;
}




static void _logos_method$DownloadBypass$_TTVideoEnginePreloadManager$_addTask$vid$preSize$urlItem$vidItem$videoModeltem$(_LOGOS_SELF_TYPE_NORMAL _TTVideoEnginePreloadManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2, long long arg3, id arg4, id arg5, id arg6) {
    _logos_orig$DownloadBypass$_TTVideoEnginePreloadManager$_addTask$vid$preSize$urlItem$vidItem$videoModeltem$(self, _cmd, arg1, arg2, arg3, arg4, arg5, arg6);
}





static id (*_logos_orig$SSLPinningBypass$TTNetworkManagerChromium$requestForJSONWithResponse$params$method$needCommonParams$headerField$requestSerializer$responseSerializer$autoResume$verifyRequest$isCustomizedCookie$callback$callbackQueue$)(_LOGOS_SELF_TYPE_NORMAL TTNetworkManagerChromium* _LOGOS_SELF_CONST, SEL, id, id, id, _Bool, id, Class, Class, _Bool, _Bool, _Bool, CDUnknownBlockType, id); static id _logos_method$SSLPinningBypass$TTNetworkManagerChromium$requestForJSONWithResponse$params$method$needCommonParams$headerField$requestSerializer$responseSerializer$autoResume$verifyRequest$isCustomizedCookie$callback$callbackQueue$(_LOGOS_SELF_TYPE_NORMAL TTNetworkManagerChromium* _LOGOS_SELF_CONST, SEL, id, id, id, _Bool, id, Class, Class, _Bool, _Bool, _Bool, CDUnknownBlockType, id); static TTHttpTask* (*_logos_orig$SSLPinningBypass$TTHttpTask$init)(_LOGOS_SELF_TYPE_INIT TTHttpTask*, SEL) _LOGOS_RETURN_RETAINED; static TTHttpTask* _logos_method$SSLPinningBypass$TTHttpTask$init(_LOGOS_SELF_TYPE_INIT TTHttpTask*, SEL) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$SSLPinningBypass$TTHttpTask$setSkipSSLCertificateError$)(_LOGOS_SELF_TYPE_NORMAL TTHttpTask* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$SSLPinningBypass$TTHttpTask$setSkipSSLCertificateError$(_LOGOS_SELF_TYPE_NORMAL TTHttpTask* _LOGOS_SELF_CONST, SEL, BOOL); 




static id _logos_method$SSLPinningBypass$TTNetworkManagerChromium$requestForJSONWithResponse$params$method$needCommonParams$headerField$requestSerializer$responseSerializer$autoResume$verifyRequest$isCustomizedCookie$callback$callbackQueue$(_LOGOS_SELF_TYPE_NORMAL TTNetworkManagerChromium* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2, id arg3, _Bool arg4, id arg5, Class arg6, Class arg7, _Bool arg8, _Bool arg9, _Bool arg10, CDUnknownBlockType arg11, id arg12) {
    TTHttpTaskChromium *obj = _logos_orig$SSLPinningBypass$TTNetworkManagerChromium$requestForJSONWithResponse$params$method$needCommonParams$headerField$requestSerializer$responseSerializer$autoResume$verifyRequest$isCustomizedCookie$callback$callbackQueue$(self, _cmd, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12); 
    obj.skipSSLCertificateError = YES;
    return obj;
}


 
static TTHttpTask* _logos_method$SSLPinningBypass$TTHttpTask$init(_LOGOS_SELF_TYPE_INIT TTHttpTask* __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {
    TTHttpTask *obj = _logos_orig$SSLPinningBypass$TTHttpTask$init(self, _cmd);
    obj.skipSSLCertificateError = YES;
    return obj;
}



static void _logos_method$SSLPinningBypass$TTHttpTask$setSkipSSLCertificateError$(_LOGOS_SELF_TYPE_NORMAL TTHttpTask* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL value) {
    _logos_orig$SSLPinningBypass$TTHttpTask$setSkipSSLCertificateError$(self, _cmd, YES);
}






static AWEAwemeModel* (*_logos_orig$CoreLogic$AWEAwemeModel$initWithDictionary$error$)(_LOGOS_SELF_TYPE_INIT AWEAwemeModel*, SEL, id, id *) _LOGOS_RETURN_RETAINED; static AWEAwemeModel* _logos_method$CoreLogic$AWEAwemeModel$initWithDictionary$error$(_LOGOS_SELF_TYPE_INIT AWEAwemeModel*, SEL, id, id *) _LOGOS_RETURN_RETAINED; static AWEAwemeModel* (*_logos_orig$CoreLogic$AWEAwemeModel$init)(_LOGOS_SELF_TYPE_INIT AWEAwemeModel*, SEL) _LOGOS_RETURN_RETAINED; static AWEAwemeModel* _logos_method$CoreLogic$AWEAwemeModel$init(_LOGOS_SELF_TYPE_INIT AWEAwemeModel*, SEL) _LOGOS_RETURN_RETAINED; static BOOL (*_logos_orig$CoreLogic$AWEAwemeModel$progressBarDraggable)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeModel* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$CoreLogic$AWEAwemeModel$progressBarDraggable(_LOGOS_SELF_TYPE_NORMAL AWEAwemeModel* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$CoreLogic$AWEAwemeModel$progressBarVisible)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeModel* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$CoreLogic$AWEAwemeModel$progressBarVisible(_LOGOS_SELF_TYPE_NORMAL AWEAwemeModel* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$CoreLogic$AWEPlayVideoPlayerController$playerWillLoopPlaying$)(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoPlayerController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$CoreLogic$AWEPlayVideoPlayerController$playerWillLoopPlaying$(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoPlayerController* _LOGOS_SELF_CONST, SEL, id); static AWEFeedContainerViewController* (*_logos_orig$CoreLogic$AWEFeedContainerViewController$init)(_LOGOS_SELF_TYPE_INIT AWEFeedContainerViewController*, SEL) _LOGOS_RETURN_RETAINED; static AWEFeedContainerViewController* _logos_method$CoreLogic$AWEFeedContainerViewController$init(_LOGOS_SELF_TYPE_INIT AWEFeedContainerViewController*, SEL) _LOGOS_RETURN_RETAINED; static AWEFeedContainerViewController * _logos_meta_method$CoreLogic$AWEFeedContainerViewController$sharedInstance(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$CoreLogic$AWEPlayInteractionViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL AWEPlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$CoreLogic$AWEPlayInteractionViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWEPlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$CoreLogic$AWEPlayInteractionViewController$stopLoadingAnimation)(_LOGOS_SELF_TYPE_NORMAL AWEPlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$CoreLogic$AWEPlayInteractionViewController$stopLoadingAnimation(_LOGOS_SELF_TYPE_NORMAL AWEPlayInteractionViewController* _LOGOS_SELF_CONST, SEL); 

static AWEAwemeModel* _logos_method$CoreLogic$AWEAwemeModel$initWithDictionary$error$(_LOGOS_SELF_TYPE_INIT AWEAwemeModel* __unused self, SEL __unused _cmd, id arg1, id * arg2) _LOGOS_RETURN_RETAINED {
    id orig = _logos_orig$CoreLogic$AWEAwemeModel$initWithDictionary$error$(self, _cmd, arg1, arg2);
    return XYPreferenceManager.shared.shouldPlayAds && self.isAds ? nil : orig;
}

static AWEAwemeModel* _logos_method$CoreLogic$AWEAwemeModel$init(_LOGOS_SELF_TYPE_INIT AWEAwemeModel* __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {
    id orig = _logos_orig$CoreLogic$AWEAwemeModel$init(self, _cmd);
    return XYPreferenceManager.shared.shouldPlayAds && self.isAds ? nil : orig;
}

static BOOL _logos_method$CoreLogic$AWEAwemeModel$progressBarDraggable(_LOGOS_SELF_TYPE_NORMAL AWEAwemeModel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return XYPreferenceManager.shared.showProgressBar || _logos_orig$CoreLogic$AWEAwemeModel$progressBarDraggable(self, _cmd);
}
static BOOL _logos_method$CoreLogic$AWEAwemeModel$progressBarVisible(_LOGOS_SELF_TYPE_NORMAL AWEAwemeModel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return XYPreferenceManager.shared.showProgressBar || _logos_orig$CoreLogic$AWEAwemeModel$progressBarVisible(self, _cmd);
}



static void _logos_method$CoreLogic$AWEPlayVideoPlayerController$playerWillLoopPlaying$(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoPlayerController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    if (XYPreferenceManager.shared.isAutoPlayNextVideoWhenPlayEnded) {
        if ([self.container.parentViewController isKindOfClass:_logos_static_class_lookup$AWEFeedTableViewController()]) {
            
            [((AWEFeedTableViewController *)self.container.parentViewController) scrollToNextVideo];
            return;
        }
    }
    _logos_orig$CoreLogic$AWEPlayVideoPlayerController$playerWillLoopPlaying$(self, _cmd, arg1);
}



static AWEFeedContainerViewController *__weak sharedInstance;
__attribute__((used)) static BOOL _logos_method$CoreLogic$AWEFeedContainerViewController$isUIHidden(AWEFeedContainerViewController * __unused self, SEL __unused _cmd) { NSValue * value = objc_getAssociatedObject(self, (void *)_logos_method$CoreLogic$AWEFeedContainerViewController$isUIHidden); BOOL rawValue; [value getValue:&rawValue]; return rawValue; }; __attribute__((used)) static void _logos_method$CoreLogic$AWEFeedContainerViewController$setIsUIHidden(AWEFeedContainerViewController * __unused self, SEL __unused _cmd, BOOL rawValue) { NSValue * value = [NSValue valueWithBytes:&rawValue objCType:@encode(BOOL)]; objc_setAssociatedObject(self, (void *)_logos_method$CoreLogic$AWEFeedContainerViewController$isUIHidden, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }

static AWEFeedContainerViewController* _logos_method$CoreLogic$AWEFeedContainerViewController$init(_LOGOS_SELF_TYPE_INIT AWEFeedContainerViewController* __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {
    id orig = _logos_orig$CoreLogic$AWEFeedContainerViewController$init(self, _cmd);
    self.isUIHidden = FALSE;
    sharedInstance = orig;
    return orig;
}


static AWEFeedContainerViewController * _logos_meta_method$CoreLogic$AWEFeedContainerViewController$sharedInstance(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return sharedInstance;
}




static void _logos_method$CoreLogic$AWEPlayInteractionViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWEPlayInteractionViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$CoreLogic$AWEPlayInteractionViewController$viewDidLoad(self, _cmd);
}

static void _logos_method$CoreLogic$AWEPlayInteractionViewController$stopLoadingAnimation(_LOGOS_SELF_TYPE_NORMAL AWEPlayInteractionViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$CoreLogic$AWEPlayInteractionViewController$stopLoadingAnimation(self, _cmd);
}



static BOOL (*_logos_meta_orig$JailbreakBypass$AppsFlyerUtils$isJailbrokenWithSkipAdvancedJailbreakValidation$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, BOOL); static BOOL _logos_meta_method$JailbreakBypass$AppsFlyerUtils$isJailbrokenWithSkipAdvancedJailbreakValidation$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, BOOL); static BOOL (*_logos_meta_orig$JailbreakBypass$TTAdSplashDeviceHelper$isJailBroken)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BOOL _logos_meta_method$JailbreakBypass$TTAdSplashDeviceHelper$isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_meta_orig$JailbreakBypass$TTInstallUtil$isJailBroken)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BOOL _logos_meta_method$JailbreakBypass$TTInstallUtil$isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$JailbreakBypass$PIPOIAPStoreManager$_pipo_isJailBrokenDeviceWithProductID$orderID$)(_LOGOS_SELF_TYPE_NORMAL PIPOIAPStoreManager* _LOGOS_SELF_CONST, SEL, id, id); static BOOL _logos_method$JailbreakBypass$PIPOIAPStoreManager$_pipo_isJailBrokenDeviceWithProductID$orderID$(_LOGOS_SELF_TYPE_NORMAL PIPOIAPStoreManager* _LOGOS_SELF_CONST, SEL, id, id); static BOOL (*_logos_meta_orig$JailbreakBypass$UIDevice$btd_isJailBroken)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BOOL _logos_meta_method$JailbreakBypass$UIDevice$btd_isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$JailbreakBypass$NSString$containsString$)(_LOGOS_SELF_TYPE_NORMAL NSString* _LOGOS_SELF_CONST, SEL, NSString *); static BOOL _logos_method$JailbreakBypass$NSString$containsString$(_LOGOS_SELF_TYPE_NORMAL NSString* _LOGOS_SELF_CONST, SEL, NSString *); static BOOL (*_logos_orig$JailbreakBypass$NSFileManager$fileExistsAtPath$)(_LOGOS_SELF_TYPE_NORMAL NSFileManager* _LOGOS_SELF_CONST, SEL, NSString *); static BOOL _logos_method$JailbreakBypass$NSFileManager$fileExistsAtPath$(_LOGOS_SELF_TYPE_NORMAL NSFileManager* _LOGOS_SELF_CONST, SEL, NSString *); 

static BOOL _logos_meta_method$JailbreakBypass$AppsFlyerUtils$isJailbrokenWithSkipAdvancedJailbreakValidation$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {
    return NO;
}



static BOOL _logos_meta_method$JailbreakBypass$TTAdSplashDeviceHelper$isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return NO;
}



static BOOL _logos_meta_method$JailbreakBypass$TTInstallUtil$isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return NO;
}



static BOOL _logos_method$JailbreakBypass$PIPOIAPStoreManager$_pipo_isJailBrokenDeviceWithProductID$orderID$(_LOGOS_SELF_TYPE_NORMAL PIPOIAPStoreManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    return NO;
}



static BOOL _logos_meta_method$JailbreakBypass$UIDevice$btd_isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return NO;
}




static BOOL _logos_method$JailbreakBypass$NSString$containsString$(_LOGOS_SELF_TYPE_NORMAL NSString* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSString * str) {
    static NSString *mobile = @"/Library/MobileSubstrate/MobileSubstrate.dylib";
    static NSString *mobile1 = @"/Library/MobileSubstrate";
    if ([str hasPrefix:mobile] || [str hasPrefix:mobile1]) {
        return NO;
    }
    return _logos_orig$JailbreakBypass$NSString$containsString$(self, _cmd, str);
}





static BOOL _logos_method$JailbreakBypass$NSFileManager$fileExistsAtPath$(_LOGOS_SELF_TYPE_NORMAL NSFileManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSString * event) {
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
    return  _logos_orig$JailbreakBypass$NSFileManager$fileExistsAtPath$(self, _cmd, event);
}


static id (*_logos_meta_orig$BundleIdByPass$TTInstallSandBoxHelper$bundleIdentifier)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$BundleIdByPass$TTInstallSandBoxHelper$bundleIdentifier(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); 

static id _logos_meta_method$BundleIdByPass$TTInstallSandBoxHelper$bundleIdentifier(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSString *orig = _logos_meta_orig$BundleIdByPass$TTInstallSandBoxHelper$bundleIdentifier(self, _cmd);
    NSLog(@"orig bundleIdentifier: %@", orig);
    return @"com.zhiliaoapp.musically";
}





static void _logos_meta_method$_ungrouped$AWEStartupTimingMonitorManager$start(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_meta_orig$_ungrouped$AWEStartupTimingMonitorManager$start(self, _cmd); 
}


static __attribute__((constructor)) void _logosLocalCtor_319290b9(int __unused argc, char __unused **argv, char __unused **envp) {
    {Class _logos_class$Settings$TTKSettingsViewController = objc_getClass("TTKSettingsViewController"); MSHookMessageEx(_logos_class$Settings$TTKSettingsViewController, @selector(viewDidLoad), (IMP)&_logos_method$Settings$TTKSettingsViewController$viewDidLoad, (IMP*)&_logos_orig$Settings$TTKSettingsViewController$viewDidLoad);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Settings$TTKSettingsViewController, @selector(xy_goSettings), (IMP)&_logos_method$Settings$TTKSettingsViewController$xy_goSettings, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Settings$TTKSettingsViewController, @selector(xy_addSettingsBtn), (IMP)&_logos_method$Settings$TTKSettingsViewController$xy_addSettingsBtn, _typeEncoding); }}
    {Class _logos_class$DownloadBypass$AWEIMDirectTranspondViewController = objc_getClass("AWEIMDirectTranspondViewController"); { char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$DownloadBypass$AWEIMDirectTranspondViewController, @selector(xy_downloadAweme), (IMP)&_logos_method$DownloadBypass$AWEIMDirectTranspondViewController$xy_downloadAweme, _typeEncoding); }MSHookMessageEx(_logos_class$DownloadBypass$AWEIMDirectTranspondViewController, @selector(viewDidLoad), (IMP)&_logos_method$DownloadBypass$AWEIMDirectTranspondViewController$viewDidLoad, (IMP*)&_logos_orig$DownloadBypass$AWEIMDirectTranspondViewController$viewDidLoad);Class _logos_class$DownloadBypass$AVMDLDataLoader = objc_getClass("AVMDLDataLoader"); MSHookMessageEx(_logos_class$DownloadBypass$AVMDLDataLoader, @selector(_supportPoxy:), (IMP)&_logos_method$DownloadBypass$AVMDLDataLoader$_supportPoxy$, (IMP*)&_logos_orig$DownloadBypass$AVMDLDataLoader$_supportPoxy$);Class _logos_class$DownloadBypass$_TTVideoEnginePreloadManager = objc_getClass("_TTVideoEnginePreloadManager"); MSHookMessageEx(_logos_class$DownloadBypass$_TTVideoEnginePreloadManager, @selector(_addTask:vid:preSize:urlItem:vidItem:videoModeltem:), (IMP)&_logos_method$DownloadBypass$_TTVideoEnginePreloadManager$_addTask$vid$preSize$urlItem$vidItem$videoModeltem$, (IMP*)&_logos_orig$DownloadBypass$_TTVideoEnginePreloadManager$_addTask$vid$preSize$urlItem$vidItem$videoModeltem$);}
    {Class _logos_class$SSLPinningBypass$TTNetworkManagerChromium = objc_getClass("TTNetworkManagerChromium"); MSHookMessageEx(_logos_class$SSLPinningBypass$TTNetworkManagerChromium, @selector(requestForJSONWithResponse:params:method:needCommonParams:headerField:requestSerializer:responseSerializer:autoResume:verifyRequest:isCustomizedCookie:callback:callbackQueue:), (IMP)&_logos_method$SSLPinningBypass$TTNetworkManagerChromium$requestForJSONWithResponse$params$method$needCommonParams$headerField$requestSerializer$responseSerializer$autoResume$verifyRequest$isCustomizedCookie$callback$callbackQueue$, (IMP*)&_logos_orig$SSLPinningBypass$TTNetworkManagerChromium$requestForJSONWithResponse$params$method$needCommonParams$headerField$requestSerializer$responseSerializer$autoResume$verifyRequest$isCustomizedCookie$callback$callbackQueue$);Class _logos_class$SSLPinningBypass$TTHttpTask = objc_getClass("TTHttpTask"); MSHookMessageEx(_logos_class$SSLPinningBypass$TTHttpTask, @selector(init), (IMP)&_logos_method$SSLPinningBypass$TTHttpTask$init, (IMP*)&_logos_orig$SSLPinningBypass$TTHttpTask$init);MSHookMessageEx(_logos_class$SSLPinningBypass$TTHttpTask, @selector(setSkipSSLCertificateError:), (IMP)&_logos_method$SSLPinningBypass$TTHttpTask$setSkipSSLCertificateError$, (IMP*)&_logos_orig$SSLPinningBypass$TTHttpTask$setSkipSSLCertificateError$);}
    {Class _logos_class$CoreLogic$AWEAwemeModel = objc_getClass("AWEAwemeModel"); MSHookMessageEx(_logos_class$CoreLogic$AWEAwemeModel, @selector(initWithDictionary:error:), (IMP)&_logos_method$CoreLogic$AWEAwemeModel$initWithDictionary$error$, (IMP*)&_logos_orig$CoreLogic$AWEAwemeModel$initWithDictionary$error$);MSHookMessageEx(_logos_class$CoreLogic$AWEAwemeModel, @selector(init), (IMP)&_logos_method$CoreLogic$AWEAwemeModel$init, (IMP*)&_logos_orig$CoreLogic$AWEAwemeModel$init);MSHookMessageEx(_logos_class$CoreLogic$AWEAwemeModel, @selector(progressBarDraggable), (IMP)&_logos_method$CoreLogic$AWEAwemeModel$progressBarDraggable, (IMP*)&_logos_orig$CoreLogic$AWEAwemeModel$progressBarDraggable);MSHookMessageEx(_logos_class$CoreLogic$AWEAwemeModel, @selector(progressBarVisible), (IMP)&_logos_method$CoreLogic$AWEAwemeModel$progressBarVisible, (IMP*)&_logos_orig$CoreLogic$AWEAwemeModel$progressBarVisible);Class _logos_class$CoreLogic$AWEPlayVideoPlayerController = objc_getClass("AWEPlayVideoPlayerController"); MSHookMessageEx(_logos_class$CoreLogic$AWEPlayVideoPlayerController, @selector(playerWillLoopPlaying:), (IMP)&_logos_method$CoreLogic$AWEPlayVideoPlayerController$playerWillLoopPlaying$, (IMP*)&_logos_orig$CoreLogic$AWEPlayVideoPlayerController$playerWillLoopPlaying$);Class _logos_class$CoreLogic$AWEFeedContainerViewController = objc_getClass("AWEFeedContainerViewController"); Class _logos_metaclass$CoreLogic$AWEFeedContainerViewController = object_getClass(_logos_class$CoreLogic$AWEFeedContainerViewController); MSHookMessageEx(_logos_class$CoreLogic$AWEFeedContainerViewController, @selector(init), (IMP)&_logos_method$CoreLogic$AWEFeedContainerViewController$init, (IMP*)&_logos_orig$CoreLogic$AWEFeedContainerViewController$init);{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(AWEFeedContainerViewController *), strlen(@encode(AWEFeedContainerViewController *))); i += strlen(@encode(AWEFeedContainerViewController *)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_metaclass$CoreLogic$AWEFeedContainerViewController, @selector(sharedInstance), (IMP)&_logos_meta_method$CoreLogic$AWEFeedContainerViewController$sharedInstance, _typeEncoding); }{ char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(BOOL)); class_addMethod(_logos_class$CoreLogic$AWEFeedContainerViewController, @selector(isUIHidden), (IMP)&_logos_method$CoreLogic$AWEFeedContainerViewController$isUIHidden, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(BOOL)); class_addMethod(_logos_class$CoreLogic$AWEFeedContainerViewController, @selector(setIsUIHidden:), (IMP)&_logos_method$CoreLogic$AWEFeedContainerViewController$setIsUIHidden, _typeEncoding); } Class _logos_class$CoreLogic$AWEPlayInteractionViewController = objc_getClass("AWEPlayInteractionViewController"); MSHookMessageEx(_logos_class$CoreLogic$AWEPlayInteractionViewController, @selector(viewDidLoad), (IMP)&_logos_method$CoreLogic$AWEPlayInteractionViewController$viewDidLoad, (IMP*)&_logos_orig$CoreLogic$AWEPlayInteractionViewController$viewDidLoad);MSHookMessageEx(_logos_class$CoreLogic$AWEPlayInteractionViewController, @selector(stopLoadingAnimation), (IMP)&_logos_method$CoreLogic$AWEPlayInteractionViewController$stopLoadingAnimation, (IMP*)&_logos_orig$CoreLogic$AWEPlayInteractionViewController$stopLoadingAnimation);}
    {Class _logos_class$JailbreakBypass$AppsFlyerUtils = objc_getClass("AppsFlyerUtils"); Class _logos_metaclass$JailbreakBypass$AppsFlyerUtils = object_getClass(_logos_class$JailbreakBypass$AppsFlyerUtils); MSHookMessageEx(_logos_metaclass$JailbreakBypass$AppsFlyerUtils, @selector(isJailbrokenWithSkipAdvancedJailbreakValidation:), (IMP)&_logos_meta_method$JailbreakBypass$AppsFlyerUtils$isJailbrokenWithSkipAdvancedJailbreakValidation$, (IMP*)&_logos_meta_orig$JailbreakBypass$AppsFlyerUtils$isJailbrokenWithSkipAdvancedJailbreakValidation$);Class _logos_class$JailbreakBypass$TTAdSplashDeviceHelper = objc_getClass("TTAdSplashDeviceHelper"); Class _logos_metaclass$JailbreakBypass$TTAdSplashDeviceHelper = object_getClass(_logos_class$JailbreakBypass$TTAdSplashDeviceHelper); MSHookMessageEx(_logos_metaclass$JailbreakBypass$TTAdSplashDeviceHelper, @selector(isJailBroken), (IMP)&_logos_meta_method$JailbreakBypass$TTAdSplashDeviceHelper$isJailBroken, (IMP*)&_logos_meta_orig$JailbreakBypass$TTAdSplashDeviceHelper$isJailBroken);Class _logos_class$JailbreakBypass$TTInstallUtil = objc_getClass("TTInstallUtil"); Class _logos_metaclass$JailbreakBypass$TTInstallUtil = object_getClass(_logos_class$JailbreakBypass$TTInstallUtil); MSHookMessageEx(_logos_metaclass$JailbreakBypass$TTInstallUtil, @selector(isJailBroken), (IMP)&_logos_meta_method$JailbreakBypass$TTInstallUtil$isJailBroken, (IMP*)&_logos_meta_orig$JailbreakBypass$TTInstallUtil$isJailBroken);Class _logos_class$JailbreakBypass$PIPOIAPStoreManager = objc_getClass("PIPOIAPStoreManager"); MSHookMessageEx(_logos_class$JailbreakBypass$PIPOIAPStoreManager, @selector(_pipo_isJailBrokenDeviceWithProductID:orderID:), (IMP)&_logos_method$JailbreakBypass$PIPOIAPStoreManager$_pipo_isJailBrokenDeviceWithProductID$orderID$, (IMP*)&_logos_orig$JailbreakBypass$PIPOIAPStoreManager$_pipo_isJailBrokenDeviceWithProductID$orderID$);Class _logos_class$JailbreakBypass$UIDevice = objc_getClass("UIDevice"); Class _logos_metaclass$JailbreakBypass$UIDevice = object_getClass(_logos_class$JailbreakBypass$UIDevice); MSHookMessageEx(_logos_metaclass$JailbreakBypass$UIDevice, @selector(btd_isJailBroken), (IMP)&_logos_meta_method$JailbreakBypass$UIDevice$btd_isJailBroken, (IMP*)&_logos_meta_orig$JailbreakBypass$UIDevice$btd_isJailBroken);Class _logos_class$JailbreakBypass$NSString = objc_getClass("NSString"); MSHookMessageEx(_logos_class$JailbreakBypass$NSString, @selector(containsString:), (IMP)&_logos_method$JailbreakBypass$NSString$containsString$, (IMP*)&_logos_orig$JailbreakBypass$NSString$containsString$);Class _logos_class$JailbreakBypass$NSFileManager = objc_getClass("NSFileManager"); MSHookMessageEx(_logos_class$JailbreakBypass$NSFileManager, @selector(fileExistsAtPath:), (IMP)&_logos_method$JailbreakBypass$NSFileManager$fileExistsAtPath$, (IMP*)&_logos_orig$JailbreakBypass$NSFileManager$fileExistsAtPath$);}
    {Class _logos_class$BundleIdByPass$TTInstallSandBoxHelper = objc_getClass("TTInstallSandBoxHelper"); Class _logos_metaclass$BundleIdByPass$TTInstallSandBoxHelper = object_getClass(_logos_class$BundleIdByPass$TTInstallSandBoxHelper); MSHookMessageEx(_logos_metaclass$BundleIdByPass$TTInstallSandBoxHelper, @selector(bundleIdentifier), (IMP)&_logos_meta_method$BundleIdByPass$TTInstallSandBoxHelper$bundleIdentifier, (IMP*)&_logos_meta_orig$BundleIdByPass$TTInstallSandBoxHelper$bundleIdentifier);}
    {Class _logos_class$_ungrouped$AWEStartupTimingMonitorManager = objc_getClass("AWEStartupTimingMonitorManager"); Class _logos_metaclass$_ungrouped$AWEStartupTimingMonitorManager = object_getClass(_logos_class$_ungrouped$AWEStartupTimingMonitorManager); MSHookMessageEx(_logos_metaclass$_ungrouped$AWEStartupTimingMonitorManager, @selector(start), (IMP)&_logos_meta_method$_ungrouped$AWEStartupTimingMonitorManager$start, (IMP*)&_logos_meta_orig$_ungrouped$AWEStartupTimingMonitorManager$start);}
}


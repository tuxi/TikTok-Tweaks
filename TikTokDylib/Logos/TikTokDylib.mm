#line 1 "/Users/xiaoyuan/Desktop/work/tweaks/TikTok/TikTokDylib/Logos/TikTokDylib.xm"


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






















#define kAwemeDylibNotificationName "com.enba.preferencesChanged"

static void notificationCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
    XYAwemeManager *manager = [XYAwemeManager manager];
    manager.authorizedToDownload = @YES;
}



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

@class AWEDiscoverFeedEntranceView; @class AWEFeedTableViewController; @class NSString; @class AWEShareCollectionView; @class NSFileManager; @class AWEIMLoginManager; @class AWEFeedContainerViewController; @class TTInstallDeviceHelper; @class AWEAwemeModel; @class AWEAwemeDetailTableViewController; @class AWEAwemePlayInteractionViewController; @class AWEFeedCellViewController; @class AWEUIResponder; @class AWEENV; @class HMDInfo; @class AWEIMMessageListViewController; @class AWEIMMessageBaseViewController; @class AVMDLDataLoader; @class AWEAwemePlayInteractionPresenter; @class UIDevice; @class AWESlidingTabbarView; @class BDDiamondAfterHeatManager; @class AWELoginWindowManager; @class ANSMetadata; 
static void (*_logos_orig$_ungrouped$AWEFeedTableViewController$viewDidDisappear$)(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$AWEFeedTableViewController$viewDidDisappear$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$AWEFeedTableViewController$viewWillAppear$)(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$AWEFeedTableViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$AWEFeedTableViewController$xy_savePhoto$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL, NSNotification *); static void (*_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$performLikeAction)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$performLikeAction(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$onVideoPlayerViewDoubleClicked$)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$onVideoPlayerViewDoubleClicked$(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void (*_logos_orig$_ungrouped$AWEFeedCellViewController$_onVideoPlayerViewClicked$)(_LOGOS_SELF_TYPE_NORMAL AWEFeedCellViewController* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void _logos_method$_ungrouped$AWEFeedCellViewController$_onVideoPlayerViewClicked$(_LOGOS_SELF_TYPE_NORMAL AWEFeedCellViewController* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void (*_logos_orig$_ungrouped$AWEAwemePlayInteractionPresenter$enterMusicDetail$)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionPresenter* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void _logos_method$_ungrouped$AWEAwemePlayInteractionPresenter$enterMusicDetail$(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionPresenter* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void (*_logos_orig$_ungrouped$AWEAwemePlayInteractionPresenter$p_goToPersonalPage$gestureRecognizer$)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionPresenter* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$AWEAwemePlayInteractionPresenter$p_goToPersonalPage$gestureRecognizer$(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionPresenter* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$_ungrouped$AWEAwemePlayInteractionPresenter$onUnFollowViewClicked$)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionPresenter* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void _logos_method$_ungrouped$AWEAwemePlayInteractionPresenter$onUnFollowViewClicked$(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionPresenter* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void (*_logos_orig$_ungrouped$AWEAwemePlayInteractionPresenter$onFollowViewClicked$)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionPresenter* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void _logos_method$_ungrouped$AWEAwemePlayInteractionPresenter$onFollowViewClicked$(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionPresenter* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void (*_logos_orig$_ungrouped$AWEShareCollectionView$sendEvents$toItemAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL AWEShareCollectionView* _LOGOS_SELF_CONST, SEL, unsigned long long, NSIndexPath *); static void _logos_method$_ungrouped$AWEShareCollectionView$sendEvents$toItemAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL AWEShareCollectionView* _LOGOS_SELF_CONST, SEL, unsigned long long, NSIndexPath *); static void (*_logos_orig$_ungrouped$AWEShareCollectionView$collectionView$didSelectItemAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL AWEShareCollectionView* _LOGOS_SELF_CONST, SEL, id, NSIndexPath *); static void _logos_method$_ungrouped$AWEShareCollectionView$collectionView$didSelectItemAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL AWEShareCollectionView* _LOGOS_SELF_CONST, SEL, id, NSIndexPath *); static AWEShareCollectionView* (*_logos_orig$_ungrouped$AWEShareCollectionView$initWithItems$hostView$)(_LOGOS_SELF_TYPE_INIT AWEShareCollectionView*, SEL, NSArray<AWEShareItem *> *, id) _LOGOS_RETURN_RETAINED; static AWEShareCollectionView* _logos_method$_ungrouped$AWEShareCollectionView$initWithItems$hostView$(_LOGOS_SELF_TYPE_INIT AWEShareCollectionView*, SEL, NSArray<AWEShareItem *> *, id) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$_ungrouped$AWEFeedContainerViewController$onDiscoverButtonClicked$)(_LOGOS_SELF_TYPE_NORMAL AWEFeedContainerViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWEFeedContainerViewController$onDiscoverButtonClicked$(_LOGOS_SELF_TYPE_NORMAL AWEFeedContainerViewController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWEDiscoverFeedEntranceView$awe_UITracker_gestureRecognizer$)(_LOGOS_SELF_TYPE_NORMAL AWEDiscoverFeedEntranceView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWEDiscoverFeedEntranceView$awe_UITracker_gestureRecognizer$(_LOGOS_SELF_TYPE_NORMAL AWEDiscoverFeedEntranceView* _LOGOS_SELF_CONST, SEL, id); static _Bool (*_logos_orig$_ungrouped$AVMDLDataLoader$_supportPoxy$)(_LOGOS_SELF_TYPE_NORMAL AVMDLDataLoader* _LOGOS_SELF_CONST, SEL, NSString *); static _Bool _logos_method$_ungrouped$AVMDLDataLoader$_supportPoxy$(_LOGOS_SELF_TYPE_NORMAL AVMDLDataLoader* _LOGOS_SELF_CONST, SEL, NSString *); static id (*_logos_orig$_ungrouped$AVMDLDataLoader$getCacheFileInfo$filePath$)(_LOGOS_SELF_TYPE_NORMAL AVMDLDataLoader* _LOGOS_SELF_CONST, SEL, id, id); static id _logos_method$_ungrouped$AVMDLDataLoader$getCacheFileInfo$filePath$(_LOGOS_SELF_TYPE_NORMAL AVMDLDataLoader* _LOGOS_SELF_CONST, SEL, id, id); static id (*_logos_orig$_ungrouped$AVMDLDataLoader$getCacheFileInfo$)(_LOGOS_SELF_TYPE_NORMAL AVMDLDataLoader* _LOGOS_SELF_CONST, SEL, id); static id _logos_method$_ungrouped$AVMDLDataLoader$getCacheFileInfo$(_LOGOS_SELF_TYPE_NORMAL AVMDLDataLoader* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AVMDLDataLoader$stop)(_LOGOS_SELF_TYPE_NORMAL AVMDLDataLoader* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AVMDLDataLoader$stop(_LOGOS_SELF_TYPE_NORMAL AVMDLDataLoader* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AVMDLDataLoader$start$)(_LOGOS_SELF_TYPE_NORMAL AVMDLDataLoader* _LOGOS_SELF_CONST, SEL, id *); static void _logos_method$_ungrouped$AVMDLDataLoader$start$(_LOGOS_SELF_TYPE_NORMAL AVMDLDataLoader* _LOGOS_SELF_CONST, SEL, id *); static _Bool (*_logos_meta_orig$_ungrouped$AWEENV$isDebugEnv)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEENV$isDebugEnv(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEENV$isBetaEnv)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEENV$isBetaEnv(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEENV$isTestEnv)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEENV$isTestEnv(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEENV$isI18N)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEENV$isI18N(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEENV$isTiktok)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEENV$isTiktok(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEENV$isMusically)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEENV$isMusically(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEENV$isDouyin)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEENV$isDouyin(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$AWEENV$plistChannel)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$AWEENV$plistChannel(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEENV$isTestFlight)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEENV$isTestFlight(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEENV$isStaff)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEENV$isStaff(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static long long (*_logos_meta_orig$_ungrouped$AWEENV$channel)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static long long _logos_meta_method$_ungrouped$AWEENV$channel(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static long long (*_logos_meta_orig$_ungrouped$AWEENV$product)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static long long _logos_meta_method$_ungrouped$AWEENV$product(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEENV$isDebugEvn)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEENV$isDebugEvn(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEENV$isBetaEvn)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEENV$isBetaEvn(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEENV$isTestEvn)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEENV$isTestEvn(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$AWEAwemeModel$disableDownload)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeModel* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWEAwemeModel$disableDownload(_LOGOS_SELF_TYPE_NORMAL AWEAwemeModel* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWESlidingTabbarView$tabButtonClicked$)(_LOGOS_SELF_TYPE_NORMAL AWESlidingTabbarView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWESlidingTabbarView$tabButtonClicked$(_LOGOS_SELF_TYPE_NORMAL AWESlidingTabbarView* _LOGOS_SELF_CONST, SEL, id); static BDDiamondAfterHeatManager * (*_logos_meta_orig$_ungrouped$BDDiamondAfterHeatManager$sharedInstance)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BDDiamondAfterHeatManager * _logos_meta_method$_ungrouped$BDDiamondAfterHeatManager$sharedInstance(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$BDDiamondAfterHeatManager$userLoginAction)(_LOGOS_SELF_TYPE_NORMAL BDDiamondAfterHeatManager* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$BDDiamondAfterHeatManager$userLoginAction(_LOGOS_SELF_TYPE_NORMAL BDDiamondAfterHeatManager* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$BDDiamondAfterHeatManager$userLogoutAction)(_LOGOS_SELF_TYPE_NORMAL BDDiamondAfterHeatManager* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$BDDiamondAfterHeatManager$userLogoutAction(_LOGOS_SELF_TYPE_NORMAL BDDiamondAfterHeatManager* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$BDDiamondAfterHeatManager$clearHeatCacheData)(_LOGOS_SELF_TYPE_NORMAL BDDiamondAfterHeatManager* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$BDDiamondAfterHeatManager$clearHeatCacheData(_LOGOS_SELF_TYPE_NORMAL BDDiamondAfterHeatManager* _LOGOS_SELF_CONST, SEL); static NSString * (*_logos_orig$_ungrouped$BDDiamondAfterHeatManager$currentLoginUID)(_LOGOS_SELF_TYPE_NORMAL BDDiamondAfterHeatManager* _LOGOS_SELF_CONST, SEL); static NSString * _logos_method$_ungrouped$BDDiamondAfterHeatManager$currentLoginUID(_LOGOS_SELF_TYPE_NORMAL BDDiamondAfterHeatManager* _LOGOS_SELF_CONST, SEL); static AWELoginWindowManager * (*_logos_meta_orig$_ungrouped$AWELoginWindowManager$sharedManager)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static AWELoginWindowManager * _logos_meta_method$_ungrouped$AWELoginWindowManager$sharedManager(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWELoginWindowManager$requestSettings)(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELoginWindowManager$requestSettings(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$AWELoginWindowManager$loginSettingsModelArray)(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$AWELoginWindowManager$loginSettingsModelArray(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWELoginWindowManager$dismiss)(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELoginWindowManager$dismiss(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWELoginWindowManager$didFinishLogin)(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELoginWindowManager$didFinishLogin(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWELoginWindowManager$showLoginViewControllerWithParamsDict$)(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWELoginWindowManager$showLoginViewControllerWithParamsDict$(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWELoginWindowManager$makeKeyAndVisible)(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELoginWindowManager$makeKeyAndVisible(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEIMMessageBaseViewController$didSendContent$mentionUsers$textView$userInfo$)(_LOGOS_SELF_TYPE_NORMAL AWEIMMessageBaseViewController* _LOGOS_SELF_CONST, SEL, NSString *, NSArray *, id, id); static void _logos_method$_ungrouped$AWEIMMessageBaseViewController$didSendContent$mentionUsers$textView$userInfo$(_LOGOS_SELF_TYPE_NORMAL AWEIMMessageBaseViewController* _LOGOS_SELF_CONST, SEL, NSString *, NSArray *, id, id); static void (*_logos_orig$_ungrouped$AWEIMMessageListViewController$setConversation$)(_LOGOS_SELF_TYPE_NORMAL AWEIMMessageListViewController* _LOGOS_SELF_CONST, SEL, AWEIMMessageConversation *); static void _logos_method$_ungrouped$AWEIMMessageListViewController$setConversation$(_LOGOS_SELF_TYPE_NORMAL AWEIMMessageListViewController* _LOGOS_SELF_CONST, SEL, AWEIMMessageConversation *); static void (*_logos_orig$_ungrouped$AWEIMLoginManager$sdk_reloginWithToken$userID$)(_LOGOS_SELF_TYPE_NORMAL AWEIMLoginManager* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$AWEIMLoginManager$sdk_reloginWithToken$userID$(_LOGOS_SELF_TYPE_NORMAL AWEIMLoginManager* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$_ungrouped$AWEIMLoginManager$sdk_loginWithToken$userID$secUserID$)(_LOGOS_SELF_TYPE_NORMAL AWEIMLoginManager* _LOGOS_SELF_CONST, SEL, id, id, id); static void _logos_method$_ungrouped$AWEIMLoginManager$sdk_loginWithToken$userID$secUserID$(_LOGOS_SELF_TYPE_NORMAL AWEIMLoginManager* _LOGOS_SELF_CONST, SEL, id, id, id); static void (*_logos_orig$_ungrouped$AWEIMLoginManager$sdk_logout)(_LOGOS_SELF_TYPE_NORMAL AWEIMLoginManager* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEIMLoginManager$sdk_logout(_LOGOS_SELF_TYPE_NORMAL AWEIMLoginManager* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEIMLoginManager$sdk_config)(_LOGOS_SELF_TYPE_NORMAL AWEIMLoginManager* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEIMLoginManager$sdk_config(_LOGOS_SELF_TYPE_NORMAL AWEIMLoginManager* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEIMLoginManager$manuallyKickOffPuller)(_LOGOS_SELF_TYPE_NORMAL AWEIMLoginManager* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEIMLoginManager$manuallyKickOffPuller(_LOGOS_SELF_TYPE_NORMAL AWEIMLoginManager* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEIMLoginManager$sendIMGetTokenMonitorDataSuccess$error$)(_LOGOS_SELF_TYPE_NORMAL AWEIMLoginManager* _LOGOS_SELF_CONST, SEL, _Bool, id); static void _logos_method$_ungrouped$AWEIMLoginManager$sendIMGetTokenMonitorDataSuccess$error$(_LOGOS_SELF_TYPE_NORMAL AWEIMLoginManager* _LOGOS_SELF_CONST, SEL, _Bool, id); static void (*_logos_orig$_ungrouped$AWEIMLoginManager$p_fetchLocalToken)(_LOGOS_SELF_TYPE_NORMAL AWEIMLoginManager* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEIMLoginManager$p_fetchLocalToken(_LOGOS_SELF_TYPE_NORMAL AWEIMLoginManager* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEIMLoginManager$p_saveToken)(_LOGOS_SELF_TYPE_NORMAL AWEIMLoginManager* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEIMLoginManager$p_saveToken(_LOGOS_SELF_TYPE_NORMAL AWEIMLoginManager* _LOGOS_SELF_CONST, SEL); static long long (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$timeStamp)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static long long _logos_meta_method$_ungrouped$TTInstallDeviceHelper$timeStamp(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$saveOpenUDIDToKeychain$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static void _logos_meta_method$_ungrouped$TTInstallDeviceHelper$saveOpenUDIDToKeychain$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static id (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$fetchOpenUDIDFromKeychain)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$fetchOpenUDIDFromKeychain(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$resolutionString)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$resolutionString(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static struct CGSize (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$resolution)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static struct CGSize _logos_meta_method$_ungrouped$TTInstallDeviceHelper$resolution(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$screenScale)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double _logos_meta_method$_ungrouped$TTInstallDeviceHelper$screenScale(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$ssOnePixel)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double _logos_meta_method$_ungrouped$TTInstallDeviceHelper$ssOnePixel(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$openUDID)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$openUDID(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$currentLanguage)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$currentLanguage(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$MACAddress)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$MACAddress(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static float (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$OSVersionNumber)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static float _logos_meta_method$_ungrouped$TTInstallDeviceHelper$OSVersionNumber(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$idfvString)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$idfvString(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$idfaString)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$idfaString(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static unsigned long long (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$getDeviceType)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static unsigned long long _logos_meta_method$_ungrouped$TTInstallDeviceHelper$getDeviceType(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$isJailBroken)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$TTInstallDeviceHelper$isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$platformName)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$platformName(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$ANSMetadata$computeIsJailbroken)(_LOGOS_SELF_TYPE_NORMAL ANSMetadata* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$ANSMetadata$computeIsJailbroken(_LOGOS_SELF_TYPE_NORMAL ANSMetadata* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$HMDInfo$isJailBroken)(_LOGOS_SELF_TYPE_NORMAL HMDInfo* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$HMDInfo$isJailBroken(_LOGOS_SELF_TYPE_NORMAL HMDInfo* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$UIDevice$btd_isJailBroken)(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$UIDevice$btd_isJailBroken(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$NSFileManager$fileExistsAtPath$)(_LOGOS_SELF_TYPE_NORMAL NSFileManager* _LOGOS_SELF_CONST, SEL, NSString *); static BOOL _logos_method$_ungrouped$NSFileManager$fileExistsAtPath$(_LOGOS_SELF_TYPE_NORMAL NSFileManager* _LOGOS_SELF_CONST, SEL, NSString *); static BOOL (*_logos_orig$_ungrouped$NSString$containsString$)(_LOGOS_SELF_TYPE_NORMAL NSString* _LOGOS_SELF_CONST, SEL, NSString *); static BOOL _logos_method$_ungrouped$NSString$containsString$(_LOGOS_SELF_TYPE_NORMAL NSString* _LOGOS_SELF_CONST, SEL, NSString *); static AWEAwemeModel * (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$currentDisplayingAweme)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static AWEAwemeModel * _logos_method$_ungrouped$AWEAwemeDetailTableViewController$currentDisplayingAweme(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$viewDidDisappear$)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$viewDidDisappear$(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$viewWillAppear$)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$xy_savePhoto$(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL, NSNotification *); static id (*_logos_meta_orig$_ungrouped$AWEUIResponder$topViewControllerForController$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static id _logos_meta_method$_ungrouped$AWEUIResponder$topViewControllerForController$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static id (*_logos_meta_orig$_ungrouped$AWEUIResponder$topViewController)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$AWEUIResponder$topViewController(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); 

#line 45 "/Users/xiaoyuan/Desktop/work/tweaks/TikTok/TikTokDylib/Logos/TikTokDylib.xm"

__attribute__((used)) static XYVideoDownloader * _logos_method$_ungrouped$AWEFeedTableViewController$xy_downloader(AWEFeedTableViewController * __unused self, SEL __unused _cmd) { return (XYVideoDownloader *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$AWEFeedTableViewController$xy_downloader); }; __attribute__((used)) static void _logos_method$_ungrouped$AWEFeedTableViewController$setXy_downloader(AWEFeedTableViewController * __unused self, SEL __unused _cmd, XYVideoDownloader * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$AWEFeedTableViewController$xy_downloader, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }







static void _logos_method$_ungrouped$AWEFeedTableViewController$viewDidDisappear$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL animated) {
    _logos_orig$_ungrouped$AWEFeedTableViewController$viewDidDisappear$(self, _cmd, animated);
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"CustomSavePhoto" object:nil];

}

static void _logos_method$_ungrouped$AWEFeedTableViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL animated) {
    _logos_orig$_ungrouped$AWEFeedTableViewController$viewWillAppear$(self, _cmd, animated);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(xy_savePhoto:) name:@"CustomSavePhoto" object:nil];
}


static void _logos_method$_ungrouped$AWEFeedTableViewController$xy_savePhoto$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSNotification * notify) {
    




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






static void _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$performLikeAction(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$performLikeAction(self, _cmd);
}


static void _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$onVideoPlayerViewDoubleClicked$(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITapGestureRecognizer * tapGes) {
    _logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$onVideoPlayerViewDoubleClicked$(self, _cmd, tapGes);
}





static void _logos_method$_ungrouped$AWEFeedCellViewController$_onVideoPlayerViewClicked$(_LOGOS_SELF_TYPE_NORMAL AWEFeedCellViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITapGestureRecognizer * tapGes) {
    _logos_orig$_ungrouped$AWEFeedCellViewController$_onVideoPlayerViewClicked$(self, _cmd, tapGes);
}





static void _logos_method$_ungrouped$AWEAwemePlayInteractionPresenter$enterMusicDetail$(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionPresenter* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITapGestureRecognizer * tapGesture) {
    _logos_orig$_ungrouped$AWEAwemePlayInteractionPresenter$enterMusicDetail$(self, _cmd, tapGesture);
}

static void _logos_method$_ungrouped$AWEAwemePlayInteractionPresenter$p_goToPersonalPage$gestureRecognizer$(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionPresenter* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    _logos_orig$_ungrouped$AWEAwemePlayInteractionPresenter$p_goToPersonalPage$gestureRecognizer$(self, _cmd, arg1, arg2);
}

static void _logos_method$_ungrouped$AWEAwemePlayInteractionPresenter$onUnFollowViewClicked$(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionPresenter* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITapGestureRecognizer * arg1) {
    _logos_orig$_ungrouped$AWEAwemePlayInteractionPresenter$onUnFollowViewClicked$(self, _cmd, arg1);
}

static void _logos_method$_ungrouped$AWEAwemePlayInteractionPresenter$onFollowViewClicked$(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionPresenter* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITapGestureRecognizer * arg1) {
    _logos_orig$_ungrouped$AWEAwemePlayInteractionPresenter$onFollowViewClicked$(self, _cmd, arg1);
}
    


 
static void _logos_method$_ungrouped$AWEShareCollectionView$sendEvents$toItemAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL AWEShareCollectionView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, unsigned long long arg1, NSIndexPath * indexPath) {
    _logos_orig$_ungrouped$AWEShareCollectionView$sendEvents$toItemAtIndexPath$(self, _cmd, arg1, indexPath); 
}
static void _logos_method$_ungrouped$AWEShareCollectionView$collectionView$didSelectItemAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL AWEShareCollectionView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, NSIndexPath * indexPath) {
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
        _logos_orig$_ungrouped$AWEShareCollectionView$collectionView$didSelectItemAtIndexPath$(self, _cmd, arg1, indexPath);
    }
}

static AWEShareCollectionView* _logos_method$_ungrouped$AWEShareCollectionView$initWithItems$hostView$(_LOGOS_SELF_TYPE_INIT AWEShareCollectionView* __unused self, SEL __unused _cmd, NSArray<AWEShareItem *> * items, id hostView) _LOGOS_RETURN_RETAINED {
    
    NSMutableArray<AWEShareItem *> *itemsM = [items mutableCopy];
    Class AWEShareItem = NSClassFromString(@"AWEShareItem");
    id downloadItem = [[AWEShareItem alloc] initWithType:@"custom_download"];
    [downloadItem setValue:@YES forKey:@"enabled"];
    [downloadItem setValue:@"下载" forKey:@"title"];
    [downloadItem setValue:items.lastObject.image forKey:@"image"];
    [itemsM addObject:downloadItem];
    
    id obj = _logos_orig$_ungrouped$AWEShareCollectionView$initWithItems$hostView$(self, _cmd, itemsM, hostView);
    return obj;
}








static void _logos_method$_ungrouped$AWEFeedContainerViewController$onDiscoverButtonClicked$(_LOGOS_SELF_TYPE_NORMAL AWEFeedContainerViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    _logos_orig$_ungrouped$AWEFeedContainerViewController$onDiscoverButtonClicked$(self, _cmd, arg1);
}






static void _logos_method$_ungrouped$AWEDiscoverFeedEntranceView$awe_UITracker_gestureRecognizer$(_LOGOS_SELF_TYPE_NORMAL AWEDiscoverFeedEntranceView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    
    
}

    

static _Bool _logos_method$_ungrouped$AVMDLDataLoader$_supportPoxy$(_LOGOS_SELF_TYPE_NORMAL AVMDLDataLoader* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSString * url) {
    
    NSLog(@"AVMDLDataLoader, url: %@", url);
    if (![url hasPrefix: @"https://api-"]) { 
        [UIPasteboard generalPasteboard].string = url;
    }
    bool ret = _logos_orig$_ungrouped$AVMDLDataLoader$_supportPoxy$(self, _cmd, url);
    return ret;
}
static id _logos_method$_ungrouped$AVMDLDataLoader$getCacheFileInfo$filePath$(_LOGOS_SELF_TYPE_NORMAL AVMDLDataLoader* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    id ret = _logos_orig$_ungrouped$AVMDLDataLoader$getCacheFileInfo$filePath$(self, _cmd, arg1, arg2);
    return ret;
}
static id _logos_method$_ungrouped$AVMDLDataLoader$getCacheFileInfo$(_LOGOS_SELF_TYPE_NORMAL AVMDLDataLoader* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    id ret = _logos_orig$_ungrouped$AVMDLDataLoader$getCacheFileInfo$(self, _cmd, arg1);
    return ret;
}
static void _logos_method$_ungrouped$AVMDLDataLoader$stop(_LOGOS_SELF_TYPE_NORMAL AVMDLDataLoader* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AVMDLDataLoader$stop(self, _cmd);
}
static void _logos_method$_ungrouped$AVMDLDataLoader$start$(_LOGOS_SELF_TYPE_NORMAL AVMDLDataLoader* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id * arg1) {
    _logos_orig$_ungrouped$AVMDLDataLoader$start$(self, _cmd, arg1);
}



static _Bool _logos_meta_method$_ungrouped$AWEENV$isDebugEnv(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool isDebugEnv = _logos_meta_orig$_ungrouped$AWEENV$isDebugEnv(self, _cmd);
    XYLog(@"isDebugEnv:%ld", isDebugEnv);
    return NO;
}
static _Bool _logos_meta_method$_ungrouped$AWEENV$isBetaEnv(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool isBetaEnv = _logos_meta_orig$_ungrouped$AWEENV$isBetaEnv(self, _cmd);
    XYLog(@"isBetaEnv:%ld", isBetaEnv);
    return NO;
}
static _Bool _logos_meta_method$_ungrouped$AWEENV$isTestEnv(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool isTestEnv = _logos_meta_orig$_ungrouped$AWEENV$isTestEnv(self, _cmd);
    XYLog(@"isTestEnv:%ld", isTestEnv);
    return NO;
}
static _Bool _logos_meta_method$_ungrouped$AWEENV$isI18N(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool isI18N = _logos_meta_orig$_ungrouped$AWEENV$isI18N(self, _cmd);
    XYLog(@"isI18N:%ld", isI18N);
    return isI18N;
}
static _Bool _logos_meta_method$_ungrouped$AWEENV$isTiktok(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool isTiktok = _logos_meta_orig$_ungrouped$AWEENV$isTiktok(self, _cmd);
    XYLog(@"isTiktok:%ld", isTiktok);
    return isTiktok;
}
static _Bool _logos_meta_method$_ungrouped$AWEENV$isMusically(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool isMusically = _logos_meta_orig$_ungrouped$AWEENV$isMusically(self, _cmd);
    XYLog(@"isMusically:%ld", isMusically);
    return isMusically;
}
static _Bool _logos_meta_method$_ungrouped$AWEENV$isDouyin(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool isDouyin = _logos_meta_orig$_ungrouped$AWEENV$isDouyin(self, _cmd);
    XYLog(@"isDouyin:%ld", isDouyin);
    return isDouyin;
}
static id _logos_meta_method$_ungrouped$AWEENV$plistChannel(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    id plistChannel = _logos_meta_orig$_ungrouped$AWEENV$plistChannel(self, _cmd);
    XYLog(@"plistChannel:%@", plistChannel);
    return plistChannel;
}
static _Bool _logos_meta_method$_ungrouped$AWEENV$isTestFlight(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool isTestFlight = _logos_meta_orig$_ungrouped$AWEENV$isTestFlight(self, _cmd);
    XYLog(@"isTestFlight:%ld", isTestFlight);
    return isTestFlight;
}
static _Bool _logos_meta_method$_ungrouped$AWEENV$isStaff(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool isStaff = _logos_meta_orig$_ungrouped$AWEENV$isStaff(self, _cmd);
    XYLog(@"isStaff:%ld", isStaff);
    return isStaff;
}
static long long _logos_meta_method$_ungrouped$AWEENV$channel(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool channel = _logos_meta_orig$_ungrouped$AWEENV$channel(self, _cmd);
    XYLog(@"channel:%ld", channel);
    return channel;
}
static long long _logos_meta_method$_ungrouped$AWEENV$product(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool product = _logos_meta_orig$_ungrouped$AWEENV$product(self, _cmd);
    XYLog(@"product:%ld", product);
    return product;
}
static _Bool _logos_meta_method$_ungrouped$AWEENV$isDebugEvn(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool isDebugEvn = _logos_meta_orig$_ungrouped$AWEENV$isDebugEvn(self, _cmd);
    XYLog(@"isDebugEvn:%ld", isDebugEvn);
    return NO;
}
static _Bool _logos_meta_method$_ungrouped$AWEENV$isBetaEvn(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool isBetaEvn = _logos_meta_orig$_ungrouped$AWEENV$isBetaEvn(self, _cmd);
    XYLog(@"isBetaEvn:%ld", isBetaEvn);
    return NO;
}
static _Bool _logos_meta_method$_ungrouped$AWEENV$isTestEvn(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool isTestEvn = _logos_meta_orig$_ungrouped$AWEENV$isTestEvn(self, _cmd);
    XYLog(@"isTestEvn:%ld", isTestEvn);
    return NO;
}



static _Bool _logos_method$_ungrouped$AWEAwemeModel$disableDownload(_LOGOS_SELF_TYPE_NORMAL AWEAwemeModel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    BOOL ret =  _logos_orig$_ungrouped$AWEAwemeModel$disableDownload(self, _cmd);
    return ret;
}




static void _logos_method$_ungrouped$AWESlidingTabbarView$tabButtonClicked$(_LOGOS_SELF_TYPE_NORMAL AWESlidingTabbarView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    _logos_orig$_ungrouped$AWESlidingTabbarView$tabButtonClicked$(self, _cmd, arg1);
}




static BDDiamondAfterHeatManager * _logos_meta_method$_ungrouped$BDDiamondAfterHeatManager$sharedInstance(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return _logos_meta_orig$_ungrouped$BDDiamondAfterHeatManager$sharedInstance(self, _cmd);
}


static void _logos_method$_ungrouped$BDDiamondAfterHeatManager$userLoginAction(_LOGOS_SELF_TYPE_NORMAL BDDiamondAfterHeatManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$BDDiamondAfterHeatManager$userLoginAction(self, _cmd);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if ([[UIApplication sharedApplication].keyWindow isKindOfClass: NSClassFromString(@"AWELoginWindow")]) {
            [UIApplication sharedApplication].keyWindow.hidden = YES;
            [[UIApplication sharedApplication].delegate.window makeKeyAndVisible];
        }
    });
    
}


static void _logos_method$_ungrouped$BDDiamondAfterHeatManager$userLogoutAction(_LOGOS_SELF_TYPE_NORMAL BDDiamondAfterHeatManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$BDDiamondAfterHeatManager$userLogoutAction(self, _cmd);
}


static void _logos_method$_ungrouped$BDDiamondAfterHeatManager$clearHeatCacheData(_LOGOS_SELF_TYPE_NORMAL BDDiamondAfterHeatManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$BDDiamondAfterHeatManager$clearHeatCacheData(self, _cmd);
}
 
static NSString * _logos_method$_ungrouped$BDDiamondAfterHeatManager$currentLoginUID(_LOGOS_SELF_TYPE_NORMAL BDDiamondAfterHeatManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
   id uid =  _logos_orig$_ungrouped$BDDiamondAfterHeatManager$currentLoginUID(self, _cmd); 
    return uid;
}





static AWELoginWindowManager * _logos_meta_method$_ungrouped$AWELoginWindowManager$sharedManager(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    id manager = _logos_meta_orig$_ungrouped$AWELoginWindowManager$sharedManager(self, _cmd);
    return manager;
}

static void _logos_method$_ungrouped$AWELoginWindowManager$requestSettings(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWELoginWindowManager$requestSettings(self, _cmd);
}
static id _logos_method$_ungrouped$AWELoginWindowManager$loginSettingsModelArray(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    id settingsModel = _logos_orig$_ungrouped$AWELoginWindowManager$loginSettingsModelArray(self, _cmd);
    return settingsModel;
}
static void _logos_method$_ungrouped$AWELoginWindowManager$dismiss(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWELoginWindowManager$dismiss(self, _cmd);
}
static void _logos_method$_ungrouped$AWELoginWindowManager$didFinishLogin(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWELoginWindowManager$didFinishLogin(self, _cmd);
}
static void _logos_method$_ungrouped$AWELoginWindowManager$showLoginViewControllerWithParamsDict$(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    _logos_orig$_ungrouped$AWELoginWindowManager$showLoginViewControllerWithParamsDict$(self, _cmd, arg1);
}
static void _logos_method$_ungrouped$AWELoginWindowManager$makeKeyAndVisible(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWELoginWindowManager$makeKeyAndVisible(self, _cmd);
}












static void _logos_method$_ungrouped$AWEIMMessageBaseViewController$didSendContent$mentionUsers$textView$userInfo$(_LOGOS_SELF_TYPE_NORMAL AWEIMMessageBaseViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSString * content, NSArray * users, id textView, id userInfo) {
    _logos_orig$_ungrouped$AWEIMMessageBaseViewController$didSendContent$mentionUsers$textView$userInfo$(self, _cmd, content, users, textView, userInfo);
}




static void _logos_method$_ungrouped$AWEIMMessageListViewController$setConversation$(_LOGOS_SELF_TYPE_NORMAL AWEIMMessageListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, AWEIMMessageConversation * conversation) {
    _logos_orig$_ungrouped$AWEIMMessageListViewController$setConversation$(self, _cmd, conversation);
}





static void _logos_method$_ungrouped$AWEIMLoginManager$sdk_reloginWithToken$userID$(_LOGOS_SELF_TYPE_NORMAL AWEIMLoginManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    _logos_orig$_ungrouped$AWEIMLoginManager$sdk_reloginWithToken$userID$(self, _cmd, arg1, arg2);
}
static void _logos_method$_ungrouped$AWEIMLoginManager$sdk_loginWithToken$userID$secUserID$(_LOGOS_SELF_TYPE_NORMAL AWEIMLoginManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2, id arg3) {
    _logos_orig$_ungrouped$AWEIMLoginManager$sdk_loginWithToken$userID$secUserID$(self, _cmd, arg1, arg2, arg3);
}
static void _logos_method$_ungrouped$AWEIMLoginManager$sdk_logout(_LOGOS_SELF_TYPE_NORMAL AWEIMLoginManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWEIMLoginManager$sdk_logout(self, _cmd);
}
static void _logos_method$_ungrouped$AWEIMLoginManager$sdk_config(_LOGOS_SELF_TYPE_NORMAL AWEIMLoginManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWEIMLoginManager$sdk_config(self, _cmd);
}
static void _logos_method$_ungrouped$AWEIMLoginManager$manuallyKickOffPuller(_LOGOS_SELF_TYPE_NORMAL AWEIMLoginManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWEIMLoginManager$manuallyKickOffPuller(self, _cmd);
}
static void _logos_method$_ungrouped$AWEIMLoginManager$sendIMGetTokenMonitorDataSuccess$error$(_LOGOS_SELF_TYPE_NORMAL AWEIMLoginManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _Bool arg1, id arg2) {
    _logos_orig$_ungrouped$AWEIMLoginManager$sendIMGetTokenMonitorDataSuccess$error$(self, _cmd, arg1, arg2);
}
static void _logos_method$_ungrouped$AWEIMLoginManager$p_fetchLocalToken(_LOGOS_SELF_TYPE_NORMAL AWEIMLoginManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWEIMLoginManager$p_fetchLocalToken(self, _cmd);
}
static void _logos_method$_ungrouped$AWEIMLoginManager$p_saveToken(_LOGOS_SELF_TYPE_NORMAL AWEIMLoginManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWEIMLoginManager$p_saveToken(self, _cmd);
}







static long long _logos_meta_method$_ungrouped$TTInstallDeviceHelper$timeStamp(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return _logos_meta_orig$_ungrouped$TTInstallDeviceHelper$timeStamp(self, _cmd);
}
static void _logos_meta_method$_ungrouped$TTInstallDeviceHelper$saveOpenUDIDToKeychain$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
     _logos_meta_orig$_ungrouped$TTInstallDeviceHelper$saveOpenUDIDToKeychain$(self, _cmd, arg1);
}
static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$fetchOpenUDIDFromKeychain(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return _logos_meta_orig$_ungrouped$TTInstallDeviceHelper$fetchOpenUDIDFromKeychain(self, _cmd); 
}
static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$resolutionString(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return _logos_meta_orig$_ungrouped$TTInstallDeviceHelper$resolutionString(self, _cmd); 
}
static struct CGSize _logos_meta_method$_ungrouped$TTInstallDeviceHelper$resolution(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return _logos_meta_orig$_ungrouped$TTInstallDeviceHelper$resolution(self, _cmd);
}
static double _logos_meta_method$_ungrouped$TTInstallDeviceHelper$screenScale(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return _logos_meta_orig$_ungrouped$TTInstallDeviceHelper$screenScale(self, _cmd);
}
static double _logos_meta_method$_ungrouped$TTInstallDeviceHelper$ssOnePixel(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return _logos_meta_orig$_ungrouped$TTInstallDeviceHelper$ssOnePixel(self, _cmd);
}
static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$openUDID(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return _logos_meta_orig$_ungrouped$TTInstallDeviceHelper$openUDID(self, _cmd); 
}

static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$currentLanguage(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return _logos_meta_orig$_ungrouped$TTInstallDeviceHelper$currentLanguage(self, _cmd); 
}
static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$MACAddress(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return _logos_meta_orig$_ungrouped$TTInstallDeviceHelper$MACAddress(self, _cmd); 
}
static float _logos_meta_method$_ungrouped$TTInstallDeviceHelper$OSVersionNumber(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return _logos_meta_orig$_ungrouped$TTInstallDeviceHelper$OSVersionNumber(self, _cmd);
}
static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$idfvString(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return _logos_meta_orig$_ungrouped$TTInstallDeviceHelper$idfvString(self, _cmd); 
}
static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$idfaString(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return _logos_meta_orig$_ungrouped$TTInstallDeviceHelper$idfaString(self, _cmd); 
}
static unsigned long long _logos_meta_method$_ungrouped$TTInstallDeviceHelper$getDeviceType(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return _logos_meta_orig$_ungrouped$TTInstallDeviceHelper$getDeviceType(self, _cmd); 
}
static _Bool _logos_meta_method$_ungrouped$TTInstallDeviceHelper$isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    BOOL isJailBroken = _logos_meta_orig$_ungrouped$TTInstallDeviceHelper$isJailBroken(self, _cmd); 
    return NO;
}
static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$platformName(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return _logos_meta_orig$_ungrouped$TTInstallDeviceHelper$platformName(self, _cmd); 
}




static BOOL _logos_method$_ungrouped$ANSMetadata$computeIsJailbroken(_LOGOS_SELF_TYPE_NORMAL ANSMetadata* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    BOOL ret = _logos_orig$_ungrouped$ANSMetadata$computeIsJailbroken(self, _cmd); 
    return NO;
}


static BOOL _logos_method$_ungrouped$HMDInfo$isJailBroken(_LOGOS_SELF_TYPE_NORMAL HMDInfo* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    BOOL ret = _logos_orig$_ungrouped$HMDInfo$isJailBroken(self, _cmd); 
    return NO;
}


 
static BOOL _logos_method$_ungrouped$UIDevice$btd_isJailBroken(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    BOOL ret = _logos_orig$_ungrouped$UIDevice$btd_isJailBroken(self, _cmd);
    return NO;
}




static BOOL _logos_method$_ungrouped$NSFileManager$fileExistsAtPath$(_LOGOS_SELF_TYPE_NORMAL NSFileManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSString * event) {
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
    return  _logos_orig$_ungrouped$NSFileManager$fileExistsAtPath$(self, _cmd, event);
}





static BOOL _logos_method$_ungrouped$NSString$containsString$(_LOGOS_SELF_TYPE_NORMAL NSString* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSString * str) {
    static NSString *mobile = @"/Library/MobileSubstrate/MobileSubstrate.dylib";
    static NSString *mobile1 = @"/Library/MobileSubstrate";
    if ([str hasPrefix:mobile] || [str hasPrefix:mobile1]) {
        return NO;
    }
    return _logos_orig$_ungrouped$NSString$containsString$(self, _cmd, str);
}
















__attribute__((used)) static NSIndexPath * _logos_method$_ungrouped$AWEAwemeDetailTableViewController$xy_lastAutoScrollIndexPath(AWEAwemeDetailTableViewController * __unused self, SEL __unused _cmd) { NSValue * value = objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$AWEAwemeDetailTableViewController$xy_lastAutoScrollIndexPath); NSIndexPath * rawValue; [value getValue:&rawValue]; return rawValue; }; __attribute__((used)) static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$setXy_lastAutoScrollIndexPath(AWEAwemeDetailTableViewController * __unused self, SEL __unused _cmd, NSIndexPath * rawValue) { NSValue * value = [NSValue valueWithBytes:&rawValue objCType:@encode(NSIndexPath *)]; objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$AWEAwemeDetailTableViewController$xy_lastAutoScrollIndexPath, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static XYVideoDownloader * _logos_method$_ungrouped$AWEAwemeDetailTableViewController$xy_downloader(AWEAwemeDetailTableViewController * __unused self, SEL __unused _cmd) { return (XYVideoDownloader *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$AWEAwemeDetailTableViewController$xy_downloader); }; __attribute__((used)) static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$setXy_downloader(AWEAwemeDetailTableViewController * __unused self, SEL __unused _cmd, XYVideoDownloader * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$AWEAwemeDetailTableViewController$xy_downloader, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }

static AWEAwemeModel * _logos_method$_ungrouped$AWEAwemeDetailTableViewController$currentDisplayingAweme(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    id model = _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$currentDisplayingAweme(self, _cmd);
    return model;
}







static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$viewDidDisappear$(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL animated) {
    _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$viewDidDisappear$(self, _cmd, animated);
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"CustomSavePhoto" object:nil];

}

static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL animated) {
    _logos_orig$_ungrouped$AWEAwemeDetailTableViewController$viewWillAppear$(self, _cmd, animated);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(xy_savePhoto:) name:@"CustomSavePhoto" object:nil];
}


static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$xy_savePhoto$(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSNotification * notify) {




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








static id _logos_meta_method$_ungrouped$AWEUIResponder$topViewControllerForController$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    id vc = _logos_meta_orig$_ungrouped$AWEUIResponder$topViewControllerForController$(self, _cmd, arg1);
    return vc;
}
static id _logos_meta_method$_ungrouped$AWEUIResponder$topViewController(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    id vc = _logos_meta_orig$_ungrouped$AWEUIResponder$topViewController(self, _cmd);
    return vc;
}




static __attribute__((constructor)) void _logosLocalCtor_b7bb35b9(int __unused argc, char __unused **argv, char __unused **envp)
{
    notificationCallback(NULL, NULL, NULL, NULL, NULL);
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                    NULL,
                                    notificationCallback,
                                    CFSTR(kAwemeDylibNotificationName),
                                    NULL,
                                    CFNotificationSuspensionBehaviorCoalesce);
    {Class _logos_class$_ungrouped$AWEFeedTableViewController = objc_getClass("AWEFeedTableViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(viewDidDisappear:), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$viewDidDisappear$, (IMP*)&_logos_orig$_ungrouped$AWEFeedTableViewController$viewDidDisappear$);MSHookMessageEx(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(viewWillAppear:), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$viewWillAppear$, (IMP*)&_logos_orig$_ungrouped$AWEFeedTableViewController$viewWillAppear$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(NSNotification *), strlen(@encode(NSNotification *))); i += strlen(@encode(NSNotification *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(xy_savePhoto:), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$xy_savePhoto$, _typeEncoding); }{ char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(XYVideoDownloader *)); class_addMethod(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(xy_downloader), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$xy_downloader, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(XYVideoDownloader *)); class_addMethod(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(setXy_downloader:), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$setXy_downloader, _typeEncoding); } Class _logos_class$_ungrouped$AWEAwemePlayInteractionViewController = objc_getClass("AWEAwemePlayInteractionViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(performLikeAction), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$performLikeAction, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$performLikeAction);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(onVideoPlayerViewDoubleClicked:), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$onVideoPlayerViewDoubleClicked$, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$onVideoPlayerViewDoubleClicked$);Class _logos_class$_ungrouped$AWEFeedCellViewController = objc_getClass("AWEFeedCellViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEFeedCellViewController, @selector(_onVideoPlayerViewClicked:), (IMP)&_logos_method$_ungrouped$AWEFeedCellViewController$_onVideoPlayerViewClicked$, (IMP*)&_logos_orig$_ungrouped$AWEFeedCellViewController$_onVideoPlayerViewClicked$);Class _logos_class$_ungrouped$AWEAwemePlayInteractionPresenter = objc_getClass("AWEAwemePlayInteractionPresenter"); MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayInteractionPresenter, @selector(enterMusicDetail:), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionPresenter$enterMusicDetail$, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayInteractionPresenter$enterMusicDetail$);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayInteractionPresenter, @selector(p_goToPersonalPage:gestureRecognizer:), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionPresenter$p_goToPersonalPage$gestureRecognizer$, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayInteractionPresenter$p_goToPersonalPage$gestureRecognizer$);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayInteractionPresenter, @selector(onUnFollowViewClicked:), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionPresenter$onUnFollowViewClicked$, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayInteractionPresenter$onUnFollowViewClicked$);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayInteractionPresenter, @selector(onFollowViewClicked:), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionPresenter$onFollowViewClicked$, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayInteractionPresenter$onFollowViewClicked$);Class _logos_class$_ungrouped$AWEShareCollectionView = objc_getClass("AWEShareCollectionView"); MSHookMessageEx(_logos_class$_ungrouped$AWEShareCollectionView, @selector(sendEvents:toItemAtIndexPath:), (IMP)&_logos_method$_ungrouped$AWEShareCollectionView$sendEvents$toItemAtIndexPath$, (IMP*)&_logos_orig$_ungrouped$AWEShareCollectionView$sendEvents$toItemAtIndexPath$);MSHookMessageEx(_logos_class$_ungrouped$AWEShareCollectionView, @selector(collectionView:didSelectItemAtIndexPath:), (IMP)&_logos_method$_ungrouped$AWEShareCollectionView$collectionView$didSelectItemAtIndexPath$, (IMP*)&_logos_orig$_ungrouped$AWEShareCollectionView$collectionView$didSelectItemAtIndexPath$);MSHookMessageEx(_logos_class$_ungrouped$AWEShareCollectionView, @selector(initWithItems:hostView:), (IMP)&_logos_method$_ungrouped$AWEShareCollectionView$initWithItems$hostView$, (IMP*)&_logos_orig$_ungrouped$AWEShareCollectionView$initWithItems$hostView$);Class _logos_class$_ungrouped$AWEFeedContainerViewController = objc_getClass("AWEFeedContainerViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEFeedContainerViewController, @selector(onDiscoverButtonClicked:), (IMP)&_logos_method$_ungrouped$AWEFeedContainerViewController$onDiscoverButtonClicked$, (IMP*)&_logos_orig$_ungrouped$AWEFeedContainerViewController$onDiscoverButtonClicked$);Class _logos_class$_ungrouped$AWEDiscoverFeedEntranceView = objc_getClass("AWEDiscoverFeedEntranceView"); MSHookMessageEx(_logos_class$_ungrouped$AWEDiscoverFeedEntranceView, @selector(awe_UITracker_gestureRecognizer:), (IMP)&_logos_method$_ungrouped$AWEDiscoverFeedEntranceView$awe_UITracker_gestureRecognizer$, (IMP*)&_logos_orig$_ungrouped$AWEDiscoverFeedEntranceView$awe_UITracker_gestureRecognizer$);Class _logos_class$_ungrouped$AVMDLDataLoader = objc_getClass("AVMDLDataLoader"); MSHookMessageEx(_logos_class$_ungrouped$AVMDLDataLoader, @selector(_supportPoxy:), (IMP)&_logos_method$_ungrouped$AVMDLDataLoader$_supportPoxy$, (IMP*)&_logos_orig$_ungrouped$AVMDLDataLoader$_supportPoxy$);MSHookMessageEx(_logos_class$_ungrouped$AVMDLDataLoader, @selector(getCacheFileInfo:filePath:), (IMP)&_logos_method$_ungrouped$AVMDLDataLoader$getCacheFileInfo$filePath$, (IMP*)&_logos_orig$_ungrouped$AVMDLDataLoader$getCacheFileInfo$filePath$);MSHookMessageEx(_logos_class$_ungrouped$AVMDLDataLoader, @selector(getCacheFileInfo:), (IMP)&_logos_method$_ungrouped$AVMDLDataLoader$getCacheFileInfo$, (IMP*)&_logos_orig$_ungrouped$AVMDLDataLoader$getCacheFileInfo$);MSHookMessageEx(_logos_class$_ungrouped$AVMDLDataLoader, @selector(stop), (IMP)&_logos_method$_ungrouped$AVMDLDataLoader$stop, (IMP*)&_logos_orig$_ungrouped$AVMDLDataLoader$stop);MSHookMessageEx(_logos_class$_ungrouped$AVMDLDataLoader, @selector(start:), (IMP)&_logos_method$_ungrouped$AVMDLDataLoader$start$, (IMP*)&_logos_orig$_ungrouped$AVMDLDataLoader$start$);Class _logos_class$_ungrouped$AWEENV = objc_getClass("AWEENV"); Class _logos_metaclass$_ungrouped$AWEENV = object_getClass(_logos_class$_ungrouped$AWEENV); MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(isDebugEnv), (IMP)&_logos_meta_method$_ungrouped$AWEENV$isDebugEnv, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$isDebugEnv);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(isBetaEnv), (IMP)&_logos_meta_method$_ungrouped$AWEENV$isBetaEnv, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$isBetaEnv);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(isTestEnv), (IMP)&_logos_meta_method$_ungrouped$AWEENV$isTestEnv, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$isTestEnv);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(isI18N), (IMP)&_logos_meta_method$_ungrouped$AWEENV$isI18N, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$isI18N);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(isTiktok), (IMP)&_logos_meta_method$_ungrouped$AWEENV$isTiktok, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$isTiktok);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(isMusically), (IMP)&_logos_meta_method$_ungrouped$AWEENV$isMusically, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$isMusically);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(isDouyin), (IMP)&_logos_meta_method$_ungrouped$AWEENV$isDouyin, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$isDouyin);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(plistChannel), (IMP)&_logos_meta_method$_ungrouped$AWEENV$plistChannel, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$plistChannel);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(isTestFlight), (IMP)&_logos_meta_method$_ungrouped$AWEENV$isTestFlight, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$isTestFlight);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(isStaff), (IMP)&_logos_meta_method$_ungrouped$AWEENV$isStaff, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$isStaff);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(channel), (IMP)&_logos_meta_method$_ungrouped$AWEENV$channel, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$channel);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(product), (IMP)&_logos_meta_method$_ungrouped$AWEENV$product, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$product);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(isDebugEvn), (IMP)&_logos_meta_method$_ungrouped$AWEENV$isDebugEvn, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$isDebugEvn);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(isBetaEvn), (IMP)&_logos_meta_method$_ungrouped$AWEENV$isBetaEvn, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$isBetaEvn);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(isTestEvn), (IMP)&_logos_meta_method$_ungrouped$AWEENV$isTestEvn, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$isTestEvn);Class _logos_class$_ungrouped$AWEAwemeModel = objc_getClass("AWEAwemeModel"); MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeModel, @selector(disableDownload), (IMP)&_logos_method$_ungrouped$AWEAwemeModel$disableDownload, (IMP*)&_logos_orig$_ungrouped$AWEAwemeModel$disableDownload);Class _logos_class$_ungrouped$AWESlidingTabbarView = objc_getClass("AWESlidingTabbarView"); MSHookMessageEx(_logos_class$_ungrouped$AWESlidingTabbarView, @selector(tabButtonClicked:), (IMP)&_logos_method$_ungrouped$AWESlidingTabbarView$tabButtonClicked$, (IMP*)&_logos_orig$_ungrouped$AWESlidingTabbarView$tabButtonClicked$);Class _logos_class$_ungrouped$BDDiamondAfterHeatManager = objc_getClass("BDDiamondAfterHeatManager"); Class _logos_metaclass$_ungrouped$BDDiamondAfterHeatManager = object_getClass(_logos_class$_ungrouped$BDDiamondAfterHeatManager); MSHookMessageEx(_logos_metaclass$_ungrouped$BDDiamondAfterHeatManager, @selector(sharedInstance), (IMP)&_logos_meta_method$_ungrouped$BDDiamondAfterHeatManager$sharedInstance, (IMP*)&_logos_meta_orig$_ungrouped$BDDiamondAfterHeatManager$sharedInstance);MSHookMessageEx(_logos_class$_ungrouped$BDDiamondAfterHeatManager, @selector(userLoginAction), (IMP)&_logos_method$_ungrouped$BDDiamondAfterHeatManager$userLoginAction, (IMP*)&_logos_orig$_ungrouped$BDDiamondAfterHeatManager$userLoginAction);MSHookMessageEx(_logos_class$_ungrouped$BDDiamondAfterHeatManager, @selector(userLogoutAction), (IMP)&_logos_method$_ungrouped$BDDiamondAfterHeatManager$userLogoutAction, (IMP*)&_logos_orig$_ungrouped$BDDiamondAfterHeatManager$userLogoutAction);MSHookMessageEx(_logos_class$_ungrouped$BDDiamondAfterHeatManager, @selector(clearHeatCacheData), (IMP)&_logos_method$_ungrouped$BDDiamondAfterHeatManager$clearHeatCacheData, (IMP*)&_logos_orig$_ungrouped$BDDiamondAfterHeatManager$clearHeatCacheData);MSHookMessageEx(_logos_class$_ungrouped$BDDiamondAfterHeatManager, @selector(currentLoginUID), (IMP)&_logos_method$_ungrouped$BDDiamondAfterHeatManager$currentLoginUID, (IMP*)&_logos_orig$_ungrouped$BDDiamondAfterHeatManager$currentLoginUID);Class _logos_class$_ungrouped$AWELoginWindowManager = objc_getClass("AWELoginWindowManager"); Class _logos_metaclass$_ungrouped$AWELoginWindowManager = object_getClass(_logos_class$_ungrouped$AWELoginWindowManager); MSHookMessageEx(_logos_metaclass$_ungrouped$AWELoginWindowManager, @selector(sharedManager), (IMP)&_logos_meta_method$_ungrouped$AWELoginWindowManager$sharedManager, (IMP*)&_logos_meta_orig$_ungrouped$AWELoginWindowManager$sharedManager);MSHookMessageEx(_logos_class$_ungrouped$AWELoginWindowManager, @selector(requestSettings), (IMP)&_logos_method$_ungrouped$AWELoginWindowManager$requestSettings, (IMP*)&_logos_orig$_ungrouped$AWELoginWindowManager$requestSettings);MSHookMessageEx(_logos_class$_ungrouped$AWELoginWindowManager, @selector(loginSettingsModelArray), (IMP)&_logos_method$_ungrouped$AWELoginWindowManager$loginSettingsModelArray, (IMP*)&_logos_orig$_ungrouped$AWELoginWindowManager$loginSettingsModelArray);MSHookMessageEx(_logos_class$_ungrouped$AWELoginWindowManager, @selector(dismiss), (IMP)&_logos_method$_ungrouped$AWELoginWindowManager$dismiss, (IMP*)&_logos_orig$_ungrouped$AWELoginWindowManager$dismiss);MSHookMessageEx(_logos_class$_ungrouped$AWELoginWindowManager, @selector(didFinishLogin), (IMP)&_logos_method$_ungrouped$AWELoginWindowManager$didFinishLogin, (IMP*)&_logos_orig$_ungrouped$AWELoginWindowManager$didFinishLogin);MSHookMessageEx(_logos_class$_ungrouped$AWELoginWindowManager, @selector(showLoginViewControllerWithParamsDict:), (IMP)&_logos_method$_ungrouped$AWELoginWindowManager$showLoginViewControllerWithParamsDict$, (IMP*)&_logos_orig$_ungrouped$AWELoginWindowManager$showLoginViewControllerWithParamsDict$);MSHookMessageEx(_logos_class$_ungrouped$AWELoginWindowManager, @selector(makeKeyAndVisible), (IMP)&_logos_method$_ungrouped$AWELoginWindowManager$makeKeyAndVisible, (IMP*)&_logos_orig$_ungrouped$AWELoginWindowManager$makeKeyAndVisible);Class _logos_class$_ungrouped$AWEIMMessageBaseViewController = objc_getClass("AWEIMMessageBaseViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEIMMessageBaseViewController, @selector(didSendContent:mentionUsers:textView:userInfo:), (IMP)&_logos_method$_ungrouped$AWEIMMessageBaseViewController$didSendContent$mentionUsers$textView$userInfo$, (IMP*)&_logos_orig$_ungrouped$AWEIMMessageBaseViewController$didSendContent$mentionUsers$textView$userInfo$);Class _logos_class$_ungrouped$AWEIMMessageListViewController = objc_getClass("AWEIMMessageListViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEIMMessageListViewController, @selector(setConversation:), (IMP)&_logos_method$_ungrouped$AWEIMMessageListViewController$setConversation$, (IMP*)&_logos_orig$_ungrouped$AWEIMMessageListViewController$setConversation$);Class _logos_class$_ungrouped$AWEIMLoginManager = objc_getClass("AWEIMLoginManager"); MSHookMessageEx(_logos_class$_ungrouped$AWEIMLoginManager, @selector(sdk_reloginWithToken:userID:), (IMP)&_logos_method$_ungrouped$AWEIMLoginManager$sdk_reloginWithToken$userID$, (IMP*)&_logos_orig$_ungrouped$AWEIMLoginManager$sdk_reloginWithToken$userID$);MSHookMessageEx(_logos_class$_ungrouped$AWEIMLoginManager, @selector(sdk_loginWithToken:userID:secUserID:), (IMP)&_logos_method$_ungrouped$AWEIMLoginManager$sdk_loginWithToken$userID$secUserID$, (IMP*)&_logos_orig$_ungrouped$AWEIMLoginManager$sdk_loginWithToken$userID$secUserID$);MSHookMessageEx(_logos_class$_ungrouped$AWEIMLoginManager, @selector(sdk_logout), (IMP)&_logos_method$_ungrouped$AWEIMLoginManager$sdk_logout, (IMP*)&_logos_orig$_ungrouped$AWEIMLoginManager$sdk_logout);MSHookMessageEx(_logos_class$_ungrouped$AWEIMLoginManager, @selector(sdk_config), (IMP)&_logos_method$_ungrouped$AWEIMLoginManager$sdk_config, (IMP*)&_logos_orig$_ungrouped$AWEIMLoginManager$sdk_config);MSHookMessageEx(_logos_class$_ungrouped$AWEIMLoginManager, @selector(manuallyKickOffPuller), (IMP)&_logos_method$_ungrouped$AWEIMLoginManager$manuallyKickOffPuller, (IMP*)&_logos_orig$_ungrouped$AWEIMLoginManager$manuallyKickOffPuller);MSHookMessageEx(_logos_class$_ungrouped$AWEIMLoginManager, @selector(sendIMGetTokenMonitorDataSuccess:error:), (IMP)&_logos_method$_ungrouped$AWEIMLoginManager$sendIMGetTokenMonitorDataSuccess$error$, (IMP*)&_logos_orig$_ungrouped$AWEIMLoginManager$sendIMGetTokenMonitorDataSuccess$error$);MSHookMessageEx(_logos_class$_ungrouped$AWEIMLoginManager, @selector(p_fetchLocalToken), (IMP)&_logos_method$_ungrouped$AWEIMLoginManager$p_fetchLocalToken, (IMP*)&_logos_orig$_ungrouped$AWEIMLoginManager$p_fetchLocalToken);MSHookMessageEx(_logos_class$_ungrouped$AWEIMLoginManager, @selector(p_saveToken), (IMP)&_logos_method$_ungrouped$AWEIMLoginManager$p_saveToken, (IMP*)&_logos_orig$_ungrouped$AWEIMLoginManager$p_saveToken);Class _logos_class$_ungrouped$TTInstallDeviceHelper = objc_getClass("TTInstallDeviceHelper"); Class _logos_metaclass$_ungrouped$TTInstallDeviceHelper = object_getClass(_logos_class$_ungrouped$TTInstallDeviceHelper); MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(timeStamp), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$timeStamp, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$timeStamp);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(saveOpenUDIDToKeychain:), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$saveOpenUDIDToKeychain$, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$saveOpenUDIDToKeychain$);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(fetchOpenUDIDFromKeychain), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$fetchOpenUDIDFromKeychain, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$fetchOpenUDIDFromKeychain);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(resolutionString), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$resolutionString, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$resolutionString);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(resolution), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$resolution, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$resolution);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(screenScale), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$screenScale, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$screenScale);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(ssOnePixel), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$ssOnePixel, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$ssOnePixel);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(openUDID), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$openUDID, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$openUDID);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(currentLanguage), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$currentLanguage, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$currentLanguage);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(MACAddress), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$MACAddress, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$MACAddress);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(OSVersionNumber), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$OSVersionNumber, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$OSVersionNumber);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(idfvString), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$idfvString, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$idfvString);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(idfaString), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$idfaString, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$idfaString);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(getDeviceType), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$getDeviceType, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$getDeviceType);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(isJailBroken), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$isJailBroken, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$isJailBroken);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(platformName), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$platformName, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$platformName);Class _logos_class$_ungrouped$ANSMetadata = objc_getClass("ANSMetadata"); MSHookMessageEx(_logos_class$_ungrouped$ANSMetadata, @selector(computeIsJailbroken), (IMP)&_logos_method$_ungrouped$ANSMetadata$computeIsJailbroken, (IMP*)&_logos_orig$_ungrouped$ANSMetadata$computeIsJailbroken);Class _logos_class$_ungrouped$HMDInfo = objc_getClass("HMDInfo"); MSHookMessageEx(_logos_class$_ungrouped$HMDInfo, @selector(isJailBroken), (IMP)&_logos_method$_ungrouped$HMDInfo$isJailBroken, (IMP*)&_logos_orig$_ungrouped$HMDInfo$isJailBroken);Class _logos_class$_ungrouped$UIDevice = objc_getClass("UIDevice"); MSHookMessageEx(_logos_class$_ungrouped$UIDevice, @selector(btd_isJailBroken), (IMP)&_logos_method$_ungrouped$UIDevice$btd_isJailBroken, (IMP*)&_logos_orig$_ungrouped$UIDevice$btd_isJailBroken);Class _logos_class$_ungrouped$NSFileManager = objc_getClass("NSFileManager"); MSHookMessageEx(_logos_class$_ungrouped$NSFileManager, @selector(fileExistsAtPath:), (IMP)&_logos_method$_ungrouped$NSFileManager$fileExistsAtPath$, (IMP*)&_logos_orig$_ungrouped$NSFileManager$fileExistsAtPath$);Class _logos_class$_ungrouped$NSString = objc_getClass("NSString"); MSHookMessageEx(_logos_class$_ungrouped$NSString, @selector(containsString:), (IMP)&_logos_method$_ungrouped$NSString$containsString$, (IMP*)&_logos_orig$_ungrouped$NSString$containsString$);Class _logos_class$_ungrouped$AWEAwemeDetailTableViewController = objc_getClass("AWEAwemeDetailTableViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(currentDisplayingAweme), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$currentDisplayingAweme, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$currentDisplayingAweme);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(viewDidDisappear:), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$viewDidDisappear$, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$viewDidDisappear$);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(viewWillAppear:), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$viewWillAppear$, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$viewWillAppear$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(NSNotification *), strlen(@encode(NSNotification *))); i += strlen(@encode(NSNotification *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(xy_savePhoto:), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$xy_savePhoto$, _typeEncoding); }{ char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(NSIndexPath *)); class_addMethod(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(xy_lastAutoScrollIndexPath), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$xy_lastAutoScrollIndexPath, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(NSIndexPath *)); class_addMethod(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(setXy_lastAutoScrollIndexPath:), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$setXy_lastAutoScrollIndexPath, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(XYVideoDownloader *)); class_addMethod(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(xy_downloader), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$xy_downloader, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(XYVideoDownloader *)); class_addMethod(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(setXy_downloader:), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$setXy_downloader, _typeEncoding); } Class _logos_class$_ungrouped$AWEUIResponder = objc_getClass("AWEUIResponder"); Class _logos_metaclass$_ungrouped$AWEUIResponder = object_getClass(_logos_class$_ungrouped$AWEUIResponder); MSHookMessageEx(_logos_metaclass$_ungrouped$AWEUIResponder, @selector(topViewControllerForController:), (IMP)&_logos_meta_method$_ungrouped$AWEUIResponder$topViewControllerForController$, (IMP*)&_logos_meta_orig$_ungrouped$AWEUIResponder$topViewControllerForController$);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEUIResponder, @selector(topViewController), (IMP)&_logos_meta_method$_ungrouped$AWEUIResponder$topViewController, (IMP*)&_logos_meta_orig$_ungrouped$AWEUIResponder$topViewController);}
    
}

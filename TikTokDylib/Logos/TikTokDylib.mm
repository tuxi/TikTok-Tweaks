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

@class BDDiamondAfterHeatManager; @class NSFileManager; @class AWEUIResponder; @class AWELiveSetting; @class AWEAppShareSettingManager; @class AWELiveFreePresentPropertyManager; @class AWELiveGiftListBottomLandscapeView; @class AWELiveSendGiftPackage; @class AWELiveMyWalletModel; @class ANSMetadata; @class AWESlidingTabbarView; @class AWELiveRoomConfigModel; @class AWEFeedContainerViewController; @class AVMDLDataLoader; @class AWEAwemePlayInteractionPresenter; @class AWELiveTrackEventManager; @class AWEAppLiveSettingManager; @class AWEIMMessageListViewController; @class AWEAwemeDetailTableViewController; @class AWEShareCollectionView; @class AWEDiscoverFeedEntranceView; @class AWEVideoRecorderController; @class AWEFeedCellViewController; @class AWELiveInteractViewController; @class AWEAwemePlayInteractionViewController; @class TTInstallDeviceHelper; @class AWELoginWindowManager; @class UIDevice; @class AWEFeedTableViewController; @class AWELiveSendGiftController; @class AWELiveWalletManager; @class AWEIMMessageBaseViewController; @class AWELiveGiftListDataController; @class AWEAwemeBaseViewController; @class AWELiveGiftListViewController; @class IESLiveDeviceInfo; @class AWEENV; @class HMDInfo; @class AWELiveGiftFansEnterView; @class NSString; @class AWEAwemeModel; 
static void (*_logos_orig$_ungrouped$AWEFeedTableViewController$viewDidDisappear$)(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$AWEFeedTableViewController$viewDidDisappear$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$AWEFeedTableViewController$viewWillAppear$)(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$AWEFeedTableViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$AWEFeedTableViewController$xy_savePhoto$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL, NSNotification *); static void (*_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$performLikeAction)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$performLikeAction(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$onVideoPlayerViewDoubleClicked$)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$onVideoPlayerViewDoubleClicked$(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void (*_logos_orig$_ungrouped$AWEFeedCellViewController$_onVideoPlayerViewClicked$)(_LOGOS_SELF_TYPE_NORMAL AWEFeedCellViewController* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void _logos_method$_ungrouped$AWEFeedCellViewController$_onVideoPlayerViewClicked$(_LOGOS_SELF_TYPE_NORMAL AWEFeedCellViewController* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void (*_logos_orig$_ungrouped$AWEAwemePlayInteractionPresenter$enterMusicDetail$)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionPresenter* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void _logos_method$_ungrouped$AWEAwemePlayInteractionPresenter$enterMusicDetail$(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionPresenter* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void (*_logos_orig$_ungrouped$AWEAwemePlayInteractionPresenter$p_goToPersonalPage$gestureRecognizer$)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionPresenter* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$AWEAwemePlayInteractionPresenter$p_goToPersonalPage$gestureRecognizer$(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionPresenter* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$_ungrouped$AWEAwemePlayInteractionPresenter$onUnFollowViewClicked$)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionPresenter* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void _logos_method$_ungrouped$AWEAwemePlayInteractionPresenter$onUnFollowViewClicked$(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionPresenter* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void (*_logos_orig$_ungrouped$AWEAwemePlayInteractionPresenter$onFollowViewClicked$)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionPresenter* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void _logos_method$_ungrouped$AWEAwemePlayInteractionPresenter$onFollowViewClicked$(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionPresenter* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static _Bool (*_logos_orig$_ungrouped$AWEAwemePlayInteractionPresenter$alertIfCanNotComment)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionPresenter* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWEAwemePlayInteractionPresenter$alertIfCanNotComment(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionPresenter* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$AWEAwemeBaseViewController$alertIfNotValid)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeBaseViewController* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWEAwemeBaseViewController$alertIfNotValid(_LOGOS_SELF_TYPE_NORMAL AWEAwemeBaseViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEShareCollectionView$sendEvents$toItemAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL AWEShareCollectionView* _LOGOS_SELF_CONST, SEL, unsigned long long, NSIndexPath *); static void _logos_method$_ungrouped$AWEShareCollectionView$sendEvents$toItemAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL AWEShareCollectionView* _LOGOS_SELF_CONST, SEL, unsigned long long, NSIndexPath *); static void (*_logos_orig$_ungrouped$AWEShareCollectionView$collectionView$didSelectItemAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL AWEShareCollectionView* _LOGOS_SELF_CONST, SEL, id, NSIndexPath *); static void _logos_method$_ungrouped$AWEShareCollectionView$collectionView$didSelectItemAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL AWEShareCollectionView* _LOGOS_SELF_CONST, SEL, id, NSIndexPath *); static AWEShareCollectionView* (*_logos_orig$_ungrouped$AWEShareCollectionView$initWithItems$hostView$)(_LOGOS_SELF_TYPE_INIT AWEShareCollectionView*, SEL, NSArray<AWEShareItem *> *, id) _LOGOS_RETURN_RETAINED; static AWEShareCollectionView* _logos_method$_ungrouped$AWEShareCollectionView$initWithItems$hostView$(_LOGOS_SELF_TYPE_INIT AWEShareCollectionView*, SEL, NSArray<AWEShareItem *> *, id) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$_ungrouped$AWEFeedContainerViewController$onDiscoverButtonClicked$)(_LOGOS_SELF_TYPE_NORMAL AWEFeedContainerViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWEFeedContainerViewController$onDiscoverButtonClicked$(_LOGOS_SELF_TYPE_NORMAL AWEFeedContainerViewController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWEDiscoverFeedEntranceView$awe_UITracker_gestureRecognizer$)(_LOGOS_SELF_TYPE_NORMAL AWEDiscoverFeedEntranceView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWEDiscoverFeedEntranceView$awe_UITracker_gestureRecognizer$(_LOGOS_SELF_TYPE_NORMAL AWEDiscoverFeedEntranceView* _LOGOS_SELF_CONST, SEL, id); static _Bool (*_logos_orig$_ungrouped$AVMDLDataLoader$_supportPoxy$)(_LOGOS_SELF_TYPE_NORMAL AVMDLDataLoader* _LOGOS_SELF_CONST, SEL, NSString *); static _Bool _logos_method$_ungrouped$AVMDLDataLoader$_supportPoxy$(_LOGOS_SELF_TYPE_NORMAL AVMDLDataLoader* _LOGOS_SELF_CONST, SEL, NSString *); static id (*_logos_orig$_ungrouped$AVMDLDataLoader$getCacheFileInfo$filePath$)(_LOGOS_SELF_TYPE_NORMAL AVMDLDataLoader* _LOGOS_SELF_CONST, SEL, id, id); static id _logos_method$_ungrouped$AVMDLDataLoader$getCacheFileInfo$filePath$(_LOGOS_SELF_TYPE_NORMAL AVMDLDataLoader* _LOGOS_SELF_CONST, SEL, id, id); static id (*_logos_orig$_ungrouped$AVMDLDataLoader$getCacheFileInfo$)(_LOGOS_SELF_TYPE_NORMAL AVMDLDataLoader* _LOGOS_SELF_CONST, SEL, id); static id _logos_method$_ungrouped$AVMDLDataLoader$getCacheFileInfo$(_LOGOS_SELF_TYPE_NORMAL AVMDLDataLoader* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AVMDLDataLoader$stop)(_LOGOS_SELF_TYPE_NORMAL AVMDLDataLoader* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AVMDLDataLoader$stop(_LOGOS_SELF_TYPE_NORMAL AVMDLDataLoader* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AVMDLDataLoader$start$)(_LOGOS_SELF_TYPE_NORMAL AVMDLDataLoader* _LOGOS_SELF_CONST, SEL, id *); static void _logos_method$_ungrouped$AVMDLDataLoader$start$(_LOGOS_SELF_TYPE_NORMAL AVMDLDataLoader* _LOGOS_SELF_CONST, SEL, id *); static _Bool (*_logos_meta_orig$_ungrouped$AWEENV$isDebugEnv)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEENV$isDebugEnv(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEENV$isBetaEnv)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEENV$isBetaEnv(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEENV$isTestEnv)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEENV$isTestEnv(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEENV$isI18N)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEENV$isI18N(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEENV$isTiktok)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEENV$isTiktok(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEENV$isMusically)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEENV$isMusically(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEENV$isDouyin)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEENV$isDouyin(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$AWEENV$plistChannel)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$AWEENV$plistChannel(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEENV$isTestFlight)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEENV$isTestFlight(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEENV$isStaff)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEENV$isStaff(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static long long (*_logos_meta_orig$_ungrouped$AWEENV$channel)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static long long _logos_meta_method$_ungrouped$AWEENV$channel(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static long long (*_logos_meta_orig$_ungrouped$AWEENV$product)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static long long _logos_meta_method$_ungrouped$AWEENV$product(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEENV$isDebugEvn)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEENV$isDebugEvn(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEENV$isBetaEvn)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEENV$isBetaEvn(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEENV$isTestEvn)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEENV$isTestEvn(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$AWEAwemeModel$disableDownload)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeModel* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWEAwemeModel$disableDownload(_LOGOS_SELF_TYPE_NORMAL AWEAwemeModel* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$AWEAwemeModel$canBeReposted)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeModel* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWEAwemeModel$canBeReposted(_LOGOS_SELF_TYPE_NORMAL AWEAwemeModel* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$AWEAwemeModel$videoCommentStauts)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeModel* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWEAwemeModel$videoCommentStauts(_LOGOS_SELF_TYPE_NORMAL AWEAwemeModel* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWESlidingTabbarView$tabButtonClicked$)(_LOGOS_SELF_TYPE_NORMAL AWESlidingTabbarView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWESlidingTabbarView$tabButtonClicked$(_LOGOS_SELF_TYPE_NORMAL AWESlidingTabbarView* _LOGOS_SELF_CONST, SEL, id); static BDDiamondAfterHeatManager * (*_logos_meta_orig$_ungrouped$BDDiamondAfterHeatManager$sharedInstance)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BDDiamondAfterHeatManager * _logos_meta_method$_ungrouped$BDDiamondAfterHeatManager$sharedInstance(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$BDDiamondAfterHeatManager$userLoginAction)(_LOGOS_SELF_TYPE_NORMAL BDDiamondAfterHeatManager* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$BDDiamondAfterHeatManager$userLoginAction(_LOGOS_SELF_TYPE_NORMAL BDDiamondAfterHeatManager* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$BDDiamondAfterHeatManager$userLogoutAction)(_LOGOS_SELF_TYPE_NORMAL BDDiamondAfterHeatManager* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$BDDiamondAfterHeatManager$userLogoutAction(_LOGOS_SELF_TYPE_NORMAL BDDiamondAfterHeatManager* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$BDDiamondAfterHeatManager$clearHeatCacheData)(_LOGOS_SELF_TYPE_NORMAL BDDiamondAfterHeatManager* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$BDDiamondAfterHeatManager$clearHeatCacheData(_LOGOS_SELF_TYPE_NORMAL BDDiamondAfterHeatManager* _LOGOS_SELF_CONST, SEL); static NSString * (*_logos_orig$_ungrouped$BDDiamondAfterHeatManager$currentLoginUID)(_LOGOS_SELF_TYPE_NORMAL BDDiamondAfterHeatManager* _LOGOS_SELF_CONST, SEL); static NSString * _logos_method$_ungrouped$BDDiamondAfterHeatManager$currentLoginUID(_LOGOS_SELF_TYPE_NORMAL BDDiamondAfterHeatManager* _LOGOS_SELF_CONST, SEL); static AWELoginWindowManager * (*_logos_meta_orig$_ungrouped$AWELoginWindowManager$sharedManager)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static AWELoginWindowManager * _logos_meta_method$_ungrouped$AWELoginWindowManager$sharedManager(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWELoginWindowManager$requestSettings)(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELoginWindowManager$requestSettings(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$AWELoginWindowManager$loginSettingsModelArray)(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$AWELoginWindowManager$loginSettingsModelArray(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWELoginWindowManager$dismiss)(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELoginWindowManager$dismiss(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWELoginWindowManager$didFinishLogin)(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELoginWindowManager$didFinishLogin(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWELoginWindowManager$showLoginViewControllerWithParamsDict$)(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWELoginWindowManager$showLoginViewControllerWithParamsDict$(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWELoginWindowManager$makeKeyAndVisible)(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELoginWindowManager$makeKeyAndVisible(_LOGOS_SELF_TYPE_NORMAL AWELoginWindowManager* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEIMMessageBaseViewController$didSendContent$mentionUsers$textView$userInfo$)(_LOGOS_SELF_TYPE_NORMAL AWEIMMessageBaseViewController* _LOGOS_SELF_CONST, SEL, NSString *, NSArray *, id, id); static void _logos_method$_ungrouped$AWEIMMessageBaseViewController$didSendContent$mentionUsers$textView$userInfo$(_LOGOS_SELF_TYPE_NORMAL AWEIMMessageBaseViewController* _LOGOS_SELF_CONST, SEL, NSString *, NSArray *, id, id); static void (*_logos_orig$_ungrouped$AWEIMMessageListViewController$setConversation$)(_LOGOS_SELF_TYPE_NORMAL AWEIMMessageListViewController* _LOGOS_SELF_CONST, SEL, AWEIMMessageConversation *); static void _logos_method$_ungrouped$AWEIMMessageListViewController$setConversation$(_LOGOS_SELF_TYPE_NORMAL AWEIMMessageListViewController* _LOGOS_SELF_CONST, SEL, AWEIMMessageConversation *); static long long (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$timeStamp)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static long long _logos_meta_method$_ungrouped$TTInstallDeviceHelper$timeStamp(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$saveOpenUDIDToKeychain$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static void _logos_meta_method$_ungrouped$TTInstallDeviceHelper$saveOpenUDIDToKeychain$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static id (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$fetchOpenUDIDFromKeychain)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$fetchOpenUDIDFromKeychain(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$resolutionString)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$resolutionString(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static struct CGSize (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$resolution)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static struct CGSize _logos_meta_method$_ungrouped$TTInstallDeviceHelper$resolution(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$screenScale)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double _logos_meta_method$_ungrouped$TTInstallDeviceHelper$screenScale(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$ssOnePixel)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double _logos_meta_method$_ungrouped$TTInstallDeviceHelper$ssOnePixel(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$openUDID)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$openUDID(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$currentLanguage)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$currentLanguage(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$MACAddress)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$MACAddress(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static float (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$OSVersionNumber)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static float _logos_meta_method$_ungrouped$TTInstallDeviceHelper$OSVersionNumber(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$idfvString)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$idfvString(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$idfaString)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$idfaString(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static unsigned long long (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$getDeviceType)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static unsigned long long _logos_meta_method$_ungrouped$TTInstallDeviceHelper$getDeviceType(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$isJailBroken)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$TTInstallDeviceHelper$isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$platformName)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$platformName(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$ANSMetadata$computeIsJailbroken)(_LOGOS_SELF_TYPE_NORMAL ANSMetadata* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$ANSMetadata$computeIsJailbroken(_LOGOS_SELF_TYPE_NORMAL ANSMetadata* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$HMDInfo$isJailBroken)(_LOGOS_SELF_TYPE_NORMAL HMDInfo* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$HMDInfo$isJailBroken(_LOGOS_SELF_TYPE_NORMAL HMDInfo* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$UIDevice$btd_isJailBroken)(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$UIDevice$btd_isJailBroken(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$NSFileManager$fileExistsAtPath$)(_LOGOS_SELF_TYPE_NORMAL NSFileManager* _LOGOS_SELF_CONST, SEL, NSString *); static BOOL _logos_method$_ungrouped$NSFileManager$fileExistsAtPath$(_LOGOS_SELF_TYPE_NORMAL NSFileManager* _LOGOS_SELF_CONST, SEL, NSString *); static BOOL (*_logos_orig$_ungrouped$NSString$containsString$)(_LOGOS_SELF_TYPE_NORMAL NSString* _LOGOS_SELF_CONST, SEL, NSString *); static BOOL _logos_method$_ungrouped$NSString$containsString$(_LOGOS_SELF_TYPE_NORMAL NSString* _LOGOS_SELF_CONST, SEL, NSString *); static AWEAwemeModel * (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$currentDisplayingAweme)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static AWEAwemeModel * _logos_method$_ungrouped$AWEAwemeDetailTableViewController$currentDisplayingAweme(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$viewDidDisappear$)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$viewDidDisappear$(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$viewWillAppear$)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$AWEAwemeDetailTableViewController$xy_savePhoto$(_LOGOS_SELF_TYPE_NORMAL AWEAwemeDetailTableViewController* _LOGOS_SELF_CONST, SEL, NSNotification *); static id (*_logos_meta_orig$_ungrouped$AWEUIResponder$topViewControllerForController$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static id _logos_meta_method$_ungrouped$AWEUIResponder$topViewControllerForController$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static id (*_logos_meta_orig$_ungrouped$AWEUIResponder$topViewController)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$AWEUIResponder$topViewController(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWELiveInteractViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL AWELiveInteractViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELiveInteractViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWELiveInteractViewController* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$disableNewPayment)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$disableNewPayment(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$newWalletConf)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$newWalletConf(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$showSkylightAnimation)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$showSkylightAnimation(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$disableLiveCDNNodeSelection)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$disableLiveCDNNodeSelection(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$isLivePodcast)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$isLivePodcast(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double (*_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveResH)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveResH(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double (*_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveResW)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveResW(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double (*_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveFps)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveFps(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double (*_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveMinBitrate)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveMinBitrate(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double (*_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveMaxBitrate)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveMaxBitrate(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double (*_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveDefaultBitrate)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveDefaultBitrate(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWELiveSetting$shouldCheckCoins$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, _Bool); static _Bool _logos_meta_method$_ungrouped$AWELiveSetting$shouldCheckCoins$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, _Bool); static void (*_logos_meta_orig$_ungrouped$AWELiveSetting$setBarrageCoins$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, long long); static void _logos_meta_method$_ungrouped$AWELiveSetting$setBarrageCoins$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, long long); static long long (*_logos_meta_orig$_ungrouped$AWELiveSetting$barrageCoins)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static long long _logos_meta_method$_ungrouped$AWELiveSetting$barrageCoins(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_meta_orig$_ungrouped$AWELiveSetting$setUserAllCoins$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, long long); static void _logos_meta_method$_ungrouped$AWELiveSetting$setUserAllCoins$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, long long); static long long (*_logos_meta_orig$_ungrouped$AWELiveSetting$userAllCoins)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static long long _logos_meta_method$_ungrouped$AWELiveSetting$userAllCoins(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_meta_orig$_ungrouped$AWELiveTrackEventManager$trackLiveClickPresent$isAnchor$enterFrom$presentID$presentCoins$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, _Bool, id, id, id); static void _logos_meta_method$_ungrouped$AWELiveTrackEventManager$trackLiveClickPresent$isAnchor$enterFrom$presentID$presentCoins$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, _Bool, id, id, id); static void (*_logos_meta_orig$_ungrouped$AWELiveTrackEventManager$trackLiveSendPresentSuccess$isAnchor$enterFrom$presentID$presentCoins$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, _Bool, id, id, id); static void _logos_meta_method$_ungrouped$AWELiveTrackEventManager$trackLiveSendPresentSuccess$isAnchor$enterFrom$presentID$presentCoins$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, _Bool, id, id, id); static void (*_logos_orig$_ungrouped$AWELiveSendGiftPackage$resetWithPresent$)(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftPackage* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWELiveSendGiftPackage$resetWithPresent$(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftPackage* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWELiveGiftListDataController$sendPresent$presentID$count$completion$)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST, SEL, id, id, long long, id); static void _logos_method$_ungrouped$AWELiveGiftListDataController$sendPresent$presentID$count$completion$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST, SEL, id, id, long long, id); static void (*_logos_orig$_ungrouped$AWELiveGiftListDataController$filterDisplayPresentList)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELiveGiftListDataController$filterDisplayPresentList(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWELiveGiftListDataController$_getFreePresentListWithPresentList$completion$)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$AWELiveGiftListDataController$_getFreePresentListWithPresentList$completion$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$_ungrouped$AWELiveGiftListDataController$getSandBoxGiftListModel$completion$)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$AWELiveGiftListDataController$getSandBoxGiftListModel$completion$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$_ungrouped$AWELiveGiftListDataController$getGiftListModelWithCompletion$roomID$)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$AWELiveGiftListDataController$getGiftListModelWithCompletion$roomID$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$_ungrouped$AWELiveGiftListDataController$getGiftListModelWithRoom$completion$)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$AWELiveGiftListDataController$getGiftListModelWithRoom$completion$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST, SEL, id, id); static _Bool (*_logos_orig$_ungrouped$AWELiveSendGiftController$isAnchor)(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWELiveSendGiftController$isAnchor(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWELiveSendGiftController$_performSendRequest)(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELiveSendGiftController$_performSendRequest(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWELiveSendGiftController$_prepareSendRequestWithPresent$)(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWELiveSendGiftController$_prepareSendRequestWithPresent$(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWELiveSendGiftController$_performClickTrack)(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELiveSendGiftController$_performClickTrack(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWELiveSendGiftController$_prepareClickTrackWithPreseent$)(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWELiveSendGiftController$_prepareClickTrackWithPreseent$(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWELiveSendGiftController$willSendGiftInCollectionView$atIndexPath$)(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$AWELiveSendGiftController$willSendGiftInCollectionView$atIndexPath$(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$_ungrouped$AWELiveGiftListBottomLandscapeView$refreshWalletCoins$)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListBottomLandscapeView* _LOGOS_SELF_CONST, SEL, long long); static void _logos_method$_ungrouped$AWELiveGiftListBottomLandscapeView$refreshWalletCoins$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListBottomLandscapeView* _LOGOS_SELF_CONST, SEL, long long); static void (*_logos_orig$_ungrouped$AWELiveGiftFansEnterView$handleProcessWithIntimacy$presentCoins$animationFinishBlock$)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftFansEnterView* _LOGOS_SELF_CONST, SEL, id, long long, id); static void _logos_method$_ungrouped$AWELiveGiftFansEnterView$handleProcessWithIntimacy$presentCoins$animationFinishBlock$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftFansEnterView* _LOGOS_SELF_CONST, SEL, id, long long, id); static void (*_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$_consumeFansFreePresentWithPresentId$count$)(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST, SEL, id, long long); static void _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$_consumeFansFreePresentWithPresentId$count$(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST, SEL, id, long long); static void (*_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$setFansFreePresent$)(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$setFansFreePresent$(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$consumeFreePresentWithPresentId$propertIDs$count$)(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST, SEL, id, id, long long); static void _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$consumeFreePresentWithPresentId$propertIDs$count$(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST, SEL, id, id, long long); static id (*_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$useFreePresentWithPresentId$count$)(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST, SEL, id, long long); static id _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$useFreePresentWithPresentId$count$(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST, SEL, id, long long); static long long (*_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$freeCountForPresentId$)(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST, SEL, id); static long long _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$freeCountForPresentId$(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$fetchFreePresentListWithCompletion$)(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$fetchFreePresentListWithCompletion$(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST, SEL, id); static AWELiveFreePresentPropertyManager* (*_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$init)(_LOGOS_SELF_TYPE_INIT AWELiveFreePresentPropertyManager*, SEL) _LOGOS_RETURN_RETAINED; static AWELiveFreePresentPropertyManager* _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$init(_LOGOS_SELF_TYPE_INIT AWELiveFreePresentPropertyManager*, SEL) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$_ungrouped$AWELiveGiftListViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELiveGiftListViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWELiveGiftListViewController$refreshWalletCoins)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELiveGiftListViewController$refreshWalletCoins(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWELiveGiftListViewController$didFinishSendPresentRequestWithTotalCoins$)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL, long long); static void _logos_method$_ungrouped$AWELiveGiftListViewController$didFinishSendPresentRequestWithTotalCoins$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL, long long); static void (*_logos_orig$_ungrouped$AWELiveGiftListViewController$didSendPresent$)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWELiveGiftListViewController$didSendPresent$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWELiveGiftListViewController$collectionView$didSelectItemAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$AWELiveGiftListViewController$collectionView$didSelectItemAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$_ungrouped$AWELiveGiftListViewController$_handleFansProcess$presentCoins$)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL, id, long long); static void _logos_method$_ungrouped$AWELiveGiftListViewController$_handleFansProcess$presentCoins$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL, id, long long); static void (*_logos_orig$_ungrouped$AWELiveGiftListViewController$_fetchGiftListDataAndReloadUI$)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL, _Bool); static void _logos_method$_ungrouped$AWELiveGiftListViewController$_fetchGiftListDataAndReloadUI$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL, _Bool); static void (*_logos_orig$_ungrouped$AWELiveGiftListViewController$rechargeClicked$)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWELiveGiftListViewController$rechargeClicked$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWELiveGiftListViewController$rechargeSuccessNotiAction)(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWELiveGiftListViewController$rechargeSuccessNotiAction(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_meta_orig$_ungrouped$AWELiveWalletManager$alertForNobalance$triggerReason$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, id); static void _logos_meta_method$_ungrouped$AWELiveWalletManager$alertForNobalance$triggerReason$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, id); static id (*_logos_meta_orig$_ungrouped$AWELiveWalletManager$_getWalletWebURL$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, _Bool); static id _logos_meta_method$_ungrouped$AWELiveWalletManager$_getWalletWebURL$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, _Bool); static void (*_logos_meta_orig$_ungrouped$AWELiveWalletManager$transitionToWalletPageFrom$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, _Bool); static void _logos_meta_method$_ungrouped$AWELiveWalletManager$transitionToWalletPageFrom$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, _Bool); static void (*_logos_meta_orig$_ungrouped$AWELiveWalletManager$getMyWalletWithFinishBlock$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static void _logos_meta_method$_ungrouped$AWELiveWalletManager$getMyWalletWithFinishBlock$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static id (*_logos_meta_orig$_ungrouped$AWELiveMyWalletModel$userJSONTransformer)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$AWELiveMyWalletModel$userJSONTransformer(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$AWELiveMyWalletModel$JSONKeyPathsByPropertyKey)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$AWELiveMyWalletModel$JSONKeyPathsByPropertyKey(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$AWEAppShareSettingManager$downloadForbiddenToast)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$AWEAppShareSettingManager$downloadForbiddenToast(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEAppShareSettingManager$selfSeeingShouldForbidWaterMarkWhenDownload)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEAppShareSettingManager$selfSeeingShouldForbidWaterMarkWhenDownload(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEAppShareSettingManager$forbidDownloadLocal)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEAppShareSettingManager$forbidDownloadLocal(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$AWEAppShareSettingManager$downloadCheckStatus)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$AWEAppShareSettingManager$downloadCheckStatus(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$AWEVideoRecorderController$shouldEnableLive)(_LOGOS_SELF_TYPE_NORMAL AWEVideoRecorderController* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$AWEVideoRecorderController$shouldEnableLive(_LOGOS_SELF_TYPE_NORMAL AWEVideoRecorderController* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$AWELiveRoomConfigModel$enableHourlyList$)(_LOGOS_SELF_TYPE_NORMAL AWELiveRoomConfigModel* _LOGOS_SELF_CONST, SEL, _Bool); static _Bool _logos_method$_ungrouped$AWELiveRoomConfigModel$enableHourlyList$(_LOGOS_SELF_TYPE_NORMAL AWELiveRoomConfigModel* _LOGOS_SELF_CONST, SEL, _Bool); static _Bool (*_logos_orig$_ungrouped$AWELiveRoomConfigModel$enableFansClub$)(_LOGOS_SELF_TYPE_NORMAL AWELiveRoomConfigModel* _LOGOS_SELF_CONST, SEL, _Bool); static _Bool _logos_method$_ungrouped$AWELiveRoomConfigModel$enableFansClub$(_LOGOS_SELF_TYPE_NORMAL AWELiveRoomConfigModel* _LOGOS_SELF_CONST, SEL, _Bool); static _Bool (*_logos_orig$_ungrouped$AWELiveRoomConfigModel$enableSendBarrage$)(_LOGOS_SELF_TYPE_NORMAL AWELiveRoomConfigModel* _LOGOS_SELF_CONST, SEL, _Bool); static _Bool _logos_method$_ungrouped$AWELiveRoomConfigModel$enableSendBarrage$(_LOGOS_SELF_TYPE_NORMAL AWELiveRoomConfigModel* _LOGOS_SELF_CONST, SEL, _Bool); static _Bool (*_logos_orig$_ungrouped$AWELiveRoomConfigModel$enableSendShortcutGift$)(_LOGOS_SELF_TYPE_NORMAL AWELiveRoomConfigModel* _LOGOS_SELF_CONST, SEL, _Bool); static _Bool _logos_method$_ungrouped$AWELiveRoomConfigModel$enableSendShortcutGift$(_LOGOS_SELF_TYPE_NORMAL AWELiveRoomConfigModel* _LOGOS_SELF_CONST, SEL, _Bool); static _Bool (*_logos_orig$_ungrouped$AWELiveRoomConfigModel$enableSendGiftGuide$)(_LOGOS_SELF_TYPE_NORMAL AWELiveRoomConfigModel* _LOGOS_SELF_CONST, SEL, _Bool); static _Bool _logos_method$_ungrouped$AWELiveRoomConfigModel$enableSendGiftGuide$(_LOGOS_SELF_TYPE_NORMAL AWELiveRoomConfigModel* _LOGOS_SELF_CONST, SEL, _Bool); static _Bool (*_logos_orig$_ungrouped$AWELiveRoomConfigModel$enableSendGift$)(_LOGOS_SELF_TYPE_NORMAL AWELiveRoomConfigModel* _LOGOS_SELF_CONST, SEL, _Bool); static _Bool _logos_method$_ungrouped$AWELiveRoomConfigModel$enableSendGift$(_LOGOS_SELF_TYPE_NORMAL AWELiveRoomConfigModel* _LOGOS_SELF_CONST, SEL, _Bool); static _Bool (*_logos_orig$_ungrouped$AWELiveRoomConfigModel$enableSendComment$)(_LOGOS_SELF_TYPE_NORMAL AWELiveRoomConfigModel* _LOGOS_SELF_CONST, SEL, _Bool); static _Bool _logos_method$_ungrouped$AWELiveRoomConfigModel$enableSendComment$(_LOGOS_SELF_TYPE_NORMAL AWELiveRoomConfigModel* _LOGOS_SELF_CONST, SEL, _Bool); static _Bool (*_logos_orig$_ungrouped$AWELiveRoomConfigModel$enableShare$)(_LOGOS_SELF_TYPE_NORMAL AWELiveRoomConfigModel* _LOGOS_SELF_CONST, SEL, _Bool); static _Bool _logos_method$_ungrouped$AWELiveRoomConfigModel$enableShare$(_LOGOS_SELF_TYPE_NORMAL AWELiveRoomConfigModel* _LOGOS_SELF_CONST, SEL, _Bool); static _Bool (*_logos_orig$_ungrouped$AWELiveRoomConfigModel$enableEmoji$)(_LOGOS_SELF_TYPE_NORMAL AWELiveRoomConfigModel* _LOGOS_SELF_CONST, SEL, _Bool); static _Bool _logos_method$_ungrouped$AWELiveRoomConfigModel$enableEmoji$(_LOGOS_SELF_TYPE_NORMAL AWELiveRoomConfigModel* _LOGOS_SELF_CONST, SEL, _Bool); static id (*_logos_meta_orig$_ungrouped$IESLiveDeviceInfo$carrierMCCMNC)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$IESLiveDeviceInfo$carrierMCCMNC(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$IESLiveDeviceInfo$carrierMNC)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$IESLiveDeviceInfo$carrierMNC(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$IESLiveDeviceInfo$carrierMCC)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$IESLiveDeviceInfo$carrierMCC(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$IESLiveDeviceInfo$carrierName)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$IESLiveDeviceInfo$carrierName(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); 

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

static _Bool _logos_method$_ungrouped$AWEAwemePlayInteractionPresenter$alertIfCanNotComment(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionPresenter* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return NO;
}




static _Bool _logos_method$_ungrouped$AWEAwemeBaseViewController$alertIfNotValid(_LOGOS_SELF_TYPE_NORMAL AWEAwemeBaseViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return NO;
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
static _Bool _logos_method$_ungrouped$AWEAwemeModel$canBeReposted(_LOGOS_SELF_TYPE_NORMAL AWEAwemeModel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return YES;
}
static _Bool _logos_method$_ungrouped$AWEAwemeModel$videoCommentStauts(_LOGOS_SELF_TYPE_NORMAL AWEAwemeModel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return YES;
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






static void _logos_method$_ungrouped$AWELiveInteractViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWELiveInteractViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWELiveInteractViewController$viewDidLoad(self, _cmd);
    NSLog(@"AWELiveInteractViewController CALLED");
    
    









    
    







}






































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


static _Bool _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$disableNewPayment(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool val = _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$disableNewPayment(self, _cmd);
    NSLog(@"[AWEAppLiveSettingManager disableNewPayment], returnValue: %d", val);
    return _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$disableNewPayment(self, _cmd);
}

static id _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$newWalletConf(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    id val = _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$newWalletConf(self, _cmd);
    NSLog(@"[AWEAppLiveSettingManager newWalletConf], returnValue: %@", val);
    return _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$newWalletConf(self, _cmd);
}
static _Bool _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$showSkylightAnimation(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool val = _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$showSkylightAnimation(self, _cmd);
    NSLog(@"[AWEAppLiveSettingManager showSkylightAnimation], returnValue: %d", val);
    return _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$showSkylightAnimation(self, _cmd);
}
static _Bool _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$disableLiveCDNNodeSelection(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool val = _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$disableLiveCDNNodeSelection(self, _cmd);
    NSLog(@"[AWEAppLiveSettingManager disableLiveCDNNodeSelection], returnValue: %d", val);
    return _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$disableLiveCDNNodeSelection(self, _cmd);
}

static _Bool _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$isLivePodcast(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool val = _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$isLivePodcast(self, _cmd);
    NSLog(@"[AWEAppLiveSettingManager isLivePodcast], returnValue: %d", val);
    return _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$isLivePodcast(self, _cmd);
}
static double _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveResH(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    double val = _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveResH(self, _cmd);
    NSLog(@"[AWEAppLiveSettingManager liveResH], returnValue: %lf", val);
    return _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveResH(self, _cmd);
}
static double _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveResW(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    double val = _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveResW(self, _cmd);
    NSLog(@"[AWEAppLiveSettingManager liveResW], returnValue: %lf", val);
    return _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveResW(self, _cmd);
}
static double _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveFps(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    double val = _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveFps(self, _cmd);
    NSLog(@"[AWEAppLiveSettingManager liveFps], returnValue: %lf", val);
    return _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveFps(self, _cmd);
}
static double _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveMinBitrate(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    double val = _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveMinBitrate(self, _cmd);
    NSLog(@"[AWEAppLiveSettingManager liveMinBitrate], returnValue: %lf", val);
    return _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveMinBitrate(self, _cmd);
}
static double _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveMaxBitrate(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    double val = _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveMaxBitrate(self, _cmd);
    NSLog(@"[AWEAppLiveSettingManager liveMaxBitrate], returnValue: %lf", val);
    return _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveMaxBitrate(self, _cmd);
}
static double _logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveDefaultBitrate(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    double val = _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveDefaultBitrate(self, _cmd);
    NSLog(@"[AWEAppLiveSettingManager liveDefaultBitrate], returnValue: %lf", val);
    return _logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveDefaultBitrate(self, _cmd);
}




@interface AWELiveSetting : NSObject
+ (_Bool)shouldCheckCoins:(_Bool)arg1;
+ (void)setBarrageCoins:(long long)arg1;
+ (long long)barrageCoins;
+ (void)setUserAllCoins:(long long)arg1;
+ (long long)userAllCoins;
@end




static _Bool _logos_meta_method$_ungrouped$AWELiveSetting$shouldCheckCoins$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _Bool arg1) {
    
    return _logos_meta_orig$_ungrouped$AWELiveSetting$shouldCheckCoins$(self, _cmd, arg1);
}
static void _logos_meta_method$_ungrouped$AWELiveSetting$setBarrageCoins$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long arg1) {
    NSLog(@"setBarrageCoins, %lld", arg1);
    _logos_meta_orig$_ungrouped$AWELiveSetting$setBarrageCoins$(self, _cmd, arg1);
}

static long long _logos_meta_method$_ungrouped$AWELiveSetting$barrageCoins(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"barrageCoins");
    return _logos_meta_orig$_ungrouped$AWELiveSetting$barrageCoins(self, _cmd);
}


static void _logos_meta_method$_ungrouped$AWELiveSetting$setUserAllCoins$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long arg1) {
    arg1 = 10000000;
    
    
    
    _logos_meta_orig$_ungrouped$AWELiveSetting$setUserAllCoins$(self, _cmd, arg1);
}

static long long _logos_meta_method$_ungrouped$AWELiveSetting$userAllCoins(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    
    
    
    
    
    
    return _logos_meta_orig$_ungrouped$AWELiveSetting$userAllCoins(self, _cmd);
}




@interface AWELiveTrackEventManager : NSObject
+ (void)trackLiveClickPresent:(id)arg1 isAnchor:(_Bool)arg2 enterFrom:(id)arg3 presentID:(id)arg4 presentCoins:(id)arg5;
+ (void)trackLiveSendPresentSuccess:(id)arg1 isAnchor:(_Bool)arg2 enterFrom:(id)arg3 presentID:(id)arg4 presentCoins:(id)arg5;
@end




static void _logos_meta_method$_ungrouped$AWELiveTrackEventManager$trackLiveClickPresent$isAnchor$enterFrom$presentID$presentCoins$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, _Bool arg2, id arg3, id arg4, id arg5) {
    _logos_meta_orig$_ungrouped$AWELiveTrackEventManager$trackLiveClickPresent$isAnchor$enterFrom$presentID$presentCoins$(self, _cmd, arg1, arg2, arg3, arg4, arg5);
    
    
    NSLog(@"trackLiveClickPresent");
    
}
static void _logos_meta_method$_ungrouped$AWELiveTrackEventManager$trackLiveSendPresentSuccess$isAnchor$enterFrom$presentID$presentCoins$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, _Bool arg2, id arg3, id arg4, id arg5) {
    _logos_meta_orig$_ungrouped$AWELiveTrackEventManager$trackLiveSendPresentSuccess$isAnchor$enterFrom$presentID$presentCoins$(self, _cmd, arg1, arg2, arg3, arg4, arg5);
    NSLog(@"trackLiveSendPresentSuccess!!");
}


@interface AWELiveSendGiftPackage : NSObject
- (void)resetWithPresent:(id)arg1;
@property(copy, nonatomic) NSString *requestId;
@property(nonatomic) long long count;
@property(nonatomic) long long coins;
@property(nonatomic) long long pid;
@end



static void _logos_method$_ungrouped$AWELiveSendGiftPackage$resetWithPresent$(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftPackage* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    
    
    NSLog(@"resetWithPresent, arg1: %@", NSStringFromClass([arg1 class]));
    NSLog(@"count: %lld, coins: %lld, pid: %lld", self.count, self.coins, self.pid);
    NSLog(@"******");
    
    
    _logos_orig$_ungrouped$AWELiveSendGiftPackage$resetWithPresent$(self, _cmd, arg1);
}



@interface AWELiveGiftListDataController : NSObject


- (void)sendPresent:(id)arg1 presentID:(id)arg2 count:(long long)arg3 completion:(id)arg4;
- (void)filterDisplayPresentList;
- (void)_getFreePresentListWithPresentList:(id)arg1 completion:(id)arg2;
- (void)getSandBoxGiftListModel:(id)arg1 completion:(id)arg2;
- (void)getGiftListModelWithCompletion:(id)arg1 roomID:(id)arg2;
- (void)getGiftListModelWithRoom:(id)arg1 completion:(id)arg2;
@end




static void _logos_method$_ungrouped$AWELiveGiftListDataController$sendPresent$presentID$count$completion$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2, long long arg3, id arg4) {
    
    
    NSLog(@"sendPresent.. arg1: %@, arg2: %@, arg3: %lld", arg1, arg2, arg3);
    
    _logos_orig$_ungrouped$AWELiveGiftListDataController$sendPresent$presentID$count$completion$(self, _cmd, arg1, arg2, arg3, NULL);
    
}
static void _logos_method$_ungrouped$AWELiveGiftListDataController$filterDisplayPresentList(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"filterDisplayPresentList");
    _logos_orig$_ungrouped$AWELiveGiftListDataController$filterDisplayPresentList(self, _cmd);
}

static void _logos_method$_ungrouped$AWELiveGiftListDataController$_getFreePresentListWithPresentList$completion$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    
    _logos_orig$_ungrouped$AWELiveGiftListDataController$_getFreePresentListWithPresentList$completion$(self, _cmd, arg1, arg2);
}
static void _logos_method$_ungrouped$AWELiveGiftListDataController$getSandBoxGiftListModel$completion$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    NSLog(@"getSandBoxGiftListModel.. arg1: %@, arg2: %@", arg1, arg2);
    _logos_orig$_ungrouped$AWELiveGiftListDataController$getSandBoxGiftListModel$completion$(self, _cmd, arg1, arg2);
}

static void _logos_method$_ungrouped$AWELiveGiftListDataController$getGiftListModelWithCompletion$roomID$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    
    _logos_orig$_ungrouped$AWELiveGiftListDataController$getGiftListModelWithCompletion$roomID$(self, _cmd, arg1, arg2);
}

static void _logos_method$_ungrouped$AWELiveGiftListDataController$getGiftListModelWithRoom$completion$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListDataController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    
    _logos_orig$_ungrouped$AWELiveGiftListDataController$getGiftListModelWithRoom$completion$(self, _cmd, arg1, arg2);
}





@interface AWELiveSendGiftController : NSObject
@property(nonatomic) _Bool isDuringSendCollecting;
@property(nonatomic) _Bool isDuringClickCollecting;

@property(retain, nonatomic) AWELiveGiftListDataController *dataController;
@property(retain, nonatomic) AWELiveRoomModel *roomModel;
- (_Bool)isAnchor;
- (void)_performSendRequest;
- (void)_prepareSendRequestWithPresent:(id)arg1;
- (void)_performClickTrack;
- (void)_prepareClickTrackWithPreseent:(id)arg1;
- (void)willSendGiftInCollectionView:(id)arg1 atIndexPath:(id)arg2;
@end




static _Bool _logos_method$_ungrouped$AWELiveSendGiftController$isAnchor(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool val = _logos_orig$_ungrouped$AWELiveSendGiftController$isAnchor(self, _cmd);
    NSLog(@"isAnchor: %d", val);
    return _logos_orig$_ungrouped$AWELiveSendGiftController$isAnchor(self, _cmd);
}

static void _logos_method$_ungrouped$AWELiveSendGiftController$_performSendRequest(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"_performSendRequest");
    _logos_orig$_ungrouped$AWELiveSendGiftController$_performSendRequest(self, _cmd);
}

static void _logos_method$_ungrouped$AWELiveSendGiftController$_prepareSendRequestWithPresent$(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    
    
    NSLog(@"_prepareSendRequestWithPresent: arg1: %@", arg1);
    
    _logos_orig$_ungrouped$AWELiveSendGiftController$_prepareSendRequestWithPresent$(self, _cmd, arg1);
}

static void _logos_method$_ungrouped$AWELiveSendGiftController$_performClickTrack(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"_performClickTrack");
    _logos_orig$_ungrouped$AWELiveSendGiftController$_performClickTrack(self, _cmd);
}


static void _logos_method$_ungrouped$AWELiveSendGiftController$_prepareClickTrackWithPreseent$(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    
    NSLog(@"_prepareClickTrackWithPreseent: arg1: %@", arg1);
    
    _logos_orig$_ungrouped$AWELiveSendGiftController$_prepareClickTrackWithPreseent$(self, _cmd, arg1);
}


static void _logos_method$_ungrouped$AWELiveSendGiftController$willSendGiftInCollectionView$atIndexPath$(_LOGOS_SELF_TYPE_NORMAL AWELiveSendGiftController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    
    NSLog(@"willSendGiftInCollectionView: arg1: %@, arg2: %@", arg1, arg2);
    
    _logos_orig$_ungrouped$AWELiveSendGiftController$willSendGiftInCollectionView$atIndexPath$(self, _cmd, arg1, arg2);
}


@interface AWELiveGiftListBottomLandscapeView : UIView
- (void)refreshWalletCoins:(long long)arg1;
@end


static void _logos_method$_ungrouped$AWELiveGiftListBottomLandscapeView$refreshWalletCoins$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListBottomLandscapeView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long arg1) {
    long long val = arg1;
    NSLog(@"refreshWalletCoins, arg1: %lld", val);
    _logos_orig$_ungrouped$AWELiveGiftListBottomLandscapeView$refreshWalletCoins$(self, _cmd, arg1);
}



@interface AWELiveGiftFansEnterView : UIView
- (void)handleProcessWithIntimacy:(id)arg1 presentCoins:(long long)arg2 animationFinishBlock:(id)arg3;
@end


static void _logos_method$_ungrouped$AWELiveGiftFansEnterView$handleProcessWithIntimacy$presentCoins$animationFinishBlock$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftFansEnterView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, long long arg2, id arg3) {
    NSLog(@"handleProcessWithIntimacy, arg1: %@, coins: %lld", arg1, arg2);
    NSLog(@"handleProcessWithIntimacy, arg1 Type: %@", NSStringFromClass([arg1 class]));
    
    _logos_orig$_ungrouped$AWELiveGiftFansEnterView$handleProcessWithIntimacy$presentCoins$animationFinishBlock$(self, _cmd, arg1, arg2, arg3);
    
}




@interface AWELiveFreePresentPropertyManager : NSObject
@property(nonatomic) long long coins; 
+ (id)sharedInstace;

- (void)_consumeFansFreePresentWithPresentId:(id)arg1 count:(long long)arg2;
- (void)setFansFreePresent:(id)arg1;
- (void)consumeFreePresentWithPresentId:(id)arg1 propertIDs:(id)arg2 count:(long long)arg3;
- (id)useFreePresentWithPresentId:(id)arg1 count:(long long)arg2;
- (long long)freeCountForPresentId:(id)arg1;
- (void)fetchFreePresentListWithCompletion:(id)arg1;
- (id)init;
@end


static void _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$_consumeFansFreePresentWithPresentId$count$(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, long long arg2) {
    NSLog(@"_consumeFansFreePresentWithPresentId... coins: %lld", self.coins);
    _logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$_consumeFansFreePresentWithPresentId$count$(self, _cmd, arg1, arg2);
}

static void _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$setFansFreePresent$(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    
    
    _logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$setFansFreePresent$(self, _cmd, arg1);
}
static void _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$consumeFreePresentWithPresentId$propertIDs$count$(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2, long long arg3) {
    NSLog(@"consumeFreePresentWithPresentId... coins: %lld", self.coins);
    _logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$consumeFreePresentWithPresentId$propertIDs$count$(self, _cmd, arg1, arg2, arg3);
}

static id _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$useFreePresentWithPresentId$count$(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, long long arg2) {
    
    
    
    return _logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$useFreePresentWithPresentId$count$(self, _cmd, arg1, arg2);
}

static long long _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$freeCountForPresentId$(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    
    
    
    return _logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$freeCountForPresentId$(self, _cmd, arg1);
}
static void _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$fetchFreePresentListWithCompletion$(_LOGOS_SELF_TYPE_NORMAL AWELiveFreePresentPropertyManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    NSLog(@"fetchFreePresentListWithCompletion... coins: %lld", self.coins);
    _logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$fetchFreePresentListWithCompletion$(self, _cmd, arg1);
}

static AWELiveFreePresentPropertyManager* _logos_method$_ungrouped$AWELiveFreePresentPropertyManager$init(_LOGOS_SELF_TYPE_INIT AWELiveFreePresentPropertyManager* __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {
    NSLog(@"init... coins: %lld", self.coins);
    
    return _logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$init(self, _cmd);
}




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
@property(retain, nonatomic) AWELiveSendGiftController *sendGiftController; 
@property(retain, nonatomic) AWELiveGiftListDataController *dataController;

@property(nonatomic, assign) id  delegate;
@end




static void _logos_method$_ungrouped$AWELiveGiftListViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWELiveGiftListViewController$viewDidLoad(self, _cmd);
}
static void _logos_method$_ungrouped$AWELiveGiftListViewController$refreshWalletCoins(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWELiveGiftListViewController$refreshWalletCoins(self, _cmd);
    NSLog(@"refreshWalletCoins");
}
static void _logos_method$_ungrouped$AWELiveGiftListViewController$didFinishSendPresentRequestWithTotalCoins$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long arg1) {
    _logos_orig$_ungrouped$AWELiveGiftListViewController$didFinishSendPresentRequestWithTotalCoins$(self, _cmd, arg1);
    NSLog(@"didFinishSendPresentRequestWithTotalCoins: totalCoins%lld", arg1);
}

static void _logos_method$_ungrouped$AWELiveGiftListViewController$didSendPresent$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    
    _logos_orig$_ungrouped$AWELiveGiftListViewController$didSendPresent$(self, _cmd, arg1);
    NSLog(@"didSendPresent, %@",NSStringFromClass([arg1 class]));
}

static void _logos_method$_ungrouped$AWELiveGiftListViewController$collectionView$didSelectItemAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    
    NSLog(@"didSelectItem");
    
    
    
    
    
    
    
    
    
    
    
    
    [self.sendGiftController willSendGiftInCollectionView:arg1 atIndexPath:arg2]; 
    
    
}
static void _logos_method$_ungrouped$AWELiveGiftListViewController$_handleFansProcess$presentCoins$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, long long arg2) {
    NSLog(@"_handleFansProcess...arg1: %@, presentCOins: %lld", arg1, arg2);
    _logos_orig$_ungrouped$AWELiveGiftListViewController$_handleFansProcess$presentCoins$(self, _cmd, arg1, arg2);
}

static void _logos_method$_ungrouped$AWELiveGiftListViewController$_fetchGiftListDataAndReloadUI$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _Bool arg1) {
    
    
    _logos_orig$_ungrouped$AWELiveGiftListViewController$_fetchGiftListDataAndReloadUI$(self, _cmd, arg1);
}











static void _logos_method$_ungrouped$AWELiveGiftListViewController$rechargeClicked$(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    _logos_orig$_ungrouped$AWELiveGiftListViewController$rechargeClicked$(self, _cmd, arg1);
    NSLog(@"rechargeClicked");
}
static void _logos_method$_ungrouped$AWELiveGiftListViewController$rechargeSuccessNotiAction(_LOGOS_SELF_TYPE_NORMAL AWELiveGiftListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWELiveGiftListViewController$rechargeSuccessNotiAction(self, _cmd);
    NSLog(@"rechargeSuccessNotiAction");
}




@interface AWELiveWalletManager : NSObject
+ (void)alertForNobalance:(id)arg1 triggerReason:(id)arg2;
+ (id)_getWalletWebURL:(_Bool)arg1;
+ (void)transitionToWalletPageFrom:(_Bool)arg1;
+ (void)getMyWalletWithFinishBlock:(id)arg1;

@end




static void _logos_meta_method$_ungrouped$AWELiveWalletManager$alertForNobalance$triggerReason$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    NSLog(@"[AWELiveWalletManager alertForNobalance], arg1: %@, reason: %@", arg1, arg2);
    _logos_meta_orig$_ungrouped$AWELiveWalletManager$alertForNobalance$triggerReason$(self, _cmd, arg1, arg2);
}
static id _logos_meta_method$_ungrouped$AWELiveWalletManager$_getWalletWebURL$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _Bool arg1) {
    
    
    
    return _logos_meta_orig$_ungrouped$AWELiveWalletManager$_getWalletWebURL$(self, _cmd, arg1);
}
static void _logos_meta_method$_ungrouped$AWELiveWalletManager$transitionToWalletPageFrom$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _Bool arg1) {
    
    
    _logos_meta_orig$_ungrouped$AWELiveWalletManager$transitionToWalletPageFrom$(self, _cmd, arg1);
}


static void _logos_meta_method$_ungrouped$AWELiveWalletManager$getMyWalletWithFinishBlock$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    
    _logos_meta_orig$_ungrouped$AWELiveWalletManager$getMyWalletWithFinishBlock$(self, _cmd, arg1);
}


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
@property(nonatomic) long long withdrawLimit; 
@property(nonatomic) long long todayIncome; 
@property(nonatomic) long long totalIncome; 
@property(nonatomic) long long diamondCount; 
@property(retain, nonatomic) AWEUserModel *user; 
@end




static id _logos_meta_method$_ungrouped$AWELiveMyWalletModel$userJSONTransformer(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    
    
    return _logos_meta_orig$_ungrouped$AWELiveMyWalletModel$userJSONTransformer(self, _cmd);
}
static id _logos_meta_method$_ungrouped$AWELiveMyWalletModel$JSONKeyPathsByPropertyKey(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    
    return _logos_meta_orig$_ungrouped$AWELiveMyWalletModel$JSONKeyPathsByPropertyKey(self, _cmd);
}


@interface AWEAppShareSettingManager : NSObject
+ (id)downloadForbiddenToast;
+ (_Bool)selfSeeingShouldForbidWaterMarkWhenDownload;
+ (_Bool)forbidDownloadLocal;
+ (_Bool)downloadCheckStatus;
@end


static id _logos_meta_method$_ungrouped$AWEAppShareSettingManager$downloadForbiddenToast(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    id val = _logos_meta_orig$_ungrouped$AWEAppShareSettingManager$downloadForbiddenToast(self, _cmd);
    NSLog(@"[AWEAppShareSettingManager] downloadForbiddenToast, returnval: %@", val);
    return _logos_meta_orig$_ungrouped$AWEAppShareSettingManager$downloadForbiddenToast(self, _cmd);
}
static _Bool _logos_meta_method$_ungrouped$AWEAppShareSettingManager$selfSeeingShouldForbidWaterMarkWhenDownload(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool val = _logos_meta_orig$_ungrouped$AWEAppShareSettingManager$selfSeeingShouldForbidWaterMarkWhenDownload(self, _cmd);
    NSLog(@"[AWEAppShareSettingManager] selfSeeingShouldForbidWaterMarkWhenDownload, returnval: %d", val);
    return _logos_meta_orig$_ungrouped$AWEAppShareSettingManager$selfSeeingShouldForbidWaterMarkWhenDownload(self, _cmd);
}
static _Bool _logos_meta_method$_ungrouped$AWEAppShareSettingManager$forbidDownloadLocal(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool val = _logos_meta_orig$_ungrouped$AWEAppShareSettingManager$forbidDownloadLocal(self, _cmd);
    NSLog(@"[AWEAppShareSettingManager] forbidDownloadLocal, returnval: %d", val);
    return _logos_meta_orig$_ungrouped$AWEAppShareSettingManager$forbidDownloadLocal(self, _cmd);
}
static _Bool _logos_meta_method$_ungrouped$AWEAppShareSettingManager$downloadCheckStatus(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    bool val = _logos_meta_orig$_ungrouped$AWEAppShareSettingManager$downloadCheckStatus(self, _cmd);
    NSLog(@"[AWEAppShareSettingManager] downloadCheckStatus, returnval: %d", val);
    return _logos_meta_orig$_ungrouped$AWEAppShareSettingManager$downloadCheckStatus(self, _cmd);
}















static _Bool _logos_method$_ungrouped$AWEVideoRecorderController$shouldEnableLive(_LOGOS_SELF_TYPE_NORMAL AWEVideoRecorderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    BOOL shouldEnableLive = _logos_orig$_ungrouped$AWEVideoRecorderController$shouldEnableLive(self, _cmd);
    NSLog(@"是否可以直播·%ld", shouldEnableLive);
    return YES;
}



static _Bool _logos_method$_ungrouped$AWELiveRoomConfigModel$enableHourlyList$(_LOGOS_SELF_TYPE_NORMAL AWELiveRoomConfigModel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _Bool arg1) {
    _Bool ret = _logos_orig$_ungrouped$AWELiveRoomConfigModel$enableHourlyList$(self, _cmd, arg1);
    NSLog(@"enableHourlyList %ld", ret);
    return ret;
}
static _Bool _logos_method$_ungrouped$AWELiveRoomConfigModel$enableFansClub$(_LOGOS_SELF_TYPE_NORMAL AWELiveRoomConfigModel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _Bool arg1) {
    _Bool ret = _logos_orig$_ungrouped$AWELiveRoomConfigModel$enableFansClub$(self, _cmd, arg1);
    NSLog(@"enableFansClub %ld", ret);
    return ret;
}
static _Bool _logos_method$_ungrouped$AWELiveRoomConfigModel$enableSendBarrage$(_LOGOS_SELF_TYPE_NORMAL AWELiveRoomConfigModel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _Bool arg1) {
    _Bool ret = _logos_orig$_ungrouped$AWELiveRoomConfigModel$enableSendBarrage$(self, _cmd, arg1);
    NSLog(@"enableSendBarrage %ld", ret);
    return ret;
}
static _Bool _logos_method$_ungrouped$AWELiveRoomConfigModel$enableSendShortcutGift$(_LOGOS_SELF_TYPE_NORMAL AWELiveRoomConfigModel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _Bool arg1) {
    _Bool ret = _logos_orig$_ungrouped$AWELiveRoomConfigModel$enableSendShortcutGift$(self, _cmd, arg1);
    NSLog(@"enableSendShortcutGift %ld", ret);
    return ret;
}
static _Bool _logos_method$_ungrouped$AWELiveRoomConfigModel$enableSendGiftGuide$(_LOGOS_SELF_TYPE_NORMAL AWELiveRoomConfigModel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _Bool arg1) {
    _Bool ret = _logos_orig$_ungrouped$AWELiveRoomConfigModel$enableSendGiftGuide$(self, _cmd, arg1);
    NSLog(@"enableSendGiftGuide %ld", ret);
    return ret;
}
static _Bool _logos_method$_ungrouped$AWELiveRoomConfigModel$enableSendGift$(_LOGOS_SELF_TYPE_NORMAL AWELiveRoomConfigModel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _Bool arg1) {
    _Bool ret = _logos_orig$_ungrouped$AWELiveRoomConfigModel$enableSendGift$(self, _cmd, arg1);
    NSLog(@"enableSendGift %ld", ret);
    return ret;
}
static _Bool _logos_method$_ungrouped$AWELiveRoomConfigModel$enableSendComment$(_LOGOS_SELF_TYPE_NORMAL AWELiveRoomConfigModel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _Bool arg1) {
    _Bool ret = _logos_orig$_ungrouped$AWELiveRoomConfigModel$enableSendComment$(self, _cmd, arg1);
    NSLog(@"enableSendComment %ld", ret);
    return ret;
}
static _Bool _logos_method$_ungrouped$AWELiveRoomConfigModel$enableShare$(_LOGOS_SELF_TYPE_NORMAL AWELiveRoomConfigModel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _Bool arg1) {
    _Bool ret = _logos_orig$_ungrouped$AWELiveRoomConfigModel$enableShare$(self, _cmd, arg1);
    NSLog(@"enableShare %ld", ret);
    return ret;
}
static _Bool _logos_method$_ungrouped$AWELiveRoomConfigModel$enableEmoji$(_LOGOS_SELF_TYPE_NORMAL AWELiveRoomConfigModel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _Bool arg1) {
    _Bool ret = _logos_orig$_ungrouped$AWELiveRoomConfigModel$enableEmoji$(self, _cmd, arg1);
    NSLog(@"enableEmoji %ld", ret);
    return ret;
}


 
static id _logos_meta_method$_ungrouped$IESLiveDeviceInfo$carrierMCCMNC(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    id obj = _logos_meta_orig$_ungrouped$IESLiveDeviceInfo$carrierMCCMNC(self, _cmd);
    return obj;
}
static id _logos_meta_method$_ungrouped$IESLiveDeviceInfo$carrierMNC(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    id obj = _logos_meta_orig$_ungrouped$IESLiveDeviceInfo$carrierMNC(self, _cmd);
    return obj;
}
static id _logos_meta_method$_ungrouped$IESLiveDeviceInfo$carrierMCC(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    id obj = _logos_meta_orig$_ungrouped$IESLiveDeviceInfo$carrierMCC(self, _cmd);
    return obj;
}
static id _logos_meta_method$_ungrouped$IESLiveDeviceInfo$carrierName(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    id obj = _logos_meta_orig$_ungrouped$IESLiveDeviceInfo$carrierName(self, _cmd);
    return obj;
}





static __attribute__((constructor)) void _logosLocalCtor_3546ab44(int __unused argc, char __unused **argv, char __unused **envp)
{
    notificationCallback(NULL, NULL, NULL, NULL, NULL);
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                    NULL,
                                    notificationCallback,
                                    CFSTR(kAwemeDylibNotificationName),
                                    NULL,
                                    CFNotificationSuspensionBehaviorCoalesce);
    {Class _logos_class$_ungrouped$AWEFeedTableViewController = objc_getClass("AWEFeedTableViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(viewDidDisappear:), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$viewDidDisappear$, (IMP*)&_logos_orig$_ungrouped$AWEFeedTableViewController$viewDidDisappear$);MSHookMessageEx(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(viewWillAppear:), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$viewWillAppear$, (IMP*)&_logos_orig$_ungrouped$AWEFeedTableViewController$viewWillAppear$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(NSNotification *), strlen(@encode(NSNotification *))); i += strlen(@encode(NSNotification *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(xy_savePhoto:), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$xy_savePhoto$, _typeEncoding); }{ char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(XYVideoDownloader *)); class_addMethod(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(xy_downloader), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$xy_downloader, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(XYVideoDownloader *)); class_addMethod(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(setXy_downloader:), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$setXy_downloader, _typeEncoding); } Class _logos_class$_ungrouped$AWEAwemePlayInteractionViewController = objc_getClass("AWEAwemePlayInteractionViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(performLikeAction), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$performLikeAction, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$performLikeAction);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(onVideoPlayerViewDoubleClicked:), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$onVideoPlayerViewDoubleClicked$, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$onVideoPlayerViewDoubleClicked$);Class _logos_class$_ungrouped$AWEFeedCellViewController = objc_getClass("AWEFeedCellViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEFeedCellViewController, @selector(_onVideoPlayerViewClicked:), (IMP)&_logos_method$_ungrouped$AWEFeedCellViewController$_onVideoPlayerViewClicked$, (IMP*)&_logos_orig$_ungrouped$AWEFeedCellViewController$_onVideoPlayerViewClicked$);Class _logos_class$_ungrouped$AWEAwemePlayInteractionPresenter = objc_getClass("AWEAwemePlayInteractionPresenter"); MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayInteractionPresenter, @selector(enterMusicDetail:), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionPresenter$enterMusicDetail$, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayInteractionPresenter$enterMusicDetail$);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayInteractionPresenter, @selector(p_goToPersonalPage:gestureRecognizer:), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionPresenter$p_goToPersonalPage$gestureRecognizer$, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayInteractionPresenter$p_goToPersonalPage$gestureRecognizer$);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayInteractionPresenter, @selector(onUnFollowViewClicked:), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionPresenter$onUnFollowViewClicked$, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayInteractionPresenter$onUnFollowViewClicked$);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayInteractionPresenter, @selector(onFollowViewClicked:), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionPresenter$onFollowViewClicked$, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayInteractionPresenter$onFollowViewClicked$);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayInteractionPresenter, @selector(alertIfCanNotComment), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionPresenter$alertIfCanNotComment, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayInteractionPresenter$alertIfCanNotComment);Class _logos_class$_ungrouped$AWEAwemeBaseViewController = objc_getClass("AWEAwemeBaseViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeBaseViewController, @selector(alertIfNotValid), (IMP)&_logos_method$_ungrouped$AWEAwemeBaseViewController$alertIfNotValid, (IMP*)&_logos_orig$_ungrouped$AWEAwemeBaseViewController$alertIfNotValid);Class _logos_class$_ungrouped$AWEShareCollectionView = objc_getClass("AWEShareCollectionView"); MSHookMessageEx(_logos_class$_ungrouped$AWEShareCollectionView, @selector(sendEvents:toItemAtIndexPath:), (IMP)&_logos_method$_ungrouped$AWEShareCollectionView$sendEvents$toItemAtIndexPath$, (IMP*)&_logos_orig$_ungrouped$AWEShareCollectionView$sendEvents$toItemAtIndexPath$);MSHookMessageEx(_logos_class$_ungrouped$AWEShareCollectionView, @selector(collectionView:didSelectItemAtIndexPath:), (IMP)&_logos_method$_ungrouped$AWEShareCollectionView$collectionView$didSelectItemAtIndexPath$, (IMP*)&_logos_orig$_ungrouped$AWEShareCollectionView$collectionView$didSelectItemAtIndexPath$);MSHookMessageEx(_logos_class$_ungrouped$AWEShareCollectionView, @selector(initWithItems:hostView:), (IMP)&_logos_method$_ungrouped$AWEShareCollectionView$initWithItems$hostView$, (IMP*)&_logos_orig$_ungrouped$AWEShareCollectionView$initWithItems$hostView$);Class _logos_class$_ungrouped$AWEFeedContainerViewController = objc_getClass("AWEFeedContainerViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEFeedContainerViewController, @selector(onDiscoverButtonClicked:), (IMP)&_logos_method$_ungrouped$AWEFeedContainerViewController$onDiscoverButtonClicked$, (IMP*)&_logos_orig$_ungrouped$AWEFeedContainerViewController$onDiscoverButtonClicked$);Class _logos_class$_ungrouped$AWEDiscoverFeedEntranceView = objc_getClass("AWEDiscoverFeedEntranceView"); MSHookMessageEx(_logos_class$_ungrouped$AWEDiscoverFeedEntranceView, @selector(awe_UITracker_gestureRecognizer:), (IMP)&_logos_method$_ungrouped$AWEDiscoverFeedEntranceView$awe_UITracker_gestureRecognizer$, (IMP*)&_logos_orig$_ungrouped$AWEDiscoverFeedEntranceView$awe_UITracker_gestureRecognizer$);Class _logos_class$_ungrouped$AVMDLDataLoader = objc_getClass("AVMDLDataLoader"); MSHookMessageEx(_logos_class$_ungrouped$AVMDLDataLoader, @selector(_supportPoxy:), (IMP)&_logos_method$_ungrouped$AVMDLDataLoader$_supportPoxy$, (IMP*)&_logos_orig$_ungrouped$AVMDLDataLoader$_supportPoxy$);MSHookMessageEx(_logos_class$_ungrouped$AVMDLDataLoader, @selector(getCacheFileInfo:filePath:), (IMP)&_logos_method$_ungrouped$AVMDLDataLoader$getCacheFileInfo$filePath$, (IMP*)&_logos_orig$_ungrouped$AVMDLDataLoader$getCacheFileInfo$filePath$);MSHookMessageEx(_logos_class$_ungrouped$AVMDLDataLoader, @selector(getCacheFileInfo:), (IMP)&_logos_method$_ungrouped$AVMDLDataLoader$getCacheFileInfo$, (IMP*)&_logos_orig$_ungrouped$AVMDLDataLoader$getCacheFileInfo$);MSHookMessageEx(_logos_class$_ungrouped$AVMDLDataLoader, @selector(stop), (IMP)&_logos_method$_ungrouped$AVMDLDataLoader$stop, (IMP*)&_logos_orig$_ungrouped$AVMDLDataLoader$stop);MSHookMessageEx(_logos_class$_ungrouped$AVMDLDataLoader, @selector(start:), (IMP)&_logos_method$_ungrouped$AVMDLDataLoader$start$, (IMP*)&_logos_orig$_ungrouped$AVMDLDataLoader$start$);Class _logos_class$_ungrouped$AWEENV = objc_getClass("AWEENV"); Class _logos_metaclass$_ungrouped$AWEENV = object_getClass(_logos_class$_ungrouped$AWEENV); MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(isDebugEnv), (IMP)&_logos_meta_method$_ungrouped$AWEENV$isDebugEnv, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$isDebugEnv);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(isBetaEnv), (IMP)&_logos_meta_method$_ungrouped$AWEENV$isBetaEnv, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$isBetaEnv);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(isTestEnv), (IMP)&_logos_meta_method$_ungrouped$AWEENV$isTestEnv, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$isTestEnv);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(isI18N), (IMP)&_logos_meta_method$_ungrouped$AWEENV$isI18N, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$isI18N);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(isTiktok), (IMP)&_logos_meta_method$_ungrouped$AWEENV$isTiktok, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$isTiktok);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(isMusically), (IMP)&_logos_meta_method$_ungrouped$AWEENV$isMusically, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$isMusically);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(isDouyin), (IMP)&_logos_meta_method$_ungrouped$AWEENV$isDouyin, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$isDouyin);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(plistChannel), (IMP)&_logos_meta_method$_ungrouped$AWEENV$plistChannel, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$plistChannel);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(isTestFlight), (IMP)&_logos_meta_method$_ungrouped$AWEENV$isTestFlight, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$isTestFlight);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(isStaff), (IMP)&_logos_meta_method$_ungrouped$AWEENV$isStaff, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$isStaff);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(channel), (IMP)&_logos_meta_method$_ungrouped$AWEENV$channel, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$channel);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(product), (IMP)&_logos_meta_method$_ungrouped$AWEENV$product, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$product);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(isDebugEvn), (IMP)&_logos_meta_method$_ungrouped$AWEENV$isDebugEvn, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$isDebugEvn);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(isBetaEvn), (IMP)&_logos_meta_method$_ungrouped$AWEENV$isBetaEvn, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$isBetaEvn);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEENV, @selector(isTestEvn), (IMP)&_logos_meta_method$_ungrouped$AWEENV$isTestEvn, (IMP*)&_logos_meta_orig$_ungrouped$AWEENV$isTestEvn);Class _logos_class$_ungrouped$AWEAwemeModel = objc_getClass("AWEAwemeModel"); MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeModel, @selector(disableDownload), (IMP)&_logos_method$_ungrouped$AWEAwemeModel$disableDownload, (IMP*)&_logos_orig$_ungrouped$AWEAwemeModel$disableDownload);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeModel, @selector(canBeReposted), (IMP)&_logos_method$_ungrouped$AWEAwemeModel$canBeReposted, (IMP*)&_logos_orig$_ungrouped$AWEAwemeModel$canBeReposted);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeModel, @selector(videoCommentStauts), (IMP)&_logos_method$_ungrouped$AWEAwemeModel$videoCommentStauts, (IMP*)&_logos_orig$_ungrouped$AWEAwemeModel$videoCommentStauts);Class _logos_class$_ungrouped$AWESlidingTabbarView = objc_getClass("AWESlidingTabbarView"); MSHookMessageEx(_logos_class$_ungrouped$AWESlidingTabbarView, @selector(tabButtonClicked:), (IMP)&_logos_method$_ungrouped$AWESlidingTabbarView$tabButtonClicked$, (IMP*)&_logos_orig$_ungrouped$AWESlidingTabbarView$tabButtonClicked$);Class _logos_class$_ungrouped$BDDiamondAfterHeatManager = objc_getClass("BDDiamondAfterHeatManager"); Class _logos_metaclass$_ungrouped$BDDiamondAfterHeatManager = object_getClass(_logos_class$_ungrouped$BDDiamondAfterHeatManager); MSHookMessageEx(_logos_metaclass$_ungrouped$BDDiamondAfterHeatManager, @selector(sharedInstance), (IMP)&_logos_meta_method$_ungrouped$BDDiamondAfterHeatManager$sharedInstance, (IMP*)&_logos_meta_orig$_ungrouped$BDDiamondAfterHeatManager$sharedInstance);MSHookMessageEx(_logos_class$_ungrouped$BDDiamondAfterHeatManager, @selector(userLoginAction), (IMP)&_logos_method$_ungrouped$BDDiamondAfterHeatManager$userLoginAction, (IMP*)&_logos_orig$_ungrouped$BDDiamondAfterHeatManager$userLoginAction);MSHookMessageEx(_logos_class$_ungrouped$BDDiamondAfterHeatManager, @selector(userLogoutAction), (IMP)&_logos_method$_ungrouped$BDDiamondAfterHeatManager$userLogoutAction, (IMP*)&_logos_orig$_ungrouped$BDDiamondAfterHeatManager$userLogoutAction);MSHookMessageEx(_logos_class$_ungrouped$BDDiamondAfterHeatManager, @selector(clearHeatCacheData), (IMP)&_logos_method$_ungrouped$BDDiamondAfterHeatManager$clearHeatCacheData, (IMP*)&_logos_orig$_ungrouped$BDDiamondAfterHeatManager$clearHeatCacheData);MSHookMessageEx(_logos_class$_ungrouped$BDDiamondAfterHeatManager, @selector(currentLoginUID), (IMP)&_logos_method$_ungrouped$BDDiamondAfterHeatManager$currentLoginUID, (IMP*)&_logos_orig$_ungrouped$BDDiamondAfterHeatManager$currentLoginUID);Class _logos_class$_ungrouped$AWELoginWindowManager = objc_getClass("AWELoginWindowManager"); Class _logos_metaclass$_ungrouped$AWELoginWindowManager = object_getClass(_logos_class$_ungrouped$AWELoginWindowManager); MSHookMessageEx(_logos_metaclass$_ungrouped$AWELoginWindowManager, @selector(sharedManager), (IMP)&_logos_meta_method$_ungrouped$AWELoginWindowManager$sharedManager, (IMP*)&_logos_meta_orig$_ungrouped$AWELoginWindowManager$sharedManager);MSHookMessageEx(_logos_class$_ungrouped$AWELoginWindowManager, @selector(requestSettings), (IMP)&_logos_method$_ungrouped$AWELoginWindowManager$requestSettings, (IMP*)&_logos_orig$_ungrouped$AWELoginWindowManager$requestSettings);MSHookMessageEx(_logos_class$_ungrouped$AWELoginWindowManager, @selector(loginSettingsModelArray), (IMP)&_logos_method$_ungrouped$AWELoginWindowManager$loginSettingsModelArray, (IMP*)&_logos_orig$_ungrouped$AWELoginWindowManager$loginSettingsModelArray);MSHookMessageEx(_logos_class$_ungrouped$AWELoginWindowManager, @selector(dismiss), (IMP)&_logos_method$_ungrouped$AWELoginWindowManager$dismiss, (IMP*)&_logos_orig$_ungrouped$AWELoginWindowManager$dismiss);MSHookMessageEx(_logos_class$_ungrouped$AWELoginWindowManager, @selector(didFinishLogin), (IMP)&_logos_method$_ungrouped$AWELoginWindowManager$didFinishLogin, (IMP*)&_logos_orig$_ungrouped$AWELoginWindowManager$didFinishLogin);MSHookMessageEx(_logos_class$_ungrouped$AWELoginWindowManager, @selector(showLoginViewControllerWithParamsDict:), (IMP)&_logos_method$_ungrouped$AWELoginWindowManager$showLoginViewControllerWithParamsDict$, (IMP*)&_logos_orig$_ungrouped$AWELoginWindowManager$showLoginViewControllerWithParamsDict$);MSHookMessageEx(_logos_class$_ungrouped$AWELoginWindowManager, @selector(makeKeyAndVisible), (IMP)&_logos_method$_ungrouped$AWELoginWindowManager$makeKeyAndVisible, (IMP*)&_logos_orig$_ungrouped$AWELoginWindowManager$makeKeyAndVisible);Class _logos_class$_ungrouped$AWEIMMessageBaseViewController = objc_getClass("AWEIMMessageBaseViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEIMMessageBaseViewController, @selector(didSendContent:mentionUsers:textView:userInfo:), (IMP)&_logos_method$_ungrouped$AWEIMMessageBaseViewController$didSendContent$mentionUsers$textView$userInfo$, (IMP*)&_logos_orig$_ungrouped$AWEIMMessageBaseViewController$didSendContent$mentionUsers$textView$userInfo$);Class _logos_class$_ungrouped$AWEIMMessageListViewController = objc_getClass("AWEIMMessageListViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEIMMessageListViewController, @selector(setConversation:), (IMP)&_logos_method$_ungrouped$AWEIMMessageListViewController$setConversation$, (IMP*)&_logos_orig$_ungrouped$AWEIMMessageListViewController$setConversation$);Class _logos_class$_ungrouped$TTInstallDeviceHelper = objc_getClass("TTInstallDeviceHelper"); Class _logos_metaclass$_ungrouped$TTInstallDeviceHelper = object_getClass(_logos_class$_ungrouped$TTInstallDeviceHelper); MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(timeStamp), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$timeStamp, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$timeStamp);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(saveOpenUDIDToKeychain:), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$saveOpenUDIDToKeychain$, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$saveOpenUDIDToKeychain$);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(fetchOpenUDIDFromKeychain), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$fetchOpenUDIDFromKeychain, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$fetchOpenUDIDFromKeychain);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(resolutionString), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$resolutionString, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$resolutionString);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(resolution), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$resolution, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$resolution);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(screenScale), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$screenScale, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$screenScale);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(ssOnePixel), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$ssOnePixel, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$ssOnePixel);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(openUDID), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$openUDID, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$openUDID);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(currentLanguage), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$currentLanguage, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$currentLanguage);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(MACAddress), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$MACAddress, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$MACAddress);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(OSVersionNumber), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$OSVersionNumber, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$OSVersionNumber);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(idfvString), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$idfvString, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$idfvString);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(idfaString), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$idfaString, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$idfaString);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(getDeviceType), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$getDeviceType, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$getDeviceType);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(isJailBroken), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$isJailBroken, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$isJailBroken);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(platformName), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$platformName, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$platformName);Class _logos_class$_ungrouped$ANSMetadata = objc_getClass("ANSMetadata"); MSHookMessageEx(_logos_class$_ungrouped$ANSMetadata, @selector(computeIsJailbroken), (IMP)&_logos_method$_ungrouped$ANSMetadata$computeIsJailbroken, (IMP*)&_logos_orig$_ungrouped$ANSMetadata$computeIsJailbroken);Class _logos_class$_ungrouped$HMDInfo = objc_getClass("HMDInfo"); MSHookMessageEx(_logos_class$_ungrouped$HMDInfo, @selector(isJailBroken), (IMP)&_logos_method$_ungrouped$HMDInfo$isJailBroken, (IMP*)&_logos_orig$_ungrouped$HMDInfo$isJailBroken);Class _logos_class$_ungrouped$UIDevice = objc_getClass("UIDevice"); MSHookMessageEx(_logos_class$_ungrouped$UIDevice, @selector(btd_isJailBroken), (IMP)&_logos_method$_ungrouped$UIDevice$btd_isJailBroken, (IMP*)&_logos_orig$_ungrouped$UIDevice$btd_isJailBroken);Class _logos_class$_ungrouped$NSFileManager = objc_getClass("NSFileManager"); MSHookMessageEx(_logos_class$_ungrouped$NSFileManager, @selector(fileExistsAtPath:), (IMP)&_logos_method$_ungrouped$NSFileManager$fileExistsAtPath$, (IMP*)&_logos_orig$_ungrouped$NSFileManager$fileExistsAtPath$);Class _logos_class$_ungrouped$NSString = objc_getClass("NSString"); MSHookMessageEx(_logos_class$_ungrouped$NSString, @selector(containsString:), (IMP)&_logos_method$_ungrouped$NSString$containsString$, (IMP*)&_logos_orig$_ungrouped$NSString$containsString$);Class _logos_class$_ungrouped$AWEAwemeDetailTableViewController = objc_getClass("AWEAwemeDetailTableViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(currentDisplayingAweme), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$currentDisplayingAweme, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$currentDisplayingAweme);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(viewDidDisappear:), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$viewDidDisappear$, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$viewDidDisappear$);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(viewWillAppear:), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$viewWillAppear$, (IMP*)&_logos_orig$_ungrouped$AWEAwemeDetailTableViewController$viewWillAppear$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(NSNotification *), strlen(@encode(NSNotification *))); i += strlen(@encode(NSNotification *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(xy_savePhoto:), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$xy_savePhoto$, _typeEncoding); }{ char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(NSIndexPath *)); class_addMethod(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(xy_lastAutoScrollIndexPath), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$xy_lastAutoScrollIndexPath, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(NSIndexPath *)); class_addMethod(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(setXy_lastAutoScrollIndexPath:), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$setXy_lastAutoScrollIndexPath, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(XYVideoDownloader *)); class_addMethod(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(xy_downloader), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$xy_downloader, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(XYVideoDownloader *)); class_addMethod(_logos_class$_ungrouped$AWEAwemeDetailTableViewController, @selector(setXy_downloader:), (IMP)&_logos_method$_ungrouped$AWEAwemeDetailTableViewController$setXy_downloader, _typeEncoding); } Class _logos_class$_ungrouped$AWEUIResponder = objc_getClass("AWEUIResponder"); Class _logos_metaclass$_ungrouped$AWEUIResponder = object_getClass(_logos_class$_ungrouped$AWEUIResponder); MSHookMessageEx(_logos_metaclass$_ungrouped$AWEUIResponder, @selector(topViewControllerForController:), (IMP)&_logos_meta_method$_ungrouped$AWEUIResponder$topViewControllerForController$, (IMP*)&_logos_meta_orig$_ungrouped$AWEUIResponder$topViewControllerForController$);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEUIResponder, @selector(topViewController), (IMP)&_logos_meta_method$_ungrouped$AWEUIResponder$topViewController, (IMP*)&_logos_meta_orig$_ungrouped$AWEUIResponder$topViewController);Class _logos_class$_ungrouped$AWELiveInteractViewController = objc_getClass("AWELiveInteractViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWELiveInteractViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$AWELiveInteractViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$AWELiveInteractViewController$viewDidLoad);Class _logos_class$_ungrouped$AWEAppLiveSettingManager = objc_getClass("AWEAppLiveSettingManager"); Class _logos_metaclass$_ungrouped$AWEAppLiveSettingManager = object_getClass(_logos_class$_ungrouped$AWEAppLiveSettingManager); MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppLiveSettingManager, @selector(disableNewPayment), (IMP)&_logos_meta_method$_ungrouped$AWEAppLiveSettingManager$disableNewPayment, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$disableNewPayment);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppLiveSettingManager, @selector(newWalletConf), (IMP)&_logos_meta_method$_ungrouped$AWEAppLiveSettingManager$newWalletConf, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$newWalletConf);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppLiveSettingManager, @selector(showSkylightAnimation), (IMP)&_logos_meta_method$_ungrouped$AWEAppLiveSettingManager$showSkylightAnimation, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$showSkylightAnimation);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppLiveSettingManager, @selector(disableLiveCDNNodeSelection), (IMP)&_logos_meta_method$_ungrouped$AWEAppLiveSettingManager$disableLiveCDNNodeSelection, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$disableLiveCDNNodeSelection);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppLiveSettingManager, @selector(isLivePodcast), (IMP)&_logos_meta_method$_ungrouped$AWEAppLiveSettingManager$isLivePodcast, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$isLivePodcast);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppLiveSettingManager, @selector(liveResH), (IMP)&_logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveResH, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveResH);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppLiveSettingManager, @selector(liveResW), (IMP)&_logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveResW, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveResW);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppLiveSettingManager, @selector(liveFps), (IMP)&_logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveFps, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveFps);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppLiveSettingManager, @selector(liveMinBitrate), (IMP)&_logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveMinBitrate, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveMinBitrate);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppLiveSettingManager, @selector(liveMaxBitrate), (IMP)&_logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveMaxBitrate, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveMaxBitrate);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppLiveSettingManager, @selector(liveDefaultBitrate), (IMP)&_logos_meta_method$_ungrouped$AWEAppLiveSettingManager$liveDefaultBitrate, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppLiveSettingManager$liveDefaultBitrate);Class _logos_class$_ungrouped$AWELiveSetting = objc_getClass("AWELiveSetting"); Class _logos_metaclass$_ungrouped$AWELiveSetting = object_getClass(_logos_class$_ungrouped$AWELiveSetting); MSHookMessageEx(_logos_metaclass$_ungrouped$AWELiveSetting, @selector(shouldCheckCoins:), (IMP)&_logos_meta_method$_ungrouped$AWELiveSetting$shouldCheckCoins$, (IMP*)&_logos_meta_orig$_ungrouped$AWELiveSetting$shouldCheckCoins$);MSHookMessageEx(_logos_metaclass$_ungrouped$AWELiveSetting, @selector(setBarrageCoins:), (IMP)&_logos_meta_method$_ungrouped$AWELiveSetting$setBarrageCoins$, (IMP*)&_logos_meta_orig$_ungrouped$AWELiveSetting$setBarrageCoins$);MSHookMessageEx(_logos_metaclass$_ungrouped$AWELiveSetting, @selector(barrageCoins), (IMP)&_logos_meta_method$_ungrouped$AWELiveSetting$barrageCoins, (IMP*)&_logos_meta_orig$_ungrouped$AWELiveSetting$barrageCoins);MSHookMessageEx(_logos_metaclass$_ungrouped$AWELiveSetting, @selector(setUserAllCoins:), (IMP)&_logos_meta_method$_ungrouped$AWELiveSetting$setUserAllCoins$, (IMP*)&_logos_meta_orig$_ungrouped$AWELiveSetting$setUserAllCoins$);MSHookMessageEx(_logos_metaclass$_ungrouped$AWELiveSetting, @selector(userAllCoins), (IMP)&_logos_meta_method$_ungrouped$AWELiveSetting$userAllCoins, (IMP*)&_logos_meta_orig$_ungrouped$AWELiveSetting$userAllCoins);Class _logos_class$_ungrouped$AWELiveTrackEventManager = objc_getClass("AWELiveTrackEventManager"); Class _logos_metaclass$_ungrouped$AWELiveTrackEventManager = object_getClass(_logos_class$_ungrouped$AWELiveTrackEventManager); MSHookMessageEx(_logos_metaclass$_ungrouped$AWELiveTrackEventManager, @selector(trackLiveClickPresent:isAnchor:enterFrom:presentID:presentCoins:), (IMP)&_logos_meta_method$_ungrouped$AWELiveTrackEventManager$trackLiveClickPresent$isAnchor$enterFrom$presentID$presentCoins$, (IMP*)&_logos_meta_orig$_ungrouped$AWELiveTrackEventManager$trackLiveClickPresent$isAnchor$enterFrom$presentID$presentCoins$);MSHookMessageEx(_logos_metaclass$_ungrouped$AWELiveTrackEventManager, @selector(trackLiveSendPresentSuccess:isAnchor:enterFrom:presentID:presentCoins:), (IMP)&_logos_meta_method$_ungrouped$AWELiveTrackEventManager$trackLiveSendPresentSuccess$isAnchor$enterFrom$presentID$presentCoins$, (IMP*)&_logos_meta_orig$_ungrouped$AWELiveTrackEventManager$trackLiveSendPresentSuccess$isAnchor$enterFrom$presentID$presentCoins$);Class _logos_class$_ungrouped$AWELiveSendGiftPackage = objc_getClass("AWELiveSendGiftPackage"); MSHookMessageEx(_logos_class$_ungrouped$AWELiveSendGiftPackage, @selector(resetWithPresent:), (IMP)&_logos_method$_ungrouped$AWELiveSendGiftPackage$resetWithPresent$, (IMP*)&_logos_orig$_ungrouped$AWELiveSendGiftPackage$resetWithPresent$);Class _logos_class$_ungrouped$AWELiveGiftListDataController = objc_getClass("AWELiveGiftListDataController"); MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListDataController, @selector(sendPresent:presentID:count:completion:), (IMP)&_logos_method$_ungrouped$AWELiveGiftListDataController$sendPresent$presentID$count$completion$, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListDataController$sendPresent$presentID$count$completion$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListDataController, @selector(filterDisplayPresentList), (IMP)&_logos_method$_ungrouped$AWELiveGiftListDataController$filterDisplayPresentList, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListDataController$filterDisplayPresentList);MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListDataController, @selector(_getFreePresentListWithPresentList:completion:), (IMP)&_logos_method$_ungrouped$AWELiveGiftListDataController$_getFreePresentListWithPresentList$completion$, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListDataController$_getFreePresentListWithPresentList$completion$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListDataController, @selector(getSandBoxGiftListModel:completion:), (IMP)&_logos_method$_ungrouped$AWELiveGiftListDataController$getSandBoxGiftListModel$completion$, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListDataController$getSandBoxGiftListModel$completion$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListDataController, @selector(getGiftListModelWithCompletion:roomID:), (IMP)&_logos_method$_ungrouped$AWELiveGiftListDataController$getGiftListModelWithCompletion$roomID$, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListDataController$getGiftListModelWithCompletion$roomID$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListDataController, @selector(getGiftListModelWithRoom:completion:), (IMP)&_logos_method$_ungrouped$AWELiveGiftListDataController$getGiftListModelWithRoom$completion$, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListDataController$getGiftListModelWithRoom$completion$);Class _logos_class$_ungrouped$AWELiveSendGiftController = objc_getClass("AWELiveSendGiftController"); MSHookMessageEx(_logos_class$_ungrouped$AWELiveSendGiftController, @selector(isAnchor), (IMP)&_logos_method$_ungrouped$AWELiveSendGiftController$isAnchor, (IMP*)&_logos_orig$_ungrouped$AWELiveSendGiftController$isAnchor);MSHookMessageEx(_logos_class$_ungrouped$AWELiveSendGiftController, @selector(_performSendRequest), (IMP)&_logos_method$_ungrouped$AWELiveSendGiftController$_performSendRequest, (IMP*)&_logos_orig$_ungrouped$AWELiveSendGiftController$_performSendRequest);MSHookMessageEx(_logos_class$_ungrouped$AWELiveSendGiftController, @selector(_prepareSendRequestWithPresent:), (IMP)&_logos_method$_ungrouped$AWELiveSendGiftController$_prepareSendRequestWithPresent$, (IMP*)&_logos_orig$_ungrouped$AWELiveSendGiftController$_prepareSendRequestWithPresent$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveSendGiftController, @selector(_performClickTrack), (IMP)&_logos_method$_ungrouped$AWELiveSendGiftController$_performClickTrack, (IMP*)&_logos_orig$_ungrouped$AWELiveSendGiftController$_performClickTrack);MSHookMessageEx(_logos_class$_ungrouped$AWELiveSendGiftController, @selector(_prepareClickTrackWithPreseent:), (IMP)&_logos_method$_ungrouped$AWELiveSendGiftController$_prepareClickTrackWithPreseent$, (IMP*)&_logos_orig$_ungrouped$AWELiveSendGiftController$_prepareClickTrackWithPreseent$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveSendGiftController, @selector(willSendGiftInCollectionView:atIndexPath:), (IMP)&_logos_method$_ungrouped$AWELiveSendGiftController$willSendGiftInCollectionView$atIndexPath$, (IMP*)&_logos_orig$_ungrouped$AWELiveSendGiftController$willSendGiftInCollectionView$atIndexPath$);Class _logos_class$_ungrouped$AWELiveGiftListBottomLandscapeView = objc_getClass("AWELiveGiftListBottomLandscapeView"); MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListBottomLandscapeView, @selector(refreshWalletCoins:), (IMP)&_logos_method$_ungrouped$AWELiveGiftListBottomLandscapeView$refreshWalletCoins$, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListBottomLandscapeView$refreshWalletCoins$);Class _logos_class$_ungrouped$AWELiveGiftFansEnterView = objc_getClass("AWELiveGiftFansEnterView"); MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftFansEnterView, @selector(handleProcessWithIntimacy:presentCoins:animationFinishBlock:), (IMP)&_logos_method$_ungrouped$AWELiveGiftFansEnterView$handleProcessWithIntimacy$presentCoins$animationFinishBlock$, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftFansEnterView$handleProcessWithIntimacy$presentCoins$animationFinishBlock$);Class _logos_class$_ungrouped$AWELiveFreePresentPropertyManager = objc_getClass("AWELiveFreePresentPropertyManager"); MSHookMessageEx(_logos_class$_ungrouped$AWELiveFreePresentPropertyManager, @selector(_consumeFansFreePresentWithPresentId:count:), (IMP)&_logos_method$_ungrouped$AWELiveFreePresentPropertyManager$_consumeFansFreePresentWithPresentId$count$, (IMP*)&_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$_consumeFansFreePresentWithPresentId$count$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveFreePresentPropertyManager, @selector(setFansFreePresent:), (IMP)&_logos_method$_ungrouped$AWELiveFreePresentPropertyManager$setFansFreePresent$, (IMP*)&_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$setFansFreePresent$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveFreePresentPropertyManager, @selector(consumeFreePresentWithPresentId:propertIDs:count:), (IMP)&_logos_method$_ungrouped$AWELiveFreePresentPropertyManager$consumeFreePresentWithPresentId$propertIDs$count$, (IMP*)&_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$consumeFreePresentWithPresentId$propertIDs$count$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveFreePresentPropertyManager, @selector(useFreePresentWithPresentId:count:), (IMP)&_logos_method$_ungrouped$AWELiveFreePresentPropertyManager$useFreePresentWithPresentId$count$, (IMP*)&_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$useFreePresentWithPresentId$count$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveFreePresentPropertyManager, @selector(freeCountForPresentId:), (IMP)&_logos_method$_ungrouped$AWELiveFreePresentPropertyManager$freeCountForPresentId$, (IMP*)&_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$freeCountForPresentId$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveFreePresentPropertyManager, @selector(fetchFreePresentListWithCompletion:), (IMP)&_logos_method$_ungrouped$AWELiveFreePresentPropertyManager$fetchFreePresentListWithCompletion$, (IMP*)&_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$fetchFreePresentListWithCompletion$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveFreePresentPropertyManager, @selector(init), (IMP)&_logos_method$_ungrouped$AWELiveFreePresentPropertyManager$init, (IMP*)&_logos_orig$_ungrouped$AWELiveFreePresentPropertyManager$init);Class _logos_class$_ungrouped$AWELiveGiftListViewController = objc_getClass("AWELiveGiftListViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$AWELiveGiftListViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListViewController$viewDidLoad);MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListViewController, @selector(refreshWalletCoins), (IMP)&_logos_method$_ungrouped$AWELiveGiftListViewController$refreshWalletCoins, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListViewController$refreshWalletCoins);MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListViewController, @selector(didFinishSendPresentRequestWithTotalCoins:), (IMP)&_logos_method$_ungrouped$AWELiveGiftListViewController$didFinishSendPresentRequestWithTotalCoins$, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListViewController$didFinishSendPresentRequestWithTotalCoins$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListViewController, @selector(didSendPresent:), (IMP)&_logos_method$_ungrouped$AWELiveGiftListViewController$didSendPresent$, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListViewController$didSendPresent$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListViewController, @selector(collectionView:didSelectItemAtIndexPath:), (IMP)&_logos_method$_ungrouped$AWELiveGiftListViewController$collectionView$didSelectItemAtIndexPath$, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListViewController$collectionView$didSelectItemAtIndexPath$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListViewController, @selector(_handleFansProcess:presentCoins:), (IMP)&_logos_method$_ungrouped$AWELiveGiftListViewController$_handleFansProcess$presentCoins$, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListViewController$_handleFansProcess$presentCoins$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListViewController, @selector(_fetchGiftListDataAndReloadUI:), (IMP)&_logos_method$_ungrouped$AWELiveGiftListViewController$_fetchGiftListDataAndReloadUI$, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListViewController$_fetchGiftListDataAndReloadUI$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListViewController, @selector(rechargeClicked:), (IMP)&_logos_method$_ungrouped$AWELiveGiftListViewController$rechargeClicked$, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListViewController$rechargeClicked$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveGiftListViewController, @selector(rechargeSuccessNotiAction), (IMP)&_logos_method$_ungrouped$AWELiveGiftListViewController$rechargeSuccessNotiAction, (IMP*)&_logos_orig$_ungrouped$AWELiveGiftListViewController$rechargeSuccessNotiAction);Class _logos_class$_ungrouped$AWELiveWalletManager = objc_getClass("AWELiveWalletManager"); Class _logos_metaclass$_ungrouped$AWELiveWalletManager = object_getClass(_logos_class$_ungrouped$AWELiveWalletManager); MSHookMessageEx(_logos_metaclass$_ungrouped$AWELiveWalletManager, @selector(alertForNobalance:triggerReason:), (IMP)&_logos_meta_method$_ungrouped$AWELiveWalletManager$alertForNobalance$triggerReason$, (IMP*)&_logos_meta_orig$_ungrouped$AWELiveWalletManager$alertForNobalance$triggerReason$);MSHookMessageEx(_logos_metaclass$_ungrouped$AWELiveWalletManager, @selector(_getWalletWebURL:), (IMP)&_logos_meta_method$_ungrouped$AWELiveWalletManager$_getWalletWebURL$, (IMP*)&_logos_meta_orig$_ungrouped$AWELiveWalletManager$_getWalletWebURL$);MSHookMessageEx(_logos_metaclass$_ungrouped$AWELiveWalletManager, @selector(transitionToWalletPageFrom:), (IMP)&_logos_meta_method$_ungrouped$AWELiveWalletManager$transitionToWalletPageFrom$, (IMP*)&_logos_meta_orig$_ungrouped$AWELiveWalletManager$transitionToWalletPageFrom$);MSHookMessageEx(_logos_metaclass$_ungrouped$AWELiveWalletManager, @selector(getMyWalletWithFinishBlock:), (IMP)&_logos_meta_method$_ungrouped$AWELiveWalletManager$getMyWalletWithFinishBlock$, (IMP*)&_logos_meta_orig$_ungrouped$AWELiveWalletManager$getMyWalletWithFinishBlock$);Class _logos_class$_ungrouped$AWELiveMyWalletModel = objc_getClass("AWELiveMyWalletModel"); Class _logos_metaclass$_ungrouped$AWELiveMyWalletModel = object_getClass(_logos_class$_ungrouped$AWELiveMyWalletModel); MSHookMessageEx(_logos_metaclass$_ungrouped$AWELiveMyWalletModel, @selector(userJSONTransformer), (IMP)&_logos_meta_method$_ungrouped$AWELiveMyWalletModel$userJSONTransformer, (IMP*)&_logos_meta_orig$_ungrouped$AWELiveMyWalletModel$userJSONTransformer);MSHookMessageEx(_logos_metaclass$_ungrouped$AWELiveMyWalletModel, @selector(JSONKeyPathsByPropertyKey), (IMP)&_logos_meta_method$_ungrouped$AWELiveMyWalletModel$JSONKeyPathsByPropertyKey, (IMP*)&_logos_meta_orig$_ungrouped$AWELiveMyWalletModel$JSONKeyPathsByPropertyKey);Class _logos_class$_ungrouped$AWEAppShareSettingManager = objc_getClass("AWEAppShareSettingManager"); Class _logos_metaclass$_ungrouped$AWEAppShareSettingManager = object_getClass(_logos_class$_ungrouped$AWEAppShareSettingManager); MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppShareSettingManager, @selector(downloadForbiddenToast), (IMP)&_logos_meta_method$_ungrouped$AWEAppShareSettingManager$downloadForbiddenToast, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppShareSettingManager$downloadForbiddenToast);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppShareSettingManager, @selector(selfSeeingShouldForbidWaterMarkWhenDownload), (IMP)&_logos_meta_method$_ungrouped$AWEAppShareSettingManager$selfSeeingShouldForbidWaterMarkWhenDownload, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppShareSettingManager$selfSeeingShouldForbidWaterMarkWhenDownload);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppShareSettingManager, @selector(forbidDownloadLocal), (IMP)&_logos_meta_method$_ungrouped$AWEAppShareSettingManager$forbidDownloadLocal, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppShareSettingManager$forbidDownloadLocal);MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAppShareSettingManager, @selector(downloadCheckStatus), (IMP)&_logos_meta_method$_ungrouped$AWEAppShareSettingManager$downloadCheckStatus, (IMP*)&_logos_meta_orig$_ungrouped$AWEAppShareSettingManager$downloadCheckStatus);Class _logos_class$_ungrouped$AWEVideoRecorderController = objc_getClass("AWEVideoRecorderController"); MSHookMessageEx(_logos_class$_ungrouped$AWEVideoRecorderController, @selector(shouldEnableLive), (IMP)&_logos_method$_ungrouped$AWEVideoRecorderController$shouldEnableLive, (IMP*)&_logos_orig$_ungrouped$AWEVideoRecorderController$shouldEnableLive);Class _logos_class$_ungrouped$AWELiveRoomConfigModel = objc_getClass("AWELiveRoomConfigModel"); MSHookMessageEx(_logos_class$_ungrouped$AWELiveRoomConfigModel, @selector(enableHourlyList:), (IMP)&_logos_method$_ungrouped$AWELiveRoomConfigModel$enableHourlyList$, (IMP*)&_logos_orig$_ungrouped$AWELiveRoomConfigModel$enableHourlyList$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveRoomConfigModel, @selector(enableFansClub:), (IMP)&_logos_method$_ungrouped$AWELiveRoomConfigModel$enableFansClub$, (IMP*)&_logos_orig$_ungrouped$AWELiveRoomConfigModel$enableFansClub$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveRoomConfigModel, @selector(enableSendBarrage:), (IMP)&_logos_method$_ungrouped$AWELiveRoomConfigModel$enableSendBarrage$, (IMP*)&_logos_orig$_ungrouped$AWELiveRoomConfigModel$enableSendBarrage$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveRoomConfigModel, @selector(enableSendShortcutGift:), (IMP)&_logos_method$_ungrouped$AWELiveRoomConfigModel$enableSendShortcutGift$, (IMP*)&_logos_orig$_ungrouped$AWELiveRoomConfigModel$enableSendShortcutGift$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveRoomConfigModel, @selector(enableSendGiftGuide:), (IMP)&_logos_method$_ungrouped$AWELiveRoomConfigModel$enableSendGiftGuide$, (IMP*)&_logos_orig$_ungrouped$AWELiveRoomConfigModel$enableSendGiftGuide$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveRoomConfigModel, @selector(enableSendGift:), (IMP)&_logos_method$_ungrouped$AWELiveRoomConfigModel$enableSendGift$, (IMP*)&_logos_orig$_ungrouped$AWELiveRoomConfigModel$enableSendGift$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveRoomConfigModel, @selector(enableSendComment:), (IMP)&_logos_method$_ungrouped$AWELiveRoomConfigModel$enableSendComment$, (IMP*)&_logos_orig$_ungrouped$AWELiveRoomConfigModel$enableSendComment$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveRoomConfigModel, @selector(enableShare:), (IMP)&_logos_method$_ungrouped$AWELiveRoomConfigModel$enableShare$, (IMP*)&_logos_orig$_ungrouped$AWELiveRoomConfigModel$enableShare$);MSHookMessageEx(_logos_class$_ungrouped$AWELiveRoomConfigModel, @selector(enableEmoji:), (IMP)&_logos_method$_ungrouped$AWELiveRoomConfigModel$enableEmoji$, (IMP*)&_logos_orig$_ungrouped$AWELiveRoomConfigModel$enableEmoji$);Class _logos_class$_ungrouped$IESLiveDeviceInfo = objc_getClass("IESLiveDeviceInfo"); Class _logos_metaclass$_ungrouped$IESLiveDeviceInfo = object_getClass(_logos_class$_ungrouped$IESLiveDeviceInfo); MSHookMessageEx(_logos_metaclass$_ungrouped$IESLiveDeviceInfo, @selector(carrierMCCMNC), (IMP)&_logos_meta_method$_ungrouped$IESLiveDeviceInfo$carrierMCCMNC, (IMP*)&_logos_meta_orig$_ungrouped$IESLiveDeviceInfo$carrierMCCMNC);MSHookMessageEx(_logos_metaclass$_ungrouped$IESLiveDeviceInfo, @selector(carrierMNC), (IMP)&_logos_meta_method$_ungrouped$IESLiveDeviceInfo$carrierMNC, (IMP*)&_logos_meta_orig$_ungrouped$IESLiveDeviceInfo$carrierMNC);MSHookMessageEx(_logos_metaclass$_ungrouped$IESLiveDeviceInfo, @selector(carrierMCC), (IMP)&_logos_meta_method$_ungrouped$IESLiveDeviceInfo$carrierMCC, (IMP*)&_logos_meta_orig$_ungrouped$IESLiveDeviceInfo$carrierMCC);MSHookMessageEx(_logos_metaclass$_ungrouped$IESLiveDeviceInfo, @selector(carrierName), (IMP)&_logos_meta_method$_ungrouped$IESLiveDeviceInfo$carrierName, (IMP*)&_logos_meta_orig$_ungrouped$IESLiveDeviceInfo$carrierName);}
    
}

#line 1 "/Users/xiaoyuan/Desktop/work/tweaks/TikTok/TikTokDylib/Logos/TikTokDylib.xm"


#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import "NSRunLoop+XYExtensions.h"
#import "AwemeApiHeaders.h"
#import "MBProgressHUD+XYHUD.h"
#import "RadomComments.h"
#import "XYAwemeManager.h"
#import "XYSimulatedTouch.h"






















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

@class AWEUserDetailViewController; @class TTInstallDeviceHelper; @class AWEDiscoverFeedEntranceView; @class AWEShareServiceUtils; @class HMDInfo; @class AWECommentPanelBaseCell; @class UIView; @class AWEFeedCellViewController; @class NSString; @class AWESearchViewController; @class DYOneLoginViewController; @class AWEDynamicWaterMarkExporter; @class AWESearchUserViewController; @class AWEAwemePlayInteractionViewController; @class NSFileManager; @class AWEProfileHeaderExtraViewController; @class UIDevice; @class ANSMetadata; @class AWESearchResultViewController; @class AWEAwemePlayInteractionPresenter; @class AWEMusicDetailViewController; @class AWEFeedContainerViewController; @class DYRouterModel; @class AWECommentListViewController; @class AWEUserRelationView; @class AWEFeedTableViewController; 
static void _logos_method$_ungrouped$AWEFeedTableViewController$xy_startAutoPlayNext(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEFeedTableViewController$xy_stopAutoPlayNext(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEFeedTableViewController$xy_automaticPlayNext(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEFeedTableViewController$xy_loginWithBlock$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL, void (^)(void)); static void _logos_method$_ungrouped$AWEFeedTableViewController$xy_swapSearchViewControllerWithBlock$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL, void (^)(void)); static void _logos_method$_ungrouped$AWEFeedTableViewController$xy_collectionMusicWithInteractionViewController$block$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL, AWEAwemePlayInteractionViewController *, void (^)(void)); static void _logos_method$_ungrouped$AWEFeedTableViewController$xy_likeWithInteractionViewController$block$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL, AWEAwemePlayInteractionViewController *, void (^)(void)); static void _logos_method$_ungrouped$AWEFeedTableViewController$xy_followCurrentUserWithInteractionViewController$block$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL, AWEAwemePlayInteractionViewController *, void (^)(void)); static void _logos_method$_ungrouped$AWEFeedTableViewController$xy_scrollToIndexPath$completion$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL, NSIndexPath *, void (^)(void)); static void _logos_method$_ungrouped$AWEFeedTableViewController$xy_toggleAutoPlayNext(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$AWEFeedTableViewController$isScrolledAutomatically)(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$AWEFeedTableViewController$isScrolledAutomatically(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEFeedTableViewController$preloadNextCellIfNeeded)(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEFeedTableViewController$preloadNextCellIfNeeded(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEFeedTableViewController$scrollViewDidScroll$)(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWEFeedTableViewController$scrollViewDidScroll$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWEFeedTableViewController$viewDidDisappear$)(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL, _Bool); static void _logos_method$_ungrouped$AWEFeedTableViewController$viewDidDisappear$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL, _Bool); static void (*_logos_orig$_ungrouped$AWEFeedTableViewController$viewWillDisappear$)(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL, _Bool); static void _logos_method$_ungrouped$AWEFeedTableViewController$viewWillDisappear$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL, _Bool); static void (*_logos_orig$_ungrouped$AWEFeedTableViewController$viewDidAppear$)(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL, _Bool); static void _logos_method$_ungrouped$AWEFeedTableViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL, _Bool); static void (*_logos_orig$_ungrouped$AWEFeedTableViewController$viewWillAppear$)(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL, _Bool); static void _logos_method$_ungrouped$AWEFeedTableViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL, _Bool); static void (*_logos_orig$_ungrouped$AWEFeedTableViewController$_addNotifications)(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEFeedTableViewController$_addNotifications(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$AWEFeedTableViewController$isStartPlayNext(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEFeedTableViewController$setIsStartPlayNext$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL, BOOL); static BOOL _logos_method$_ungrouped$AWEFeedTableViewController$viewIsDisappear(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEFeedTableViewController$setViewIsDisappear$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL, BOOL); static int _logos_method$_ungrouped$AWEFeedTableViewController$autoScrollCount(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEFeedTableViewController$setAutoScrollCount$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL, int); static void _logos_method$_ungrouped$AWEFeedTableViewController$xy_motionShakeNotification(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEFeedTableViewController$xy_didBecomeActiveNotification(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEFeedTableViewController$xy_willResignActiveNotification(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEFeedTableViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEFeedTableViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$performLikeAction)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$performLikeAction(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$onVideoPlayerViewDoubleClicked$)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void _logos_method$_ungrouped$AWEAwemePlayInteractionViewController$onVideoPlayerViewDoubleClicked$(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionViewController* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void (*_logos_orig$_ungrouped$AWEFeedCellViewController$_onVideoPlayerViewClicked$)(_LOGOS_SELF_TYPE_NORMAL AWEFeedCellViewController* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void _logos_method$_ungrouped$AWEFeedCellViewController$_onVideoPlayerViewClicked$(_LOGOS_SELF_TYPE_NORMAL AWEFeedCellViewController* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void (*_logos_orig$_ungrouped$AWECommentListViewController$sendCommentContent$inputView$isRetry$)(_LOGOS_SELF_TYPE_NORMAL AWECommentListViewController* _LOGOS_SELF_CONST, SEL, id, id, _Bool); static void _logos_method$_ungrouped$AWECommentListViewController$sendCommentContent$inputView$isRetry$(_LOGOS_SELF_TYPE_NORMAL AWECommentListViewController* _LOGOS_SELF_CONST, SEL, id, id, _Bool); static void (*_logos_orig$_ungrouped$AWECommentListViewController$likeCommentAtIndexPath$isLike$)(_LOGOS_SELF_TYPE_NORMAL AWECommentListViewController* _LOGOS_SELF_CONST, SEL, NSIndexPath *, BOOL); static void _logos_method$_ungrouped$AWECommentListViewController$likeCommentAtIndexPath$isLike$(_LOGOS_SELF_TYPE_NORMAL AWECommentListViewController* _LOGOS_SELF_CONST, SEL, NSIndexPath *, BOOL); static void (*_logos_orig$_ungrouped$AWECommentListViewController$closeBtnClicked$)(_LOGOS_SELF_TYPE_NORMAL AWECommentListViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWECommentListViewController$closeBtnClicked$(_LOGOS_SELF_TYPE_NORMAL AWECommentListViewController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWEUserDetailViewController$followBtnClicked)(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEUserDetailViewController$followBtnClicked(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEUserDetailViewController$dealloc)(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEUserDetailViewController$dealloc(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST, SEL); static AWEUserDetailViewController* (*_logos_orig$_ungrouped$AWEUserDetailViewController$init)(_LOGOS_SELF_TYPE_INIT AWEUserDetailViewController*, SEL) _LOGOS_RETURN_RETAINED; static AWEUserDetailViewController* _logos_method$_ungrouped$AWEUserDetailViewController$init(_LOGOS_SELF_TYPE_INIT AWEUserDetailViewController*, SEL) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$_ungrouped$AWEUserDetailViewController$unfollowed)(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEUserDetailViewController$unfollowed(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEUserDetailViewController$followed)(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWEUserDetailViewController$followed(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEUserDetailViewController$backBtnClicked$)(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWEUserDetailViewController$backBtnClicked$(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWEUserDetailViewController$setUser$)(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST, SEL, AWEUserModel *); static void _logos_method$_ungrouped$AWEUserDetailViewController$setUser$(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST, SEL, AWEUserModel *); static void (*_logos_orig$_ungrouped$AWEUserDetailViewController$setUserID$)(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST, SEL, NSString *); static void _logos_method$_ungrouped$AWEUserDetailViewController$setUserID$(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST, SEL, NSString *); static void (*_logos_orig$_ungrouped$AWEUserDetailViewController$setPreloadedUser$)(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST, SEL, AWEUserModel *); static void _logos_method$_ungrouped$AWEUserDetailViewController$setPreloadedUser$(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST, SEL, AWEUserModel *); static void (*_logos_orig$_ungrouped$AWECommentPanelBaseCell$likeButtonTapped)(_LOGOS_SELF_TYPE_NORMAL AWECommentPanelBaseCell* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWECommentPanelBaseCell$likeButtonTapped(_LOGOS_SELF_TYPE_NORMAL AWECommentPanelBaseCell* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEProfileHeaderExtraViewController$relationBtnClicked$)(_LOGOS_SELF_TYPE_NORMAL AWEProfileHeaderExtraViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWEProfileHeaderExtraViewController$relationBtnClicked$(_LOGOS_SELF_TYPE_NORMAL AWEProfileHeaderExtraViewController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWEUserRelationView$updateRelationWithFollowStatus$followerStatus$animated$)(_LOGOS_SELF_TYPE_NORMAL AWEUserRelationView* _LOGOS_SELF_CONST, SEL, long long, long long, _Bool); static void _logos_method$_ungrouped$AWEUserRelationView$updateRelationWithFollowStatus$followerStatus$animated$(_LOGOS_SELF_TYPE_NORMAL AWEUserRelationView* _LOGOS_SELF_CONST, SEL, long long, long long, _Bool); static void (*_logos_orig$_ungrouped$AWEMusicDetailViewController$onCollectionBtnClicked$)(_LOGOS_SELF_TYPE_NORMAL AWEMusicDetailViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWEMusicDetailViewController$onCollectionBtnClicked$(_LOGOS_SELF_TYPE_NORMAL AWEMusicDetailViewController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWEAwemePlayInteractionPresenter$enterMusicDetail$)(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionPresenter* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void _logos_method$_ungrouped$AWEAwemePlayInteractionPresenter$enterMusicDetail$(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionPresenter* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void (*_logos_meta_orig$_ungrouped$AWEShareServiceUtils$_shareAwemeForSaveVideo$forBTDShareType$preprocess$delegateType$completion$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, long long, id, unsigned long long, id); static void _logos_meta_method$_ungrouped$AWEShareServiceUtils$_shareAwemeForSaveVideo$forBTDShareType$preprocess$delegateType$completion$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, long long, id, unsigned long long, id); static NSArray * (*_logos_meta_orig$_ungrouped$AWEDynamicWaterMarkExporter$watermarkLogoImageArray)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static NSArray * _logos_meta_method$_ungrouped$AWEDynamicWaterMarkExporter$watermarkLogoImageArray(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$AWEFeedContainerViewController$onDiscoverButtonClicked$)(_LOGOS_SELF_TYPE_NORMAL AWEFeedContainerViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWEFeedContainerViewController$onDiscoverButtonClicked$(_LOGOS_SELF_TYPE_NORMAL AWEFeedContainerViewController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWEDiscoverFeedEntranceView$awe_UITracker_gestureRecognizer$)(_LOGOS_SELF_TYPE_NORMAL AWEDiscoverFeedEntranceView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWEDiscoverFeedEntranceView$awe_UITracker_gestureRecognizer$(_LOGOS_SELF_TYPE_NORMAL AWEDiscoverFeedEntranceView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWESearchResultViewController$searchWithKeyword$tabType$enterMethod$onlyShowSug$completion$)(_LOGOS_SELF_TYPE_NORMAL AWESearchResultViewController* _LOGOS_SELF_CONST, SEL, id, unsigned long long, id, _Bool, id); static void _logos_method$_ungrouped$AWESearchResultViewController$searchWithKeyword$tabType$enterMethod$onlyShowSug$completion$(_LOGOS_SELF_TYPE_NORMAL AWESearchResultViewController* _LOGOS_SELF_CONST, SEL, id, unsigned long long, id, _Bool, id); static void (*_logos_orig$_ungrouped$AWESearchResultViewController$excuteSearch$onlyShowSug$isSearchByUserClick$enterMethod$extraLogParams$completion$)(_LOGOS_SELF_TYPE_NORMAL AWESearchResultViewController* _LOGOS_SELF_CONST, SEL, _Bool, _Bool, _Bool, id, id, id); static void _logos_method$_ungrouped$AWESearchResultViewController$excuteSearch$onlyShowSug$isSearchByUserClick$enterMethod$extraLogParams$completion$(_LOGOS_SELF_TYPE_NORMAL AWESearchResultViewController* _LOGOS_SELF_CONST, SEL, _Bool, _Bool, _Bool, id, id, id); static void (*_logos_orig$_ungrouped$AWESearchResultViewController$searchWithKeyword$tabType$enterMethod$completion$)(_LOGOS_SELF_TYPE_NORMAL AWESearchResultViewController* _LOGOS_SELF_CONST, SEL, id, unsigned long long, id, id); static void _logos_method$_ungrouped$AWESearchResultViewController$searchWithKeyword$tabType$enterMethod$completion$(_LOGOS_SELF_TYPE_NORMAL AWESearchResultViewController* _LOGOS_SELF_CONST, SEL, id, unsigned long long, id, id); static void (*_logos_orig$_ungrouped$AWESearchResultViewController$viewControllerEndRefreshData$searchData$)(_LOGOS_SELF_TYPE_NORMAL AWESearchResultViewController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$AWESearchResultViewController$viewControllerEndRefreshData$searchData$(_LOGOS_SELF_TYPE_NORMAL AWESearchResultViewController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$AWESearchResultViewController$setViewControllerEndRefreshDataBlock$(_LOGOS_SELF_TYPE_NORMAL AWESearchResultViewController* _LOGOS_SELF_CONST, SEL, void (^ )(UIViewController *vc, id searchData)); static void (^ _logos_method$_ungrouped$AWESearchResultViewController$viewControllerEndRefreshDataBlock(_LOGOS_SELF_TYPE_NORMAL AWESearchResultViewController* _LOGOS_SELF_CONST, SEL))(UIViewController *vc, id searchData); static void (*_logos_orig$_ungrouped$AWESearchViewController$updateSearchBarWithKeyword$)(_LOGOS_SELF_TYPE_NORMAL AWESearchViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AWESearchViewController$updateSearchBarWithKeyword$(_LOGOS_SELF_TYPE_NORMAL AWESearchViewController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_meta_orig$_ungrouped$UIView$awe_UITracker_run)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void _logos_meta_method$_ungrouped$UIView$awe_UITracker_run(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$UIView$awe_UITracker_gestureRecognizer$)(_LOGOS_SELF_TYPE_NORMAL UIView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$UIView$awe_UITracker_gestureRecognizer$(_LOGOS_SELF_TYPE_NORMAL UIView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$UIView$awe_UITracker_addGestureRecognizer$)(_LOGOS_SELF_TYPE_NORMAL UIView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$UIView$awe_UITracker_addGestureRecognizer$(_LOGOS_SELF_TYPE_NORMAL UIView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AWESearchUserViewController$didFinishUnFollowUser$status$error$)(_LOGOS_SELF_TYPE_NORMAL AWESearchUserViewController* _LOGOS_SELF_CONST, SEL, id, long long, id); static void _logos_method$_ungrouped$AWESearchUserViewController$didFinishUnFollowUser$status$error$(_LOGOS_SELF_TYPE_NORMAL AWESearchUserViewController* _LOGOS_SELF_CONST, SEL, id, long long, id); static void (*_logos_orig$_ungrouped$AWESearchUserViewController$didFinishFollowUser$status$error$)(_LOGOS_SELF_TYPE_NORMAL AWESearchUserViewController* _LOGOS_SELF_CONST, SEL, id, long long, id); static void _logos_method$_ungrouped$AWESearchUserViewController$didFinishFollowUser$status$error$(_LOGOS_SELF_TYPE_NORMAL AWESearchUserViewController* _LOGOS_SELF_CONST, SEL, id, long long, id); static void (*_logos_orig$_ungrouped$AWESearchUserViewController$unfollowUser$indexPath$)(_LOGOS_SELF_TYPE_NORMAL AWESearchUserViewController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$AWESearchUserViewController$unfollowUser$indexPath$(_LOGOS_SELF_TYPE_NORMAL AWESearchUserViewController* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$_ungrouped$AWESearchUserViewController$followUser$indexPath$)(_LOGOS_SELF_TYPE_NORMAL AWESearchUserViewController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$AWESearchUserViewController$followUser$indexPath$(_LOGOS_SELF_TYPE_NORMAL AWESearchUserViewController* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$_ungrouped$DYOneLoginViewController$loginWithPlatform$)(_LOGOS_SELF_TYPE_NORMAL DYOneLoginViewController* _LOGOS_SELF_CONST, SEL, unsigned long long); static void _logos_method$_ungrouped$DYOneLoginViewController$loginWithPlatform$(_LOGOS_SELF_TYPE_NORMAL DYOneLoginViewController* _LOGOS_SELF_CONST, SEL, unsigned long long); static void (*_logos_orig$_ungrouped$DYOneLoginViewController$oneLogin)(_LOGOS_SELF_TYPE_NORMAL DYOneLoginViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$DYOneLoginViewController$oneLogin(_LOGOS_SELF_TYPE_NORMAL DYOneLoginViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$DYOneLoginViewController$otherLoginAction)(_LOGOS_SELF_TYPE_NORMAL DYOneLoginViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$DYOneLoginViewController$otherLoginAction(_LOGOS_SELF_TYPE_NORMAL DYOneLoginViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$DYOneLoginViewController$closeAction)(_LOGOS_SELF_TYPE_NORMAL DYOneLoginViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$DYOneLoginViewController$closeAction(_LOGOS_SELF_TYPE_NORMAL DYOneLoginViewController* _LOGOS_SELF_CONST, SEL); static DYOneLoginViewController* (*_logos_orig$_ungrouped$DYOneLoginViewController$initWithRouterModel$)(_LOGOS_SELF_TYPE_INIT DYOneLoginViewController*, SEL, DYRouterModel *) _LOGOS_RETURN_RETAINED; static DYOneLoginViewController* _logos_method$_ungrouped$DYOneLoginViewController$initWithRouterModel$(_LOGOS_SELF_TYPE_INIT DYOneLoginViewController*, SEL, DYRouterModel *) _LOGOS_RETURN_RETAINED; static id (*_logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBackStrategy$bindStrategy$platformContext$phoneContext$ticketModel$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, unsigned long long, unsigned long long, unsigned long long, id, id); static id _logos_meta_method$_ungrouped$DYRouterModel$instanceWithBackStrategy$bindStrategy$platformContext$phoneContext$ticketModel$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, unsigned long long, unsigned long long, unsigned long long, id, id); static id (*_logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBackStrategy$platformContext$bindStrategy$ticketModel$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, unsigned long long, unsigned long long, unsigned long long, id); static id _logos_meta_method$_ungrouped$DYRouterModel$instanceWithBackStrategy$platformContext$bindStrategy$ticketModel$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, unsigned long long, unsigned long long, unsigned long long, id); static id (*_logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBackStrategy$bindStrategy$ticketModel$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, unsigned long long, unsigned long long, id); static id _logos_meta_method$_ungrouped$DYRouterModel$instanceWithBackStrategy$bindStrategy$ticketModel$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, unsigned long long, unsigned long long, id); static id (*_logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBackStrategy$platformContext$ticketModel$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, unsigned long long, unsigned long long, id); static id _logos_meta_method$_ungrouped$DYRouterModel$instanceWithBackStrategy$platformContext$ticketModel$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, unsigned long long, unsigned long long, id); static id (*_logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBackStrategy$emailContext$passwordContext$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, unsigned long long, id, id); static id _logos_meta_method$_ungrouped$DYRouterModel$instanceWithBackStrategy$emailContext$passwordContext$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, unsigned long long, id, id); static id (*_logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBackStrategy$emailContext$ticketModel$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, unsigned long long, id, id); static id _logos_meta_method$_ungrouped$DYRouterModel$instanceWithBackStrategy$emailContext$ticketModel$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, unsigned long long, id, id); static id (*_logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBackStrategy$phoneContext$ticketModel$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, unsigned long long, id, id); static id _logos_meta_method$_ungrouped$DYRouterModel$instanceWithBackStrategy$phoneContext$ticketModel$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, unsigned long long, id, id); static id (*_logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBackStrategy$ticketModel$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, unsigned long long, id); static id _logos_meta_method$_ungrouped$DYRouterModel$instanceWithBackStrategy$ticketModel$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, unsigned long long, id); static id (*_logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBuilder$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static id _logos_meta_method$_ungrouped$DYRouterModel$instanceWithBuilder$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static id (*_logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBlock$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, CDUnknownBlockType); static id _logos_meta_method$_ungrouped$DYRouterModel$instanceWithBlock$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, CDUnknownBlockType); static long long (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$timeStamp)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static long long _logos_meta_method$_ungrouped$TTInstallDeviceHelper$timeStamp(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$saveOpenUDIDToKeychain$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static void _logos_meta_method$_ungrouped$TTInstallDeviceHelper$saveOpenUDIDToKeychain$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static id (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$fetchOpenUDIDFromKeychain)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$fetchOpenUDIDFromKeychain(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$resolutionString)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$resolutionString(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static struct CGSize (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$resolution)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static struct CGSize _logos_meta_method$_ungrouped$TTInstallDeviceHelper$resolution(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$screenScale)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double _logos_meta_method$_ungrouped$TTInstallDeviceHelper$screenScale(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$ssOnePixel)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double _logos_meta_method$_ungrouped$TTInstallDeviceHelper$ssOnePixel(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$openUDID)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$openUDID(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$currentLanguage)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$currentLanguage(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$MACAddress)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$MACAddress(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static float (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$OSVersionNumber)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static float _logos_meta_method$_ungrouped$TTInstallDeviceHelper$OSVersionNumber(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$idfvString)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$idfvString(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$idfaString)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$idfaString(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static unsigned long long (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$getDeviceType)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static unsigned long long _logos_meta_method$_ungrouped$TTInstallDeviceHelper$getDeviceType(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$isJailBroken)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$TTInstallDeviceHelper$isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$platformName)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$TTInstallDeviceHelper$platformName(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$ANSMetadata$computeIsJailbroken)(_LOGOS_SELF_TYPE_NORMAL ANSMetadata* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$ANSMetadata$computeIsJailbroken(_LOGOS_SELF_TYPE_NORMAL ANSMetadata* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$HMDInfo$isJailBroken)(_LOGOS_SELF_TYPE_NORMAL HMDInfo* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$HMDInfo$isJailBroken(_LOGOS_SELF_TYPE_NORMAL HMDInfo* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$UIDevice$btd_isJailBroken)(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$UIDevice$btd_isJailBroken(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$NSFileManager$fileExistsAtPath$)(_LOGOS_SELF_TYPE_NORMAL NSFileManager* _LOGOS_SELF_CONST, SEL, NSString *); static BOOL _logos_method$_ungrouped$NSFileManager$fileExistsAtPath$(_LOGOS_SELF_TYPE_NORMAL NSFileManager* _LOGOS_SELF_CONST, SEL, NSString *); static BOOL (*_logos_orig$_ungrouped$NSString$containsString$)(_LOGOS_SELF_TYPE_NORMAL NSString* _LOGOS_SELF_CONST, SEL, NSString *); static BOOL _logos_method$_ungrouped$NSString$containsString$(_LOGOS_SELF_TYPE_NORMAL NSString* _LOGOS_SELF_CONST, SEL, NSString *); 

#line 43 "/Users/xiaoyuan/Desktop/work/tweaks/TikTok/TikTokDylib/Logos/TikTokDylib.xm"



__attribute__((used)) static NSIndexPath * _logos_method$_ungrouped$AWEFeedTableViewController$xy_lastAutoScrollIndexPath(AWEFeedTableViewController * __unused self, SEL __unused _cmd) { return (NSIndexPath *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$AWEFeedTableViewController$xy_lastAutoScrollIndexPath); }; __attribute__((used)) static void _logos_method$_ungrouped$AWEFeedTableViewController$setXy_lastAutoScrollIndexPath(AWEFeedTableViewController * __unused self, SEL __unused _cmd, NSIndexPath * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$AWEFeedTableViewController$xy_lastAutoScrollIndexPath, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }

#pragma mark - Timer methods

static void _logos_method$_ungrouped$AWEFeedTableViewController$xy_startAutoPlayNext(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
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
    
    
    
    CGFloat delay = MAX(arc4random_uniform(36), 15);
    CGFloat delayTime = 3.0;
    NSString *message = [NSString stringWithFormat:@"自动播放已开启\n可在设置中以关闭\n当前播放第%ld个", self.autoScrollCount ];
    if (self.autoScrollCount > 100) {
        delay = MAX(arc4random_uniform(80), 50);
        message = [NSString stringWithFormat:@"超过100次自动化速度将会被降低\n当前播放第%ld个", self.autoScrollCount];
    }
    if ((self.autoScrollCount + 1) % 30 == 0) {
        
        delay = MAX(arc4random_uniform(360), 180);
        message = [NSString stringWithFormat:@"休息%1.f秒\当前播放第%ld个", delay, self.autoScrollCount];
        delayTime = delay;
    }
    
    
    [self performSelector:@selector(xy_automaticPlayNext) withObject:nil afterDelay:delay inModes:@[NSDefaultRunLoopMode]];
    
    [self.view xy_hideHUD];
    [self.view xy_showMessage:message delayTime:delayTime];
    NSLog(@"当前播放第%ld个", self.autoScrollCount);
}


static void _logos_method$_ungrouped$AWEFeedTableViewController$xy_stopAutoPlayNext(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    
    self.isStartPlayNext = NO;
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(xy_automaticPlayNext) object:nil];
    
    [self.view xy_hideHUD];
    [self.view xy_showMessage:[NSString stringWithFormat:@"自动播放已关闭\n去设置中开启\n当前播放第%ld个", self.autoScrollCount]];
    NSLog(@"当前已停止播放");
}



static void _logos_method$_ungrouped$AWEFeedTableViewController$xy_automaticPlayNext(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    
    NSLog(@"%@", self.navigationController.viewControllers);
    
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
        
        
        dispatch_block_t completionBlock = ^{
            id visibleCell = [tableView visibleCells].firstObject;
            
            
            if (!visibleCell) {
                
                self.autoScrollCount += 1;
                [self xy_startAutoPlayNext];
                return;
            }
            if ([visibleCell isKindOfClass:NSClassFromString(@"AWEFeedLiveStreamTableViewCell")]) {
                
                self.autoScrollCount += 1;
                [self xy_startAutoPlayNext];
                return;
            }
            
            AWEFeedCellViewController *viewController = MSHookIvar<AWEFeedCellViewController*>(visibleCell, "_viewController");
            AWEAwemePlayInteractionViewController *iVC = viewController.interactionController;
            
            
            if (iVC.model.isNoAccountAd == YES || iVC.model.isLive == YES) {
                self.autoScrollCount += 1;
                [self xy_startAutoPlayNext];
                return;
            }
            
            
            void (^likeCompletion)(void) = ^{
                
                
                if ((self.autoScrollCount + 1) % 8 == 0) {
                    logInfo = @"(self.autoScrollCount + 1) % 10 == 0";
                    
                    [self xy_collectionMusicWithInteractionViewController:iVC block:^{
                        self.autoScrollCount += 1;
                        [self xy_startAutoPlayNext];
                    }];
                    
                }
                
                else if ((self.autoScrollCount + 1) % 5 == 0) {
                    logInfo = @"(self.autoScrollCount + 1) % 14 == 0";
                    if (iVC.model.author.followStatus == 1) {
                        
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
        
        
        if ((self.autoScrollCount + 1) % 2 == 0) {
            logInfo = @"(self.autoScrollCount + 1) % 2 == 0";
            
            [self xy_scrollToIndexPath:nextIndexPath completion: ^{
                
                dispatch_async(dispatch_get_main_queue(), completionBlock);
                
            }];
        }
        else {
            
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
        
        
    }
}


static void _logos_method$_ungrouped$AWEFeedTableViewController$xy_loginWithBlock$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, void (^block)(void)) {
    
}



static void _logos_method$_ungrouped$AWEFeedTableViewController$xy_swapSearchViewControllerWithBlock$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, void (^block)(void)) {
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
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    
            if (userResultVC.manager.userArray.count == 0) {
                completion();
                return;
            }
        
          AWESearchUser *searchUserModel = userResultVC.manager.userArray[0];
           if (searchUserModel.userInfo.followStatus == 1) {
               
              completion();
              return;
          }
        
                [userResultVC followUser:searchUserModel indexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        
                
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


static void _logos_method$_ungrouped$AWEFeedTableViewController$xy_collectionMusicWithInteractionViewController$block$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, AWEAwemePlayInteractionViewController * iVC, void (^block)(void)) {
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


static void _logos_method$_ungrouped$AWEFeedTableViewController$xy_likeWithInteractionViewController$block$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, AWEAwemePlayInteractionViewController * iVC, void (^block)(void)) {
    
    dispatch_async(dispatch_get_main_queue(), ^{
                   
                   if (iVC.model.userDigged == NO) {

                   
                   
                   
                   
                    [iVC onVideoPlayerViewDoubleClicked:nil];
                   }
                   else {
                   NSLog(@"已经点过赞！");
                   }
                   
                   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (block) {
            block();
        }
    });
    });
    
    
}


static void _logos_method$_ungrouped$AWEFeedTableViewController$xy_followCurrentUserWithInteractionViewController$block$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, AWEAwemePlayInteractionViewController * iVC, void (^block)(void)) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        





        
      
            [iVC.presenter onFollowViewClicked:nil];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
                if (iVC.model.userDigged == YES) {
                    if (block) {
                        block();
                    }
                }
                else {
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        
                        [iVC onVideoPlayerViewDoubleClicked:nil];
                        
                        if (block) {
                            block();
                        }
                    });
                }
            });
             
                   
                   
    });
    
}


static void _logos_method$_ungrouped$AWEFeedTableViewController$xy_scrollToIndexPath$completion$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSIndexPath * indexPath, void (^completion)(void)) {
    dispatch_block_t block = ^{
        
        UITableView *tableView = MSHookIvar<UITableView*>(self, "_tableView");
        NSInteger totalCount = [tableView.dataSource tableView:self.tableView numberOfRowsInSection:indexPath.section];
        
        if (indexPath.row > totalCount - 1) {
            
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
        
        
        
        if (indexPath.row % 5 != 1 && self.xy_lastAutoScrollIndexPath != indexPath) {
            long diff =  abs(indexPath.row - visibleIndexPath.row);
            CGPoint startPoint, endPoint;
            if (indexPath.row > visibleIndexPath.row) {
                
                startPoint = CGPointMake(tableView.frame.size.width * 0.35, tableView.frame.size.height * 0.7);
                endPoint = CGPointMake(tableView.frame.size.width * 0.35, tableView.frame.size.height * 0.28);
            }
            else {
                
                endPoint = CGPointMake(tableView.frame.size.width * 0.32, tableView.frame.size.height * 0.7);
                startPoint = CGPointMake(tableView.frame.size.width * 0.32, tableView.frame.size.height * 0.26);
            }
            
            
            [[XYSimulatedTouch sharedInstance] swapWithPoint:startPoint endPoint:endPoint count:diff completion:completion];

        }
        else {
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:1.0f];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            
            [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
            [UIView commitAnimations];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MAX(arc4random_uniform(5), 2) * NSEC_PER_SEC)), dispatch_get_main_queue(), completion);
        }
        self.xy_lastAutoScrollIndexPath = indexPath;
    };
    
    dispatch_async(dispatch_get_main_queue(), block);
}


static void _logos_method$_ungrouped$AWEFeedTableViewController$xy_toggleAutoPlayNext(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (self.isStartPlayNext == NO) {
        [self xy_startAutoPlayNext];
    }
    else {
        [self xy_stopAutoPlayNext];
    }
}

#pragma mark - Orig methods

static BOOL _logos_method$_ungrouped$AWEFeedTableViewController$isScrolledAutomatically(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    BOOL ret = _logos_orig$_ungrouped$AWEFeedTableViewController$isScrolledAutomatically(self, _cmd);
    ret = YES;
    return ret;
}
static void _logos_method$_ungrouped$AWEFeedTableViewController$preloadNextCellIfNeeded(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWEFeedTableViewController$preloadNextCellIfNeeded(self, _cmd);
}

static void _logos_method$_ungrouped$AWEFeedTableViewController$scrollViewDidScroll$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    _logos_orig$_ungrouped$AWEFeedTableViewController$scrollViewDidScroll$(self, _cmd, arg1);
}

static void _logos_method$_ungrouped$AWEFeedTableViewController$viewDidDisappear$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _Bool arg1) {
    _logos_orig$_ungrouped$AWEFeedTableViewController$viewDidDisappear$(self, _cmd, arg1);
    self.viewIsDisappear = YES;
    [self xy_stopAutoPlayNext];
}
static void _logos_method$_ungrouped$AWEFeedTableViewController$viewWillDisappear$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _Bool arg1) {
    _logos_orig$_ungrouped$AWEFeedTableViewController$viewWillDisappear$(self, _cmd, arg1);
}
static void _logos_method$_ungrouped$AWEFeedTableViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _Bool arg1) {
    _logos_orig$_ungrouped$AWEFeedTableViewController$viewDidAppear$(self, _cmd, arg1);
    self.viewIsDisappear = NO;
    [self xy_startAutoPlayNext];
}
static void _logos_method$_ungrouped$AWEFeedTableViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _Bool arg1) {
    _logos_orig$_ungrouped$AWEFeedTableViewController$viewWillAppear$(self, _cmd, arg1);
}

static void _logos_method$_ungrouped$AWEFeedTableViewController$_addNotifications(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

    _logos_orig$_ungrouped$AWEFeedTableViewController$_addNotifications(self, _cmd);
}




static BOOL _logos_method$_ungrouped$AWEFeedTableViewController$isStartPlayNext(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return [objc_getAssociatedObject(self, @selector(isStartPlayNext)) boolValue];
}


static void _logos_method$_ungrouped$AWEFeedTableViewController$setIsStartPlayNext$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL value) {
    objc_setAssociatedObject(self, @selector(isStartPlayNext), @(value), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


static BOOL _logos_method$_ungrouped$AWEFeedTableViewController$viewIsDisappear(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return [objc_getAssociatedObject(self, @selector(viewIsDisappear)) boolValue];
}


static void _logos_method$_ungrouped$AWEFeedTableViewController$setViewIsDisappear$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL value) {
    objc_setAssociatedObject(self, @selector(viewIsDisappear), @(value), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

static int _logos_method$_ungrouped$AWEFeedTableViewController$autoScrollCount(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return [objc_getAssociatedObject(self, @selector(autoScrollCount)) intValue];
}


static void _logos_method$_ungrouped$AWEFeedTableViewController$setAutoScrollCount$(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, int value) {
    objc_setAssociatedObject(self, @selector(autoScrollCount), @(value), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


static void _logos_method$_ungrouped$AWEFeedTableViewController$xy_motionShakeNotification(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    
}


static void _logos_method$_ungrouped$AWEFeedTableViewController$xy_didBecomeActiveNotification(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    [self xy_startAutoPlayNext];
}


static void _logos_method$_ungrouped$AWEFeedTableViewController$xy_willResignActiveNotification(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    [self xy_stopAutoPlayNext];
}

static void _logos_method$_ungrouped$AWEFeedTableViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWEFeedTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWEFeedTableViewController$viewDidLoad(self, _cmd);
    
    self.autoScrollCount = 0;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(xy_motionShakeNotification) name:@"UIEventSubtypexy_motionShakeNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(xy_didBecomeActiveNotification) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(xy_willResignActiveNotification) name:UIApplicationWillResignActiveNotification object:nil];
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






static void _logos_method$_ungrouped$AWECommentListViewController$sendCommentContent$inputView$isRetry$(_LOGOS_SELF_TYPE_NORMAL AWECommentListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2, _Bool arg3) {
    _logos_orig$_ungrouped$AWECommentListViewController$sendCommentContent$inputView$isRetry$(self, _cmd, arg1, arg2, arg3);
}


static void _logos_method$_ungrouped$AWECommentListViewController$likeCommentAtIndexPath$isLike$(_LOGOS_SELF_TYPE_NORMAL AWECommentListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSIndexPath * indexPath, BOOL isLike) {
    _logos_orig$_ungrouped$AWECommentListViewController$likeCommentAtIndexPath$isLike$(self, _cmd, indexPath, isLike);
}

static void _logos_method$_ungrouped$AWECommentListViewController$closeBtnClicked$(_LOGOS_SELF_TYPE_NORMAL AWECommentListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    _logos_orig$_ungrouped$AWECommentListViewController$closeBtnClicked$(self, _cmd, arg1);
}





static void _logos_method$_ungrouped$AWEUserDetailViewController$followBtnClicked(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWEUserDetailViewController$followBtnClicked(self, _cmd);
}

static void _logos_method$_ungrouped$AWEUserDetailViewController$dealloc(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWEUserDetailViewController$dealloc(self, _cmd);
}

static AWEUserDetailViewController* _logos_method$_ungrouped$AWEUserDetailViewController$init(_LOGOS_SELF_TYPE_INIT AWEUserDetailViewController* __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {
    id vc = _logos_orig$_ungrouped$AWEUserDetailViewController$init(self, _cmd);
    return vc;
}

static void _logos_method$_ungrouped$AWEUserDetailViewController$unfollowed(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { 
    _logos_orig$_ungrouped$AWEUserDetailViewController$unfollowed(self, _cmd);
}
static void _logos_method$_ungrouped$AWEUserDetailViewController$followed(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { 
    _logos_orig$_ungrouped$AWEUserDetailViewController$followed(self, _cmd);
}

static void _logos_method$_ungrouped$AWEUserDetailViewController$backBtnClicked$(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    _logos_orig$_ungrouped$AWEUserDetailViewController$backBtnClicked$(self, _cmd, arg1);
}


static void _logos_method$_ungrouped$AWEUserDetailViewController$setUser$(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, AWEUserModel * user) {
    _logos_orig$_ungrouped$AWEUserDetailViewController$setUser$(self, _cmd, user);
}


static void _logos_method$_ungrouped$AWEUserDetailViewController$setUserID$(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSString * userID) {
    _logos_orig$_ungrouped$AWEUserDetailViewController$setUserID$(self, _cmd, userID);
}

static void _logos_method$_ungrouped$AWEUserDetailViewController$setPreloadedUser$(_LOGOS_SELF_TYPE_NORMAL AWEUserDetailViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, AWEUserModel * arg1) {
    _logos_orig$_ungrouped$AWEUserDetailViewController$setPreloadedUser$(self, _cmd, arg1);
}





static void _logos_method$_ungrouped$AWECommentPanelBaseCell$likeButtonTapped(_LOGOS_SELF_TYPE_NORMAL AWECommentPanelBaseCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$AWECommentPanelBaseCell$likeButtonTapped(self, _cmd);
}




static void _logos_method$_ungrouped$AWEProfileHeaderExtraViewController$relationBtnClicked$(_LOGOS_SELF_TYPE_NORMAL AWEProfileHeaderExtraViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) { 
    _logos_orig$_ungrouped$AWEProfileHeaderExtraViewController$relationBtnClicked$(self, _cmd, arg1);
}



static void _logos_method$_ungrouped$AWEUserRelationView$updateRelationWithFollowStatus$followerStatus$animated$(_LOGOS_SELF_TYPE_NORMAL AWEUserRelationView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long arg1, long long arg2, _Bool arg3) {
    _logos_orig$_ungrouped$AWEUserRelationView$updateRelationWithFollowStatus$followerStatus$animated$(self, _cmd, arg1, arg2, arg3);
}




static void _logos_method$_ungrouped$AWEMusicDetailViewController$onCollectionBtnClicked$(_LOGOS_SELF_TYPE_NORMAL AWEMusicDetailViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    _logos_orig$_ungrouped$AWEMusicDetailViewController$onCollectionBtnClicked$(self, _cmd, arg1);
}





static void _logos_method$_ungrouped$AWEAwemePlayInteractionPresenter$enterMusicDetail$(_LOGOS_SELF_TYPE_NORMAL AWEAwemePlayInteractionPresenter* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITapGestureRecognizer * tapGesture) {
    _logos_orig$_ungrouped$AWEAwemePlayInteractionPresenter$enterMusicDetail$(self, _cmd, tapGesture);
}








static void _logos_meta_method$_ungrouped$AWEShareServiceUtils$_shareAwemeForSaveVideo$forBTDShareType$preprocess$delegateType$completion$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg2, long long arg3, id arg4, unsigned long long arg5, id arg6) {
    
    AWEAwemeModel *data = arg2;
    AWEVideoModel *model = data.video;
    if ([XYAwemeManager manager].isRemovedWatermark == YES) {
        
        [model setHasWatermark:NO];
    }
    if(model.endWatermarkDownloadURL != nil && [XYAwemeManager manager].isRemovedEndWatermark == YES)
    {
        
        [model setHasEndWatermark:NO];
    }
    _logos_meta_orig$_ungrouped$AWEShareServiceUtils$_shareAwemeForSaveVideo$forBTDShareType$preprocess$delegateType$completion$(self, _cmd, data, arg3, arg4, arg5, arg6);
}




static NSArray * _logos_meta_method$_ungrouped$AWEDynamicWaterMarkExporter$watermarkLogoImageArray(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if ([XYAwemeManager manager].isRemovedWatermark == YES) {
        
        return @[];
    }
    return _logos_meta_orig$_ungrouped$AWEDynamicWaterMarkExporter$watermarkLogoImageArray(self, _cmd);
}












































static void _logos_method$_ungrouped$AWEFeedContainerViewController$onDiscoverButtonClicked$(_LOGOS_SELF_TYPE_NORMAL AWEFeedContainerViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    _logos_orig$_ungrouped$AWEFeedContainerViewController$onDiscoverButtonClicked$(self, _cmd, arg1);
}






static void _logos_method$_ungrouped$AWEDiscoverFeedEntranceView$awe_UITracker_gestureRecognizer$(_LOGOS_SELF_TYPE_NORMAL AWEDiscoverFeedEntranceView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    
    
}




static void _logos_method$_ungrouped$AWESearchResultViewController$searchWithKeyword$tabType$enterMethod$onlyShowSug$completion$(_LOGOS_SELF_TYPE_NORMAL AWESearchResultViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, unsigned long long arg2, id arg3, _Bool arg4, id arg5) {
    _logos_orig$_ungrouped$AWESearchResultViewController$searchWithKeyword$tabType$enterMethod$onlyShowSug$completion$(self, _cmd, arg1, arg2, arg3, arg4, arg5);
}

static void _logos_method$_ungrouped$AWESearchResultViewController$excuteSearch$onlyShowSug$isSearchByUserClick$enterMethod$extraLogParams$completion$(_LOGOS_SELF_TYPE_NORMAL AWESearchResultViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _Bool arg1, _Bool arg2, _Bool arg3, id arg4, id arg5, id arg6) {
    _logos_orig$_ungrouped$AWESearchResultViewController$excuteSearch$onlyShowSug$isSearchByUserClick$enterMethod$extraLogParams$completion$(self, _cmd, arg1, arg2, arg3, arg4, arg5, arg6);
}
static void _logos_method$_ungrouped$AWESearchResultViewController$searchWithKeyword$tabType$enterMethod$completion$(_LOGOS_SELF_TYPE_NORMAL AWESearchResultViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, unsigned long long arg2, id arg3, id arg4) {
    _logos_orig$_ungrouped$AWESearchResultViewController$searchWithKeyword$tabType$enterMethod$completion$(self, _cmd, arg1, arg2, arg3, arg4);
}

static void _logos_method$_ungrouped$AWESearchResultViewController$viewControllerEndRefreshData$searchData$(_LOGOS_SELF_TYPE_NORMAL AWESearchResultViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    _logos_orig$_ungrouped$AWESearchResultViewController$viewControllerEndRefreshData$searchData$(self, _cmd, arg1, arg2);
    NSLog(@"%@", self.navigationController.viewControllers);
    if (self.viewControllerEndRefreshDataBlock) {
        self.viewControllerEndRefreshDataBlock(arg1, arg2);
    }
    
    self.viewControllerEndRefreshDataBlock = nil;
}


static void _logos_method$_ungrouped$AWESearchResultViewController$setViewControllerEndRefreshDataBlock$(_LOGOS_SELF_TYPE_NORMAL AWESearchResultViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, void (^ block)(UIViewController *vc, id searchData)) {
    objc_setAssociatedObject(self, @selector(viewControllerEndRefreshDataBlock), block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


static void (^ _logos_method$_ungrouped$AWESearchResultViewController$viewControllerEndRefreshDataBlock(_LOGOS_SELF_TYPE_NORMAL AWESearchResultViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd))(UIViewController *vc, id searchData) {
    return objc_getAssociatedObject(self, @selector(viewControllerEndRefreshDataBlock));
}





static void _logos_method$_ungrouped$AWESearchViewController$updateSearchBarWithKeyword$(_LOGOS_SELF_TYPE_NORMAL AWESearchViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    _logos_orig$_ungrouped$AWESearchViewController$updateSearchBarWithKeyword$(self, _cmd, arg1);
}



static void _logos_meta_method$_ungrouped$UIView$awe_UITracker_run(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

}
static void _logos_method$_ungrouped$UIView$awe_UITracker_gestureRecognizer$(_LOGOS_SELF_TYPE_NORMAL UIView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

}
static void _logos_method$_ungrouped$UIView$awe_UITracker_addGestureRecognizer$(_LOGOS_SELF_TYPE_NORMAL UIView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    

}




static void _logos_method$_ungrouped$AWESearchUserViewController$didFinishUnFollowUser$status$error$(_LOGOS_SELF_TYPE_NORMAL AWESearchUserViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, long long arg2, id arg3) {
    _logos_orig$_ungrouped$AWESearchUserViewController$didFinishUnFollowUser$status$error$(self, _cmd, arg1, arg2, arg3);
}
static void _logos_method$_ungrouped$AWESearchUserViewController$didFinishFollowUser$status$error$(_LOGOS_SELF_TYPE_NORMAL AWESearchUserViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, long long arg2, id arg3) {
    _logos_orig$_ungrouped$AWESearchUserViewController$didFinishFollowUser$status$error$(self, _cmd, arg1, arg2, arg3);
}
static void _logos_method$_ungrouped$AWESearchUserViewController$unfollowUser$indexPath$(_LOGOS_SELF_TYPE_NORMAL AWESearchUserViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    _logos_orig$_ungrouped$AWESearchUserViewController$unfollowUser$indexPath$(self, _cmd, arg1, arg2);
}
static void _logos_method$_ungrouped$AWESearchUserViewController$followUser$indexPath$(_LOGOS_SELF_TYPE_NORMAL AWESearchUserViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    _logos_orig$_ungrouped$AWESearchUserViewController$followUser$indexPath$(self, _cmd, arg1, arg2);
}




static void _logos_method$_ungrouped$DYOneLoginViewController$loginWithPlatform$(_LOGOS_SELF_TYPE_NORMAL DYOneLoginViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, unsigned long long arg1) {
    _logos_orig$_ungrouped$DYOneLoginViewController$loginWithPlatform$(self, _cmd, arg1);
}
static void _logos_method$_ungrouped$DYOneLoginViewController$oneLogin(_LOGOS_SELF_TYPE_NORMAL DYOneLoginViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$DYOneLoginViewController$oneLogin(self, _cmd);
}
static void _logos_method$_ungrouped$DYOneLoginViewController$otherLoginAction(_LOGOS_SELF_TYPE_NORMAL DYOneLoginViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$DYOneLoginViewController$otherLoginAction(self, _cmd);
}
static void _logos_method$_ungrouped$DYOneLoginViewController$closeAction(_LOGOS_SELF_TYPE_NORMAL DYOneLoginViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$DYOneLoginViewController$closeAction(self, _cmd);
}
static DYOneLoginViewController* _logos_method$_ungrouped$DYOneLoginViewController$initWithRouterModel$(_LOGOS_SELF_TYPE_INIT DYOneLoginViewController* __unused self, SEL __unused _cmd, DYRouterModel * arg1) _LOGOS_RETURN_RETAINED  {
    id obj = _logos_orig$_ungrouped$DYOneLoginViewController$initWithRouterModel$(self, _cmd, arg1);
    return obj;
}





static id _logos_meta_method$_ungrouped$DYRouterModel$instanceWithBackStrategy$bindStrategy$platformContext$phoneContext$ticketModel$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, unsigned long long arg1, unsigned long long arg2, unsigned long long arg3, id arg4, id arg5) {
    return _logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBackStrategy$bindStrategy$platformContext$phoneContext$ticketModel$(self, _cmd, arg1, arg2, arg3, arg4, arg5);
}
static id _logos_meta_method$_ungrouped$DYRouterModel$instanceWithBackStrategy$platformContext$bindStrategy$ticketModel$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, unsigned long long arg1, unsigned long long arg2, unsigned long long arg3, id arg4) {
    return _logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBackStrategy$platformContext$bindStrategy$ticketModel$(self, _cmd, arg1, arg2, arg3, arg4);
}
static id _logos_meta_method$_ungrouped$DYRouterModel$instanceWithBackStrategy$bindStrategy$ticketModel$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, unsigned long long arg1, unsigned long long arg2, id arg3) {
    return _logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBackStrategy$bindStrategy$ticketModel$(self, _cmd, arg1, arg2, arg3);
}
static id _logos_meta_method$_ungrouped$DYRouterModel$instanceWithBackStrategy$platformContext$ticketModel$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, unsigned long long arg1, unsigned long long arg2, id arg3) {
    return _logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBackStrategy$platformContext$ticketModel$(self, _cmd, arg1, arg2, arg3);
}
static id _logos_meta_method$_ungrouped$DYRouterModel$instanceWithBackStrategy$emailContext$passwordContext$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, unsigned long long arg1, id arg2, id arg3) {
    return _logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBackStrategy$emailContext$passwordContext$(self, _cmd, arg1, arg2, arg3);
}
static id _logos_meta_method$_ungrouped$DYRouterModel$instanceWithBackStrategy$emailContext$ticketModel$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, unsigned long long arg1, id arg2, id arg3) {
    return _logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBackStrategy$emailContext$ticketModel$(self, _cmd, arg1, arg2, arg3);
}
static id _logos_meta_method$_ungrouped$DYRouterModel$instanceWithBackStrategy$phoneContext$ticketModel$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, unsigned long long arg1, id arg2, id arg3) {
    return _logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBackStrategy$phoneContext$ticketModel$(self, _cmd, arg1, arg2, arg3);
}
static id _logos_meta_method$_ungrouped$DYRouterModel$instanceWithBackStrategy$ticketModel$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, unsigned long long arg1, id arg2) {
    return _logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBackStrategy$ticketModel$(self, _cmd, arg1, arg2);
}
static id _logos_meta_method$_ungrouped$DYRouterModel$instanceWithBuilder$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    return _logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBuilder$(self, _cmd, arg1);
}
static id _logos_meta_method$_ungrouped$DYRouterModel$instanceWithBlock$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CDUnknownBlockType block) {
    return _logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBlock$(self, _cmd, block);
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
    return _logos_orig$_ungrouped$UIDevice$btd_isJailBroken(self, _cmd);
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
        NSLog(@"9999999==%@=",event);
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



static __attribute__((constructor)) void _logosLocalCtor_a2137a2a(int __unused argc, char __unused **argv, char __unused **envp)
{
    notificationCallback(NULL, NULL, NULL, NULL, NULL);
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                    NULL,
                                    notificationCallback,
                                    CFSTR(kAwemeDylibNotificationName),
                                    NULL,
                                    CFNotificationSuspensionBehaviorCoalesce);
    {Class _logos_class$_ungrouped$AWEFeedTableViewController = objc_getClass("AWEFeedTableViewController"); { char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(xy_startAutoPlayNext), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$xy_startAutoPlayNext, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(xy_stopAutoPlayNext), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$xy_stopAutoPlayNext, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(xy_automaticPlayNext), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$xy_automaticPlayNext, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(void (^)(void)), strlen(@encode(void (^)(void)))); i += strlen(@encode(void (^)(void))); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(xy_loginWithBlock:), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$xy_loginWithBlock$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(void (^)(void)), strlen(@encode(void (^)(void)))); i += strlen(@encode(void (^)(void))); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(xy_swapSearchViewControllerWithBlock:), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$xy_swapSearchViewControllerWithBlock$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(AWEAwemePlayInteractionViewController *), strlen(@encode(AWEAwemePlayInteractionViewController *))); i += strlen(@encode(AWEAwemePlayInteractionViewController *)); memcpy(_typeEncoding + i, @encode(void (^)(void)), strlen(@encode(void (^)(void)))); i += strlen(@encode(void (^)(void))); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(xy_collectionMusicWithInteractionViewController:block:), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$xy_collectionMusicWithInteractionViewController$block$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(AWEAwemePlayInteractionViewController *), strlen(@encode(AWEAwemePlayInteractionViewController *))); i += strlen(@encode(AWEAwemePlayInteractionViewController *)); memcpy(_typeEncoding + i, @encode(void (^)(void)), strlen(@encode(void (^)(void)))); i += strlen(@encode(void (^)(void))); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(xy_likeWithInteractionViewController:block:), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$xy_likeWithInteractionViewController$block$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(AWEAwemePlayInteractionViewController *), strlen(@encode(AWEAwemePlayInteractionViewController *))); i += strlen(@encode(AWEAwemePlayInteractionViewController *)); memcpy(_typeEncoding + i, @encode(void (^)(void)), strlen(@encode(void (^)(void)))); i += strlen(@encode(void (^)(void))); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(xy_followCurrentUserWithInteractionViewController:block:), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$xy_followCurrentUserWithInteractionViewController$block$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(NSIndexPath *), strlen(@encode(NSIndexPath *))); i += strlen(@encode(NSIndexPath *)); memcpy(_typeEncoding + i, @encode(void (^)(void)), strlen(@encode(void (^)(void)))); i += strlen(@encode(void (^)(void))); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(xy_scrollToIndexPath:completion:), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$xy_scrollToIndexPath$completion$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(xy_toggleAutoPlayNext), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$xy_toggleAutoPlayNext, _typeEncoding); }MSHookMessageEx(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(isScrolledAutomatically), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$isScrolledAutomatically, (IMP*)&_logos_orig$_ungrouped$AWEFeedTableViewController$isScrolledAutomatically);MSHookMessageEx(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(preloadNextCellIfNeeded), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$preloadNextCellIfNeeded, (IMP*)&_logos_orig$_ungrouped$AWEFeedTableViewController$preloadNextCellIfNeeded);MSHookMessageEx(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(scrollViewDidScroll:), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$scrollViewDidScroll$, (IMP*)&_logos_orig$_ungrouped$AWEFeedTableViewController$scrollViewDidScroll$);MSHookMessageEx(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(viewDidDisappear:), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$viewDidDisappear$, (IMP*)&_logos_orig$_ungrouped$AWEFeedTableViewController$viewDidDisappear$);MSHookMessageEx(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(viewWillDisappear:), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$viewWillDisappear$, (IMP*)&_logos_orig$_ungrouped$AWEFeedTableViewController$viewWillDisappear$);MSHookMessageEx(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(viewDidAppear:), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$viewDidAppear$, (IMP*)&_logos_orig$_ungrouped$AWEFeedTableViewController$viewDidAppear$);MSHookMessageEx(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(viewWillAppear:), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$viewWillAppear$, (IMP*)&_logos_orig$_ungrouped$AWEFeedTableViewController$viewWillAppear$);MSHookMessageEx(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(_addNotifications), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$_addNotifications, (IMP*)&_logos_orig$_ungrouped$AWEFeedTableViewController$_addNotifications);{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(BOOL), strlen(@encode(BOOL))); i += strlen(@encode(BOOL)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(isStartPlayNext), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$isStartPlayNext, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(BOOL), strlen(@encode(BOOL))); i += strlen(@encode(BOOL)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(setIsStartPlayNext:), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$setIsStartPlayNext$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(BOOL), strlen(@encode(BOOL))); i += strlen(@encode(BOOL)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(viewIsDisappear), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$viewIsDisappear, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(BOOL), strlen(@encode(BOOL))); i += strlen(@encode(BOOL)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(setViewIsDisappear:), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$setViewIsDisappear$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'i'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(autoScrollCount), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$autoScrollCount, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = 'i'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(setAutoScrollCount:), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$setAutoScrollCount$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(xy_motionShakeNotification), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$xy_motionShakeNotification, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(xy_didBecomeActiveNotification), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$xy_didBecomeActiveNotification, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(xy_willResignActiveNotification), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$xy_willResignActiveNotification, _typeEncoding); }MSHookMessageEx(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$AWEFeedTableViewController$viewDidLoad);{ char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(NSIndexPath *)); class_addMethod(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(xy_lastAutoScrollIndexPath), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$xy_lastAutoScrollIndexPath, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(NSIndexPath *)); class_addMethod(_logos_class$_ungrouped$AWEFeedTableViewController, @selector(setXy_lastAutoScrollIndexPath:), (IMP)&_logos_method$_ungrouped$AWEFeedTableViewController$setXy_lastAutoScrollIndexPath, _typeEncoding); } Class _logos_class$_ungrouped$AWEAwemePlayInteractionViewController = objc_getClass("AWEAwemePlayInteractionViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(performLikeAction), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$performLikeAction, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$performLikeAction);MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayInteractionViewController, @selector(onVideoPlayerViewDoubleClicked:), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionViewController$onVideoPlayerViewDoubleClicked$, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayInteractionViewController$onVideoPlayerViewDoubleClicked$);Class _logos_class$_ungrouped$AWEFeedCellViewController = objc_getClass("AWEFeedCellViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEFeedCellViewController, @selector(_onVideoPlayerViewClicked:), (IMP)&_logos_method$_ungrouped$AWEFeedCellViewController$_onVideoPlayerViewClicked$, (IMP*)&_logos_orig$_ungrouped$AWEFeedCellViewController$_onVideoPlayerViewClicked$);Class _logos_class$_ungrouped$AWECommentListViewController = objc_getClass("AWECommentListViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWECommentListViewController, @selector(sendCommentContent:inputView:isRetry:), (IMP)&_logos_method$_ungrouped$AWECommentListViewController$sendCommentContent$inputView$isRetry$, (IMP*)&_logos_orig$_ungrouped$AWECommentListViewController$sendCommentContent$inputView$isRetry$);MSHookMessageEx(_logos_class$_ungrouped$AWECommentListViewController, @selector(likeCommentAtIndexPath:isLike:), (IMP)&_logos_method$_ungrouped$AWECommentListViewController$likeCommentAtIndexPath$isLike$, (IMP*)&_logos_orig$_ungrouped$AWECommentListViewController$likeCommentAtIndexPath$isLike$);MSHookMessageEx(_logos_class$_ungrouped$AWECommentListViewController, @selector(closeBtnClicked:), (IMP)&_logos_method$_ungrouped$AWECommentListViewController$closeBtnClicked$, (IMP*)&_logos_orig$_ungrouped$AWECommentListViewController$closeBtnClicked$);Class _logos_class$_ungrouped$AWEUserDetailViewController = objc_getClass("AWEUserDetailViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEUserDetailViewController, @selector(followBtnClicked), (IMP)&_logos_method$_ungrouped$AWEUserDetailViewController$followBtnClicked, (IMP*)&_logos_orig$_ungrouped$AWEUserDetailViewController$followBtnClicked);MSHookMessageEx(_logos_class$_ungrouped$AWEUserDetailViewController, sel_registerName("dealloc"), (IMP)&_logos_method$_ungrouped$AWEUserDetailViewController$dealloc, (IMP*)&_logos_orig$_ungrouped$AWEUserDetailViewController$dealloc);MSHookMessageEx(_logos_class$_ungrouped$AWEUserDetailViewController, @selector(init), (IMP)&_logos_method$_ungrouped$AWEUserDetailViewController$init, (IMP*)&_logos_orig$_ungrouped$AWEUserDetailViewController$init);MSHookMessageEx(_logos_class$_ungrouped$AWEUserDetailViewController, @selector(unfollowed), (IMP)&_logos_method$_ungrouped$AWEUserDetailViewController$unfollowed, (IMP*)&_logos_orig$_ungrouped$AWEUserDetailViewController$unfollowed);MSHookMessageEx(_logos_class$_ungrouped$AWEUserDetailViewController, @selector(followed), (IMP)&_logos_method$_ungrouped$AWEUserDetailViewController$followed, (IMP*)&_logos_orig$_ungrouped$AWEUserDetailViewController$followed);MSHookMessageEx(_logos_class$_ungrouped$AWEUserDetailViewController, @selector(backBtnClicked:), (IMP)&_logos_method$_ungrouped$AWEUserDetailViewController$backBtnClicked$, (IMP*)&_logos_orig$_ungrouped$AWEUserDetailViewController$backBtnClicked$);MSHookMessageEx(_logos_class$_ungrouped$AWEUserDetailViewController, @selector(setUser:), (IMP)&_logos_method$_ungrouped$AWEUserDetailViewController$setUser$, (IMP*)&_logos_orig$_ungrouped$AWEUserDetailViewController$setUser$);MSHookMessageEx(_logos_class$_ungrouped$AWEUserDetailViewController, @selector(setUserID:), (IMP)&_logos_method$_ungrouped$AWEUserDetailViewController$setUserID$, (IMP*)&_logos_orig$_ungrouped$AWEUserDetailViewController$setUserID$);MSHookMessageEx(_logos_class$_ungrouped$AWEUserDetailViewController, @selector(setPreloadedUser:), (IMP)&_logos_method$_ungrouped$AWEUserDetailViewController$setPreloadedUser$, (IMP*)&_logos_orig$_ungrouped$AWEUserDetailViewController$setPreloadedUser$);Class _logos_class$_ungrouped$AWECommentPanelBaseCell = objc_getClass("AWECommentPanelBaseCell"); MSHookMessageEx(_logos_class$_ungrouped$AWECommentPanelBaseCell, @selector(likeButtonTapped), (IMP)&_logos_method$_ungrouped$AWECommentPanelBaseCell$likeButtonTapped, (IMP*)&_logos_orig$_ungrouped$AWECommentPanelBaseCell$likeButtonTapped);Class _logos_class$_ungrouped$AWEProfileHeaderExtraViewController = objc_getClass("AWEProfileHeaderExtraViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEProfileHeaderExtraViewController, @selector(relationBtnClicked:), (IMP)&_logos_method$_ungrouped$AWEProfileHeaderExtraViewController$relationBtnClicked$, (IMP*)&_logos_orig$_ungrouped$AWEProfileHeaderExtraViewController$relationBtnClicked$);Class _logos_class$_ungrouped$AWEUserRelationView = objc_getClass("AWEUserRelationView"); MSHookMessageEx(_logos_class$_ungrouped$AWEUserRelationView, @selector(updateRelationWithFollowStatus:followerStatus:animated:), (IMP)&_logos_method$_ungrouped$AWEUserRelationView$updateRelationWithFollowStatus$followerStatus$animated$, (IMP*)&_logos_orig$_ungrouped$AWEUserRelationView$updateRelationWithFollowStatus$followerStatus$animated$);Class _logos_class$_ungrouped$AWEMusicDetailViewController = objc_getClass("AWEMusicDetailViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEMusicDetailViewController, @selector(onCollectionBtnClicked:), (IMP)&_logos_method$_ungrouped$AWEMusicDetailViewController$onCollectionBtnClicked$, (IMP*)&_logos_orig$_ungrouped$AWEMusicDetailViewController$onCollectionBtnClicked$);Class _logos_class$_ungrouped$AWEAwemePlayInteractionPresenter = objc_getClass("AWEAwemePlayInteractionPresenter"); MSHookMessageEx(_logos_class$_ungrouped$AWEAwemePlayInteractionPresenter, @selector(enterMusicDetail:), (IMP)&_logos_method$_ungrouped$AWEAwemePlayInteractionPresenter$enterMusicDetail$, (IMP*)&_logos_orig$_ungrouped$AWEAwemePlayInteractionPresenter$enterMusicDetail$);Class _logos_class$_ungrouped$AWEShareServiceUtils = objc_getClass("AWEShareServiceUtils"); Class _logos_metaclass$_ungrouped$AWEShareServiceUtils = object_getClass(_logos_class$_ungrouped$AWEShareServiceUtils); MSHookMessageEx(_logos_metaclass$_ungrouped$AWEShareServiceUtils, @selector(_shareAwemeForSaveVideo:forBTDShareType:preprocess:delegateType:completion:), (IMP)&_logos_meta_method$_ungrouped$AWEShareServiceUtils$_shareAwemeForSaveVideo$forBTDShareType$preprocess$delegateType$completion$, (IMP*)&_logos_meta_orig$_ungrouped$AWEShareServiceUtils$_shareAwemeForSaveVideo$forBTDShareType$preprocess$delegateType$completion$);Class _logos_class$_ungrouped$AWEDynamicWaterMarkExporter = objc_getClass("AWEDynamicWaterMarkExporter"); Class _logos_metaclass$_ungrouped$AWEDynamicWaterMarkExporter = object_getClass(_logos_class$_ungrouped$AWEDynamicWaterMarkExporter); MSHookMessageEx(_logos_metaclass$_ungrouped$AWEDynamicWaterMarkExporter, @selector(watermarkLogoImageArray), (IMP)&_logos_meta_method$_ungrouped$AWEDynamicWaterMarkExporter$watermarkLogoImageArray, (IMP*)&_logos_meta_orig$_ungrouped$AWEDynamicWaterMarkExporter$watermarkLogoImageArray);Class _logos_class$_ungrouped$AWEFeedContainerViewController = objc_getClass("AWEFeedContainerViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWEFeedContainerViewController, @selector(onDiscoverButtonClicked:), (IMP)&_logos_method$_ungrouped$AWEFeedContainerViewController$onDiscoverButtonClicked$, (IMP*)&_logos_orig$_ungrouped$AWEFeedContainerViewController$onDiscoverButtonClicked$);Class _logos_class$_ungrouped$AWEDiscoverFeedEntranceView = objc_getClass("AWEDiscoverFeedEntranceView"); MSHookMessageEx(_logos_class$_ungrouped$AWEDiscoverFeedEntranceView, @selector(awe_UITracker_gestureRecognizer:), (IMP)&_logos_method$_ungrouped$AWEDiscoverFeedEntranceView$awe_UITracker_gestureRecognizer$, (IMP*)&_logos_orig$_ungrouped$AWEDiscoverFeedEntranceView$awe_UITracker_gestureRecognizer$);Class _logos_class$_ungrouped$AWESearchResultViewController = objc_getClass("AWESearchResultViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWESearchResultViewController, @selector(searchWithKeyword:tabType:enterMethod:onlyShowSug:completion:), (IMP)&_logos_method$_ungrouped$AWESearchResultViewController$searchWithKeyword$tabType$enterMethod$onlyShowSug$completion$, (IMP*)&_logos_orig$_ungrouped$AWESearchResultViewController$searchWithKeyword$tabType$enterMethod$onlyShowSug$completion$);MSHookMessageEx(_logos_class$_ungrouped$AWESearchResultViewController, @selector(excuteSearch:onlyShowSug:isSearchByUserClick:enterMethod:extraLogParams:completion:), (IMP)&_logos_method$_ungrouped$AWESearchResultViewController$excuteSearch$onlyShowSug$isSearchByUserClick$enterMethod$extraLogParams$completion$, (IMP*)&_logos_orig$_ungrouped$AWESearchResultViewController$excuteSearch$onlyShowSug$isSearchByUserClick$enterMethod$extraLogParams$completion$);MSHookMessageEx(_logos_class$_ungrouped$AWESearchResultViewController, @selector(searchWithKeyword:tabType:enterMethod:completion:), (IMP)&_logos_method$_ungrouped$AWESearchResultViewController$searchWithKeyword$tabType$enterMethod$completion$, (IMP*)&_logos_orig$_ungrouped$AWESearchResultViewController$searchWithKeyword$tabType$enterMethod$completion$);MSHookMessageEx(_logos_class$_ungrouped$AWESearchResultViewController, @selector(viewControllerEndRefreshData:searchData:), (IMP)&_logos_method$_ungrouped$AWESearchResultViewController$viewControllerEndRefreshData$searchData$, (IMP*)&_logos_orig$_ungrouped$AWESearchResultViewController$viewControllerEndRefreshData$searchData$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(void (^ )(UIViewController *vc, id searchData)), strlen(@encode(void (^ )(UIViewController *vc, id searchData)))); i += strlen(@encode(void (^ )(UIViewController *vc, id searchData))); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWESearchResultViewController, @selector(setViewControllerEndRefreshDataBlock:), (IMP)&_logos_method$_ungrouped$AWESearchResultViewController$setViewControllerEndRefreshDataBlock$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(void (^ )(UIViewController *vc, id searchData)), strlen(@encode(void (^ )(UIViewController *vc, id searchData)))); i += strlen(@encode(void (^ )(UIViewController *vc, id searchData))); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AWESearchResultViewController, @selector(viewControllerEndRefreshDataBlock), (IMP)&_logos_method$_ungrouped$AWESearchResultViewController$viewControllerEndRefreshDataBlock, _typeEncoding); }Class _logos_class$_ungrouped$AWESearchViewController = objc_getClass("AWESearchViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWESearchViewController, @selector(updateSearchBarWithKeyword:), (IMP)&_logos_method$_ungrouped$AWESearchViewController$updateSearchBarWithKeyword$, (IMP*)&_logos_orig$_ungrouped$AWESearchViewController$updateSearchBarWithKeyword$);Class _logos_class$_ungrouped$UIView = objc_getClass("UIView"); Class _logos_metaclass$_ungrouped$UIView = object_getClass(_logos_class$_ungrouped$UIView); MSHookMessageEx(_logos_metaclass$_ungrouped$UIView, @selector(awe_UITracker_run), (IMP)&_logos_meta_method$_ungrouped$UIView$awe_UITracker_run, (IMP*)&_logos_meta_orig$_ungrouped$UIView$awe_UITracker_run);MSHookMessageEx(_logos_class$_ungrouped$UIView, @selector(awe_UITracker_gestureRecognizer:), (IMP)&_logos_method$_ungrouped$UIView$awe_UITracker_gestureRecognizer$, (IMP*)&_logos_orig$_ungrouped$UIView$awe_UITracker_gestureRecognizer$);MSHookMessageEx(_logos_class$_ungrouped$UIView, @selector(awe_UITracker_addGestureRecognizer:), (IMP)&_logos_method$_ungrouped$UIView$awe_UITracker_addGestureRecognizer$, (IMP*)&_logos_orig$_ungrouped$UIView$awe_UITracker_addGestureRecognizer$);Class _logos_class$_ungrouped$AWESearchUserViewController = objc_getClass("AWESearchUserViewController"); MSHookMessageEx(_logos_class$_ungrouped$AWESearchUserViewController, @selector(didFinishUnFollowUser:status:error:), (IMP)&_logos_method$_ungrouped$AWESearchUserViewController$didFinishUnFollowUser$status$error$, (IMP*)&_logos_orig$_ungrouped$AWESearchUserViewController$didFinishUnFollowUser$status$error$);MSHookMessageEx(_logos_class$_ungrouped$AWESearchUserViewController, @selector(didFinishFollowUser:status:error:), (IMP)&_logos_method$_ungrouped$AWESearchUserViewController$didFinishFollowUser$status$error$, (IMP*)&_logos_orig$_ungrouped$AWESearchUserViewController$didFinishFollowUser$status$error$);MSHookMessageEx(_logos_class$_ungrouped$AWESearchUserViewController, @selector(unfollowUser:indexPath:), (IMP)&_logos_method$_ungrouped$AWESearchUserViewController$unfollowUser$indexPath$, (IMP*)&_logos_orig$_ungrouped$AWESearchUserViewController$unfollowUser$indexPath$);MSHookMessageEx(_logos_class$_ungrouped$AWESearchUserViewController, @selector(followUser:indexPath:), (IMP)&_logos_method$_ungrouped$AWESearchUserViewController$followUser$indexPath$, (IMP*)&_logos_orig$_ungrouped$AWESearchUserViewController$followUser$indexPath$);Class _logos_class$_ungrouped$DYOneLoginViewController = objc_getClass("DYOneLoginViewController"); MSHookMessageEx(_logos_class$_ungrouped$DYOneLoginViewController, @selector(loginWithPlatform:), (IMP)&_logos_method$_ungrouped$DYOneLoginViewController$loginWithPlatform$, (IMP*)&_logos_orig$_ungrouped$DYOneLoginViewController$loginWithPlatform$);MSHookMessageEx(_logos_class$_ungrouped$DYOneLoginViewController, @selector(oneLogin), (IMP)&_logos_method$_ungrouped$DYOneLoginViewController$oneLogin, (IMP*)&_logos_orig$_ungrouped$DYOneLoginViewController$oneLogin);MSHookMessageEx(_logos_class$_ungrouped$DYOneLoginViewController, @selector(otherLoginAction), (IMP)&_logos_method$_ungrouped$DYOneLoginViewController$otherLoginAction, (IMP*)&_logos_orig$_ungrouped$DYOneLoginViewController$otherLoginAction);MSHookMessageEx(_logos_class$_ungrouped$DYOneLoginViewController, @selector(closeAction), (IMP)&_logos_method$_ungrouped$DYOneLoginViewController$closeAction, (IMP*)&_logos_orig$_ungrouped$DYOneLoginViewController$closeAction);MSHookMessageEx(_logos_class$_ungrouped$DYOneLoginViewController, @selector(initWithRouterModel:), (IMP)&_logos_method$_ungrouped$DYOneLoginViewController$initWithRouterModel$, (IMP*)&_logos_orig$_ungrouped$DYOneLoginViewController$initWithRouterModel$);Class _logos_class$_ungrouped$DYRouterModel = objc_getClass("DYRouterModel"); Class _logos_metaclass$_ungrouped$DYRouterModel = object_getClass(_logos_class$_ungrouped$DYRouterModel); MSHookMessageEx(_logos_metaclass$_ungrouped$DYRouterModel, @selector(instanceWithBackStrategy:bindStrategy:platformContext:phoneContext:ticketModel:), (IMP)&_logos_meta_method$_ungrouped$DYRouterModel$instanceWithBackStrategy$bindStrategy$platformContext$phoneContext$ticketModel$, (IMP*)&_logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBackStrategy$bindStrategy$platformContext$phoneContext$ticketModel$);MSHookMessageEx(_logos_metaclass$_ungrouped$DYRouterModel, @selector(instanceWithBackStrategy:platformContext:bindStrategy:ticketModel:), (IMP)&_logos_meta_method$_ungrouped$DYRouterModel$instanceWithBackStrategy$platformContext$bindStrategy$ticketModel$, (IMP*)&_logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBackStrategy$platformContext$bindStrategy$ticketModel$);MSHookMessageEx(_logos_metaclass$_ungrouped$DYRouterModel, @selector(instanceWithBackStrategy:bindStrategy:ticketModel:), (IMP)&_logos_meta_method$_ungrouped$DYRouterModel$instanceWithBackStrategy$bindStrategy$ticketModel$, (IMP*)&_logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBackStrategy$bindStrategy$ticketModel$);MSHookMessageEx(_logos_metaclass$_ungrouped$DYRouterModel, @selector(instanceWithBackStrategy:platformContext:ticketModel:), (IMP)&_logos_meta_method$_ungrouped$DYRouterModel$instanceWithBackStrategy$platformContext$ticketModel$, (IMP*)&_logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBackStrategy$platformContext$ticketModel$);MSHookMessageEx(_logos_metaclass$_ungrouped$DYRouterModel, @selector(instanceWithBackStrategy:emailContext:passwordContext:), (IMP)&_logos_meta_method$_ungrouped$DYRouterModel$instanceWithBackStrategy$emailContext$passwordContext$, (IMP*)&_logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBackStrategy$emailContext$passwordContext$);MSHookMessageEx(_logos_metaclass$_ungrouped$DYRouterModel, @selector(instanceWithBackStrategy:emailContext:ticketModel:), (IMP)&_logos_meta_method$_ungrouped$DYRouterModel$instanceWithBackStrategy$emailContext$ticketModel$, (IMP*)&_logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBackStrategy$emailContext$ticketModel$);MSHookMessageEx(_logos_metaclass$_ungrouped$DYRouterModel, @selector(instanceWithBackStrategy:phoneContext:ticketModel:), (IMP)&_logos_meta_method$_ungrouped$DYRouterModel$instanceWithBackStrategy$phoneContext$ticketModel$, (IMP*)&_logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBackStrategy$phoneContext$ticketModel$);MSHookMessageEx(_logos_metaclass$_ungrouped$DYRouterModel, @selector(instanceWithBackStrategy:ticketModel:), (IMP)&_logos_meta_method$_ungrouped$DYRouterModel$instanceWithBackStrategy$ticketModel$, (IMP*)&_logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBackStrategy$ticketModel$);MSHookMessageEx(_logos_metaclass$_ungrouped$DYRouterModel, @selector(instanceWithBuilder:), (IMP)&_logos_meta_method$_ungrouped$DYRouterModel$instanceWithBuilder$, (IMP*)&_logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBuilder$);MSHookMessageEx(_logos_metaclass$_ungrouped$DYRouterModel, @selector(instanceWithBlock:), (IMP)&_logos_meta_method$_ungrouped$DYRouterModel$instanceWithBlock$, (IMP*)&_logos_meta_orig$_ungrouped$DYRouterModel$instanceWithBlock$);Class _logos_class$_ungrouped$TTInstallDeviceHelper = objc_getClass("TTInstallDeviceHelper"); Class _logos_metaclass$_ungrouped$TTInstallDeviceHelper = object_getClass(_logos_class$_ungrouped$TTInstallDeviceHelper); MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(timeStamp), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$timeStamp, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$timeStamp);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(saveOpenUDIDToKeychain:), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$saveOpenUDIDToKeychain$, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$saveOpenUDIDToKeychain$);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(fetchOpenUDIDFromKeychain), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$fetchOpenUDIDFromKeychain, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$fetchOpenUDIDFromKeychain);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(resolutionString), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$resolutionString, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$resolutionString);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(resolution), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$resolution, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$resolution);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(screenScale), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$screenScale, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$screenScale);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(ssOnePixel), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$ssOnePixel, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$ssOnePixel);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(openUDID), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$openUDID, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$openUDID);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(currentLanguage), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$currentLanguage, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$currentLanguage);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(MACAddress), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$MACAddress, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$MACAddress);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(OSVersionNumber), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$OSVersionNumber, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$OSVersionNumber);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(idfvString), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$idfvString, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$idfvString);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(idfaString), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$idfaString, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$idfaString);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(getDeviceType), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$getDeviceType, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$getDeviceType);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(isJailBroken), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$isJailBroken, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$isJailBroken);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallDeviceHelper, @selector(platformName), (IMP)&_logos_meta_method$_ungrouped$TTInstallDeviceHelper$platformName, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallDeviceHelper$platformName);Class _logos_class$_ungrouped$ANSMetadata = objc_getClass("ANSMetadata"); MSHookMessageEx(_logos_class$_ungrouped$ANSMetadata, @selector(computeIsJailbroken), (IMP)&_logos_method$_ungrouped$ANSMetadata$computeIsJailbroken, (IMP*)&_logos_orig$_ungrouped$ANSMetadata$computeIsJailbroken);Class _logos_class$_ungrouped$HMDInfo = objc_getClass("HMDInfo"); MSHookMessageEx(_logos_class$_ungrouped$HMDInfo, @selector(isJailBroken), (IMP)&_logos_method$_ungrouped$HMDInfo$isJailBroken, (IMP*)&_logos_orig$_ungrouped$HMDInfo$isJailBroken);Class _logos_class$_ungrouped$UIDevice = objc_getClass("UIDevice"); MSHookMessageEx(_logos_class$_ungrouped$UIDevice, @selector(btd_isJailBroken), (IMP)&_logos_method$_ungrouped$UIDevice$btd_isJailBroken, (IMP*)&_logos_orig$_ungrouped$UIDevice$btd_isJailBroken);Class _logos_class$_ungrouped$NSFileManager = objc_getClass("NSFileManager"); MSHookMessageEx(_logos_class$_ungrouped$NSFileManager, @selector(fileExistsAtPath:), (IMP)&_logos_method$_ungrouped$NSFileManager$fileExistsAtPath$, (IMP*)&_logos_orig$_ungrouped$NSFileManager$fileExistsAtPath$);Class _logos_class$_ungrouped$NSString = objc_getClass("NSString"); MSHookMessageEx(_logos_class$_ungrouped$NSString, @selector(containsString:), (IMP)&_logos_method$_ungrouped$NSString$containsString$, (IMP*)&_logos_orig$_ungrouped$NSString$containsString$);}
    
}

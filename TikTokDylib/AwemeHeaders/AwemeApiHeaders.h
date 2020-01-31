//
//  AwemeApiHeaders.h
//  Aweme
//
//  Created by xiaoyuan on 2020/1/27.
//  Copyright © 2020 enba. All rights reserved.
//

#ifndef AwemeApiHeaders_h
#define AwemeApiHeaders_h

/*
 请充分阅读并理解
 《用户服务协议》 和 《隐私政策》
 1. 在仅浏览时，为保障服务所需，我们会申请系统权限收集设备信息、日志信息，用于信息推送和安全风控，并申请存储权限，用于下载短视频及缓存相关文件。
 2. 为了基于你的所在位置向你推荐内容、在你的个人主页显示位置信息，或经你选择在你发布的视频中显示位置信息，我们可能会申请位置权限。
 3. 为了帮你发现更多好友，我们可能会申请通讯录权限。
 4. 我们尊重你的选择权，如果你不希望被推荐给好友，你可以在“我-设置-隐私设置”中随时关闭。
 5. 为帮助你在APP中拨打投诉电话或其他咨询热线，我们可能会申请拨打电话权限，该权限不会收集隐私信息，且仅在你使用前述功能时使用。
 6. 通讯录、GPS、摄像头、麦克风、相册等敏感权限均不会默认开启，只有经过明示授权才会为实现功能或服务时使用，你均可以拒绝且不影响你继续使用抖音。
 */

/*
抖音的 聊天消息是走的google的protobuf协议
 抖音聊天消息发送过程就是：
 第一步：调用cloud/token接口获取im token
 第二步：登录im服务，登录过程参考【7】的调用链
 第三步：构建创建对话protobuf，创建对话
 第四步：使用获取到的对话信息，构建发送消息protobuf，发送消息
 https://www.52pojie.cn/thread-964766-4-1.html
*/

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ CDUnknownBlockType)(void);

@class AWEAwemePlayInteractionViewController, AWEAwemePlayInteractionPresenter, AWESearchViewController;

@interface AWEUserModel
// 关注状态 0 未关注 1 已关注
@property (readonly, nonatomic) long long followStatus;
@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *nickname;
@end


@interface AWEURLModel

@property(retain, nonatomic) NSArray *originURLList;

@end

@interface AWEVideoModel 

// 视频时长
@property (nonatomic, strong) NSNumber *duration;
@property (nonatomic) BOOL hasWatermark;
@property (nonatomic) BOOL hasEndWatermark;
@property(readonly, nonatomic) id endWatermarkDownloadURL;
// 是否是直播
- (BOOL)isLive;

@property(readonly, nonatomic) AWEURLModel *playURL;
@property(readonly, nonatomic) AWEURLModel *downloadURL;
@end

@interface AWEBaseApiModel

@end

@interface AWEAwemeStatusModel : AWEBaseApiModel


+ (id)downloadTypeJSONTransformer;
+ (id)JSONKeyPathsByPropertyKey;
@property(nonatomic) _Bool hasFusionGoods;
// 是否有淘宝商品
@property(nonatomic) _Bool hasTaobaoGoods;
// 下载类型
@property(nonatomic) unsigned long long downloadType;
// 是否被审核
@property(nonatomic) _Bool isReviewed;
// 是否在审核中
@property(readonly, nonatomic) _Bool inReviewing;
@property(nonatomic) unsigned long long privacyType;
// 允许评论
@property(nonatomic) _Bool allowComment;
// 允许分享
@property(nonatomic) _Bool allowShare;
// 已经删除的
@property(readonly, nonatomic) _Bool deleted;
@property(readonly, nonatomic) NSString *itemID;
// 强制公开状态
- (void)forcePublicStatus;
// 是否不是公开
@property(readonly, nonatomic) _Bool isNotPublic;
// 是否朋友可见
@property(readonly, nonatomic) _Bool isFriendVisible;
// 是否私有
@property(readonly, nonatomic) _Bool isPrivate;
// 是否自己可见
@property(nonatomic) _Bool isSelfSeeing;
// 是否有商品
@property(readonly, nonatomic) _Bool hasGoods;
// 是否禁止
@property(nonatomic) _Bool isProhibited;

@end



@interface AWEAwemeModel
// 作者
@property (nonatomic, strong) AWEUserModel *author;
// 视频
@property (nonatomic, strong) AWEVideoModel *video;
// 是否是广告
@property (nonatomic, assign) BOOL isAds;
@property (nonatomic, assign) BOOL preventDownload;
// 视频状态
@property (nonatomic, strong) AWEAwemeStatusModel *status;
// 是否为用户挖掘的 用于用户是否点赞
@property (nonatomic) _Bool userDigged;
// 是否是用户喜欢的
@property (nonatomic) _Bool userFavorited;
// 是否是没有账号的广告
- (BOOL)isNoAccountAd;
// 是否是直播
- (BOOL)isLive;

@end

@interface AWEListDataController : NSObject

@property(copy, nonatomic) NSString *listDataRequestID;
@property(nonatomic) _Bool isRefreshing;
@property(nonatomic) _Bool loadmoreHasMore;
@property(nonatomic) _Bool refreshHasMore;
@property(retain, nonatomic) NSMutableArray *filteredDataSource;
@property(retain, nonatomic) NSMutableArray *dataSource;
- (void)fetchForCacheWithCompletion:(CDUnknownBlockType)arg1;
- (void)loadPreviousWithCompletion:(CDUnknownBlockType)arg1;
- (void)loadMoreWithFilteredCompletion:(CDUnknownBlockType)arg1;
- (void)loadMoreWithCompletion:(CDUnknownBlockType)arg1;
- (void)refreshWithCompletion:(CDUnknownBlockType)arg1;
- (void)initFetchWithCompletion:(CDUnknownBlockType)arg1;
- (void)calculateFilteredDataSource;
- (long long)filteredDataSourceIndexFromIndex:(long long)arg1;
- (long long)dataSourceIndexFromFilteredIndex:(long long)arg1;
- (id)filterDuplicatedDatasourceWithArray:(id)arg1 isEqual:(CDUnknownBlockType)arg2;
- (id)filterDuplicatedDatasourceWithArray:(id)arg1 isEqual:(CDUnknownBlockType)arg2 didGetDuplicatedArray:(CDUnknownBlockType)arg3;
@property(nonatomic) _Bool disableLoadMore;

@end



@interface AWEFeedTableViewController: UIViewController

// 下面方法为自定义的新方法
@property (nonatomic, assign) BOOL viewIsDisappear;
// 自动滚动的数量
@property (nonatomic, assign) int autoScrollCount;
@property (nonatomic, assign) BOOL isStartPlayNext;
@property (nonatomic, strong) NSIndexPath *xy_lastAutoScrollIndexPath;
- (void)xy_stopAutoPlayNext;
- (void)xy_startAutoPlayNext;
- (void)xy_motionShakeNotification;
- (void)xy_didBecomeActiveNotification;
- (void)xy_willResignActiveNotification;
- (void)xy_toggleAutoPlayNext;
// 打开用户详情页，并关注用户
- (void)xy_followCurrentUserWithInteractionViewController:(AWEAwemePlayInteractionViewController *)interactionViewController block:(void (^)(void))block;
// 滚到到某个视频
- (void)xy_scrollToIndexPath:(NSIndexPath *)indexPath completion:(void (^)(void))completion;
// 点赞当前播放的视频
- (void)xy_likeWithInteractionViewController:(AWEAwemePlayInteractionViewController *)iVC block:(void (^_Nullable)(void))block;
// 收藏当前视频的音乐
- (void)xy_collectionMusicWithInteractionViewController:(AWEAwemePlayInteractionViewController *)iVC block:(void (^)(void))block;
// 随机滚动搜索页, 注意抖音搜索 每天都有上限，所以要控制使用，防止被禁
- (void)xy_swapSearchViewControllerWithBlock:(void (^)(void))block;

// 系统属性和方法
@property (nonatomic, strong) UIView *view;
@property (retain, nonatomic) UITableView *tableView;
@property (retain, nonatomic) AWEListDataController *dataController;
@property (nonatomic,readonly,strong) UINavigationController *navigationController;
// 当前播放的index
@property (nonatomic, assign) NSInteger currentPlayIndex;
// 是否为纯视频模式，如果设置pureMode == YES  只显示视频，不会显示视频上的AWEAwemePlayInteractionViewController view
@property(nonatomic) _Bool pureMode;
- (void)performSelector:(SEL)aSelector withObject:(nullable id)anArgument afterDelay:(NSTimeInterval)delay inModes:(NSArray<NSRunLoopMode> *)modes;
- (void)_addNotifications;
@end

@interface AWETextViewInternal : UITextView

@end

@interface AWEGrowingTextView
@property (nonatomic, strong) UITextView *internalTextView;
@property (nonatomic, strong) NSString *text;
- (BOOL)isFirstResponder;
- (BOOL)resignFirstResponder;
- (BOOL)becomeFirstResponder;
@end

@interface AWECommentListInputView

@property(retain, nonatomic) AWEGrowingTextView *textView;

@end

@interface AWECommentPanelBaseCell
// 评论cell 上的点赞按钮点击的事件调用的方法
- (void)likeButtonTapped;

@end

/// 评论列表控制器
@interface AWECommentListViewController 

@property (nonatomic, strong) UITableView *tableView;
// 评论弹框的输入框
@property (nonatomic, strong) AWECommentListInputView *commentInputView;
- (void)sendCommentContent:(NSString *)content inputView:(AWECommentListInputView *)inputView isRetry:(BOOL)isRetry;
// 点击键盘发送按钮回调的方法
- (BOOL)commentInputViewShouldReturn:(AWECommentListInputView *)inputView;
// 点击关闭按钮调的方法
- (void)closeBtnClicked:(nullable id)btn;
// 为某个评论点赞调用的方法
- (void)likeCommentAtIndexPath:(NSIndexPath *)indexPath isLike:(BOOL)isLike;
@end

@interface AWEAwemePlayInteractionViewController
@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) UIButton *likeButton;
@property (nonatomic, strong) AWEAwemeModel *fromModel;
@property (nonatomic, strong) AWEAwemeModel *model;
// 评论列表控制器
@property(retain, nonatomic) AWECommentListViewController *commentVC;
// 一些事件的响应者
@property(retain, nonatomic) AWEAwemePlayInteractionPresenter *presenter;
// 执行点击评论按钮的方法，弹出评论弹框
- (void)performCommentAction;
// 执行点赞的方法，如果已点赞则取消点赞，会取消赞 郁闷 tiktok 没有这个 方法
- (void)performLikeAction;
// 双击 视频view时调用, 由AWEFeedCellViewController 的 tapGesture 触发, 调用此方法可以触发点赞，且不会取消赞
- (void)onVideoPlayerViewDoubleClicked:(UITapGestureRecognizer *)tapGes;


@end

// AWEFeedCellViewController 继承自AWEAwemeBaseViewController
// 注意：首页的关注和推荐是两个不同的实例控制器，但是他们都是AWEFeedCellViewController，所以切换首页的关注和推荐时，播放次数也是不一样的
@interface AWEFeedCellViewController 
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;
@property (nonatomic, strong) AWEAwemePlayInteractionViewController *interactionController;
// UITapGestureRecognizer 的事件 target 是 AWEFeedCellViewController
- (void)_onVideoPlayerViewClicked:(UITapGestureRecognizer *)tapGes;
@end

/// 首页播放的视频所在的cell
@interface AWEFeedViewCell 

@property (nonatomic, strong) AWEFeedCellViewController *viewController;

@end

/// 用户个人详情页，播放视频的主控制器，相当于一个 主页的feedtableViewcontroller
@interface AWEAwemeDetailTableViewController

@end

@protocol AWEFeedTableViewCellViewControllerProtocol <NSObject>
@property(nonatomic) long long type;
@property(copy, nonatomic) NSString *referString;
@property(retain, nonatomic) AWEAwemeModel *model;
@property(nonatomic) long long indexPath;
- (void)prepareForDisplay;
- (void)configureWithModel:(AWEAwemeModel *)arg1;
- (void)stop;
- (void)pause;
- (void)play;
- (void)reset;

@optional
@property(copy, nonatomic) NSDictionary *extTrackLog;
- (void)purifySurfaceViews:(_Bool)arg1;
- (double)currentPlaybackTime;
- (_Bool)isCommentListShowing;
- (void)updateHeaderForBulletScreen:(double)arg1 transform:(struct CGAffineTransform)arg2;
@end

/// 首页直播所在的cell
@interface AWEFeedLiveStreamTableViewCell
// viewController实际是AWELiveFollowStreamViewController
@property(readonly, nonatomic) UIViewController<AWEFeedTableViewCellViewControllerProtocol> *viewController;
@end

@protocol AWEUserDetailViewControllerProtocol <NSObject>
@property (nonatomic, strong) AWEAwemeModel *model;
@property (nonatomic, copy) NSString *userID;
- (void)setPreloadedUser:(AWEUserModel *)arg1;
@end

@interface AWEAnimatedButton : UIButton

@end

@interface AWEUserRelationView

// 0 为 没有被关注 1 为 已经被关注
@property (readonly, nonatomic) long long followerStatus;
// 0 为 没有关注 1 为 已经关注
@property (readonly, nonatomic) long long followStatus;
// 关注按钮
@property(retain, nonatomic) AWEAnimatedButton *relationTitleBtn;

@end

@interface AWEProfileHeaderExtraViewController
// 是否为当前登陆的用户
@property (nonatomic) BOOL isCurrentUser;
@property (nonatomic, strong) AWEUserRelationView *relationView;
// _relationView->_relationTitleBtn 点击事件
- (void)relationBtnClicked:(nullable id)btn;
@end

@interface AWEProfileHeaderView

@property (nonatomic, strong) AWEProfileHeaderExtraViewController *extraViewController;

@end

@interface AWEProfileHeaderViewController
@property (nonatomic, strong) AWEProfileHeaderView *profileHeaderView;
@end

@interface AWEUserDetailViewController <AWEUserDetailViewControllerProtocol>

@property (nonatomic, strong) AWEProfileHeaderViewController *profileHeaderVC;
// 点击返回按钮调用
- (void)backBtnClicked:(nullable id)arg1;
@end

/// 音乐详情控制器，用于收藏音乐的
@interface AWEMusicDetailViewController

// 收藏按钮
@property (retain, nonatomic) UIButton *collectionBtn;
@property(nullable, nonatomic,readonly,strong) UINavigationController *navigationController;
// 点击收藏按钮的回调
- (void)onCollectionBtnClicked:(nullable id)arg1;
@end

@interface AWEAwemePlayInteractionPresenter 
// 点击视频播放页 音乐按钮 进入 音乐详情页
- (void)enterMusicDetail:(nullable UITapGestureRecognizer *)tapGesture;
- (void)p_goToPersonalPage:(id)arg1 gestureRecognizer:(id)arg2;
// 取消关注 按钮的点击手势
- (void)onUnFollowViewClicked:(UITapGestureRecognizer *)arg1;
// 关注 按钮的点击手势
- (void)onFollowViewClicked:(UITapGestureRecognizer *)arg1;
@end

@interface AWESettingsViewModel

- (void)tapContentPreferenceCell;
- (void)tapDataSaverCell;
- (void)tapRocketFansGroupCell;
- (void)tapFansCell;
- (void)tapToutiaoCell;
- (void)tapLinkAuthorizeCell;
- (void)tapSafetyCenterCell;
- (void)tapInsights;
- (void)tapCommunityGuidelinesCell;
- (void)tapGoodsGuideCell;
- (void)tapGoodsManagementCell;
- (void)tapWalletCell;
- (void)tapAddAccountCell;
- (void)logOut;
- (void)tapLogOutCell;
- (void)tapBetaTestCell;
- (void)tapNetDiagnoseCell;
- (void)tapCleanCacheCell;
- (void)tapAboutAmeCell;
- (void)tapUserServiceCell;
- (void)tapTeenModeCell;
- (void)tapTimeLockCell;
- (void)tapOneDaySettingCell;
- (void)tapGeneralSettingCell;
- (void)tapStarAtlasCell;
- (void)tapTeenagerProtectionCell;
- (void)tapHelpCenterCell;
- (void)tapImpressumCell;
- (void)tapCopyrightPolicyCell;
- (void)tapPrivacyPolicyCell;
- (void)tapConnectToAppleMusicCell;
- (void)tapAccessibilityCell;
- (void)tapIronManCell;
- (void)tapPushSettingCell;
- (void)tapFeedBackCell;
- (void)tapInviteFriendsCell;
- (void)tapAccountSiginInCell;
- (void)tapAccountManageCell;
- (void)tapSetOrChangePasswordCell;
- (void)logoutAction:(id)arg1;
- (void)tapGuidanceForParentsCell;
- (void)tapMyQRCodeCell;
- (void)tapShareProfileCell;
- (void)tapPrivacySettingCell;
- (void)updateSectionDataArray;
- (void)refreshAllCells;
// 数据源
@property(retain, nonatomic) NSArray *sectionDataArray;
- (id)sectionDataArray;

// new
@property (nonatomic, copy) NSString *isHooked;

@end

@interface AWEDynamicWaterMarkExporter

@property (nonatomic, strong) AWEAwemeModel *model;

@end

@interface AWESettingSectionModel

@property(copy, nonatomic) NSString *sectionFooterTitle;
@property(retain, nonatomic) NSArray *itemArray;
@property(nonatomic) double sectionHeaderHeight;
@property(copy, nonatomic) NSString *sectionHeaderTitle;
@property(nonatomic) long long type; 

@end

@interface AWESettingItemModel: NSObject

@property(copy, nonatomic) id cellRefreshBlock;
@property(copy, nonatomic) id switchChangedBlock;
@property(copy, nonatomic) void(^cellTappedBlock)(void);
@property(nonatomic) double cellHeight;
@property(nonatomic) long long dotType;
@property(nonatomic) _Bool showDotView;
@property(nonatomic) _Bool isEnable;
@property(nonatomic) _Bool isSwitchOn;
@property(nonatomic) long long cellType;
@property(copy, nonatomic) NSString *iconImageName;
@property(copy, nonatomic) NSString *detail;
@property(copy, nonatomic) NSString *fancySubtitle;
@property(copy, nonatomic) NSString *subTitle;
@property(copy, nonatomic) NSString *title;
@property(nonatomic) long long type;

@end

@interface AWEFeedContainerViewController

/// 点击主页 搜索按钮的手势 的action，target 为 AWEFeedContainerViewController， view 为 AWEDiscoverFeedEntranceView
/// 用于调转到搜索页的 AWESearchViewController
/// 另一个action 为 awe_UITracker_gestureRecognizer， target 是 AWEDiscoverFeedEntranceView
- (void)onDiscoverButtonClicked:(id)arg1;

@end

@interface AWEFeedRootViewController: UIViewController

@property(retain, nonatomic) AWEFeedContainerViewController *contentViewController;

@end

@interface AWESearchBar : UISearchBar <UITextFieldDelegate>
@property (nonatomic, weak) UITextField *ownSearchField;
@end

@interface AWESlidingTabbarView
@property(retain, nonatomic) NSMutableArray *buttonArray;
- (void)tabButtonClicked:(id)arg1;
@end

@interface AWESlidingViewController
- (void)scrollToIndex:(long long)arg1 animated:(_Bool)arg2;
@end

@interface AWESearchResultViewController: UIViewController
// 执行搜索的方法
- (void)searchWithKeyword:(id)arg1 tabType:(unsigned long long)arg2 enterMethod:(id)arg3 onlyShowSug:(_Bool)arg4 completion:(CDUnknownBlockType)arg5;
// 搜索的各类型控制器 AWESearchUserViewController 是搜索用户结果的控制器 AWEGeneralSearchViewController 是综合
@property(retain, nonatomic) NSMutableArray *childControllers;
@property(nonatomic) long long selectIndex;
// 搜索结果的segment view
@property(retain, nonatomic) AWESlidingTabbarView *tabView;
@property(retain, nonatomic) AWESlidingViewController *slidingViewController;
// 子控制器 刷新完成数据后调用，
- (void)viewControllerEndRefreshData:(UIViewController *)arg1 searchData:(id)arg2;

// 非 aweme 的方法，new
@property (nonatomic, copy, nullable) void (^ viewControllerEndRefreshDataBlock)(UIViewController *vc, id searchData);
@end

@interface AWESearchViewController: UIViewController

@property(retain, nonatomic) AWESearchBar *searchBar;
@property(retain, nonatomic) AWESearchResultViewController *searchResultViewController;
// 点击键盘搜索按钮 调用的方法
- (void)searchBarSearchButtonClicked:(AWESearchBar *)arg1;
@end

/// 搜索用户结果的模型
@interface AWESearchUser

@property(retain, nonatomic) AWEUserModel *userInfo;

@end

@interface AWESearchUserManager

@property(retain, nonatomic) NSMutableArray<AWESearchUser *> *userArray;

@end

/// 搜索结果用户控制器
@interface AWESearchUserViewController

/// viewModel 数据源在此
@property (nonatomic, strong) AWESearchUserManager *manager;

- (void)didFinishBlockUser:(AWESearchUser *)arg1 status:(long long)arg2;
- (void)didFinishUnFollowUser:(AWESearchUser *)arg1 status:(long long)arg2 error:(id)arg3;
- (void)didFinishFollowUser:(AWESearchUser *)arg1 status:(long long)arg2 error:(id)arg3;
- (void)unfollowUser:(AWESearchUser *)arg1 indexPath:(id)arg2;
- (void)followUser:(AWESearchUser *)arg1 indexPath:(id)arg2;

@end

@interface AWESearchUserTableViewCell
// 点击关注按钮调用
- (void)actionBtnClicked;

@end

@interface DYPhoneNumberModel : NSObject

@property(copy, nonatomic) NSString *number;
@property(copy, nonatomic) NSString *countryCode;
- (id)hideFourPlacesForPhoneNumberWithoutCountryCode:(id)arg1;
- (_Bool)isEqual:(id)arg1;
- (id)numberStringWithSpaceAfterCountryCode;
- (id)numberStringValueWithStar;
- (id)numberWithCountryCode;
- (id)initWithString:(id)arg1;

@end

@interface DYASecurityTicketModel

@end

@interface DYRouterModel : NSObject

// 以下instanceWithBackStrategy方法 都是创建实例对象的类方法
+ (id)instanceWithBackStrategy:(unsigned long long)arg1 bindStrategy:(unsigned long long)arg2 platformContext:(unsigned long long)arg3 phoneContext:(id)arg4 ticketModel:(id)arg5;
+ (id)instanceWithBackStrategy:(unsigned long long)arg1 platformContext:(unsigned long long)arg2 bindStrategy:(unsigned long long)arg3 ticketModel:(id)arg4;
+ (id)instanceWithBackStrategy:(unsigned long long)arg1 bindStrategy:(unsigned long long)arg2 ticketModel:(id)arg3;
+ (id)instanceWithBackStrategy:(unsigned long long)arg1 platformContext:(unsigned long long)arg2 ticketModel:(id)arg3;
+ (id)instanceWithBackStrategy:(unsigned long long)arg1 emailContext:(id)arg2 passwordContext:(id)arg3;
+ (id)instanceWithBackStrategy:(unsigned long long)arg1 emailContext:(id)arg2 ticketModel:(id)arg3;
+ (id)instanceWithBackStrategy:(unsigned long long)arg1 phoneContext:(id)arg2 ticketModel:(id)arg3;
+ (id)instanceWithBackStrategy:(unsigned long long)arg1 ticketModel:(id)arg2;
+ (id)instanceWithBuilder:(id)arg1;
+ (id)instanceWithBlock:(CDUnknownBlockType)block;
@property(retain, nonatomic) DYASecurityTicketModel *ticketModel; // @synthesize ticketModel=_ticketModel;
@property(nonatomic) unsigned long long bindStrategy; // @synthesize bindStrategy=_bindStrategy;
@property(nonatomic) unsigned long long platformContext; // @synthesize platformContext=_platformContext;
@property(retain, nonatomic) NSString *passwordContext; // @synthesize passwordContext=_passwordContext;
@property(retain, nonatomic) NSString *emailContext; // @synthesize emailContext=_emailContext;
@property(retain, nonatomic) DYPhoneNumberModel *phoneContext; // @synthesize phoneContext=_phoneContext;
@property(nonatomic) unsigned long long backStrategy; // @synthesize backStrategy=_backStrategy;

@end

/*
 创建登陆页面
 DYRouterModel *model = [DYRouterModel instanceWithBackStrategy:2 platformContext:4 ticketModel:nil];
 DYOneLoginViewController *vc = [[DYOneLoginViewController alloc] initWithRouterModel:model];
 vc.enterMethod = @"click_mine";
 vc.enterFrom = @"personal_homepage";
 self.navigation push
 */
@interface DYOneLoginViewController: UIViewController
@property(copy, nonatomic) NSString *enterMethod; // @synthesize enterMethod=_enterMethod;
@property(copy, nonatomic) NSString *enterFrom; // @synthesize enterFrom=_enterFrom;
- (void)loginWithPlatform:(unsigned long long)arg1;
- (void)oneLogin;
- (void)otherLoginAction;
- (void)closeAction;
- (id)initWithRouterModel:(DYRouterModel *)arg1;

@end

@interface UIView (AWEUITracker) ///<AWEUITrackerRunner>
+ (void)awe_UITracker_run;
- (void)awe_UITracker_gestureRecognizer:(id)arg1;
- (void)awe_UITracker_addGestureRecognizer:(id)arg1;
@end

/// 与设备和udid 有关的工具类
@interface TTInstallDeviceHelper

+ (long long)timeStamp;
+ (void)saveOpenUDIDToKeychain:(id)arg1;
+ (id)fetchOpenUDIDFromKeychain;
+ (id)resolutionString;
+ (struct CGSize)resolution;
+ (double)screenScale;
+ (double)ssOnePixel;
+ (id)openUDID;
+ (id)currentLanguage;
+ (id)MACAddress;
+ (float)OSVersionNumber;
+ (id)idfvString;
+ (id)idfaString;
+ (unsigned long long)getDeviceType;
+ (_Bool)isJailBroken;
+ (id)platformName; // iphone

@end

@interface HMDInfo

/// 反越狱检测
// NO 启动时调用, 播放下一个视频时会掉这个方法，此方法调用频繁，验证是否为越狱设备，如果是越狱设备不能登陆
// 通过调用栈，得知调用了[NSFileManager fileExistsAtPath:@"/Applications/Cydia.app"] 和  /private/var/lib/apt
- (BOOL)isJailBroken;
@end

NS_ASSUME_NONNULL_END

#endif /* AwemeApiHeaders_h */



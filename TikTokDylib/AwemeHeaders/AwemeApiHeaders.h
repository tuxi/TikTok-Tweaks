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
#import "XYVideoDownloader.h"
#import "AwemeApiHeaders1.h"
#import "AMEMessageHeaders.h"

NS_ASSUME_NONNULL_BEGIN

//typedef void (^ CDUnknownBlockType)(void);
typedef id CDUnknownBlockType;
@class XYVideoDownloader;

@class AWEAwemePlayInteractionViewController, AWEAwemePlayInteractionPresenter, AWESearchViewController, AWEAwemeShareViewController, AWECommentListInputView, AWECommentListManager, AWESlidingTabbarView, AWESlidingTabButton, AWEUserProfileSlidingViewController, AWEUserFavoriteViewController, AWEUserDynamicViewController, AWELikeWorkViewController, AWEPostWorkViewController, AWEAwemeBaseViewController, AWESettingBaseViewModel, AWESettingItemModel;

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
// 视频标题，基本没有 nil
@property (copy, nonatomic) NSString *title;
// 视频描述内容
@property(copy, nonatomic) NSString *descriptionString;
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
@property (nonatomic, strong) XYVideoDownloader *xy_downloader;

// 获取当前显示的分享控制面板
- (nullable AWEAwemeShareViewController *)xy_getShareViewController;

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

@protocol AWECommentListInputViewDelegate <NSObject>
- (_Bool)commentInputViewShouldBeginEditing:(AWECommentListInputView *)arg1;
- (void)commentInputView:(AWECommentListInputView *)arg1 didChangeHeightWithDiff:(double)arg2;
// 评论inputView 点击键盘确定 响应的事件
- (_Bool)commentInputViewShouldReturn:(AWECommentListInputView *)arg1;

@optional
- (void)commentInputViewDidHide:(AWECommentListInputView *)arg1;
- (void)commentInputViewWillHideAdditionalAnimation:(AWECommentListInputView *)arg1 keyboardSize:(struct CGSize)arg2;
- (void)commentInputViewWillHide:(AWECommentListInputView *)arg1 keyboardSize:(struct CGSize)arg2;
- (void)commentInputViewDidChangeFrame:(AWECommentListInputView *)arg1;
- (void)commentInputViewWillChangeFrameAdditionalAnimation:(AWECommentListInputView *)arg1;
- (void)commentInputViewWillChangeFrame:(AWECommentListInputView *)arg1 keyboardSize:(struct CGSize)arg2;
- (void)commentInputViewDidShow:(AWECommentListInputView *)arg1;
- (void)commentInputViewWillShowAdditionalAnimation:(AWECommentListInputView *)arg1 keyboardSize:(struct CGSize)arg2;
- (void)commentInputViewWillShow:(AWECommentListInputView *)arg1 keyboardSize:(struct CGSize)arg2;
- (_Bool)commentInputViewShouldRemoveFromSuperAfterHide:(AWECommentListInputView *)arg1;
- (_Bool)commentInputViewShouldChangeFrameBySuperview:(AWECommentListInputView *)arg1;
- (void)growingTextViewDidChange:(AWEGrowingTextView *)arg1;
- (void)growingTextViewDidEndEditing:(AWEGrowingTextView *)arg1;
- (void)growingTextViewDidBeginEditing:(AWEGrowingTextView *)arg1;
- (void)commentInputViewEmoticonButtonClicked:(UIButton *)arg1;
- (_Bool)commentInputViewAtButtonAndEmoticonButtonEnable:(AWECommentListInputView *)arg1;
@end


@interface AWECommentListInputView: UIView

@property (retain, nonatomic) AWEGrowingTextView *textView;
@property (nonatomic, strong) AWEAwemeModel *model;
// inputView 的 代理，当转发视频时，delegate 为 AWECreateRepostController 类型的
@property (nonatomic, weak) id<AWECommentListInputViewDelegate> delegate;
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
// 评论列表的数据源
@property (nonatomic, strong) AWECommentListManager *listManager;
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
// 执行点赞的方法，如果已点赞则取消点赞，会取消赞
- (void)performLikeAction;
// 双击 视频view时调用, 由AWEFeedCellViewController 的 tapGesture 触发, 调用此方法可以触发点赞，且不会取消赞
- (void)onVideoPlayerViewDoubleClicked:(UITapGestureRecognizer *)tapGes;

@end

// AWEFeedCellViewController 继承自AWEAwemeBaseViewController
// 注意：首页的关注和推荐是两个不同的实例控制器，但是他们都是AWEFeedCellViewController，所以切换首页的关注和推荐时，播放次数也是不一样的
@interface AWEFeedCellViewController //: AWEAwemeBaseViewController
// UITapGestureRecognizer 的事件 target 是 AWEFeedCellViewController
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;
@property (nonatomic, strong) AWEAwemePlayInteractionViewController *interactionController;
- (void)_onVideoPlayerViewClicked:(UITapGestureRecognizer *)tapGes;
@end

/// 首页播放的视频所在的cell
@interface AWEFeedViewCell 

@property (nonatomic, strong) AWEFeedCellViewController *viewController;

@end

/// 用户个人详情页，播放视频的主控制器，相当于一个 主页的 AWEFeedTableViewController
@interface AWEAwemeDetailTableViewController: UIViewController


// AWEAwemeDetailTableViewCell
@property(retain, nonatomic) UITableView *tableView;
- (AWEAwemeModel *)currentDisplayingAweme;

@property (nonatomic, assign) BOOL viewIsDisappear;
@property (nonatomic, strong) XYVideoDownloader *xy_downloader;
@end


@interface AWEAwemeDetailCellViewController //: AWEAwemeBaseViewController
// UITapGestureRecognizer 的事件 target 是 AWEFeedCellViewController
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;
@property (nonatomic, strong) AWEAwemePlayInteractionViewController *interactionController;
- (void)_onVideoPlayerViewClicked:(UITapGestureRecognizer *)tapGes;
@end


// 从用户主页作品播放一个作品后 的cell
@interface AWEAwemeDetailTableViewCell
@property(retain, nonatomic) AWEAwemeDetailCellViewController *viewController;
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

/// 用户主页控制器
@interface AWEUserDetailViewController: UIViewController <AWEUserDetailViewControllerProtocol>

// 头部视图的控制器
@property (nonatomic, strong) AWEProfileHeaderViewController *profileHeaderVC;
// segment view
@property(retain, nonatomic) AWESlidingTabbarView *tabView;
// 子控制器的容器控制器
@property(retain, nonatomic) AWEUserProfileSlidingViewController *slidingVC;
// 收藏控制器
@property(retain, nonatomic) AWEUserFavoriteViewController *favoriteVC;
// 动态控制器
@property(retain, nonatomic) AWEUserDynamicViewController *dynamicVC;
// 喜欢控制器
@property(retain, nonatomic) AWELikeWorkViewController *likeVC;
// 发布的作品控制器
@property(retain, nonatomic) AWEPostWorkViewController *postVC;
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

// 点击音乐按钮的事件
- (void)onMusicButtonClicked:(id)arg1;
// 点击分享按钮的事件
- (void)onShareButtonClicked:(id)arg1;
// 点击评论按钮的事件
- (void)onCommentButtonClicked:(id)arg1;
// 点击喜欢按钮的事件
- (void)onLikeButtonClicked:(id)arg1;
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
@property(retain, nonatomic) NSArray<AWESettingItemModel *> *itemArray;
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
@property(retain, nonatomic) NSString *identifier;
@property(nonatomic) _Bool isSelect; 

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
- (void)tabButtonClicked:(AWESlidingTabButton *)arg1;
@end

@interface AWESlidingViewController
// AWEPostWorkViewController 为 作品控制器
@property(retain, nonatomic) NSMutableArray *viewControllers;
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
// 其他登陆事件，这个我用到了，抖音底部的登陆按钮，使用其他账号登陆
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

@class  AWEShareItem;
@interface AWEShareCollectionView : UICollectionView
{
    NSArray<AWEShareItem *> *_items;
    unsigned long long _preferredItemStyle;
}

@property(nonatomic) unsigned long long preferredItemStyle; // @synthesize preferredItemStyle=_preferredItemStyle;
@property(readonly, copy, nonatomic) NSArray<AWEShareItem *> *items; // @synthesize items=_items;
- (void)updateCell:(id)arg1 withItem:(id)arg2;
- (void)sendEvents:(unsigned long long)arg1 toItemAtIndexPath:(id)arg2;
- (id)indexPathForItemWithType:(id)arg1;
- (AWEShareItem *)itemWithType:(id)arg1;
- (_Bool)reloadCellForItemWithType:(id)arg1;
- (id)initWithItems:(NSArray<AWEShareItem *> *)items hostView:(id)arg2;

@end

@class NSMutableArray, NSString, UIImage, UIView;
@protocol AWEShareItemDelegate;

@interface AWEShareItem : NSObject
{
    _Bool _enabled;
    _Bool _showsBadgeOnImage;
    _Bool _shouldBubbleAnimate;
    _Bool _hasAppeared;
    _Bool _hasDisappeared;
    NSString *_shareType;
    unsigned long long _style;
    NSString *_title;
    UIImage *_image;
    CDUnknownBlockType _bubbleAnimations;
    UIView *_customView;
    id <AWEShareItemDelegate> _delegate;
    NSMutableArray *_eventsWithHandlers;
}

@property(retain, nonatomic) NSMutableArray *eventsWithHandlers; // @synthesize eventsWithHandlers=_eventsWithHandlers;
@property(nonatomic) _Bool hasDisappeared; // @synthesize hasDisappeared=_hasDisappeared;
@property(nonatomic) _Bool hasAppeared; // @synthesize hasAppeared=_hasAppeared;
@property(nonatomic) id delegate; // @synthesize delegate=_delegate;
@property(retain, nonatomic) UIView *customView; // @synthesize customView=_customView;
@property(copy, nonatomic) CDUnknownBlockType bubbleAnimations; // @synthesize bubbleAnimations=_bubbleAnimations;
@property(nonatomic) _Bool shouldBubbleAnimate; // @synthesize shouldBubbleAnimate=_shouldBubbleAnimate;
@property(nonatomic) _Bool showsBadgeOnImage; // @synthesize showsBadgeOnImage=_showsBadgeOnImage;
@property(retain, nonatomic) UIImage *image; // @synthesize image=_image;
@property(copy, nonatomic) NSString *title; // @synthesize title=_title;
@property(nonatomic, getter=isEnabled) _Bool enabled; // @synthesize enabled=_enabled;
@property(nonatomic) unsigned long long style; // @synthesize style=_style;
@property(readonly, copy, nonatomic) NSString *shareType; // @synthesize shareType=_shareType;
- (void)registerHandler:(CDUnknownBlockType)arg1 forEvents:(unsigned long long)arg2;
- (void)notifyDelegateWithEvents:(unsigned long long)arg1;
- (void)sendEvents:(unsigned long long)arg1 withView:(id)arg2;
- (id)initWithType:(id)arg1;

@end

/// 抖音的分享面板 中的cell 也是转发所在的cell， 属于自定义的view 并非cell
@interface AWEShareIconAndTitleCell
@property(nonatomic, strong) UILabel *titleLabel;
@property(retain, nonatomic) UIImageView *iconImageView;
// 分享类型
@property(nonatomic, assign) long long shareType;
// 点击cell的tap 事件
- (void)tapGestureRecognized;
@end
/// 抖音的分享面板
/**
 显示分享面板
 AWEAwemeShareViewController *shareVC = [AWEAwemeShareViewController new];
 [shareVC showOnWindow:[[UIApplication sharedApplication].delegate window] enableMask:NO  completion:nil];
 
 隐藏分享面板
 [shareVC dismiss];
 */
@interface AWEAwemeShareViewController: UIViewController
// 将分享面板 显示到某个window 上；
- (void)showOnWindow:(id)arg1 enableMask:(_Bool)arg2 completion:(CDUnknownBlockType)arg3;
// 移除分享面板
- (void)dismiss;

- (_Bool)mus_shareDownloadDisabledForType:(long long)arg1;
- (void)_updateFirstLineView;
- (void)_updateSecondLineView;
// 分享面板 第一行的scrollView
// 通过其subviews 可以看到，第一个subview 为 转发 （AWEShareIconAndTitleCell）
@property(retain, nonatomic) UIScrollView *firstLineView;
// 分享面板 第二行的scrollView
@property(retain, nonatomic) UIScrollView *secondLineView;
@property(retain, nonatomic) NSMutableArray *secondLineShareChannels;
@property(retain, nonatomic) NSMutableArray *firstLineShareChannels;
@end

// 评论的model
@interface AWECommentModel : NSObject
@property(copy, nonatomic) NSString *labelInfo; // @synthesize labelInfo=_labelInfo;
@property(nonatomic) _Bool isSubComment; // @synthesize isSubComment=_isSubComment;
@property(copy, nonatomic) NSNumber *subCommentCount;
@property(retain, nonatomic) AWEAwemeModel *model; // @synthesize model=_model;
@property(copy, nonatomic) NSString *adLinkText; // @synthesize adLinkText=_adLinkText;
@property(nonatomic) _Bool isVideoTitle;
@property(nonatomic) _Bool isAdComment;
@property(copy, nonatomic) NSArray *textExtras; // @synthesize textExtras=_textExtras;
@property(copy, nonatomic) NSArray *replyComments; // @synthesize replyComments=_replyComments;
@property(nonatomic) _Bool userDigged; // @synthesize userDigged=_userDigged;
@property(copy, nonatomic) NSString *tagText; // @synthesize tagText=_tagText;
@property(copy, nonatomic) NSString *replySubCommentAutherName;
@property(nonatomic) _Bool likedByCreator;
// 评论内容
@property(copy, nonatomic) NSString *content;
@property(nonatomic) long long adLinkType;
@property(readonly, nonatomic) AWECommentModel *quotedComment;
@property(readonly, nonatomic) AWECommentModel *mainComment;
@property(nonatomic) long long postState;
// 作者
@property (nonatomic, strong) AWEUserModel *author;
@end

/// 评论列表的数据源
@interface AWECommentListManager : NSObject

@property(nonatomic) _Bool isRequesting;
@property(nonatomic) _Bool showEmptyCommentList;
@property(nonatomic) long long commentCount;
@property(nonatomic) _Bool hasMore;
@property(retain, nonatomic) NSMutableDictionary *subCommentInfoDict;
@property(retain, nonatomic) NSMutableArray<AWECommentModel *> *dataList;
- (_Bool)useV2API;
- (_Bool)commentExistsInArray:(id)arg1 comment:(id)arg2;
- (id)removeDuplicatedCommentsWithArray:(id)arg1;
- (void)likeButtonTappedWithCommentID:(id)arg1 isLike:(_Bool)arg2 referString:(id)arg3 completion:(CDUnknownBlockType)arg4;
- (void)refreshWithCompletion:(CDUnknownBlockType)arg1;
- (void)refreshCommentsWithCompletion:(CDUnknownBlockType)arg1;
- (void)refreshCommentsWithDiggID:(id)arg1 insertIDs:(id)arg2 completion:(CDUnknownBlockType)arg3;
- (void)fetchReplyListWithCommentID:(id)arg1 completion:(CDUnknownBlockType)arg2;
- (id)initWithAwemeId:(id)arg1;
- (long long)rowWithSubCommentIndex:(long long)arg1;
- (long long)subCommentIndexWithIndexPath:(id)arg1;
- (long long)removeCommentAtIndexPath:(id)arg1;
- (_Bool)insertComment:(id)arg1 atIndexPath:(id)arg2;
- (_Bool)isEmpty;
- (AWECommentModel *)commentAtIndexPath:(id)arg1;

@end

@interface AWEUserProfileSlidingViewController : AWESlidingViewController

@end

/// 用户主页的 作品控制器
@interface AWEPostWorkViewController
@property(copy, nonatomic) NSString *userID;
@property(nonatomic) _Bool isCurrentUser;
@property(retain, nonatomic) UICollectionView *collectionView;
- (void)collectionView:(id)arg1 didSelectItemAtIndexPath:(id)arg2;
- (long long)collectionView:(id)arg1 numberOfItemsInSection:(long long)arg2;
- (long long)numberOfSectionsInCollectionView:(id)arg1;
@end

/// 管理用户心跳的 与登陆有关
@interface BDDiamondAfterHeatManager: NSObject
+ (BDDiamondAfterHeatManager *)sharedInstance;
// 登陆完成后的事件
- (void)userLoginAction;

// 用户退出完成后调用
- (void)userLogoutAction;
// 用户改变后清理
- (void)clearHeatCacheData;
 // 当前登陆的用户id，未登陆时是空字符串或者nil
- (NSString *)currentLoginUID;
@end

@interface AWETabbarControllerConfig : NSObject

+ (AWETabbarControllerConfig *)sharedInstance;
// AWEUserHomeViewController
@property(retain, nonatomic) UIViewController<AWEUserHomeViewControllerProtocol> *userHomeController;
@property(retain, nonatomic) UIViewController *messageController;
@property(retain, nonatomic) AWEFeedRootViewController *feedController;
@property(retain, nonatomic) UIViewController *concernController;
@property(retain, nonatomic) UIViewController *discoverController;
@property(retain, nonatomic) AWEChannelTabViewController *channelController;

//下面是tabbar 的 buttons
@property(retain, nonatomic) AWETabbarGeneralButton *familiarButton; // @synthesize familiarButton=_familiarButton;
@property(retain, nonatomic) AWETabbarGeneralButton *nearbyButton; // @synthesize nearbyButton=_nearbyButton;
@property(retain, nonatomic) AWETabbarGeneralButton *homepageButton; // @synthesize homepageButton=_homepageButton;
@property(retain, nonatomic) AWETabbarGeneralButton *messageButton; // @synthesize messageButton=_messageButton;
@property(retain, nonatomic) AWETabBarPlusButton *plusButton; // @synthesize plusButton=_plusButton;
@property(retain, nonatomic) AWETabbarGeneralButton *channelButton; // @synthesize channelButton=_channelButton;
@property(retain, nonatomic) AWETabbarGeneralButton *friendButton; // @synthesize friendButton=_friendButton;
@property(retain, nonatomic) AWETabbarGeneralButton *concernButton; // @synthesize concernButton=_concernButton;
@property(retain, nonatomic) AWETabbarGeneralButton *discoverButton; // @synthesize discoverButton=_discoverButton;
@property(retain, nonatomic) AWETabbarGeneralButton *feedButton;
@end

// 弹出登陆控制器所在的window 当弹出时，此window 为 keyWindow
@interface AWELoginWindow : UIWindow

@end

@interface AWELoginSettingsResponse
+ (id)dataArrayJSONTransformer;
+ (id)JSONKeyPathsByPropertyKey;
@property(retain, nonatomic) NSArray *dataArray; // @synthesize dataArray=_dataArray;

@end

@interface AWELoginWindowManager : NSObject
+ (AWELoginWindowManager *)sharedManager;
@property(nonatomic, weak) UIWindow *lastWindow;
@property(retain, nonatomic) AWELoginSettingsResponse *settingsRsp;
//@property(retain, nonatomic) AWELoginViewControllerTransitioningDelegate *transitionDelegate;
@property(retain, nonatomic) UIViewController *loginLoadingViewController;
@property(copy, nonatomic) id dismissCompletionBlock;
@property(nonatomic) _Bool isThirdpartyLoginButtonClicked;
@property(retain, nonatomic) AWELoginWindow *loginWindow;
- (void)requestSettings;
- (id)loginSettingsModelArray;
- (void)dismiss;
- (void)didFinishLogin;
- (void)showLoginViewControllerWithParamsDict:(id)arg1;
- (void)makeKeyAndVisible;
@property(readonly, nonatomic) UIViewController *rootViewController;
@property(readonly, nonatomic) UIWindow *visibleWindow;

@end

@interface AWELongVideoControlModel : NSObject
{
    _Bool _allowDownload;
    _Bool _showProgressBar;
    _Bool _canDragProgressBar;
    _Bool _allowDuet;
    _Bool _allowReact;
    _Bool _allowDynamicWallPaper;
    long long _shareType;
    long long _preventDownloadType;
    long long _timerStatusOver;
    NSNumber *_timerStatusNumber;
}

+ (id)JSONKeyPathsByPropertyKey;
@property(retain, nonatomic) NSNumber *timerStatusNumber; // @synthesize timerStatusNumber=_timerStatusNumber;
@property(nonatomic) long long timerStatusOver; // @synthesize timerStatusOver=_timerStatusOver;
// 是否限制下载
@property(nonatomic) long long preventDownloadType; // @synthesize preventDownloadType=_preventDownloadType;
@property(nonatomic) _Bool allowDynamicWallPaper; // @synthesize allowDynamicWallPaper=_allowDynamicWallPaper;
@property(nonatomic) _Bool allowReact; // @synthesize allowReact=_allowReact;
@property(nonatomic) _Bool allowDuet; // @synthesize allowDuet=_allowDuet;
@property(nonatomic) _Bool canDragProgressBar; // @synthesize canDragProgressBar=_canDragProgressBar;
@property(nonatomic) _Bool showProgressBar; // @synthesize showProgressBar=_showProgressBar;
@property(nonatomic) long long shareType; // @synthesize shareType=_shareType;
// 是否允许下载视频
@property(nonatomic) _Bool allowDownload; // @synthesize allowDownload=_allowDownload;

@end

//@interface AWEShareChannel : NSObject //<AWEShareChannelAppearance, AWEShareChannelAction>
//{
//    long long _type;
//    unsigned long long _option;
//    id _shareActionBlock;
//    NSString *_title;
//    NSDictionary *_channelImages;
//    UIImage *_smallImage;
//    NSString *_label;
//}
//
//@property(copy, nonatomic) NSString *label; // @synthesize label=_label;
//@property(retain, nonatomic) UIImage *smallImage; // @synthesize smallImage=_smallImage;
//@property(copy, nonatomic) NSDictionary *channelImages; // @synthesize channelImages=_channelImages;
//@property(copy, nonatomic) NSString *title; // @synthesize title=_title;
//@property(copy, nonatomic) id shareActionBlock; // @synthesize shareActionBlock=_shareActionBlock;
//@property(nonatomic) unsigned long long option; // @synthesize option=_option;
//@property(nonatomic) long long type; // @synthesize type=_type;
//
//- (_Bool)shareWithContext:(id)arg1;
//- (id)imageForStyleOption:(unsigned long long)arg1;
//- (id)initWithType:(long long)arg1 option:(unsigned long long)arg2;
//- (id)init;
//
//
//@end

@interface AWEStorage : NSObject
{
}

+ (void)startMigrationIfNeeded;
+ (unsigned long long)cachedCount;
+ (unsigned long long)cachedSize;
+ (_Bool)removeAllObjectsWithError:(id *)arg1;
+ (void)removeAllObjects;
+ (id)universalStorage;
+ (id)storageWithDomain:(id)arg1;
+ (void)updateImpConfig:(unsigned long long)arg1;
+ (Class)_impClass;
+ (id)yamStorage;
+ (id)commerceStorage;
+ (id)eCommerceCalendarStorage;
+ (id)eCommerceStorage;
+ (id)feedCountStorage;
+ (id)foundationStorage;
+ (id)recentUsedIMStickerKeyForUserID:(id)arg1;
+ (id)closedFansBarKeyForUserID:(id)arg1;
+ (id)IMStorage;
+ (id)liveStorage;
+ (id)mainStorage;
+ (id)owlStorage;
+ (id)nearbyStorage;
+ (id)IMTransferStorage;
+ (id)noticeStorage;
+ (id)poiStorage;
+ (id)dya_accountStorage;
+ (id)p_passportStorage;
+ (id)searchStorage;
+ (id)studioStorage;
+ (id)ironManStorage;
+ (id)passportStorage;
+ (id)webViewStorage;
- (id)valueForKey:(id)arg1;
- (void)setValue:(id)arg1 forKey:(id)arg2;
- (_Bool)setData:(id)arg1 forKey:(id)arg2 err:(id *)arg3;
- (void)setData:(id)arg1 forKey:(id)arg2;
- (id)dataForKey:(id)arg1;
- (_Bool)setDictionary:(id)arg1 forKey:(id)arg2 err:(id *)arg3;
- (void)setDictionary:(id)arg1 forKey:(id)arg2;
- (id)dictionaryForKey:(id)arg1;
- (_Bool)setArray:(id)arg1 forKey:(id)arg2 err:(id *)arg3;
- (void)setArray:(id)arg1 forKey:(id)arg2;
- (id)arrayForKey:(id)arg1;
- (_Bool)setString:(id)arg1 forKey:(id)arg2 err:(id *)arg3;
- (void)setString:(id)arg1 forKey:(id)arg2;
- (id)stringForKey:(id)arg1;
- (_Bool)setURL:(id)arg1 forKey:(id)arg2 err:(id *)arg3;
- (void)setURL:(id)arg1 forKey:(id)arg2;
- (id)URLForKey:(id)arg1;
- (_Bool)setBool:(_Bool)arg1 forKey:(id)arg2 err:(id *)arg3;
- (void)setBool:(_Bool)arg1 forKey:(id)arg2;
- (_Bool)boolForKey:(id)arg1;
- (_Bool)setDouble:(double)arg1 forKey:(id)arg2 err:(id *)arg3;
- (void)setDouble:(double)arg1 forKey:(id)arg2;
- (double)doubleForKey:(id)arg1;
- (_Bool)setFloat:(float)arg1 forKey:(id)arg2 err:(id *)arg3;
- (void)setFloat:(float)arg1 forKey:(id)arg2;
- (float)floatForKey:(id)arg1;
- (_Bool)setInteger:(long long)arg1 forKey:(id)arg2 err:(id *)arg3;
- (void)setInteger:(long long)arg1 forKey:(id)arg2;
- (long long)integerForKey:(id)arg1;
- (_Bool)removeAllObjectsWithError:(id *)arg1;
- (void)removeAllObjects;
- (_Bool)removeObjectForKey:(id)arg1 err:(id *)arg2;
- (void)removeObjectForKey:(id)arg1;
- (_Bool)setObject:(id)arg1 forKey:(id)arg2 err:(id *)arg3;
- (void)setObject:(id)arg1 forKey:(id)arg2;
- (id)objectForKey:(id)arg1;
- (id)initWithDomain:(id)arg1;
- (id)init;
- (id)rootInit;
- (id)im_lastShareToUserId;
- (void)im_setLastShareToUserId:(id)arg1;
- (void)im_clearUserFlag:(long long)arg1;
- (void)im_setUserFlag:(long long)arg1;
- (_Bool)im_isUserFlagOn:(long long)arg1;
- (long long)im_userFlag;
- (id)im_userFlagKeyForUserID:(id)arg1;
- (void)im_setHotsoonUserHideTip:(id)arg1;
- (id)im_hotsoonUserHideTip;
- (void)im_setLastDateCreateGroupTipsShowNeedForceReset:(_Bool)arg1;
- (id)im_lastDateCreateGroupTipsShow;
- (void)im_setActiveUserTranspondPageTipAlertShowCount:(long long)arg1;
- (long long)im_activeUserTranspondPageTipAlertShowCount;
- (void)im_setActiveUserConversationFakeSystemTipsInfo:(id)arg1;
- (id)im_activeUserConversationFakeSystemTipsInfo;
- (void)im_setCreateGroupTipsV2Info:(id)arg1;
- (id)im_createGroupTipsV2Info;
- (void)im_setIsDisableChatNoticeCellDeleted;
- (_Bool)im_isDisableChatNoticeCellDeleted;
- (void)im_setDisableChatConfig:(id)arg1;
- (id)im_disableChatConfig;
- (void)im_setUserLastDuoshanInteractiveTimeInterval;
- (double)im_userLastDuoshanInteractiveTimeInterval;
- (void)im_setPlanBLastDateXShowAlert;
- (id)im_planBLastDateXAlertShow;
- (void)im_setPlanBContactXAlertShow;
- (_Bool)im_planBContactXAlertShow;
- (void)im_setPlanBProfileDetailXAlertShow;
- (_Bool)im_planBProfileDetailXAlertShow;
- (void)im_setPlanBProfileXAlertShow;
- (_Bool)im_planBProfileXAlertShow;
- (void)im_setPlanBAlertShowFlag:(long long)arg1;
- (long long)im_planBAlertShowFlag;
- (void)im_setShowBlockAlert;
- (_Bool)im_showBlockAlert;
- (void)im_setShowUnfollowAlert;
- (_Bool)im_showUnfollowAlert;
- (void)im_setShowDeleteMsgAlert;
- (_Bool)im_showDeleteMsgAlert;
- (void)im_setXAccountActive;
- (_Bool)im_XAccountActive;
- (void)im_setNewXBannerNotInstallUserShowDay:(long long)arg1;
- (long long)im_newXBannerNotInstallUserShowDay;
- (void)im_setNewXBannerIsInstallUserShowDay:(long long)arg1;
- (long long)im_newXBannerIsInstallUserShowDay;
- (id)im_AWEIMNewDuoshanBannerModel;
- (void)im_setAWEIMNewDuoshanBannerModel:(id)arg1;
- (void)im_setIsDuoshanNewBannerStyle:(_Bool)arg1;
- (_Bool)im_isDuoshanNewBannerStyle;
- (long long)im_bannerStyle;
- (void)im_setBannerStyleList:(id)arg1;
- (id)im_bannerStyleList;
- (void)im_setUserLastShowPrivateTipsTimeInterval;
- (double)im_userLastShowPrivateTipsTimeInterval;
- (void)im_setUserXFlag:(long long)arg1;
- (long long)im_userXFlag;
- (id)im_userXFlagForUserID:(id)arg1;
- (void)im_setProjectXNumberChatUnreadMessageCount:(long long)arg1;
- (long long)im_projectXNumberChatUnreadMessageCount;
- (void)im_setProjectXYellowDotChatUnreadMessageCount:(long long)arg1;
- (long long)im_projectXYellowDotChatUnreadMessageCount;
- (void)im_setDidFetchedRecentConversationCoreInfoForUserID:(id)arg1;
- (_Bool)im_didFetchedRecentConversationCoreInfoForUserID:(id)arg1;
- (id)im_didFetchedRecentConversationCoreInfoKeyForUserID:(id)arg1;
- (void)im_setFollowListBusinessVersion:(long long)arg1;
- (long long)im_followListBusinessVersion;
- (id)im_innerPushConversationArray;
- (void)im_setAWEIMInnerPushConversationArray:(id)arg1;
- (_Bool)im_alreadyShowGroupChatInviteFollowerToast;
- (_Bool)im_alreadyShowGroupChatInviteToast;
- (void)im_setAWEIMUserIgnoreSearchGiphyTimes:(long long)arg1;
- (long long)im_AWEIMUserIgnoreSearchGiphyTimes;
- (id)im_userIgnoreSearchGiphyTimesForUserID:(id)arg1;
- (id)im_AWEIMF2ButtonText;
- (void)im_setAWEIMF2ButtonText:(id)arg1;
- (id)im_AWEIMF2Text;
- (void)im_setAWEIMF2Text:(id)arg1;
- (id)im_AWEIMF2Title;
- (void)im_setAWEIMF2Title:(id)arg1;
- (id)im_AWEIMF2Schema;
- (void)im_setAWEIMF2Schema:(id)arg1;
- (id)im_AWEIMF2IconConfig;
- (void)im_setAWEIMF2IconConfig:(id)arg1;
- (id)im_AWEIMACSchema;
- (void)im_setAWEIMACSchema:(id)arg1;
- (id)im_AWEIMACIconConfig;
- (void)im_setAWEIMACIconConfig:(id)arg1;
- (id)im_lastAWEIMGreetingEmoticonModelArray;
- (void)im_setAWEIMGreetingEmoticonModelDataWithModels:(id)arg1;
- (_Bool)im_showedMutiselectToast;
- (void)im_setGiphyTabbarLastAccessStyleGiphyStyle:(_Bool)arg1;
- (_Bool)im_giphyTabbarLastAccessStyleIsGiphy;
- (void)im_setAmonymousID:(id)arg1;
- (id)im_anonymousID;
- (void)setClosedFansBarUserIDSetForUserID:(id)arg1 userIDSet:(id)arg2;
- (id)closedFansBarUserIDSetForUserID:(id)arg1;
- (unsigned long long)notice_getMaximumCountOfLivePushAtColdLanuch;
- (unsigned long long)live_userKeepIgnoreTimesInToday;
- (id)stringWithToday;
- (void)notice_decreaseMaximumCountOfLivePushAtColdLanuch;
- (void)notice_resetMaximumCountOfLivePushAtColdLanuch;
- (unsigned long long)notice_livePushDisplayIntervalInSec;
- (void)notice_userIgnoreLivePush;
- (_Bool)notice_isAdVideoPlaying;
- (void)notice_setAdVideoPlaying:(_Bool)arg1;

@end

/*-------------------直播相关-----------------------*/
@interface AWELiveStreamURLModel : AWEBaseApiModel
{
    long long _sid;
    NSString *_rtmpPullURL;
    NSString *_rtmpPushURL;
    unsigned long long _provider;
    NSDictionary *_flvPullUrl;
    NSArray *_candidateResolution;
    NSString *_defaultResolution;
}

+ (id)providerJSONTransformer;
+ (id)JSONKeyPathsByPropertyKey;
@property(copy, nonatomic) NSString *defaultResolution; // @synthesize defaultResolution=_defaultResolution;
@property(copy, nonatomic) NSArray *candidateResolution; // @synthesize candidateResolution=_candidateResolution;
@property(copy, nonatomic) NSDictionary *flvPullUrl; // @synthesize flvPullUrl=_flvPullUrl;
@property(nonatomic) unsigned long long provider; // @synthesize provider=_provider;
@property(copy, nonatomic) NSString *rtmpPushURL; // @synthesize rtmpPushURL=_rtmpPushURL;
@property(copy, nonatomic) NSString *rtmpPullURL; // @synthesize rtmpPullURL=_rtmpPullURL;
@property(nonatomic) long long sid; // @synthesize sid=_sid;
- (id)streamUrlWithName:(id)arg1;
- (id)originPullURL;

@end

@interface AWEShareModel : AWEBaseApiModel
{
    _Bool _isPersist;
    NSString *_shareUrl;
    AWEURLModel *_shareQRCodeURL;
    AWEURLModel *_shareImageURL;
    NSString *_shareWeiboDesc;
    NSString *_shareLinkDesc;
    NSString *_shareTitle;
    NSString *_shareDesc;
    NSString *_manageGoodsURL;
    NSString *_manageFXGURL;
    NSString *_shareSignatureDesc;
    NSString *_shareSignatureUrl;
}

+ (id)shareImageURLJSONTransformer;
+ (id)shareQRCodeURLJSONTransformer;
+ (id)JSONKeyPathsByPropertyKey;
@property(retain, nonatomic) NSString *shareSignatureUrl; // @synthesize shareSignatureUrl=_shareSignatureUrl;
@property(retain, nonatomic) NSString *shareSignatureDesc; // @synthesize shareSignatureDesc=_shareSignatureDesc;
@property(retain, nonatomic) NSString *manageFXGURL; // @synthesize manageFXGURL=_manageFXGURL;
@property(retain, nonatomic) NSString *manageGoodsURL; // @synthesize manageGoodsURL=_manageGoodsURL;
@property(retain, nonatomic) NSString *shareDesc; // @synthesize shareDesc=_shareDesc;
@property(retain, nonatomic) NSString *shareTitle; // @synthesize shareTitle=_shareTitle;
@property(retain, nonatomic) NSString *shareLinkDesc; // @synthesize shareLinkDesc=_shareLinkDesc;
@property(retain, nonatomic) NSString *shareWeiboDesc; // @synthesize shareWeiboDesc=_shareWeiboDesc;
@property(retain, nonatomic) AWEURLModel *shareImageURL; // @synthesize shareImageURL=_shareImageURL;
@property(retain, nonatomic) AWEURLModel *shareQRCodeURL; // @synthesize shareQRCodeURL=_shareQRCodeURL;
@property(nonatomic) _Bool isPersist; // @synthesize isPersist=_isPersist;
@property(retain, nonatomic) NSString *shareUrl; // @synthesize shareUrl=_shareUrl;

@end

@interface AWELiveRoomConfigModel : AWEBaseApiModel
{
    long long _canBeLandscape;
    long long _enableEmoji;
    long long _enableShare;
    long long _enableSendComment;
    long long _enableSendGift;
    long long _enableSendGiftGuide;
    long long _enableSendShortcutGift;
    long long _enableSendBarrage;
    long long _enableFansClub;
    long long _enableHourlyList;
}

+ (id)JSONKeyPathsByPropertyKey;
@property(nonatomic) long long enableHourlyList; // @synthesize enableHourlyList=_enableHourlyList;
@property(nonatomic) long long enableFansClub; // @synthesize enableFansClub=_enableFansClub;
@property(nonatomic) long long enableSendBarrage; // @synthesize enableSendBarrage=_enableSendBarrage;
@property(nonatomic) long long enableSendShortcutGift; // @synthesize enableSendShortcutGift=_enableSendShortcutGift;
@property(nonatomic) long long enableSendGiftGuide; // @synthesize enableSendGiftGuide=_enableSendGiftGuide;
@property(nonatomic) long long enableSendGift; // @synthesize enableSendGift=_enableSendGift;
@property(nonatomic) long long enableSendComment; // @synthesize enableSendComment=_enableSendComment;
@property(nonatomic) long long enableShare; // @synthesize enableShare=_enableShare;
@property(nonatomic) long long enableEmoji; // @synthesize enableEmoji=_enableEmoji;
@property(nonatomic) long long canBeLandscape; // @synthesize canBeLandscape=_canBeLandscape;
- (_Bool)enableHourlyList:(_Bool)arg1;
- (_Bool)enableFansClub:(_Bool)arg1;
- (_Bool)enableSendBarrage:(_Bool)arg1;
- (_Bool)enableSendShortcutGift:(_Bool)arg1;
- (_Bool)enableSendGiftGuide:(_Bool)arg1;
- (_Bool)enableSendGift:(_Bool)arg1;
- (_Bool)enableSendComment:(_Bool)arg1;
- (_Bool)enableShare:(_Bool)arg1;
- (_Bool)enableEmoji:(_Bool)arg1;

@end

@interface AWELiveRoomSourceCountModel : AWEBaseApiModel
{
    long long _follow;
    long long _liveSquare;
    long long _recommend;
}

+ (id)JSONKeyPathsByPropertyKey;
@property(nonatomic) long long recommend; // @synthesize recommend=_recommend;
@property(nonatomic) long long liveSquare; // @synthesize liveSquare=_liveSquare;
@property(nonatomic) long long follow; // @synthesize follow=_follow;

@end

@interface AWELiveChallengeModel : AWEBaseApiModel
{
    _Bool _isCommerce;
    NSString *_challengeID;
    NSString *_challengeName;
}

+ (id)parseChallengeModelFromJson:(id)arg1;
+ (id)JSONKeyPathsByPropertyKey;
@property(nonatomic) _Bool isCommerce; // @synthesize isCommerce=_isCommerce;
@property(copy, nonatomic) NSString *challengeName; // @synthesize challengeName=_challengeName;
@property(copy, nonatomic) NSString *challengeID; // @synthesize challengeID=_challengeID;

@end

@interface AWELiveMultiInteractListModel : NSObject
{
    NSArray *_users;
}

+ (id)usersJSONTransformer;
+ (id)JSONKeyPathsByPropertyKey;
@property(copy, nonatomic) NSArray *users; // @synthesize users=_users;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end

@interface AWELiveNearbyTV : NSObject
{
    _Bool _isIdle;
    NSString *_desc;
}

+ (id)JSONKeyPathsByPropertyKey;
@property(copy, nonatomic) NSString *desc; // @synthesize desc=_desc;
@property(nonatomic) _Bool isIdle; // @synthesize isIdle=_isIdle;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end

@interface AWELiveRoomModel : AWEBaseApiModel
{
    _Bool _inSandBox;
    _Bool _isCommerceLive;
    _Bool _isAudioLive;
    _Bool _screenshotRoom;
    _Bool _thirdPartyRoom;
    _Bool _isOfficalRoom;
    NSNumber *_roomID;
    long long _status;
    AWEUserModel *_owner;
    NSString *_title;
    long long _userCount;
    long long _newFansCount;
    long long _createTime;
    long long _finishTime;
    NSNumber *_streamID;
    AWELiveStreamURLModel *_streamURL;
    AWELiveStreamURLModel *_backupStreamURL;
    AWEShareModel *_shareInfo;
    long long _diggCount;
    long long _totalUserCount;
    long long _coins;
    AWEURLModel *_dynamicCoverURL;
    AWEURLModel *_roomCoverURL;
    NSString *_roomTypeTag;
    AWELiveRoomConfigModel *_config;
    AWELiveRoomSourceCountModel *_sourceCount;
    long long _liveMode;
    AWEURLModel *_liveFeedCellWebpCover;
    AWELiveChallengeModel *_challengeModel;
    long long _cellIndexOfChannel;
    NSString *_enterFrom;
    NSString *_groupID;
    NSString *_secondStageTagString;
    NSNumber *_interactiveEnabled;
    AWELiveMultiInteractListModel *_interactList;
    AWELiveNearbyTV *_nearbyTV;
    NSString *_videoFeedTag;
    NSString *_distance;
    NSString *_ownerUserID;
    NSNumber *_roomLayout;
    long long _recommendCardType;
}

+ (id)videoFeedTagJSONTransformer;
+ (id)sourceCountJSONTransformer;
+ (id)configJSONTransformer;
+ (id)roomCoverURLJSONTransformer;
+ (id)dynamicCoverURLJSONTransformer;
+ (id)shareInfoJSONTransformer;
+ (id)ownerJSONTransformer;
+ (id)backupStreamURLJSONTransformer;
+ (id)streamURLJSONTransformer;
+ (id)liveFeedCellWebpCoverJSONTransformer;
+ (id)JSONKeyPathsByPropertyKey;
+ (id)instanceFromLiveRoom:(id)arg1;
@property(nonatomic) long long recommendCardType; // @synthesize recommendCardType=_recommendCardType;
@property(retain, nonatomic) NSNumber *roomLayout; // @synthesize roomLayout=_roomLayout;
@property(retain, nonatomic) NSString *ownerUserID; // @synthesize ownerUserID=_ownerUserID;
@property(nonatomic) _Bool isOfficalRoom; // @synthesize isOfficalRoom=_isOfficalRoom;
@property(nonatomic) _Bool thirdPartyRoom; // @synthesize thirdPartyRoom=_thirdPartyRoom;
@property(nonatomic) _Bool screenshotRoom; // @synthesize screenshotRoom=_screenshotRoom;
@property(copy, nonatomic) NSString *distance; // @synthesize distance=_distance;
@property(copy, nonatomic) NSString *videoFeedTag; // @synthesize videoFeedTag=_videoFeedTag;
@property(retain, nonatomic) AWELiveNearbyTV *nearbyTV; // @synthesize nearbyTV=_nearbyTV;
@property(retain, nonatomic) AWELiveMultiInteractListModel *interactList; // @synthesize interactList=_interactList;
@property(retain, nonatomic) NSNumber *interactiveEnabled; // @synthesize interactiveEnabled=_interactiveEnabled;
@property(nonatomic) _Bool isAudioLive; // @synthesize isAudioLive=_isAudioLive;
@property(retain, nonatomic) NSString *secondStageTagString; // @synthesize secondStageTagString=_secondStageTagString;
@property(retain, nonatomic) NSString *groupID; // @synthesize groupID=_groupID;
@property(retain, nonatomic) NSString *enterFrom; // @synthesize enterFrom=_enterFrom;
@property(nonatomic) long long cellIndexOfChannel; // @synthesize cellIndexOfChannel=_cellIndexOfChannel;
@property(retain, nonatomic) AWELiveChallengeModel *challengeModel; // @synthesize challengeModel=_challengeModel;
@property(nonatomic) _Bool isCommerceLive; // @synthesize isCommerceLive=_isCommerceLive;
@property(retain, nonatomic) AWEURLModel *liveFeedCellWebpCover; // @synthesize liveFeedCellWebpCover=_liveFeedCellWebpCover;
@property(nonatomic) long long liveMode; // @synthesize liveMode=_liveMode;
@property(retain, nonatomic) AWELiveRoomSourceCountModel *sourceCount; // @synthesize sourceCount=_sourceCount;
@property(retain, nonatomic) AWELiveRoomConfigModel *config; // @synthesize config=_config;
@property(readonly, nonatomic) NSString *roomTypeTag; // @synthesize roomTypeTag=_roomTypeTag;
@property(retain, nonatomic) AWEURLModel *roomCoverURL; // @synthesize roomCoverURL=_roomCoverURL;
@property(retain, nonatomic) AWEURLModel *dynamicCoverURL; // @synthesize dynamicCoverURL=_dynamicCoverURL;
@property(nonatomic) _Bool inSandBox; // @synthesize inSandBox=_inSandBox;
@property(nonatomic) long long coins; // @synthesize coins=_coins;
@property(nonatomic) long long totalUserCount; // @synthesize totalUserCount=_totalUserCount;
@property(nonatomic) long long diggCount; // @synthesize diggCount=_diggCount;
@property(retain, nonatomic) AWEShareModel *shareInfo; // @synthesize shareInfo=_shareInfo;
@property(retain, nonatomic) AWELiveStreamURLModel *backupStreamURL; // @synthesize backupStreamURL=_backupStreamURL;
@property(retain, nonatomic) AWELiveStreamURLModel *streamURL; // @synthesize streamURL=_streamURL;
@property(retain, nonatomic) NSNumber *streamID; // @synthesize streamID=_streamID;
@property(nonatomic) long long finishTime; // @synthesize finishTime=_finishTime;
@property(nonatomic) long long createTime; // @synthesize createTime=_createTime;
@property(nonatomic) long long newFansCount; // @synthesize newFansCount=_newFansCount;
@property(nonatomic) long long userCount; // @synthesize userCount=_userCount;
@property(copy, nonatomic) NSString *title; // @synthesize title=_title;
@property(retain, nonatomic) AWEUserModel *owner; // @synthesize owner=_owner;
@property(nonatomic) long long status; // @synthesize status=_status;
@property(retain, nonatomic) NSNumber *roomID; // @synthesize roomID=_roomID;
- (id)initWithRoomID:(id)arg1;

@end

@class ACCRecordViewControllerInputData;

@interface ACCViewController : UIViewController {
    _Bool _routerAnimated;
    id _inputData;
//    id <ACCServiceAssembler> _serviveAssembler;
//    ACCComponentManager *_componentManager;
//    ACCViewModelFactory *_viewModelFactory;
//    ACCViewModelContainer *_modelContainer;
//    ACCComponentsFactory *_componentFactory;
//    id <ACCRouterCoordinatorProtocol> _routerCoordinator;
//    id <ACCBusinessConfiguration> _business;
}

//@property(retain, nonatomic) id <ACCBusinessConfiguration> business; // @synthesize business=_business;
//@property(retain, nonatomic) id <ACCRouterCoordinatorProtocol> routerCoordinator; // @synthesize routerCoordinator=_routerCoordinator;
//@property(retain, nonatomic) ACCComponentsFactory *componentFactory; // @synthesize componentFactory=_componentFactory;
//@property(retain, nonatomic) ACCViewModelContainer *modelContainer; // @synthesize modelContainer=_modelContainer;
//@property(retain, nonatomic) ACCViewModelFactory *viewModelFactory; // @synthesize viewModelFactory=_viewModelFactory;
//@property(retain, nonatomic) ACCComponentManager *componentManager; // @synthesize componentManager=_componentManager;
//@property(retain, nonatomic) id <ACCServiceAssembler> serviveAssembler; // @synthesize serviveAssembler=_serviveAssembler;
@property(retain, nonatomic) id inputData; // @synthesize inputData=_inputData;
@property(nonatomic) _Bool routerAnimated; // @synthesize routerAnimated=_routerAnimated;
- (void)controllerTaskFinished;
- (void)close;
- (id)viewModelContainer;
- (id)root;
- (void)popSelf;
- (id)handleTargetViewControllerInputData;
- (void)beforeLoadLazyComponent;
- (void)beforeLoadEagerComponent;
- (_Bool)prefersStatusBarHidden;
- (long long)preferredStatusBarStyle;
- (void)viewWillTransitionToSize:(struct CGSize)arg1 withTransitionCoordinator:(id)arg2;
- (void)viewDidDisappear:(_Bool)arg1;
- (void)viewWillDisappear:(_Bool)arg1;
- (void)viewDidAppear:(_Bool)arg1;
- (void)viewWillAppear:(_Bool)arg1;
- (void)viewDidLoad;
- (id)initWithBusinessConfiguration:(id)arg1;

@end


@interface AWERecorderViewController : ACCViewController
{
}

- (void)resetShowFunctionToast:(_Bool)arg1;
- (void)checkIfNeverGoLive;
- (void)popSelf;
- (id)handleTargetViewControllerInputData;
- (void)beforeLoadLazyComponent;
- (void)beforeLoadEagerComponent;
- (long long)preferredStatusBarStyle;
- (_Bool)prefersStatusBarHidden;
- (id)currentSticker;
- (id)awesst_additionalTrackerParams;
- (id)awesst_enterFrom;
- (void)viewWillDisappear:(_Bool)arg1;
- (void)viewDidAppear:(_Bool)arg1;
- (void)viewWillAppear:(_Bool)arg1;
- (void)viewDidLoad;
- (id)initWithBusinessConfiguration:(id)arg1;
- (void)dealloc;

// Remaining properties
@property(readonly, nonatomic) ACCRecordViewControllerInputData *inputData; // @dynamic inputData;

@end

/*-------------------直播相关-----------------------*/

NS_ASSUME_NONNULL_END

#endif /* AwemeApiHeaders_h */



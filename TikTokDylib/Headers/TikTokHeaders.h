//
//  TikTokHeaders.h
//  TikTok
//
//  Created by xiaoyuan on 2021/10/2.
//

#ifndef TikTokHeaders_h
#define TikTokHeaders_h
#include <dlfcn.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AwemeTTHttpTask.h"
#import "TikTokSettingsHeaders.h"

@class AWEFeedCellViewController;

@interface AWEURLModel : NSObject
@property(retain, nonatomic) NSArray* originURLList;
@end

@interface AWEVideoModel : NSObject
@property(readonly, nonatomic) AWEURLModel* playURL;
@property(readonly, nonatomic) AWEURLModel* downloadURL;
@property(readonly, nonatomic) AWEURLModel* h264URL;
@property(readonly, nonatomic) NSNumber *duration;

- (NSURL *)xy_videoURL;

@end

@interface AWELiveStreamURL : NSObject
@property(retain, nonatomic) NSString *rtmpURL;
@property(retain, nonatomic) NSString *identifier;
@property(nonatomic) NSString *liveRawData;
@end

@interface AWELiveRoom : NSObject
@property (nonatomic) BOOL isAudioLive;
@property (nonatomic) NSNumber * roomID;
/// 直播间用户数量
@property (nonatomic) NSInteger userCount;
@end


@interface AWEImageAlbumImageModel : NSObject
@property (retain, nonatomic) NSURL* localCacheURL;
@property (nonatomic) BOOL isPlaceholder;
@property (nonatomic) BOOL isFakeModel;
@property (nonatomic) BOOL hasPrefetched;
@property (nonatomic) long height;
@property (nonatomic) long width;
@property (copy, nonatomic) NSString* uri;
@property (copy, nonatomic) NSArray* urlList;
@property (copy, nonatomic) NSArray* downloadURLList;
@end

@interface AWEAwemeModel : NSObject
@property(nonatomic) BOOL isAds;
@property(retain, nonatomic) AWEVideoModel* video;
/// 直播时才会有liveStreamURL和room
@property(retain, nonatomic) AWELiveStreamURL *liveStreamURL;
@property(retain, nonatomic) AWELiveRoom *room;
@property(nonatomic) long long awemeType;
@property(copy, nonatomic) NSArray<AWEImageAlbumImageModel *> *albumImages;
@end

@interface AWEPlayVideoPlayerController : NSObject
@property(nonatomic) AWEFeedCellViewController *container;
- (void)setPlayerSeekTime:(double)arg1 completion:(id)arg2;
@end

@interface AWEAwemePlayVideoPlayerController : NSObject
@property(nonatomic) AWEFeedCellViewController *container;
- (void)setPlayerSeekTime:(double)arg1 completion:(id)arg2;
@end

@interface AWEFeedContainerViewController : UIViewController
@property(retain, nonatomic) UIView *tabControl;
@property(retain, nonatomic) UIView *specialEventEntranceView;
@property(nonatomic) BOOL isUIHidden; // new property
- (void)setAccessoriesHidden:(BOOL)arg1;
+ (AWEFeedContainerViewController *)sharedInstance; // new
@end

@interface AWEPlayInteractionViewController : UIViewController
@property(retain, nonatomic) AWEAwemeModel *model;
- (void)setHide:(BOOL)arg1;
- (void)updateShowOrHideUI; // new
@end

@interface AWEMediaDownloadOptions : NSObject
@property(retain, nonatomic) AWEAwemeModel *awemeModel;
@end

@interface AWEDownloadShareChannel : NSObject
@property(retain, nonatomic) AWEMediaDownloadOptions *downloadOptions;
@end

@interface AWEFeedTableViewController : UIViewController

@property(readonly, nonatomic) AWEAwemeModel *currentAweme;

- (void)scrollToNextVideo;
- (void)scrollToPreviousVideo;
@end

@interface AWEAwemePlayInteractionViewController: UIViewController
@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) UIButton *likeButton;
@property (nonatomic, strong) AWEAwemeModel *fromModel;
@property (nonatomic, strong) AWEAwemeModel *model;
// 执行点击评论按钮的方法，弹出评论弹框
- (void)performCommentAction;
// 执行点赞的方法，如果已点赞则取消点赞，会取消赞
- (void)performLikeAction;
// 双击 视频view时调用, 由AWEFeedCellViewController 的 tapGesture 触发, 调用此方法可以触发点赞，且不会取消赞
- (void)onVideoPlayerViewDoubleClicked:(UITapGestureRecognizer *)tapGes;

@end

@interface AWEFeedCellViewController : UIViewController
@property (nonatomic, strong) AWEAwemePlayInteractionViewController *interactionController;
@property (nonatomic, strong) AWEAwemePlayVideoPlayerController *videoController;
@end

@interface AWEFeedViewCell : UITableViewCell
@property (nonatomic) AWEFeedCellViewController *viewController;
@end

@interface AWEIMDirectTranspondTopView : UIView
@end

@interface AWEShareContext : NSObject
@property(retain, nonatomic) AWEAwemeModel *target; 
@end

@interface AWEIMDirectTranspondViewController : UIViewController
@property(retain, nonatomic) AWEIMDirectTranspondTopView *topView;
@property(retain, nonatomic) AWEShareContext *shareContext;
- (void)dismissAnimated:(_Bool)arg1 completion:(CDUnknownBlockType)arg2;
@end

@interface AWEUIResponder : NSObject
+ (UIViewController *)topViewController;
+ (id)topViewControllerForController:(id)arg1;
@end

@class AWEAwemeLongPressDownloadFunctionModel, AWEAwemeModel, AWEShareContext, NSArray, NSDictionary, NSString;
@interface AWESharePanelViewModel : NSObject
{
    _Bool _shareTitleIsDisabled;
    _Bool _needShowTranspondList;
    unsigned long long _panelType;
    NSString *_shareTitle;
    NSString *_dismissTitle;
    NSArray *_firstRowItems;
    NSArray *_secondRowItems;
    NSString *_fromGroupID;
    AWEAwemeModel *_aweme;
    AWEShareContext *_context;
    AWEAwemeLongPressDownloadFunctionModel *_currentExposeExternalShareModel;
    NSDictionary *_exposeExternalShareModelsDict;
    long long _currentExposeExternalSharePlatform;
}

@property(nonatomic) long long currentExposeExternalSharePlatform; // @synthesize currentExposeExternalSharePlatform=_currentExposeExternalSharePlatform;
@property(retain, nonatomic) NSDictionary *exposeExternalShareModelsDict; // @synthesize exposeExternalShareModelsDict=_exposeExternalShareModelsDict;
@property(retain, nonatomic) AWEAwemeLongPressDownloadFunctionModel *currentExposeExternalShareModel; // @synthesize currentExposeExternalShareModel=_currentExposeExternalShareModel;
@property(retain, nonatomic) AWEShareContext *context; // @synthesize context=_context;
@property(retain, nonatomic) AWEAwemeModel *aweme; // @synthesize aweme=_aweme;
@property(nonatomic) _Bool needShowTranspondList; // @synthesize needShowTranspondList=_needShowTranspondList;
@property(copy, nonatomic) NSString *fromGroupID; // @synthesize fromGroupID=_fromGroupID;
@property(copy, nonatomic) NSArray *secondRowItems; // @synthesize secondRowItems=_secondRowItems;
@property(copy, nonatomic) NSArray *firstRowItems; // @synthesize firstRowItems=_firstRowItems;
@property(nonatomic) _Bool shareTitleIsDisabled; // @synthesize shareTitleIsDisabled=_shareTitleIsDisabled;
@property(copy, nonatomic) NSString *dismissTitle; // @synthesize dismissTitle=_dismissTitle;
@property(copy, nonatomic) NSString *shareTitle; // @synthesize shareTitle=_shareTitle;
@property(nonatomic) unsigned long long panelType; // @synthesize panelType=_panelType;
- (id)filteredLongPressFunctionModels:(id)arg1;
- (_Bool)shouldExposeCopyCommand;
- (_Bool)shouldExposeWechatOrQQ;
- (_Bool)isExposedExternalShareWithModel:(id)arg1;
- (id)fetchExternalShareEventContext;
- (_Bool)isHostUser;
- (_Bool)shouldHideExternalShare;
- (_Bool)shouldShowToken;
- (_Bool)shouldShowCopyCommandOnExternalShare;
- (_Bool)shouldSkipWechatOrQQ:(id)arg1;
- (id)offsiteShareTypesAfterExposing;
- (void)tweakCopyCommandPositionOnHostUser:(id)arg1 douPlusModel:(id)arg2 actionCompletion:(CDUnknownBlockType)arg3;
- (void)tweakExternalSharePosition:(id)arg1 externalShareModel:(id)arg2 douPlusModel:(id)arg3 permissionModel:(id)arg4;
- (void)exposeCopyCommandIfNeeded:(id)arg1 actionCompletion:(CDUnknownBlockType)arg2;
- (void)tweakExposedExternalSharePositionIfNeeded:(id)arg1 downloadModel:(id)arg2 downloadCompletion:(CDUnknownBlockType)arg3 copyCommandCompletion:(CDUnknownBlockType)arg4;
- (void)exposeWechatOrQQIfNeeded:(id)arg1 actionCompletion:(CDUnknownBlockType)arg2;

@end

@class AWEShareItem;
@interface AWEShareCollectionView : UICollectionView
{
    NSArray<AWEShareItem *> *_items;
}
@property(readonly, copy, nonatomic) NSArray<AWEShareItem *> *items;
@end
@interface AWEShareRowView : AWEShareCollectionView
{
    _Bool _isFirstRow;
    AWEAwemeModel *_aweme;
}

+ (double)rowHeight;
+ (id)collectionLayout;
+ (Class)cellClass;
@property(retain, nonatomic) AWEAwemeModel *aweme; // @synthesize aweme=_aweme;
@property(nonatomic) _Bool isFirstRow; // @synthesize isFirstRow=_isFirstRow;
- (void)collectionView:(id)arg1 didSelectItemAtIndexPath:(id)arg2;
- (void)updateCell:(id)arg1 withItem:(id)arg2;
- (void)playBounceAnimationAfterDelay:(double)arg1;
- (id)initWithItems:(id)arg1 hostView:(id)arg2;

@end


// 分享面板
@interface AWEShareBasePanelController : UIViewController
- (void)dismissAnimated:(_Bool)arg1 completion:(CDUnknownBlockType)arg2;
@end
@class AWEShareRowView;
@interface AWESharePanelController : AWEShareBasePanelController
{
    AWESharePanelViewModel *_viewModel;
    AWEShareRowView *_firstRowView;
    AWEShareRowView *_secondRowView;
}

@property(retain, nonatomic) AWEShareRowView *secondRowView; // @synthesize secondRowView=_secondRowView;
@property(retain, nonatomic) AWEShareRowView *firstRowView; // @synthesize firstRowView=_firstRowView;
@property(retain, nonatomic) AWESharePanelViewModel *viewModel; // @synthesize viewModel=_viewModel;
- (void)closeButtonTapped:(id)arg1;
- (void)dismissButtonTapped:(id)arg1;

// new
- (void)xy_downloadWithAweme:(AWEAwemeModel *)aweme;
@end

@interface AWEIMTranspondListViewController : UIViewController
@property(retain, nonatomic) AWEShareContext *shareContext;
@end

@interface AWENewFeedTableViewController : UIViewController
@property(readonly, nonatomic) AWEAwemeModel *currentAweme;
@property(nonatomic) _Bool pureMode;
- (void)scrollToNextVideo;
- (void)setNeedsSetPureMode:(_Bool)arg1;
@end

@interface AWEIMLongPressControlCellViewModel : NSObject
@property (copy, nonatomic) NSString* title; // (@synthesize title = _title;)
@property (copy, nonatomic) NSURL* imageURL; // (@synthesize imageURL = _imageURL;)
@property (retain, nonatomic) UIImage* icon;  // (@synthesize icon = _icon;)
@end

// 新的
@interface AWEIMLongPressViewController : UIViewController
@property (nonatomic) AWEShareContext *shareContext;
@property (nonatomic) NSArray<AWEIMLongPressControlCellViewModel *> *viewModelSections;

// 自定义
- (void)xy_downloadAweme;
@end

@class NSMutableArray, NSString, UIImage, UIView, AWEShareItem;
@protocol AWEShareItemDelegate <NSObject>

@optional
- (void)shareItem:(AWEShareItem *)arg1 didDisappear:(_Bool)arg2;
- (void)shareItem:(AWEShareItem *)arg1 willAppear:(_Bool)arg2;
- (void)didUnhighlightShareItem:(AWEShareItem *)arg1;
- (void)didHighlightShareItem:(AWEShareItem *)arg1;
- (void)didSelectShareItem:(AWEShareItem *)arg1;
@end

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
@property(nonatomic) __weak id <AWEShareItemDelegate> delegate; // @synthesize delegate=_delegate;
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


@interface TTKSharePanelViewModel : AWESharePanelViewModel
@property (readonly, nonatomic) NSArray* sections; // (@synthesize sections = _sections;)
@property (retain, nonatomic) NSArray<AWEShareItem *>* groupedActionItems;  // (@synthesize groupedActionItems = _groupedActionItems;)
- (void) insertModel:(id)arg1 toArray:(id)arg2 position:(long)arg3;
- (void) updateSections;
@end

@interface TTKSharePanelViewController : UIViewController
@property (retain, nonatomic) TTKSharePanelViewModel* viewModel;  //(@synthesize viewModel = _viewModel;)
@property (nonatomic, strong) UITableView *tableView;
- (void)xy_downloadWithAweme:(AWEAwemeModel *)aweme;
@end

// 分享item.delegate 的基类，可以拿到AwemeModel
@interface AWEShareBaseChannel : NSObject <AWEShareItemDelegate>
@property (readonly, nonatomic) AWEShareContext* context;  // (@synthesize context = _context;)
@end


#endif /* TikTokHeaders_h */

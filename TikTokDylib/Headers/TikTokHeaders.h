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
@property(readonly, nonatomic) NSNumber *duration;
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
@interface AWEAwemeModel : NSObject
@property(nonatomic) BOOL isAds;
@property(retain, nonatomic) AWEVideoModel* video;
/// 直播时才会有liveStreamURL和room
@property(retain, nonatomic) AWELiveStreamURL *liveStreamURL;
@property(retain, nonatomic) AWELiveRoom *room;
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

#endif /* TikTokHeaders_h */

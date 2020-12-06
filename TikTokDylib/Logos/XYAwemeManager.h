//
//  XYAwemeManager.h
//  AwemeDylib
//
//  Created by xiaoyuan on 2020/1/29.
//  Copyright © 2020 enba. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifdef DEBUG
# define XYLog(fmt, ...); // NSLog((@"[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define XYLog(...);
#endif

NS_ASSUME_NONNULL_BEGIN

@class AWEUserModel, AWEUserDetailViewController, AWEUserModel;

@interface XYAwemeManager : NSObject

+ (instancetype)manager;

// 是否移除水印, 默认为 NO 不移除
@property (nonatomic, assign) BOOL isRemovedWatermark;
// 是否移除结尾添加的水印, 默认为 NO 不移除
@property (nonatomic, assign) BOOL isRemovedEndWatermark;
// 下载视频的限制, 默认为 nil
@property (nonatomic, strong) NSNumber *authorizedToDownload;
// 是否去除视频禁止下载， 默认为 NO，不移除
// 当某个视频禁止下载时，比如版权问题，此视频保存相册按钮是灰色的
@property (nonatomic, assign) BOOL isRemovePreventDownload;
// 当前的country code 默认为 cn
@property (nonatomic, copy) NSString *countryCode;
// 是否自动播放下一个视频，默认为YES
@property (nonatomic, assign) BOOL isAutoPlayNext;
// 隐藏直播间评论列表
@property (nonatomic, assign) BOOL isLivePureMode;
// 隐藏直播间弹幕及各种动画
@property (nonatomic, assign) BOOL isHideLiveBarrages;
// 用户作品最大播放限制
@property (nonatomic, assign) BOOL isMaxPlayLimitOfUserprofile;
// 关闭自动评论
@property (nonatomic, assign) BOOL isCloseAutoComment;
// 是否关闭评论唯一，比如是关闭时，一个视频只评论一次，防止多次打开的多次评论
@property (nonatomic, assign) BOOL isCloseUniqueComment;
// 是否关闭关注，如果关闭，只会去用户主页逛一圈就回来啦
@property (nonatomic, assign) BOOL isCloseFollow;

// 执行的用户id
@property (nonatomic, copy, nullable) NSString *executedUserId;

// 是否为纯视频模式，不显示视频上的用户和音乐信息，默认为NO，抖音首页默认也不是纯模式，只有从用户主页进去的视频才是纯模式
@property (nonatomic, assign) BOOL isPureMode;

- (nullable NSDictionary *)getCarrierInfo;

+ (void)openWechat;

+ (BOOL)isLogin;

+ (AWEUserModel *)currentAuthUser;

// 通过View获取View所在的控制器
+ (UIViewController *)viewControllerFromView:(UIView *)view;

+ (CGRect)getCurrentKeyboardFrame;

+ (AWEUserDetailViewController *)createUserProfilePageWithUserId:(NSString *)userId preloadedUser:(AWEUserModel *)preloadedUser;

// 进入用户详情页
// segment 比如作品
+ (AWEUserDetailViewController *)showUserProfilePageWithUserId:(NSString *)userId preloadedUser:(nullable AWEUserModel *)preloadedUser toNavitaionController:(UINavigationController *)nac segment:(NSString *)segment completion:(void (^)(AWEUserDetailViewController * _Nonnull detailVC))completion;

// 进入用户详情页，并选中作品列
+ (AWEUserDetailViewController *)showUserProfilePageWithUserId:(NSString *)userId preloadedUser:(nullable AWEUserModel *)preloadedUser segment:(nonnull NSString *)segment completion:(nonnull void (^)(AWEUserDetailViewController * _Nonnull detailVC))completion;

// 进入用户详情页，并打开用户的第index个作品，当打开AWEUserDetailViewController时回调
+ (AWEUserDetailViewController *)playVideoWithUserId:(NSString *)userId videoIndex:(NSInteger)index preloadedUser:(nullable AWEUserModel *)preloadedUser completion:(void (^)(AWEUserDetailViewController * _Nonnull detailVC))completion;

+ (UIViewController *)topViewController;

@end

NS_ASSUME_NONNULL_END

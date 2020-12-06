//
//  XYAwemeManager.h
//  AwemeDylib
//
//  Created by xiaoyuan on 2020/1/29.
//  Copyright © 2020 enba. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

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
// 是否为纯视频模式，不显示视频上的用户和音乐信息，默认为NO，抖音首页默认也不是纯模式，只有从用户主页进去的视频才是纯模式
@property (nonatomic, assign) BOOL isPureMode;

- (nullable NSDictionary *)getCarrierInfo;

+ (void)openWechat;


+ (UIViewController *)topViewController;
@end

NS_ASSUME_NONNULL_END

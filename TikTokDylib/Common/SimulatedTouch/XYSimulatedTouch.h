//
//  XYSimulatedTouch.h
//  AwemeDylib
//
//  Created by xiaoyuan on 2020/1/29.
//  Copyright © 2020 enba. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XYSimulatedTouch : NSObject

@property (nonatomic, strong, readonly, class) XYSimulatedTouch *sharedInstance;

/// 模拟点击屏幕上的坐标
- (void)touchesWithPoint:(CGPoint)point;
/// 模拟屏幕滑动
/// @param startPoint 滑动的起点
/// @param endPoint 滑动的终点
/// @param count 滑动次数
- (void)swapWithPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint count:(NSInteger)count completion:(void (^ _Nullable)(void))completion;

- (void)swapWithPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;


/// 向上滑
- (void)swapUp;
/// 向下滑
- (void)swapDown;
/// 向左滑
- (void)swapLeft;
/// 向右滑
- (void)swapRight;

@end

NS_ASSUME_NONNULL_END

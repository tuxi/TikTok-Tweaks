//
//  UITouch+XYSimulatedTouchExtensions.h
//  AwemeDylib
//
//  Created by xiaoyuan on 2020/1/29.
//  Copyright © 2020 enba. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IOHIDEvent+KIF.h"
#import "FixCategoryBug.h"

KW_FIX_CATEGORY_BUG_H(UITouch_XYSimulatedTouchExtensions)

NS_ASSUME_NONNULL_BEGIN

@interface UITouch ()


- (void)setWindow:(UIWindow *)window;
- (void)setView:(UIView *)view;
- (void)setTapCount:(NSUInteger)tapCount;
- (void)setIsTap:(BOOL)isTap;
- (void)setTimestamp:(NSTimeInterval)timestamp;
- (void)setPhase:(UITouchPhase)touchPhase;
- (void)setGestureView:(UIView *)view;
- (void)_setLocationInWindow:(CGPoint)location resetPrevious:(BOOL)resetPrevious;
- (void)_setIsFirstTouchForView:(BOOL)firstTouchForView;

- (void)_setHidEvent:(IOHIDEventRef)event;
- (void)kif_setHidEvent ;
@end

@interface UITouch (XYSimulatedTouchExtensions)
- (instancetype)initAtPoint:(CGPoint)point inWindow:(UIWindow *)window;
@end

NS_ASSUME_NONNULL_END

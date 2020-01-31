//
//  XYSimulatedTouch.m
//  AwemeDylib
//
//  Created by xiaoyuan on 2020/1/29.
//  Copyright © 2020 enba. All rights reserved.
//

#import "XYSimulatedTouch.h"
#import "UIApplication+XYSimulatedTouchPrivate.h"
#import "UITouch-KIFAdditions.h"
#import "UIApplication-KIFAdditions.h"
#import "UIEvent+KIFAdditions.h"
#import "UITouch+XYSimulatedTouchExtensions.h"

@interface XYSimulatedTouch ()

@property (nonatomic, strong) UITouch *touch;

@end

@implementation XYSimulatedTouch

@dynamic sharedInstance;

+ (XYSimulatedTouch *)sharedInstance {
    static id _instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [self new];
    });
    return _instance;
}

- (void)touchesWithPoint:(CGPoint)point {
    [[XYSimulatedTouch sharedInstance] beginTouchWithPoint:point];
    [[XYSimulatedTouch sharedInstance] endTouchWithPoint:point];
}

- (void)swapWithPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint count:(NSInteger)count completion:(void (^ _Nullable)(void))completion {
    
    // 每次滑动延迟delayTime秒执行
    int64_t delayTime = 1;
    // 滑动一次的时间预估为2秒时间
    const int64_t stagger = 3;
    // 每次滑动的周期为 delayTime + stagger == 3秒
    for (long i = 0; i < count; i++) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [[XYSimulatedTouch sharedInstance] beginTouchWithPoint:startPoint];
            [[XYSimulatedTouch sharedInstance] moveTouchWithPoint:endPoint];
            [[XYSimulatedTouch sharedInstance] endTouchWithPoint:endPoint];
        });
        delayTime += stagger;
     }

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((delayTime + 1) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (completion) {
            completion();
        }
    });
}

- (void)swapWithPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint  {
    [self swapWithPoint:startPoint endPoint:endPoint count:1 completion:nil];
}

- (void)swapUp {
  
    CGPoint startPoint = CGPointMake([XYSimulatedTouch getInterfaceSize].width * 0.35, [XYSimulatedTouch getInterfaceSize].height * 0.7);
    CGPoint endPoint = CGPointMake([XYSimulatedTouch getInterfaceSize].width * 0.35, [XYSimulatedTouch getInterfaceSize].height * 0.3);
    
   [[XYSimulatedTouch sharedInstance] swapWithPoint:startPoint endPoint:endPoint];
}

- (void)swapDown {
  
    CGPoint startPoint = CGPointMake([XYSimulatedTouch getInterfaceSize].width * 0.35, [XYSimulatedTouch getInterfaceSize].height * 0.3);
    CGPoint endPoint = CGPointMake([XYSimulatedTouch getInterfaceSize].width * 0.35, [XYSimulatedTouch getInterfaceSize].height * 0.7);
    
   [[XYSimulatedTouch sharedInstance] swapWithPoint:startPoint endPoint:endPoint];
}

- (void)swapRight {
    CGPoint startPoint = CGPointMake([XYSimulatedTouch getInterfaceSize].width * 0.22, [XYSimulatedTouch getInterfaceSize].height * 0.3);
     CGPoint endPoint = CGPointMake([XYSimulatedTouch getInterfaceSize].width * 0.7, [XYSimulatedTouch getInterfaceSize].height * 0.3);
     
    [[XYSimulatedTouch sharedInstance] swapWithPoint:startPoint endPoint:endPoint];
}

- (void)swapLeft {
    CGPoint startPoint = CGPointMake([XYSimulatedTouch getInterfaceSize].width * 0.7, [XYSimulatedTouch getInterfaceSize].height * 0.3);
    CGPoint endPoint = CGPointMake([XYSimulatedTouch getInterfaceSize].width * 0.22, [XYSimulatedTouch getInterfaceSize].height * 0.3);
     
    [[XYSimulatedTouch sharedInstance] swapWithPoint:startPoint endPoint:endPoint];
}

// 模拟开始点触 类似touchesBegan
- (void)beginTouchWithPoint:(CGPoint)point {
    CGRect keyboardFrame ;
    keyboardFrame = CGRectMake(0, 0, 0, 258);
    if([[[UIApplication sharedApplication].windows lastObject] isKindOfClass:NSClassFromString(@"UIRemoteKeyboardWindow")] && (CGRectContainsPoint(CGRectMake(0, [UIApplication sharedApplication].keyWindow.frame.size.height-keyboardFrame.size.height, [UIApplication sharedApplication].keyWindow.frame.size.width, keyboardFrame.size.height), point))) {
        self.touch = [[UITouch alloc] initAtPoint:point inWindow:[XYSimulatedTouch lastWindow]];
        [self.touch setLocationInWindow:point];
    }
    else {
        self.touch = [[UITouch alloc] initAtPoint:point inWindow:[UIApplication sharedApplication].keyWindow];
    }
    UIEvent *event = [XYSimulatedTouch eventWithTouches:@[self.touch]];
    [[UIApplication sharedApplication] sendEvent:event];
    if ((self.touch.phase == UITouchPhaseBegan) ||
        self.touch.phase == UITouchPhaseMoved) {
        [self.touch setPhaseAndUpdateTimestamp:UITouchPhaseStationary];
    }
    
}

// 模拟结束点触 touchesMoved
- (void)endTouchWithPoint:(CGPoint)point{
    [self.touch setLocationInWindow:point];
    [self.touch setPhaseAndUpdateTimestamp:UITouchPhaseEnded];
    UIEvent *event = [self.class eventWithTouches:@[self.touch]];
    [[UIApplication sharedApplication] sendEvent:event];
}

// 模拟移动 pressesEnded
- (void)moveTouchWithPoint:(CGPoint)point{
    [self.touch setLocationInWindow:point];
    [self.touch setPhaseAndUpdateTimestamp:UITouchPhaseMoved];
    UIEvent *event = [self.class eventWithTouches:@[self.touch]];
    [[UIApplication sharedApplication] sendEvent:event];
    [self.touch setPhaseAndUpdateTimestamp:UITouchPhaseStationary];
}

+ (UIWindow *)lastWindow
{
    NSArray *windows = [UIApplication sharedApplication].windows;
    for(UIWindow *window in [windows reverseObjectEnumerator]) {
        if ([window isKindOfClass:[UIWindow class]] &&
            CGRectEqualToRect(window.bounds, [UIScreen mainScreen].bounds))
            return window;
    }
    return [UIApplication sharedApplication].keyWindow;
}

+ (UIEvent *)eventWithTouches:(NSArray *)touches
{
    // _touchesEvent is a private selector, interface is exposed in UIApplication(KIFAdditionsPrivate)
    UIEvent *event = [[UIApplication sharedApplication] _touchesEvent];
    [event _clearTouches];
    [event kif_setEventWithTouches:touches];
    
    for (UITouch *aTouch in touches) {
        [event _addTouch:aTouch forDelayedDelivery:NO];
    }
    return event;
}

+ (CGSize)getInterfaceSize {
    CGFloat width = 0, height = 0;
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        
        width = size.height;
        height = size.width;
    } else {
        
        width = size.width;
        height = size.height;
    }
    return CGSizeMake(width, height);
}

@end

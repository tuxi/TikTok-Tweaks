//
//  UIDebuggingTool.m
//  xinzhuxianDylib
//
//  Created by xiaoyuan on 2019/11/21.
//  Copyright © 2019 寻宝天行. All rights reserved.
//

#if DEBUG
 
#import "UIDebuggingTool.h"
#import <objc/runtime.h>
#import <FLEX/FLEX.h>
#import "TikTokDylib-Swift.h"

static void SwapInstanceMethods(Class cls, SEL original, SEL replacement) {
    Method originalMethod = class_getInstanceMethod(cls, original);
    IMP originalImplementation = method_getImplementation(originalMethod);
    const char *originalArgTypes = method_getTypeEncoding(originalMethod);

    Method replacementMethod = class_getInstanceMethod(cls, replacement);
    IMP replacementImplementation = method_getImplementation(replacementMethod);
    const char *replacementArgTypes = method_getTypeEncoding(replacementMethod);

    if (class_addMethod(cls, original, replacementImplementation, replacementArgTypes)) {
        class_replaceMethod(cls, replacement, originalImplementation, originalArgTypes);
    } else {
        method_exchangeImplementations(originalMethod, replacementMethod);
    }
}

@interface _FakeGestureRecognizer : UIGestureRecognizer
- (UIGestureRecognizerState)state;
@end

@implementation _FakeGestureRecognizer
// [[UIDebuggingInformationOverlayInvokeGestureHandler mainHandler] _handleActivationGesture:(UIGestureRecognizer *)]
// requires a UIGestureRecognizer, as it checks the state of it. We just fake that here.
- (UIGestureRecognizerState)state {
    return UIGestureRecognizerStateEnded;
}

@end

NSString *const UIEventSubtypexy_motionShakeNotification = @"UIEventSubtypexy_motionShakeNotification";
@interface UIApplication (XYSwizzle)

@property (nonatomic, assign) BOOL isMoved;

@end

@implementation UIApplication (XYSwizzle)
- (void)swizzle_sendEvent:(UIEvent *)event {
    [self swizzle_sendEvent:event];
    if (event.type == UIEventTypeMotion && event.subtype == UIEventSubtypeMotionShake) {
        if ([[event valueForKey:@"shakeState"] intValue] == 1) {
            [[NSNotificationCenter defaultCenter] postNotificationName:UIEventSubtypexy_motionShakeNotification object:nil];
        }
    }
    else if (event.type==UIEventTypeTouches) {
        UITouch *touch = [event.allTouches anyObject];
        
        if (touch.phase == UITouchPhaseBegan) {
            self.isMoved = NO;
        } else if (touch.phase == UITouchPhaseMoved) {
            self.isMoved = YES;
        } else if (touch.phase == UITouchPhaseEnded) {
            if (!self.isMoved && event.allTouches.count == 1) {
                UITouch *touch = [event.allTouches anyObject];
                if (@available(iOS 9.1, *)) {
                    CGPoint locationPointWindow = [touch preciseLocationInView:touch.window]; NSLog(@"TouchLocationWindow:(%.1f,%.1f)",locationPointWindow.x,locationPointWindow.y);
                } else {
                    // Fallback on earlier versions
                }
            }
            self.isMoved = NO;
        }
    }
}
- (void)setIsMoved:(BOOL)isMoved {
    objc_setAssociatedObject(self, @selector(isMoved), @(isMoved), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isMoved {
    NSNumber *isMoved = objc_getAssociatedObject(self, _cmd);
    return isMoved.boolValue;
}
@end

@interface UIDebuggingTool () <NSURLConnectionDataDelegate, NSURLSessionDataDelegate>


@property (nonatomic, assign) BOOL enableMotion;
@end

@implementation UIDebuggingTool

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SwapInstanceMethods([UIApplication class], @selector(sendEvent:), @selector(swizzle_sendEvent:));
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onUIApplicationDidFinishLaunching) name:UIApplicationDidFinishLaunchingNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onMotionShake) name:UIEventSubtypexy_motionShakeNotification object:nil];
    });
}

+ (instancetype)manager {
    static id _instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [self new];
    });
    return _instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[FLEXManager sharedManager] setNetworkDebuggingEnabled:YES];
    }
    return self;
}

+ (void)onUIApplicationDidFinishLaunching {
    [UIDebuggingTool manager].enableMotion = YES;
//    [self prepareDebuggingOverlay];
}

+ (void)onMotionShake {
    if ([UIDebuggingTool manager].enableMotion) {
        [self toggleVisibility];
    }
}


- (void)setEnableMotion:(BOOL)enableMotion {
    objc_setAssociatedObject(self, @selector(enableMotion), @(enableMotion), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)enableMotion {
    NSNumber *enableMotion = objc_getAssociatedObject(self, _cmd);
    return enableMotion.boolValue;
}

+ (void)prepareDebuggingOverlay {
    [self toggleVisibility];
}

+ (void)toggleVisibility {
    if (!XYPreferenceManager.shared.isDebugFLEXEnabled) {
        return;
    }
    [[FLEXManager sharedManager] toggleExplorer];
}


@end

#endif

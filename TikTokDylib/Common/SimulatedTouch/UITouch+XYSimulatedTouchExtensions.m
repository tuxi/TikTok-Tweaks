//
//  UITouch+XYSimulatedTouchExtensions.m
//  AwemeDylib
//
//  Created by xiaoyuan on 2020/1/29.
//  Copyright © 2020 enba. All rights reserved.
//

#import "UITouch+XYSimulatedTouchExtensions.h"

#import "LoadableCategory.h"
#import <objc/runtime.h>

KW_FIX_CATEGORY_BUG_M(UITouch_XYSimulatedTouchExtensions)

MAKE_CATEGORIES_LOADABLE(UITouch_XYSimulatedTouchExtensions)

@implementation UITouch (XYSimulatedTouchExtensions)

- (id)initAtPoint:(CGPoint)point inWindow:(UIWindow *)window;
{
    self = [super init];
    if (self == nil) {
        return nil;
    }
    
    // Create a fake tap touch
    [self setWindow:window]; // Wipes out some values.  Needs to be first.
    
    //[self setTapCount:1];
    [self _setLocationInWindow:point resetPrevious:YES];
    
    UIView *hitTestView = [window hitTest:point withEvent:nil];
    
    [self setView:hitTestView];
    [self setPhase:UITouchPhaseBegan];
    //    NSLog(@"initAtPoint setPhase 0");
    [self _setIsFirstTouchForView:YES];
    [self setIsTap:NO];
    [self setTimestamp:[[NSProcessInfo processInfo] systemUptime]];
    if ([self respondsToSelector:@selector(setGestureView:)]) {
        [self setGestureView:hitTestView];
    }
    
    // Starting with iOS 9, internal IOHIDEvent must be set for UITouch object
    NSOperatingSystemVersion iOS9 = {9, 0, 0};
    if ([NSProcessInfo instancesRespondToSelector:@selector(isOperatingSystemAtLeastVersion:)] && [[NSProcessInfo new] isOperatingSystemAtLeastVersion:iOS9]) {
        [self kif_setHidEvent];
    }
    
    return self;
}
@end

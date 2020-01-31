//
//  UIControl+XYExtensions.m
//  AwemeDylib
//
//  Created by xiaoyuan on 2020/1/28.
//  Copyright © 2020 enba. All rights reserved.
//

#import "UIControl+XYExtensions.h"
#import <objc/runtime.h>

@implementation UIControl (XYExtensions)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        {
            SEL originalSelector = @selector(sendActionsForControlEvents:);
            SEL swizzledSelector = @selector(xy_sendActionsForControlEvents:);
            
            Method originalMethod = class_getInstanceMethod(class, originalSelector);
            Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
            
            BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
            if (success) {
                class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }
        }
        {
            SEL originalSelector = @selector(sendAction:to:forEvent:);
            SEL swizzledSelector = @selector(xy_sendAction:to:forEvent:);
            
            Method originalMethod = class_getInstanceMethod(class, originalSelector);
            Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
            
            BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
            if (success) {
                class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }
        }
    });
}


- (void)xy_sendActionsForControlEvents:(UIControlEvents)controlEvents {
    [self xy_sendActionsForControlEvents:controlEvents];
}
- (void)xy_sendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event {
    [self xy_sendAction:action to:target forEvent:event];
}
@end

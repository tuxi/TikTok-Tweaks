//
//  UIAlertController+XYExtensions.m
//  AwemeDylib
//
//  Created by xiaoyuan on 2020/2/2.
//  Copyright © 2020 enba. All rights reserved.
//

#import "UIAlertController+XYExtensions.h"

#import <AppKit/AppKit.h>


@implementation UIAlertController (XYExtensions)

+ (UIAlertController *)xy_topAlertController {
    NSArray<UIWindow *> *windows = [UIApplication sharedApplication].windows;
    UIAlertController *topAlertController = nil;
    for (NSInteger i = windows.count - 1; windows >= 0; i--) {
        UIWindow *window = windows[i];
        UIViewController *presentedViewController = window.rootViewController.presentedViewController;
        if (presentedViewController && [presentedViewController isKindOfClass:[UIAlertController class]]) {
            topAlertController = (id)presentedViewController;
            break;
        }
    }
    return topAlertController;
}

- (BOOL)xy_performActionBlockWithActionTitle:(NSString *)title {
    if (title == nil) {
        return NO;
    }
    // 找到alertController 上的按钮，并点击，完成退出
    __block UIAlertAction *action = nil;
    [self.actions enumerateObjectsUsingBlock:^(UIAlertAction * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // 找到确定按钮
        if ([obj.title isEqualToString:title]) {
            action = obj;
            *stop = YES;
        }
    }];
    
    if (!action) {
        return NO;
    }
    
    void (^actionHandler)(UIAlertAction *action) = [action valueForKey:@"_handler"];
    if (!actionHandler) {
        return NO;
    }
    actionHandler(action);
    [self dismissViewControllerAnimated:YES completion:nil];
    return YES;
}

@end

//
//  UIAlertController+XYExtensions.h
//  AwemeDylib
//
//  Created by xiaoyuan on 2020/2/2.
//  Copyright © 2020 enba. All rights reserved.
//

#import <AppKit/AppKit.h>


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (XYExtensions)

// 获取正在显示的UIAlertController实例
+ (UIAlertController *)xy_topAlertController;

// 根据action title 执行 某个action 的block 块
- (BOOL)xy_performActionBlockWithActionTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END

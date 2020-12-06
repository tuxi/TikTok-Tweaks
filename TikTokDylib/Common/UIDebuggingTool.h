//
//  UIDebuggingTool.h
//  xinzhuxianDylib
//
//  Created by xiaoyuan on 2019/11/21.
//  Copyright © 2019 寻宝天行. All rights reserved.
//

#if DEBUG

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const UIEventSubtypexy_motionShakeNotification;

@interface UIDebuggingTool : NSObject


+ (instancetype)manager;

+ (void)toggleVisibility;

@end

NS_ASSUME_NONNULL_END

#endif


//
//  MBProgressHUD+XYHUD.h
//  Boobuz
//
//  Created by xiaoyuan on 14/11/2017.
//  Copyright © 2017 erlinyou.com. All rights reserved.
//

#import "MBProgressHUD.h"

typedef void(^XYHUDActionCallBack)(MBProgressHUD *hud);

@interface UIView (XYHUDExtension)

#pragma mark *** Text hud ***

- (MBProgressHUD *)xy_hud;

/// 显示文本样式的hud, 默认显示在当前控制器view上
- (void)xy_showMaxTimeMessage:(NSString *)message;
- (void)xy_showMessage:(NSString *)message;
- (void)xy_showMessage:(NSString *)message
             delayTime:(CGFloat)delayTime;
- (void)xy_showMessage:(NSString *)message
             delayTime:(CGFloat)delayTime
                offset:(CGPoint)offset;

#pragma mark *** Activity hud ***

/// 显示菊花样式的hud
- (void)xy_showActivity;
- (void)xy_showActivityMessage:(NSString *)message;
- (void)xy_showActivityDelayTime:(CGFloat)delayTime;
- (void)xy_showActivityMessage:(NSString*)message
                     delayTime:(CGFloat)delayTime;
- (void)xy_showActivityMessage:(NSString*)message
                     delayTime:(CGFloat)delayTime
                        offset:(CGPoint)offset;

/// 显示菊花和取消按钮的loading，不会自动隐藏，需要手动调用hide隐藏
- (void)xy_showActivityWithActionCallBack:(XYHUDActionCallBack)callBack;
/// 显示菊花和取消按钮的loading，不会自动隐藏，需要手动调用hide隐藏
/// @param message 菊花下面显示的文本
/// @param callBack 触发取消按钮的回调
- (void)xy_showActivityMessage:(NSString *)message
                actionCallBack:(XYHUDActionCallBack)callBack;
- (void)xy_showProgressWithActionCallBack:(XYHUDActionCallBack)callBack;
- (void)xy_showProgressMessage:(NSString *)message
                actionCallBack:(XYHUDActionCallBack)callBack;

#pragma mark *** Custom hud ***

/// 显示自定义样式的hud
/// @param image hud上显示的图片
/// @param message hud上显示的文本
- (void)xy_showCustomImage:(UIImage *)image
                   message:(NSString *)message;
- (void)xy_showCustomImage:(UIImage *)image
                   message:(NSString *)message
                    offset:(CGPoint)offset;

#pragma mark *** Hide hud ***

- (void)xy_hideHUD;
- (void)xy_hideHUDWithMessage:(NSString *)message
                    hideAfter:(NSTimeInterval)afterSecond;
- (void)xy_hideHUDWithAfter:(NSTimeInterval)afterSecond;

@end

@interface MBProgressHUD (XYHUD)

/// button 距离边距控件的顶部和底部间距值
@property (nonatomic) CGFloat buttonPadding;

#pragma mark *** Text hud ***

/// 显示文本样式的hud，不会自动隐藏，必须手动调用hide
+ (void)xy_showMaxTimeMessage:(NSString *)message;
/// 显示文本样式的hud, 默认显示在当前控制器view上， 会自动隐藏，默认为2秒
+ (void)xy_showMessage:(NSString *)message;
+ (void)xy_showMessage:(NSString *)message
             delayTime:(CGFloat)delayTime;
+ (void)xy_showMessage:(NSString *)message
             delayTime:(CGFloat)delayTime
                toView:(UIView *)view;
+ (void)xy_showAttMessage:(NSAttributedString *)attMessage
                delayTime:(CGFloat)delayTime
                   toView:(UIView *)view
                   offSet:(CGPoint)offset;
#pragma mark *** Activity hud ***

/// 显示菊花样式的hud
+ (void)xy_showActivity;
+ (void)xy_showActivityDelayTime:(CGFloat)delayTime;
+ (void)xy_showActivityToView:(UIView *)view;
+ (void)xy_showActivityMessage:(NSString *)message;
+ (void)xy_showActivityDelayTime:(CGFloat)delayTime
                          toView:(UIView *)view;
+ (void)xy_showActivityMessage:(NSString *)message
                     delayTime:(CGFloat)delayTime;
+ (void)xy_showActivityMessage:(NSString *)message
                     delayTime:(CGFloat)delayTime
                        toView:(UIView *)view;
+ (void)xy_showActivityMessage:(NSString*)message
                     delayTime:(CGFloat)delayTime
                        toView:(UIView *)view
                        offset:(CGPoint)offset;
/// 显示菊花和取消按钮的loading，不会自动隐藏，需要手动调用hide隐藏
+ (void)xy_showActivityWithActionCallBack:(XYHUDActionCallBack)callBack;
/// 显示菊花和取消按钮的loading，不会自动隐藏，需要手动调用hide隐藏
/// @param message 菊花下面显示的文本
/// @param callBack 触发取消按钮的回调
+ (void)xy_showActivityMessage:(NSString *)message
                actionCallBack:(XYHUDActionCallBack)callBack;
+ (void)xy_showProgressMessage:(NSString *)message
                actionCallBack:(XYHUDActionCallBack)callBack;

#pragma mark *** Custom hud ***

/// 显示自定义样式的hud, 默认显示在window上
+ (void)xy_showCustomImage:(UIImage *)image
                   message:(NSString *)message;

/// 显示自定义样式的hud
/// @param image hud上显示的图片
/// @param message hud上显示的文本
/// @param view 如果view为nil则显示在appliction的window上
+ (void)xy_showCustomImage:(UIImage *)image
                   message:(NSString *)message
                    toView:(UIView *)view;
+ (void)xy_showCustomImage:(UIImage *)image
                   message:(NSString *)message
                    toView:(UIView *)view
                    offset:(CGPoint)offset;

#pragma mark *** Hide hud ***

/// 隐藏当前window显示的hud
+ (void)xy_hideHUD;

@end







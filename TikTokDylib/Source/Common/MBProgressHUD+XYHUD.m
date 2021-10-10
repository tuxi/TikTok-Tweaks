//
//  MBProgressHUD+XYHUD.m
//  Boobuz
//
//  Created by xiaoyuan on 14/11/2017.
//  Copyright © 2017 erlinyou.com. All rights reserved.
//

#import "MBProgressHUD+XYHUD.h"
#import <objc/runtime.h>

#define xy_HUD_VIEW_SELF [MBProgressHUD HUDForView:self]
#define xy_HUD_NULL_VIEW(view) (view ?: (UIView *)[UIApplication sharedApplication].delegate.window)

#ifndef kScreenWidth
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#endif

#ifndef kScreenHeight
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#endif

#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

static const CGFloat BBToastDefaultDuration = 2.0;
#define kMinWH (MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) * 0.22)

@interface UIView ()

- (void)setXy_hudCancelOption:(XYHUDActionCallBack)cancelOption;
- (void)xy_cancelOperationAction:(id)sender;

@end

@interface MBProgressHUD ()

@property (nonatomic, strong, readonly) NSArray *paddingConstraints;

@end

@implementation MBProgressHUD (XYHUD)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[MBProgressHUD appearance] setMinSize:CGSizeMake(kMinWH, kMinWH)];
        [[MBProgressHUD appearance] setMargin:10.0];
    });
}

////////////////////////////////////////////////////////////////////////
#pragma mark - Activity
////////////////////////////////////////////////////////////////////////

+ (void)xy_showActivity {
    [self xy_showActivityToView:nil];
}

+ (void)xy_showActivityToView:(UIView *)view {
    [self xy_showActivityDelayTime:0 toView:xy_HUD_NULL_VIEW(view)];
}

+ (void)xy_showActivityDelayTime:(CGFloat)delayTime {
    [self xy_showActivityDelayTime:delayTime toView:nil];
}

+ (void)xy_showActivityDelayTime:(CGFloat)delayTime
                          toView:(UIView *)view {
    [self xy_showActivityMessage:nil delayTime:delayTime toView:xy_HUD_NULL_VIEW(view)];
}

+ (void)xy_showActivityMessage:(NSString*)message  {
    [self xy_showActivityMessage:message delayTime:0 toView:xy_HUD_NULL_VIEW(nil)];
}
+ (void)xy_showActivityMessage:(NSString*)message
                     delayTime:(CGFloat)delayTime {
    [self xy_showActivityMessage:message delayTime:delayTime toView:xy_HUD_NULL_VIEW(nil)];
}

+ (void)xy_showActivityMessage:(NSString*)message
                     delayTime:(CGFloat)delayTime
                        toView:(UIView *)view {
    [self xy_showActivityMessage:message
                       delayTime:delayTime
                          toView:view
                          offset:CGPointZero];
}

+ (void)xy_showActivityMessage:(NSString*)message
                     delayTime:(CGFloat)delayTime
                        toView:(UIView *)view
                        offset:(CGPoint)offset {
    view = xy_HUD_NULL_VIEW(view);
    MBProgressHUD *hud  = [self xy_hudWithMessage:message
                                           toView:view
                                           offset:offset];
    hud.mode = MBProgressHUDModeIndeterminate;
    CGFloat wid = MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    hud.square = NO;
    if (delayTime > 0) {
        [hud hideAnimated:YES afterDelay:delayTime];
    }
    [NSLayoutConstraint constraintWithItem:hud.label attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationLessThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:MIN(kScreenWidth, kScreenHeight)*.3].active = YES;
}

+ (void)xy_showActivityWithActionCallBack:(XYHUDActionCallBack)callBack {
    [self xy_showActivityMessage:nil actionCallBack:callBack];
}

+ (void)xy_showActivityMessage:(NSString *)message
                actionCallBack:(XYHUDActionCallBack)callBack {
    [self xy_showActivityMessage:message toView:nil actionCallBack:callBack];
}

+ (void)xy_showProgressMessage:(NSString *)message
                actionCallBack:(XYHUDActionCallBack)callBack {
    [self xy_showProgressMessage:message
                          toView:nil
                  actionCallBack:callBack];
}

+ (void)xy_showProgressMessage:(NSString *)message
                        toView:(UIView *)view
                actionCallBack:(XYHUDActionCallBack)callBack {
    [self xy_showHudWithMessage:message
                         toView:view
                           mode:MBProgressHUDModeDeterminate
                 actionCallBack:callBack];
}

+ (void)xy_showActivityMessage:(NSString *)message
                        toView:(UIView *)view
                actionCallBack:(XYHUDActionCallBack)callBack {
    [self xy_showHudWithMessage:message
                         toView:view
                           mode:MBProgressHUDModeIndeterminate
                 actionCallBack:callBack];;
}

+ (void)xy_showHudWithMessage:(NSString *)message
                       toView:(UIView *)view
                         mode:(MBProgressHUDMode)mode
               actionCallBack:(XYHUDActionCallBack)callBack {
    MBProgressHUD *hud = [self xy_hudWithMessage:message toView:view offset:CGPointZero];
    hud.mode = mode;
    view = xy_HUD_NULL_VIEW(view);
    view.xy_hudCancelOption = callBack;
    [hud.button setTitle:@"Cancel" forState:UIControlStateNormal];
    [hud.button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [hud.button addTarget:view
                   action:@selector(xy_cancelOperationAction:)
         forControlEvents:UIControlEventTouchUpInside];
    [NSLayoutConstraint constraintWithItem:hud.label attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationLessThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:MIN(kScreenWidth, kScreenHeight)*.5].active = YES;
}


////////////////////////////////////////////////////////////////////////
#pragma mark - CustomView
////////////////////////////////////////////////////////////////////////

+ (void)xy_showCustomImage:(UIImage *)image
                   message:(NSString *)message {
    [self xy_showCustomImage:image
                     message:message
                      toView:xy_HUD_NULL_VIEW(nil)];
}


+ (void)xy_showCustomImage:(UIImage *)image
                   message:(NSString *)message
                    toView:(UIView *)view {
    [self xy_showCustomImage:image message:message toView:view offset:CGPointZero];
}

+ (void)xy_showCustomImage:(UIImage *)image
                   message:(NSString *)message
                    toView:(UIView *)view
                    offset:(CGPoint)offset {
    
    MBProgressHUD *hud = [self xy_hudWithMessage:message toView:view offset:offset];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:image];
    [hud hideAnimated:YES afterDelay:BBToastDefaultDuration];
}

////////////////////////////////////////////////////////////////////////
#pragma mark - Text
////////////////////////////////////////////////////////////////////////

+ (void)xy_showMaxTimeMessage:(NSString *)message {
    [self xy_showMessage:message delayTime:NSIntegerMax toView:xy_HUD_NULL_VIEW(nil)];
}

+ (void)xy_showMessage:(NSString *)message {
    [self xy_showMessage:message delayTime:BBToastDefaultDuration toView:xy_HUD_NULL_VIEW(nil)];
}

+ (void)xy_showMessage:(NSString *)message delayTime:(CGFloat)delayTime {
    [self xy_showMessage:message delayTime:delayTime toView:nil];
}

+ (void)xy_showMessage:(NSString *)message
             delayTime:(CGFloat)delayTime
                toView:(UIView *)view {
    [self xy_showMessage:message delayTime:delayTime toView:view offSet:CGPointZero];
}

+ (void)xy_showMessage:(NSString *)message
             delayTime:(CGFloat)delayTime
                toView:(UIView *)view
                offSet:(CGPoint)offset {
    if (delayTime <= 0.0) {
        delayTime = 2.0;
    }
    MBProgressHUD *hud = [self xy_hudWithMessage:message toView:view offset:offset];
    hud.mode = MBProgressHUDModeText;
    hud.userInteractionEnabled = NO;
    if (delayTime != NSIntegerMax) {
        [hud hideAnimated:YES afterDelay:delayTime];
    }
}

+ (void)xy_showAttMessage:(NSAttributedString *)attMessage
             delayTime:(CGFloat)delayTime
                toView:(UIView *)view
                offSet:(CGPoint)offset {
    if (delayTime <= 0.0) {
        delayTime = 2.0;
    }
    MBProgressHUD *hud = [self xy_hudWithAttMessage:attMessage toView:view offset:offset];
    hud.mode = MBProgressHUDModeText;
    hud.userInteractionEnabled = NO;
    if (delayTime != NSIntegerMax) {
        [hud hideAnimated:YES afterDelay:delayTime];
    }
}


////////////////////////////////////////////////////////////////////////
#pragma mark - Hide
////////////////////////////////////////////////////////////////////////

+ (void)xy_hideHUD {
    UIView *windowView = (UIView *)[UIApplication sharedApplication].delegate.window;
    [self hideAllHUDsForView:windowView animated:NO];
}


////////////////////////////////////////////////////////////////////////
#pragma mark - Init
////////////////////////////////////////////////////////////////////////


+ (MBProgressHUD *)xy_hudWithMessage:(NSString *)message toView:(UIView *)view offset:(CGPoint)offset {
    MBProgressHUD *hud = [self xy_hudToView:view offset:offset];
    hud.label.text = message;
    return hud;
}

+ (MBProgressHUD *)xy_hudWithAttMessage:(NSAttributedString *)attMessage toView:(UIView *)view offset:(CGPoint)offset {
    MBProgressHUD *hud = [self xy_hudToView:view offset:offset];
    hud.label.attributedText = attMessage;
    return hud;
}

+ (MBProgressHUD *)xy_hudToView:(UIView *)view offset:(CGPoint)offset {
    view = xy_HUD_NULL_VIEW(view);
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    // 修改样式，否则等待框背景色将为半透明
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    // 设置等待框背景色为黑色
    hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    hud.removeFromSuperViewOnHide = YES;
    // 设置菊花框为白色
    if (@available(iOS 9.0, *)) {
        [UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[MBProgressHUD class]]].color = [UIColor whiteColor];
    } else {
        [UIActivityIndicatorView appearanceWhenContainedIn:[MBProgressHUD class], nil].color = [UIColor whiteColor];
    }
    [view addSubview:hud];
    hud.label.font = [UIFont systemFontOfSize:15.0f];
    hud.label.numberOfLines = 0;
    // 设置间距为20.f
    hud.margin = 20.0;
    hud.buttonPadding = 20.0;
    // 正方形，就是宽高是否相同
    hud.square = NO;
    // 设置内部控件的颜色，包括button的文本颜色，边框颜色，label的文本颜色等
    hud.contentColor = [UIColor whiteColor];
    [hud setOffset:offset];
    [hud showAnimated:YES];
    return hud;
}

- (void)setButtonPadding:(CGFloat)buttonPadding {
    if (buttonPadding != self.buttonPadding) {
        objc_setAssociatedObject(self, @selector(buttonPadding), @(buttonPadding), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self setNeedsUpdateConstraints];
    }
}

- (CGFloat)buttonPadding {
    NSNumber *paddingNum = objc_getAssociatedObject(self, _cmd);
    if (!paddingNum) {
        paddingNum = @(4.0);
    }
    return [paddingNum floatValue];
}

/// 修改子控件之间间距的方法，重写以修改
- (void)updatePaddingConstraints {
    //    NSMutableArray *subviews = [NSMutableArray arrayWithObjects:self.topSpacer, self.label, self.detailsLabel, self.button, self.bottomSpacer, nil];
    
    // Set padding dynamically, depending on whether the view is visible or not
    __block BOOL hasVisibleAncestors = NO;
    [self.paddingConstraints enumerateObjectsUsingBlock:^(NSLayoutConstraint *padding, NSUInteger idx, BOOL *stop) {
        UIView *firstView = (UIView *)padding.firstItem;
        UIView *secondView = (UIView *)padding.secondItem;
        BOOL firstVisible = !firstView.hidden && !CGSizeEqualToSize(firstView.intrinsicContentSize, CGSizeZero);
        BOOL secondVisible = !secondView.hidden && !CGSizeEqualToSize(secondView.intrinsicContentSize, CGSizeZero);
        // Set if both views are visible or if there's a visible view on top that doesn't have padding
        // added relative to the current view yet
        padding.constant = (firstVisible && (secondVisible || hasVisibleAncestors)) ? 4.f : 0.f;
        if (padding.constant) {
            if ([firstView isEqual:self.button] || [secondView isEqual:self.button]) {
                padding.constant = self.buttonPadding;
            }
        }
        hasVisibleAncestors |= secondVisible;
    }];
}


@end

@implementation UIView (XYHUDExtension)

- (MBProgressHUD *)xy_hud {
    return [MBProgressHUD HUDForView:self];
}

#pragma mark *** Text hud ***

/// 显示文本样式的hud, 默认显示在当前控制器view上
- (void)xy_showMaxTimeMessage:(NSString *)message {
    [MBProgressHUD xy_showMaxTimeMessage:message];
}

- (void)xy_showMessage:(NSString *)message {
    [self xy_showMessage:message delayTime:0];
}
- (void)xy_showMessage:(NSString *)message
             delayTime:(CGFloat)delayTime {
    [self xy_showMessage:message
               delayTime:delayTime
                  offset:CGPointZero];
}

- (void)xy_showMessage:(NSString *)message
             delayTime:(CGFloat)delayTime
                offset:(CGPoint)offset {
    [MBProgressHUD xy_showMessage:message
                        delayTime:delayTime
                           toView:self
                           offSet:offset];
}

#pragma mark *** Activity hud ***

- (void)xy_showActivity {
    [self xy_showActivityMessage:nil];
}

- (void)xy_showActivityMessage:(NSString *)message {
    [self xy_showActivityMessage:message delayTime:0];
}

- (void)xy_showActivityDelayTime:(CGFloat)delayTime {
    [self xy_showActivityMessage:nil delayTime:delayTime];
}

- (void)xy_showActivityWithActionCallBack:(XYHUDActionCallBack)callBack {
    [self xy_showActivityMessage:nil actionCallBack:callBack];
}

- (void)xy_showActivityMessage:(NSString*)message delayTime:(CGFloat)delayTime {
    [self xy_showActivityMessage:message delayTime:delayTime offset:CGPointZero];
}

- (void)xy_showActivityMessage:(NSString*)message
                     delayTime:(CGFloat)delayTime
                        offset:(CGPoint)offset {
    [MBProgressHUD xy_showActivityMessage:message
                                delayTime:delayTime
                                   toView:self
                                   offset:offset];
}

- (void)xy_showActivityMessage:(NSString *)message
                actionCallBack:(XYHUDActionCallBack)callBack {
    [MBProgressHUD xy_showActivityMessage:message toView:self actionCallBack:callBack];
}

- (void)xy_showProgressWithActionCallBack:(XYHUDActionCallBack)callBack {
    [self xy_showProgressMessage:nil actionCallBack:callBack];
}

- (void)xy_showProgressMessage:(NSString *)message
                actionCallBack:(XYHUDActionCallBack)callBack {
    [MBProgressHUD xy_showProgressMessage:message toView:self actionCallBack:callBack];
}


#pragma mark *** Custom hud ***

- (void)xy_showCustomImage:(UIImage *)image
                   message:(NSString *)message {
    [MBProgressHUD xy_showCustomImage:image
                              message:message
                               toView:self
                               offset:CGPointZero];
}

- (void)xy_showCustomImage:(UIImage *)image
                   message:(NSString *)message
                    offset:(CGPoint)offset {
    [self xy_showCustomImage:image
                     message:message
                      offset:offset];
}

- (void)xy_hideHUD {
    [MBProgressHUD hideHUDForView:self animated:NO];
}

- (void)xy_hideHUDWithMessage:(NSString *)message
                    hideAfter:(NSTimeInterval)afterSecond {
    MBProgressHUD *hud = [self xy_hud];
    if (!hud) {
        return;
    }
    hud.label.text = message;
    [hud hideAnimated:YES afterDelay:afterSecond];
}

- (void)xy_hideHUDWithAfter:(NSTimeInterval)afterSecond {
    [self xy_hideHUDWithMessage:nil hideAfter:afterSecond];
}


////////////////////////////////////////////////////////////////////////
#pragma mark - Action
////////////////////////////////////////////////////////////////////////

- (void)xy_cancelOperationAction:(id)sender {
    if (self.xy_hudCancelOption) {
        self.xy_hudCancelOption([self xy_hud]);
    }
    
    [self xy_hideHUDWithAfter:1.0];
}

////////////////////////////////////////////////////////////////////////
#pragma mark - Set \ get
////////////////////////////////////////////////////////////////////////

- (void)setXy_hudCancelOption:(XYHUDActionCallBack)cancelOption {
    objc_setAssociatedObject(self, @selector(xy_hudCancelOption), cancelOption, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (XYHUDActionCallBack)xy_hudCancelOption {
    return objc_getAssociatedObject(self, _cmd);
}

@end


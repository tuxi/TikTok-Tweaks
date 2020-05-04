//  weibo: http://weibo.com/xiaoqing28
//  blog:  http://www.alonemonkey.com
//
//  AwemeDylib.m
//  AwemeDylib
//
//  Created by xiaoyuan on 2020/1/27.
//  Copyright (c) 2020 enba. All rights reserved.
//

#import "TikTokDylib.h"
#import <CaptainHook/CaptainHook.h>
#import <UIKit/UIKit.h>
#import <Cycript/Cycript.h>
#import <MDCycriptManager.h>
#import "AwemeApiHeaders.h"
#import "XYConfigSettingsViewController.h"
#import "XYAwemeManager.h"
#import "XYSimulatedTouch.h"

#define kMENU_TITLE @"配置"

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


@implementation UIApplication (XYSwizzle)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SwapInstanceMethods([UIApplication class], @selector(sendEvent:), @selector(swizzle_sendEvent:));
    });
}

- (void)swizzle_sendEvent:(UIEvent *)event {
    [self swizzle_sendEvent:event];
}

@end

CHConstructor{
    
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        
#ifndef __OPTIMIZE__
        CYListenServer(6666);

        MDCycriptManager* manager = [MDCycriptManager sharedInstance];
        [manager loadCycript:NO];

        NSError* error;
        NSString* result = [manager evaluateCycript:@"UIApp" error:&error];
        NSLog(@"result: %@", result);
        if(error.code != 0){
            NSLog(@"error: %@", error.localizedDescription);
        }
#endif
        
    }];
}



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wstrict-prototypes"
#pragma GCC diagnostic ignored "-Wundeclared-selector"

// MARK: - Hook CTCarrier
CHDeclareClass(CTCarrier)

CHMethod0(NSString *, CTCarrier, isoCountryCode) {
    if ([XYAwemeManager manager].countryCode) {
        return [XYAwemeManager manager].countryCode;
    }
    return CHSuper0(CTCarrier, isoCountryCode);
}

CHMethod0(NSString *, CTCarrier, mobileCountryCode) {
    NSDictionary *dict = [XYAwemeManager manager].getCarrierInfo;
    if (dict) {
        return [dict objectForKey:@"mcc"];
    }
    return CHSuper0(CTCarrier, mobileCountryCode);
}

CHMethod0(NSString *, CTCarrier, mobileNetworkCode) {
    NSDictionary *dict = [XYAwemeManager manager].getCarrierInfo;
    if (dict) {
        return [dict objectForKey:@"mnc"];
    }
    return CHSuper0(CTCarrier, mobileCountryCode);
}

CHConstructor {
    CHLoadLateClass(CTCarrier);
    CHHook0(CTCarrier, isoCountryCode);
    CHHook0(CTCarrier, mobileCountryCode);
    CHHook0(CTCarrier, mobileNetworkCode);
}

// MARK: - Setting界面
CHDeclareClass(AWESettingsTableViewController)
CHDeclareClass(AWESettingsViewModel)

CHPropertyAssign(AWESettingsViewModel, NSString *, isHooked, setIsHooked);

CHMethod0(NSArray *, AWESettingsViewModel, sectionDataArray) {
    NSMutableArray *hookSettings = [CHSuper0(AWESettingsViewModel, sectionDataArray) mutableCopy];
    if (![self.isHooked isEqualToString:@"YES"]) {
        AWESettingSectionModel *firstSectionModle = hookSettings.firstObject;
        NSMutableArray<AWESettingItemModel *> *items = [firstSectionModle.itemArray mutableCopy];
        AWESettingItemModel *hookItem = [objc_getClass("AWESettingItemModel") new];
        hookItem.type = -1;
        hookItem.title = kMENU_TITLE;
        hookItem.iconImageName = items.firstObject.iconImageName;
        hookItem.cellType = items.firstObject.cellType;
        hookItem.cellTappedBlock = ^(void) {
            dispatch_async(dispatch_get_main_queue(), ^{
                XYConfigSettingsViewController *settingVc = [[XYConfigSettingsViewController alloc] init];
                UIViewController *tabbarVc = UIApplication.sharedApplication.keyWindow.rootViewController;
                UINavigationController *hookNavi = [[UINavigationController alloc] initWithRootViewController:settingVc];
                [tabbarVc presentViewController:hookNavi animated:YES completion:nil];
            });
        };
        [items insertObject:hookItem atIndex:0];
        firstSectionModle.itemArray = [items copy];
        self.isHooked = @"YES";
    }
    return [hookSettings copy];
}

CHConstructor {
    CHLoadLateClass(AWESettingsTableViewController);
    CHLoadLateClass(AWESettingsViewModel);
    CHHook0(AWESettingsViewModel, sectionDataArray);
    CHHook0(AWESettingsViewModel, isHooked);
    CHHook1(AWESettingsViewModel, setIsHooked);
}

// MARK: - AWEAwemeModel
CHDeclareClass(AWEShareServiceUtils)
CHDeclareClass(AWEAwemeModel)

CHMethod1(void, AWEAwemeModel, setPreventDownload, BOOL, arg1) {
    // 与禁止下载视频的有关的hook
    if ([XYAwemeManager manager].isRemovePreventDownload == YES) {
        arg1 = NO;
    }
    
    CHSuper1(AWEAwemeModel, setPreventDownload, arg1);
}

CHMethod1(void, AWEAwemeModel, setVideo, AWEVideoModel *, arg1) {
    // 与禁止下载视频的有关的hook
    if ([XYAwemeManager manager].isRemovePreventDownload == YES) {
        // 移除该视频的禁止下载时，将 downloadURL 重制为 originURLList，防止无下载源
        arg1.downloadURL.originURLList = arg1.playURL.originURLList;
    }
    CHSuper1(AWEAwemeModel, setVideo, arg1);
}



CHConstructor {
    CHLoadLateClass(AWEAwemeModel);
    CHLoadLateClass(AWEShareServiceUtils);
    CHHook1(AWEAwemeModel, setPreventDownload);
    CHHook1(AWEAwemeModel, setVideo);
}


CHDeclareClass(AWEFeedTableViewController)

CHOptimizedMethod(0, self, BOOL, AWEFeedTableViewController, pureMode) {
    // 是否为纯视频模式，如果设置pureMode == YES  只显示视频，不会显示视频上的AWEAwemePlayInteractionViewController view，即视频上的头像、点赞、音乐等等..
    return [XYAwemeManager manager].isPureMode;
}

CHDeclareClass(AWEVideoPlayerController)

CHOptimizedMethod1(self, void, AWEVideoPlayerController, playerItemDidReachEnd, id, arg1) {
    // 发送视频播放结束的通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"XYFeedTableVideoPlayEndNotification" object:nil];
    CHSuper1(AWEVideoPlayerController, playerItemDidReachEnd, arg1);
}

CHConstructor{
    
    CHLoadLateClass(AWEFeedTableViewController);
    CHHook0(AWEFeedTableViewController, pureMode);
    
    
    CHLoadLateClass(AWEVideoPlayerController);
    CHHook1(AWEVideoPlayerController, playerItemDidReachEnd);
    
}


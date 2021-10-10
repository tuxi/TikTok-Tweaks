//  weibo: http://weibo.com/xiaoqing28
//  blog:  http://www.alonemonkey.com
//
//  TikTokDylib.m
//  TikTokDylib
//
//  Created by xiaoyuan on 2021/10/1.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

#import "TikTokDylib.h"
#import <CaptainHook/CaptainHook.h>
#import <UIKit/UIKit.h>
#import <Cycript/Cycript.h>
#import <MDCycriptManager.h>
#import "TikTokHeaders.h"
#import "TikTokDylib-Swift.h"
#import "XYConfigSettingsViewController.h"

CHConstructor{
    printf(INSERT_SUCCESS_WELCOME);
    
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
    if ([XYPreferenceManager shared].currentCarrier.code) {
        return [XYPreferenceManager shared].currentCarrier.code;
    }
    return CHSuper0(CTCarrier, isoCountryCode);
}

CHMethod0(NSString *, CTCarrier, mobileCountryCode) {
    if ([XYPreferenceManager shared].currentCarrier.mcc) {
        return [XYPreferenceManager shared].currentCarrier.mcc;
    }
    return CHSuper0(CTCarrier, mobileCountryCode);
}

CHMethod0(NSString *, CTCarrier, mobileNetworkCode) {
    if ([XYPreferenceManager shared].currentCarrier.mnc) {
        return [XYPreferenceManager shared].currentCarrier.mnc;
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
// 注意：设置页面第一次进入时使用的是 AWESettingsTableViewController，然后就是TTKSettingsViewController，不知道为什么
CHDeclareClass(AWESettingsTableViewController)
CHDeclareClass(AWESettingsViewModel)

CHPropertyAssign(AWESettingsViewModel, NSString *, isHooked, setIsHooked);

CHMethod0(NSArray *, AWESettingsViewModel, sectionDataArray) {
    NSString *settingsTitle = @"设置规则";
    NSMutableArray *hookSettings = [CHSuper0(AWESettingsViewModel, sectionDataArray) mutableCopy];
    AWESettingSectionModel *firstSectionModle = hookSettings.firstObject;
    NSMutableArray<AWESettingItemModel *> *items = [firstSectionModle.itemArray mutableCopy];
    NSInteger index = [items indexOfObjectPassingTest:^BOOL(AWESettingItemModel *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.title isEqualToString:settingsTitle]) {
            *stop = YES;
            return YES;
        }
        return NO;
    }];
    // 防止重复加入
    if (index != NSNotFound) {
        return [hookSettings copy];;
    }
    AWESettingItemModel *hookItem = [objc_getClass("AWESettingItemModel") new];
    hookItem.type = -1;
    hookItem.title = settingsTitle;
    hookItem.iconImage = items.firstObject.iconImage;
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
    return [hookSettings copy];
}

CHConstructor {
    CHLoadLateClass(AWESettingsTableViewController);
    CHLoadLateClass(AWESettingsViewModel);
    CHHook0(AWESettingsViewModel, sectionDataArray);
    CHHook0(AWESettingsViewModel, isHooked);
    CHHook1(AWESettingsViewModel, setIsHooked);
}

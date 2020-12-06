//
//  XYAwemeManager.m
//  AwemeDylib
//
//  Created by xiaoyuan on 2020/1/29.
//  Copyright © 2020 enba. All rights reserved.
//

#import "XYAwemeManager.h"
#import "MBProgressHUD+XYHUD.h"
#include <sys/stat.h>

#define kRemovedEndWatermarkkKey @"com.enba.removedEndWatermark"
#define kRemovedWatermarkKey @"com.enba.removedWatermark"
#define kAuthorizedToDownload @"com.enba.authorizedToDownload"
#define kCounrtyCode @"com.enba.counrtyCode"
#define kRemovePreventDownloadKey @"com.enba.removePreventDownload"
#define kAutoPlayNextKey @"com.enba.autoPlayNext"
#define kPureModetKey @"com.enba.pureMode"


@implementation XYAwemeManager

+ (instancetype)manager {
    static id _instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [self new];
    });
    return _instance;
}

- (void)setIsRemovedEndWatermark:(BOOL)isRemovedEndWatermark {
    [[NSUserDefaults standardUserDefaults] setBool:isRemovedEndWatermark forKey:kRemovedEndWatermarkkKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)isRemovedEndWatermark {
    return [[[NSUserDefaults standardUserDefaults] valueForKey:kRemovedEndWatermarkkKey] boolValue];
}
- (void)setIsRemovedWatermark:(BOOL)isRemovedWatermark {
    [[NSUserDefaults standardUserDefaults] setBool:isRemovedWatermark forKey:kRemovedWatermarkKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)isRemovedWatermark {
    return [[[NSUserDefaults standardUserDefaults] valueForKey:kRemovedWatermarkKey] boolValue];
}

- (void)setAuthorizedToDownload:(NSNumber *)authorizedToDownload {
    [[NSUserDefaults standardUserDefaults] setValue:authorizedToDownload forKey:kAuthorizedToDownload];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSNumber *)authorizedToDownload {
    return [[NSUserDefaults standardUserDefaults] valueForKey:kAuthorizedToDownload];
}

- (void)setIsRemovePreventDownload:(BOOL)isRemovePreventDownload {
    [[NSUserDefaults standardUserDefaults] setBool:isRemovePreventDownload forKey:kRemovePreventDownloadKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)isRemovePreventDownload {
    return [[NSUserDefaults standardUserDefaults] boolForKey:kRemovePreventDownloadKey];
}

- (void)setCountryCode:(NSString *)countryCode {
    [[NSUserDefaults standardUserDefaults] setValue:countryCode forKey:kCounrtyCode];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)countryCode {
    NSString *countryCode = [[NSUserDefaults standardUserDefaults] valueForKey:kCounrtyCode];
    if (countryCode == nil) {
        countryCode = @"JP";
    }
    return countryCode;
}

- (void)setIsAutoPlayNext:(BOOL)isAutoPlayNext {
    [[NSUserDefaults standardUserDefaults] setValue:@(isAutoPlayNext) forKey:kAutoPlayNextKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)isAutoPlayNext {
    NSNumber *isAutoPlay = [[NSUserDefaults standardUserDefaults] valueForKey:kAutoPlayNextKey];
    if (isAutoPlay == nil) {
        return NO;
    }
    return isAutoPlay.boolValue;
}


- (void)setIsPureMode:(BOOL)isPureMode {
    [[NSUserDefaults standardUserDefaults] setBool:isPureMode forKey:kPureModetKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)isPureMode {
    return [[NSUserDefaults standardUserDefaults] boolForKey:kPureModetKey];
}

- (NSDictionary *)getCarrierInfo {
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistFile = [bundle pathForResource:@"countryCode" ofType:@"plist"];
    NSArray *list = [NSArray arrayWithContentsOfFile:plistFile];
    
    NSString *countryCode = [[XYAwemeManager manager] countryCode];
    for (NSInteger index = 0; index < list.count; index ++) {
        NSDictionary *dataDic = list[index];
        if ([countryCode.lowercaseString isEqualToString:[dataDic[@"code"] lowercaseString]]) {
            return dataDic;
        }
    }
    return nil;
}

+ (void)openWechat {
    NSURL * url = [NSURL URLWithString:@"weixin://"];
    BOOL canOpen = [[UIApplication sharedApplication] canOpenURL:url];
    //先判断是否能打开该url
    if (canOpen) {   //打开微信
        if (@available(iOS 10.0, *)) {
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        } else {
            [[UIApplication sharedApplication] openURL:url];
        }
    }else {
        [MBProgressHUD xy_showMessage:@"您的设备未安装微信APP"];
    }
}

//是否越狱
+ (BOOL)isPrisonBreak
{
    if ([self isSimulator]) return NO;
    
    bool pb = NO;
    
    // 常见越狱文件
    NSArray *pathArray = @[
        @"/Applications/Cydia.app",
        @"/Library/MobileSubstrate/MobileSubstrate.dylib",
        @"/bin/bash",
        @"/usr/sbin/sshd",
        @"/etc/apt"
    ];
    for (int i = 0; i < pathArray.count; i++) {
        NSString *path = pathArray[i];
        if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
            pb = YES;
        }
    }

    // 读取系统所有的应用名称
    if ([[NSFileManager defaultManager] fileExistsAtPath:@"/User/Applications/"]){
        pb = YES;
    }
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://"]]) {
        pb = YES;
    }
    

    struct stat stat_info;
    //使用stat系列函数检测Cydia等工具
    if (0 == stat("/Applications/Cydia.app", &stat_info)) {
        pb = YES;
    }
    
    // 读取环境变量
    char *checkInsertLib = getenv("DYLD_INSERT_LIBRARIES");
    if (checkInsertLib) {
        pb = YES;
    }
    
    return pb;
}
+ (BOOL)isSimulator {
#if TARGET_OS_SIMULATOR
    return YES;
#else
    return NO;
#endif
}

// 判断IPA包二进制文件是否被更改，被二次打包
+ (BOOL)isSecondIPA {
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSDictionary *info = [bundle infoDictionary];
    if ([info objectForKey: @"SignerIdentity"] != nil){
        //存在这个key，则说明被二次打包了
        return YES;
    }
    
    return NO;
}

+ (UIViewController *)topViewController {
    return [NSClassFromString(@"AWEUIResponder") topViewController];
}
@end

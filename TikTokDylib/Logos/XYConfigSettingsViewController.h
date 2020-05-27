//
//  XYConfigSettingsViewController.h
//  AwemeDylib
//
//  Created by xiaoyuan on 2020/1/29.
//  Copyright © 2020 enba. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XYConfigSettingsViewController : UIViewController

@property (nonatomic, copy, nullable) void (^ goUserProfileBlock)(NSString *userId);

@end

NS_ASSUME_NONNULL_END

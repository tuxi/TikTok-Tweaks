//
//  RadomComments.h
//  AwemeDylib
//
//  Created by xiaoyuan on 2020/1/28.
//  Copyright © 2020 enba. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RadomComments : NSObject

+ (instancetype)sharedInstance;

- (NSString *)getRadomComment;

@end

NS_ASSUME_NONNULL_END

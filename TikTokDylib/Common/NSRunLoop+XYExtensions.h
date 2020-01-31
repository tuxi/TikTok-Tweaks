//
//  NSRunLoop+XYExtensions.h
//  AwemeDylib
//
//  Created by xiaoyuan on 2020/1/27.
//  Copyright © 2020 enba. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSRunLoop (XYExtensions)

- (void)xy_defaultAddTimer:(NSTimer *)timer;

@end

NS_ASSUME_NONNULL_END

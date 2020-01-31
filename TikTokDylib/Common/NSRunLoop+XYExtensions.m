//
//  NSRunLoop+XYExtensions.m
//  AwemeDylib
//
//  Created by xiaoyuan on 2020/1/27.
//  Copyright © 2020 enba. All rights reserved.
//

#import "NSRunLoop+XYExtensions.h"


@implementation NSRunLoop (XYExtensions)

- (void)xy_defaultAddTimer:(NSTimer *)timer {
    [self addTimer:timer forMode:NSDefaultRunLoopMode];
}

@end

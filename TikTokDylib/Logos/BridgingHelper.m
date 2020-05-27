//
// BridgingHelper.m
// Aweme
//
// Created by xiaoyuan on 2020/4/26.
// Copyright © 2020 enba. All rights reserved.
//

#import "BridgingHelper.h"
#import "TikTokDylib-Swift.h"

@implementation BridgingHelper

+ (NSString *)nextComment {
    return XYCommentManger.shared.nextComment;
}

+ (NSString *)nextReportComment {
    return XYCommentManger.shared.nextReportComment;
}

@end

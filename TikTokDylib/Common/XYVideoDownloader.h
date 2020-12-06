//
// XYVideoDownloader.h
// Aweme
//
// Created by xiaoyuan on 2020/5/22.
// Copyright © 2020 enba. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XYVideoDownloader : NSObject
 
@property (nonatomic,strong) NSURLSession *session;
- (void)downloadFileWithUrl:(NSURL *)url completion:(void (^)(BOOL isSuccess))completion;
@end

NS_ASSUME_NONNULL_END

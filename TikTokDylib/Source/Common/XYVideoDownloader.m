//
// XYVideoDownloader.m
// Aweme
//
// Created by xiaoyuan on 2020/5/22.
// Copyright © 2020 enba. All rights reserved.
//

#import "XYVideoDownloader.h"
#import "MBProgressHUD.h"
#import "MBProgressHUD+XYHUD.h"

@interface XYVideoDownloader () <NSURLSessionDownloadDelegate>

@property (nonatomic, strong) MBProgressHUD *hud;
///视频播放和下载用的url
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, copy) void (^completionHandler)(BOOL isSuccess);

@end

@implementation XYVideoDownloader

+ (XYVideoDownloader *)sharedInstance {
    static dispatch_once_t onceToken;
    static XYVideoDownloader * _instance;
    dispatch_once(&onceToken, ^{
        _instance = [XYVideoDownloader new];
    });
    return  _instance;
}

///初始化session
- (NSURLSession *)session {
    if(_session == nil)
    {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
    }
    return _session;
}


///通过url下载
- (void)downloadFileWithUrl:(NSURL *)url completion:(nonnull void (^)(BOOL isSuccess))completion {
    self.url = url;
    self.completionHandler = completion;
    UIWindow *window = UIApplication.sharedApplication.delegate.window;
//        UIViewController *controller = [XYVideoDownloader topViewController];
    _hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    _hud.bezelView.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.65];
    _hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    _hud.label.text = @"准备下载";
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:1.0 timeoutInterval:10.0];

    [[self.session downloadTaskWithRequest:request] resume];
    
}
 
//保存视频完成之后的回调
- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (!error) {
        self.hud.label.text = @"保存到相册成功！";
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.completionHandler) {
                self.completionHandler(YES);
            }
        });
    } else {
        self.hud.label.text = @"保存到相册失败！";
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.completionHandler) {
                self.completionHandler(NO);
            }
        });
    }
    [self.hud hideAnimated:YES afterDelay:.5];
    if (@available(iOS 10.0, *)) {
        UIImpactFeedbackGenerator *feedBackGenertor = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
        [feedBackGenertor impactOccurred];
    }
}

 
-(void)URLSession:(nonnull NSURLSession *)session downloadTask:(nonnull NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    float progress = (float)totalBytesWritten / totalBytesExpectedToWrite;
    long pro = (long)(progress *100);
    dispatch_async(dispatch_get_main_queue(), ^{
       self.hud.label.text = [NSString stringWithFormat:@"下载进度:%ld%%",pro];
    });
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    ///[self.hud setLabelText:[NSString stringWithFormat:@"下载成功"]];
    NSFileManager *fileManger = [NSFileManager defaultManager];
    ///沙盒Documents路径
    NSString *documents = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    //拼接文件绝对路径
    NSString *path = [documents stringByAppendingPathComponent:downloadTask.response.suggestedFilename];
    if (@available(iOS 10.0, *)) {
        //视频存放到这个位置
    } else {
        // Fallback on earlier versions
    }
    [fileManger moveItemAtURL:location toURL:[NSURL fileURLWithPath:path] error:nil];
    dispatch_async(dispatch_get_main_queue(), ^{
        ///保存到相册
        UISaveVideoAtPathToSavedPhotosAlbum(path, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
        self.hud.label.text = @"正在保存到相册！";
    });
}


- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    if (error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.hud.label.text = @"视频下载失败！";
            [self.hud hideAnimated:YES afterDelay:.5];
            if (self.completionHandler) {
                self.completionHandler(NO);
            }
        });
    }
}


+ (UIViewController *)topViewController {
    return [NSClassFromString(@"AWEUIResponder") topViewController];
}
@end

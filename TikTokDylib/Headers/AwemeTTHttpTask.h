//
//  AwemeTTHttpTask.h
//  Aweme
//
//  Created by xiaoyuan on 2021/10/5.
//

#ifndef AwemeTTHttpTask_h
#define AwemeTTHttpTask_h
@class NSString;

typedef id CDUnknownBlockType;

@interface TTHttpTask : NSObject
{
    _Bool _skipSSLCertificateError;
    _Bool _isStreamingTask;
    _Bool _enableHttpCache;
    _Bool _enableCustomizedCookie;
    long long _state;
    double _recvHeaderTimeout;
    double _readDataTimeout;
    double _protectTimeout;
    double _timeoutInterval;
}

@property(nonatomic) _Bool enableCustomizedCookie; // @synthesize enableCustomizedCookie=_enableCustomizedCookie;
@property(nonatomic) _Bool enableHttpCache; // @synthesize enableHttpCache=_enableHttpCache;
@property _Bool isStreamingTask; // @synthesize isStreamingTask=_isStreamingTask;
@property _Bool skipSSLCertificateError; // @synthesize skipSSLCertificateError=_skipSSLCertificateError;
@property double timeoutInterval; // @synthesize timeoutInterval=_timeoutInterval;
@property(nonatomic) double protectTimeout; // @synthesize protectTimeout=_protectTimeout;
@property(nonatomic) double readDataTimeout; // @synthesize readDataTimeout=_readDataTimeout;
@property(nonatomic) double recvHeaderTimeout; // @synthesize recvHeaderTimeout=_recvHeaderTimeout;
@property(readonly) long long state; // @synthesize state=_state;
- (id)request;
- (void)readDataOfMinLength:(unsigned long long)arg1 maxLength:(unsigned long long)arg2 timeout:(double)arg3 completionHandler:(CDUnknownBlockType)arg4;
- (void)setHeaderCallback:(CDUnknownBlockType)arg1;
- (void)setThrottleNetSpeed:(long long)arg1;
- (void)setPriority:(float)arg1;
- (void)resume;
- (void)suspend;
- (void)cancel;

@end

@class NSData, NSString;

@protocol TTFetcherProtocol <NSObject>
- (void)onCancel:(NSString *)arg1;
- (void)onTimeout:(int)arg1 error:(int)arg2 details:(NSString *)arg3 requestLog:(NSString *)arg4;
- (void)onReadResponseData:(NSData *)arg1;
- (void)onURLRedirectReceived:(const struct URLFetcher *)arg1 redirect_info:(const struct RedirectInfo *)arg2 response_info:(const struct HttpResponseInfo *)arg3;
- (void)onResponseStarted:(const struct URLFetcher *)arg1;
- (void)onURLFetchUploadProgress:(const struct URLFetcher *)arg1 current:(long long)arg2 total:(long long)arg3;
- (void)onURLFetchDownloadProgress:(const struct URLFetcher *)arg1 current:(long long)arg2 total:(long long)arg3 current_network_bytes:(long long)arg4;
- (void)onURLFetchComplete:(const struct URLFetcher *)arg1;
@end


@class NSMutableIndexSet, NSObject, NSProgress, NSString, NSURL, TTHttpRequestChromium;
@protocol OS_dispatch_queue;

@interface TTHttpTaskChromium : TTHttpTask //<TTFetcherProtocol>
{
//    struct scoped_refptr<TTFetcherDelegate> fetcher_delegate;
//    _Bool _isFileAppend;
//    _Bool _isCancelled;
//    _Bool _isCompleted;
//    _Bool _isTaskResumed;
//    _Bool _forceRun;
//    float _taskPriority;
//    int _taskType;
//    NSURL *_fileDestinationURL;
//    unsigned long long _uploadFileOffset;
//    unsigned long long _uploadFileLength;
//    struct CronetEnvironment {
//        struct TTNetworkDelegate *;
//        basic_string_c7c33320;
//        basic_string_c7c33320;
//        basic_string_c7c33320;
//        basic_string_c7c33320;
//        _Bool;
//        _Bool;
//        struct unique_ptr<net::ProxyConfigService, std::__1::default_delete<net::ProxyConfigService>>;
//        vector_ebb6ef3e;
//        struct vector<net::ClientCertInfo, std::__1::allocator<net::ClientCertInfo>>;
//        struct TTColdStartListener *;
//        int;
//        double;
//        struct CronetInitTimingInfo;
//        struct unique_ptr<net::NetworkQualityEstimator, std::__1::default_delete<net::NetworkQualityEstimator>>;
//        struct unique_ptr<cronet::CronetEnvironment::NQEHandler, std::__1::default_delete<cronet::CronetEnvironment::NQEHandler>>;
//        _Bool;
//        _Bool;
//        _Bool;
//        basic_string_c7c33320;
//        basic_string_c7c33320;
//        struct unique_ptr<base::DictionaryValue, std::__1::default_delete<base::DictionaryValue>>;
//        basic_string_c7c33320;
//        int;
//        struct vector<std::__1::unique_ptr<cronet::URLRequestContextConfig::Pkp, std::__1::default_delete<cronet::URLRequestContextConfig::Pkp>>, std::__1::allocator<std::__1::unique_ptr<cronet::URLRequestContextConfig::Pkp, std::__1::default_delete<cronet::URLRequestContextConfig::Pkp>>>>;
//        struct list<net::HostPortPair, std::__1::allocator<net::HostPortPair>>;
//        struct unique_ptr<base::Thread, std::__1::default_delete<base::Thread>>;
//        struct unique_ptr<base::Thread, std::__1::default_delete<base::Thread>>;
//        struct scoped_refptr<base::SequencedTaskRunner>;
//        unique_ptr_33e8c17e;
//        struct unique_ptr<net::CookieStore, std::__1::default_delete<net::CookieStore>>;
//        struct unique_ptr<net::URLRequestContext, std::__1::default_delete<net::URLRequestContext>>;
//        struct scoped_refptr<net::URLRequestContextGetter>;
//        basic_string_c7c33320;
//        _Bool;
//        struct unique_ptr<net::NetLog, std::__1::default_delete<net::NetLog>>;
//        struct unique_ptr<net::FileNetLogObserver, std::__1::default_delete<net::FileNetLogObserver>>;
//        _Bool;
//        double;
//        struct unique_ptr<cronet::CronetPrefsManager, std::__1::default_delete<cronet::CronetPrefsManager>>;
//    } *_engine;
    TTHttpRequestChromium *_request;
    unsigned long long _taskId;
    CDUnknownBlockType _callbackBlock;
    CDUnknownBlockType _uploadProgressBlock;
    CDUnknownBlockType _downloadProgressBlock;
    long long _throttleNetBytesPerSecond;
    NSMutableIndexSet *_acceptableStatusCodes;
    NSObject<OS_dispatch_queue> *_dispatch_queue;
    CDUnknownBlockType _streamReadCompleteBlock;
    NSProgress *_uploadProgress;
    NSProgress *_downloadProgress;
    CDUnknownBlockType _headerBlock;
    CDUnknownBlockType _dataBlock;
    CDUnknownBlockType _redirectedBlock;
    NSObject<OS_dispatch_queue> *_downloadProgressCallbackQueue;
}

@property(retain, nonatomic) NSObject<OS_dispatch_queue> *downloadProgressCallbackQueue; // @synthesize downloadProgressCallbackQueue=_downloadProgressCallbackQueue;
@property(copy, nonatomic) CDUnknownBlockType redirectedBlock; // @synthesize redirectedBlock=_redirectedBlock;
@property(copy, nonatomic) CDUnknownBlockType dataBlock; // @synthesize dataBlock=_dataBlock;
@property(copy, nonatomic) CDUnknownBlockType headerBlock; // @synthesize headerBlock=_headerBlock;
@property(retain, nonatomic) NSProgress *downloadProgress; // @synthesize downloadProgress=_downloadProgress;
@property(retain, nonatomic) NSProgress *uploadProgress; // @synthesize uploadProgress=_uploadProgress;
@property(copy, nonatomic) CDUnknownBlockType streamReadCompleteBlock; // @synthesize streamReadCompleteBlock=_streamReadCompleteBlock;
@property(retain, nonatomic) NSObject<OS_dispatch_queue> *dispatch_queue; // @synthesize dispatch_queue=_dispatch_queue;
@property(retain, nonatomic) NSMutableIndexSet *acceptableStatusCodes; // @synthesize acceptableStatusCodes=_acceptableStatusCodes;
@property(nonatomic) _Bool forceRun; // @synthesize forceRun=_forceRun;
@property(nonatomic) int taskType; // @synthesize taskType=_taskType;
@property long long throttleNetBytesPerSecond; // @synthesize throttleNetBytesPerSecond=_throttleNetBytesPerSecond;
@property(nonatomic) _Bool isTaskResumed; // @synthesize isTaskResumed=_isTaskResumed;
@property(nonatomic) _Bool isCompleted; // @synthesize isCompleted=_isCompleted;
@property(nonatomic) _Bool isCancelled; // @synthesize isCancelled=_isCancelled;
@property(nonatomic) float taskPriority; // @synthesize taskPriority=_taskPriority;
@property(copy, nonatomic) CDUnknownBlockType downloadProgressBlock; // @synthesize downloadProgressBlock=_downloadProgressBlock;
@property(copy, nonatomic) CDUnknownBlockType uploadProgressBlock; // @synthesize uploadProgressBlock=_uploadProgressBlock;
@property(copy, nonatomic) CDUnknownBlockType callbackBlock; // @synthesize callbackBlock=_callbackBlock;
@property(nonatomic) unsigned long long taskId; // @synthesize taskId=_taskId;
@property(retain, nonatomic) TTHttpRequestChromium *request; // @synthesize request=_request;
@property(nonatomic) struct CronetEnvironment *engine; // @synthesize engine=_engine;
@property(nonatomic) unsigned long long uploadFileLength; // @synthesize uploadFileLength=_uploadFileLength;
@property(nonatomic) unsigned long long uploadFileOffset; // @synthesize uploadFileOffset=_uploadFileOffset;
@property(nonatomic) _Bool isFileAppend; // @synthesize isFileAppend=_isFileAppend;
@property(retain, nonatomic) NSURL *fileDestinationURL; // @synthesize fileDestinationURL=_fileDestinationURL;
- (void)readDataOfMinLength:(unsigned long long)arg1 maxLength:(unsigned long long)arg2 timeout:(double)arg3 completionHandler:(CDUnknownBlockType)arg4;
- (void)setFetcherPriority_:(struct URLFetcher *)arg1;
- (void)onReadResponseData:(id)arg1;
- (void)onResponseStarted:(const struct URLFetcher *)arg1;
- (void)onCancel:(id)arg1;
- (void)onTimeout:(int)arg1 error:(int)arg2 details:(id)arg3 requestLog:(id)arg4;
- (void)onURLRedirectReceived:(const struct URLFetcher *)arg1 redirect_info:(const struct RedirectInfo *)arg2 response_info:(const struct HttpResponseInfo *)arg3;
- (void)onURLFetchUploadProgress:(const struct URLFetcher *)arg1 current:(long long)arg2 total:(long long)arg3;
- (void)onURLFetchDownloadProgress:(const struct URLFetcher *)arg1 current:(long long)arg2 total:(long long)arg3 current_network_bytes:(long long)arg4;
- (void)onURLFetchComplete:(const struct URLFetcher *)arg1;
- (long long)state;
- (void)setHeaderCallback:(CDUnknownBlockType)arg1;
- (void)setPriority:(float)arg1;
- (void)setThrottleNetSpeed:(long long)arg1;
- (void)resume;
- (void)suspend;
- (void)cancel;
- (void)dealloc;
- (id)initWithRequest:(id)arg1 engine:(struct CronetEnvironment *)arg2 dispatchQueue:(id)arg3 taskId:(unsigned long long)arg4 enableHttpCache:(_Bool)arg5 completedCallback:(CDUnknownBlockType)arg6 uploadProgressCallback:(CDUnknownBlockType)arg7 downloadProgressCallback:(CDUnknownBlockType)arg8;
- (id)initWithRequest:(id)arg1 engine:(struct CronetEnvironment *)arg2 dispatchQueue:(id)arg3 taskId:(unsigned long long)arg4 completedCallback:(CDUnknownBlockType)arg5 uploadProgressCallback:(CDUnknownBlockType)arg6 downloadProgressCallback:(CDUnknownBlockType)arg7;
- (id)initWithRequest:(id)arg1 engine:(struct CronetEnvironment *)arg2 dispatchQueue:(id)arg3 taskId:(unsigned long long)arg4 completedCallback:(CDUnknownBlockType)arg5;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end



#endif /* AwemeTTHttpTask_h */

//
//  DownloadOperation.m
//  ConcurrentTest
//
//  Created by caiyao's Mac on 2017/4/27.
//  Copyright © 2017年 core's Mac. All rights reserved.
//

#import "DownloadOperation.h"

typedef NS_ENUM(NSUInteger, OperationStatus)
{
    OperationStatusNone,
    OperationStatusExecuting,
    OperationStatusFinished
};

@interface DownloadOperation ()

@property(nonatomic, assign)OperationStatus status;

@end

@implementation DownloadOperation

-(instancetype)init
{
    if ([super init])
    {
        _URL = nil;
        _status = OperationStatusNone;
    }
    return self;
}

-(BOOL)isAsynchronous
{
    return YES;
}

-(BOOL)isExecuting
{
    return self.status == OperationStatusExecuting;
}

-(BOOL)isFinished
{
    return self.status == OperationStatusFinished;
}

-(void)start
{
    if (self.cancelled || self.finished)
    {
        return;
    }
    
    if (self.isReady)
    {
        [self main];
    }
}

-(void)main
{
    [self willChangeValueForKey:NSStringFromSelector(@selector(isExecuting))];
    self.status = OperationStatusExecuting;
    [self didChangeValueForKey:NSStringFromSelector(@selector(isExecuting))];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.URL] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:60];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"Task %@ finished\nresult: %@", self.name, [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        //NSLog(@"Task %@ finished", self.name);
        [self willChangeValueForKey:NSStringFromSelector(@selector(isFinished))];
        self.status = OperationStatusFinished;
        [self didChangeValueForKey:NSStringFromSelector(@selector(isFinished))];
    }];
    [task resume];
}
@end

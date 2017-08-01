//
//  OperationManager.m
//  ConcurrentTest
//
//  Created by caiyao's Mac on 2017/5/11.
//  Copyright © 2017年 core's Mac. All rights reserved.
//

#import "OperationManager.h"
#import "DownloadOperation.h"

@interface OperationManager ()

@property (nonatomic, strong) NSOperationQueue *operationQueue;

@end

@implementation OperationManager

-(NSOperationQueue *)operationQueue
{
    if (!_operationQueue)
    {
        _operationQueue = [[NSOperationQueue alloc] init];
    }
    return _operationQueue;
}

-(void)downloadFrom:(NSArray *)URLs progress:(Progress)progress
{
    __block CGFloat progressValue = 0;
    NSMutableArray *operations = [NSMutableArray arrayWithCapacity:1];
    for (NSInteger i = 0; i < URLs.count; i ++)
    {
        DownloadOperation *op = [[DownloadOperation alloc] init];
        op.URL = URLs[i];
        op.name = [NSString stringWithFormat:@"%ld", i + 1];
        [op setCompletionBlock:^{
            progressValue += 1.0/URLs.count;
            if (progress)
            {
                progress(progressValue);
            }
        }];
        [operations addObject:op];
        
        if (i > 0)
        {
            DownloadOperation *lastOp = (DownloadOperation *)operations[i - 1];
            [op addDependency:lastOp];
        }
    }
    [self.operationQueue addOperations:operations waitUntilFinished:NO];
}

@end

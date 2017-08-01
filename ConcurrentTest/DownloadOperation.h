//
//  DownloadOperation.h
//  ConcurrentTest
//
//  Created by caiyao's Mac on 2017/4/27.
//  Copyright © 2017年 core's Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DownloadOperation : NSOperation

@property (nonatomic, strong) NSString *URL;

@end

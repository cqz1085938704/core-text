//
//  OperationManager.h
//  ConcurrentTest
//
//  Created by caiyao's Mac on 2017/5/11.
//  Copyright © 2017年 core's Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef void(^Progress)(CGFloat progress);

@interface OperationManager : NSObject

-(void)downloadFrom:(NSArray *)URLs progress:(Progress)progress;

@end

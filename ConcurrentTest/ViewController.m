//
//  ViewController.m
//  ConcurrentTest
//
//  Created by caiyao's Mac on 2017/4/27.
//  Copyright © 2017年 core's Mac. All rights reserved.
//

#import "ViewController.h"
#import "OperationManager.h"
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSMutableArray *urls = [NSMutableArray arrayWithCapacity:10];
//    for (int i = 0; i < 10; i ++)
//    {
//        [urls addObject:@"https://www.hkgv2ls0401-hk.security.p2g.netd2.hsbc.com.hk/gsp_ap_brt4/mobileclientpack/mobileci_prd/PRD_WD/sitc/prd_mobile_pro_sit_i.txt"];
//    }
//    
//    OperationManager *manager = [[OperationManager alloc] init];
//    [manager downloadFrom:urls progress:^(CGFloat progress) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.progressView.progress = progress;
//        });
//    }];
    
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    
    CTCarrier *carrier = [info subscriberCellularProvider];
    
    NSString *mcc = [carrier mobileCountryCode];
    NSString *mnc = [carrier mobileNetworkCode];
    
    NSString *imsi = [NSString stringWithFormat:@"%@%@", mcc, mnc];
    NSLog(@"");
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

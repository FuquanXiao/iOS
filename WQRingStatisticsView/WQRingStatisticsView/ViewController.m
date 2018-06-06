//
//  ViewController.m
//  WQRingStatisticsView
//
//  Created by hxlc on 2018/6/4.
//  Copyright © 2018年 hxlc. All rights reserved.
//

#import "ViewController.h"
//环形统计图
#import "WQRingStatisticsView.h"

#import "WQPieView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    WQRingStatisticsView *ring = [[WQRingStatisticsView alloc] initWithFrame:CGRectMake(20, 60, 300, 300) andDataArray:@[@20,@30,@40,@10,@50,@50]];
    
    WQPieView *pie = [[WQPieView alloc] initWithFrame:CGRectMake(20, 60, 300, 300)];
    [pie showCustomViewInSuperView:self.view];
    
}




@end

//
//  ViewController.m
//  WQCircleProgress
//
//  Created by xfq on 2018/5/30.
//  Copyright © 2018年 xfq. All rights reserved.
//

#import "ViewController.h"
#import "WQCircleProgress.h"
#import "Masonry.h"
@interface ViewController ()
{
    WQCircleProgress *progress;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    progress =[[WQCircleProgress alloc] initWithFrame:CGRectZero];
    
    [self.view addSubview:progress];
   
    [progress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.height.width.mas_equalTo(300);
    }];
    NSLog(@"====%@",NSStringFromCGRect(progress.frame));
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
   
  
    
//    progress.frame = CGRectMake(30, 30, 400, 400);
//    [progress setNeedsDisplay];
     progress.progress = 100;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

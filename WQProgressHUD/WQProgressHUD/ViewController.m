//
//  ViewController.m
//  WQProgressHUD
//
//  Created by xfq on 2018/5/10.
//  Copyright © 2018年 xfq. All rights reserved.
//

#import "ViewController.h"
#import "CustomImageView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CustomImageView *hud = [[CustomImageView alloc] initWithFrame:CGRectMake(60, 100, 100, 100)];
    hud.image = [UIImage imageNamed:@"1461298347288183414"];
    
    [self.view addSubview:hud];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

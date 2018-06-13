//
//  ViewController.m
//  WQProgressHHD
//
//  Created by xfq on 2018/6/13.
//  Copyright © 2018年 xfq. All rights reserved.
//

#import "ViewController.h"
#import "WQProgressHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    WQProgressHUD *hud = [WQProgressHUD showHUDAddedTo:self.view animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

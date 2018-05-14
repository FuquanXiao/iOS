//
//  ShareOrderListController.m
//  XunBuy
//
//  Created by wujianming on 16/1/6.
//  Copyright © 2016年 kimee. All rights reserved.
//  晒单控制器

#import "ShareOrderListController.h"

@interface ShareOrderListController ()

@end

@implementation ShareOrderListController

#pragma mark - life cycle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - private methods

- (void)setupController
{
    [super setupController];
    self.navigationItem.title = @"晒单分享";
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com
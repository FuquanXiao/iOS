//
//  ViewController.m
//  WQAutoScrollLabel
//
//  Created by xfq on 2018/5/19.
//  Copyright © 2018年 xfq. All rights reserved.
//

#import "ViewController.h"
#import "WQAutoScrollView.h"
#import "AViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    [self.view addSubview:label];
    label.text = @"如题需求，试过增加渐变layer层，和添加阴影效果，但都是把原来的视图遮住了，效果都不理想。看文档中发现CALayer中有这样一个属性：";
    CAGradientLayer *_gradLayer = [CAGradientLayer layer];
    NSArray *colors = [NSArray arrayWithObjects:
                       (id)[[UIColor colorWithWhite:0 alpha:0] CGColor],
                       (id)[[UIColor colorWithWhite:0 alpha:0.5] CGColor],
                       (id)[[UIColor colorWithWhite:0 alpha:1] CGColor],
                       nil];
    [_gradLayer setColors:colors];
    //渐变起止点，point表示向量
    [_gradLayer setStartPoint:CGPointMake(1.0f, 0.0f)];
    [_gradLayer setEndPoint:CGPointMake(0.0f, 0.0f)];
    
    [_gradLayer setFrame:label.bounds];
    
    [label.layer setMask:_gradLayer];

    
    
    WQAutoScrollView * s = [[WQAutoScrollView alloc] initWithFrame:CGRectMake(20, 100, 300, 50)];
    [self.view addSubview:s];
//    s.text = @"火钱理财零钱罐临时下架，望周知！";
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    AViewController *a = [AViewController new];
    [self presentViewController:a animated:YES completion:nil];
    
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if ([self isCurrentViewControllerVisible:self]) {
        NSLog(@"%@",@"我是正在现实的界面");
        return;
    }
    NSLog(@"%@",@"我是bu正在现实的界面");
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    if ([self isCurrentViewControllerVisible:self]) {
        NSLog(@"%@",@"我是正在现实的界面");
        return;
    }
     NSLog(@"%@",@"我是bu正在现实的界面");
}
-(BOOL)isCurrentViewControllerVisible:(UIViewController *)viewController{
    return (viewController.isViewLoaded && viewController.view.window && [UIApplication sharedApplication].applicationState == UIApplicationStateActive);
    //    if (_sourceViewController.isViewLoaded && _sourceViewController.view.window) {
    //        NSLog(@"屏幕上");
    //
    //        isCurrentVC = YES;
    //
    //    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

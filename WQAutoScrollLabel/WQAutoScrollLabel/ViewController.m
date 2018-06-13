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
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 69, 60)];


    label1.text = @"爱情都是骗人的"; [self.view addSubview:label1];
    [label1 sizeToFit];
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 69, 60)];
    
    
    label.text = @"爱情都是骗人的"; [self.view addSubview:label];
    [label sizeToFit];
//

    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"transform.rotation";

    anim.values = @[@(-5/180.0*M_PI), @(5/180.0*M_PI), @(-5/180.0*M_PI)];
    anim.duration = 0.25;

    // 动画次数设置为最大
    anim.repeatCount = MAXFLOAT;
    // 保持动画执行完毕后的状态
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;

    [label1.layer addAnimation:anim forKey:@"shake"];
    
    
    
    [UIView beginAnimations:@"aaaa" context:nil];
    [UIView setAnimationRepeatCount:MAXFLOAT];
    
     label.transform = CGAffineTransformMakeRotation( 5/180.0*M_PI);
     label.transform = CGAffineTransformMakeRotation( -5/180.0*M_PI);
      label.transform = CGAffineTransformMakeRotation( 5/180.0*M_PI);
    [UIView setAnimationDuration:0.25];
    [UIView commitAnimations];
  
    

//    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionRepeat animations:^{
//         label.transform = CGAffineTransformMakeRotation( 5/180.0*M_PI);
//    } completion:^(BOOL finished) {
//        label.transform = CGAffineTransformMakeRotation( -5/180.0*M_PI);
//
//    }];
    
   
    
    
    
    //    label.text = @"如题需求，试过增加渐变layer层，和添加阴影效果，但都是把原来的视图遮住了，效果都不理想。看文档中发现CALayer中有这样一个属性：";
    //    CAGradientLayer *_gradLayer = [CAGradientLayer layer];
    //    NSArray *colors = [NSArray arrayWithObjects:
    //                       (id)[[UIColor colorWithWhite:0 alpha:0] CGColor],
    //                       (id)[[UIColor colorWithWhite:0 alpha:0.5] CGColor],
    //                       (id)[[UIColor colorWithWhite:0 alpha:1] CGColor],
    //                       nil];
    //    [_gradLayer setColors:colors];
    //    //渐变起止点，point表示向量
    //    [_gradLayer setStartPoint:CGPointMake(1.0f, 0.0f)];
    //    [_gradLayer setEndPoint:CGPointMake(0.0f, 0.0f)];
    //
    //    [_gradLayer setFrame:label.bounds];
    //
    //    [label.layer setMask:_gradLayer];
    
    
    
    WQAutoScrollView * s = [[WQAutoScrollView alloc] initWithFrame:CGRectMake(20, 300, 400, 50)];
    //    s.rows = 2;
    s.text = @"火钱理财零钱罐临时下架，望周知!运行时系统火钱理财零钱罐临时下架，望周知!运行时系统火钱理财零钱罐临时下架，望周知!运行时系统";
    
    [s startScroll];
    [self.view addSubview:s];
    
    
    //    WQScrollTextView *broadcastLabel = [[WQScrollTextView alloc] initWithFrame:CGRectMake(20, 100, 300, 50)];
    //    broadcastLabel.textDataArr = @[@"火钱理财零钱罐临时下架，望周知！"];
    //
    //    [broadcastLabel startScrollBottomToTopWithNoSpace];
    //    [self.view addSubview:broadcastLabel];
    
    
    
    
    
    
    
    
    
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

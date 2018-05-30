//
//  WQCircleProgress.m
//  WQCircleProgress
//
//  Created by xfq on 2018/5/30.
//  Copyright © 2018年 xfq. All rights reserved.
//

#import "WQCircleProgress.h"
#import "WQCircleProgress.h"
#define degreesToRadians(x) (M_PI*(x)/180.0)

@interface WQCircleProgress()

@property (nonatomic,strong)CAShapeLayer *trackLayer;

@property (nonatomic,strong)CAShapeLayer *progressLayer;
@property (nonatomic,strong)UILabel *label;
@end

@implementation WQCircleProgress

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        NSLog(@"%@",NSStringFromCGRect(frame));
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setProgress:(float)progress{
    _progress = progress;
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _progressLayer.strokeEnd = 0.5;
        
    });
//   NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(changeTimeAtTimedisplay)
//                                           userInfo:nil repeats:YES];
//
//    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
//    [timer fire];
    
}

-(void)changeTimeAtTimedisplay
{
    _progressLayer.strokeEnd = 0.5;
    
    
}
- (void)drawRect:(CGRect)rect {
    /*
     
     两个layer通用一个path
     改变第二个layer的strokeend strokestart默认是从零开始的，而开始的位置与startAngle:-M_PI对应
     利用添加view
     */
    

    _trackLayer  = [CAShapeLayer layer];
    _trackLayer.frame = rect;

    UIBezierPath *tracePath = [UIBezierPath bezierPath];

    [tracePath addArcWithCenter:CGPointMake(rect.size.width/2.0, rect.size.height/2.0) radius:rect.size.width/2.0 startAngle:-M_PI endAngle:M_PI clockwise:YES];
    _trackLayer.path = [tracePath CGPath];
    _trackLayer.lineWidth = 2;
    _trackLayer.fillColor = [UIColor clearColor].CGColor;
    [_trackLayer setStrokeColor:[UIColor grayColor].CGColor];
    [self.layer addSublayer:_trackLayer];
    
    
    _progressLayer = [CAShapeLayer layer];
    _progressLayer.frame = rect;
    _progressLayer.strokeStart = 0.f;
    _progressLayer.strokeEnd = 0.1;
    _progressLayer.fillColor = [UIColor clearColor].CGColor;
    _progressLayer.path = [tracePath CGPath];
    _progressLayer.lineWidth = 2;
    [_progressLayer setStrokeColor:[UIColor redColor].CGColor];
    [self.layer addSublayer:_progressLayer];

    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 200, 30)];
    [self addSubview:_label];
    _label.text = @"100万";
    
    
}


@end

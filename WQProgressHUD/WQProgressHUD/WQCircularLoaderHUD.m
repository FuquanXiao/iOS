//
//  WQCircularLoaderHUD.m
//  WQProgressHUD
//
//  Created by xfq on 2018/5/10.
//  Copyright © 2018年 xfq. All rights reserved.
//

#import "WQCircularLoaderHUD.h"
@interface WQCircularLoaderHUD()

@property (nonatomic,strong)CAShapeLayer *circlePathLayer;
/**
  
  */
@property (nonatomic,assign) CGFloat circleRadius;

@property (nonatomic,strong)UIBezierPath *bezierPath;
@end

@implementation WQCircularLoaderHUD

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self configure];
    }
    return self;
}

- (void)configure{
    _circlePathLayer = [CAShapeLayer layer];
    _circlePathLayer.lineWidth = 2;
    _circlePathLayer.fillColor = [UIColor clearColor].CGColor;
    _circlePathLayer.strokeColor = [UIColor redColor].CGColor;
    [self.layer addSublayer:_circlePathLayer];
    
    //创建圆角矩形 
    _bezierPath = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    
}

- (void)setProgress:(CGFloat)progress{
    
    if (progress > 1.0) {
        _circlePathLayer.strokeEnd = 1;
    }
    else if (progress < 0){
        _circlePathLayer.strokeEnd = 0;
    }else{
        _circlePathLayer.strokeEnd = progress;
    }
    
}

- (void)revea{
    self.backgroundColor = [UIColor whiteColor];
    self.progress = 1;
    [_circlePathLayer removeAnimationForKey:@"strokeEnd"];
    [_circlePathLayer removeFromSuperlayer];
    
    self.layer.mask = _circlePathLayer;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    _circlePathLayer.frame = self.bounds;
    _circlePathLayer.path = [_bezierPath CGPath];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

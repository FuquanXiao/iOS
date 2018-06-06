//
//  WQRingStatisticsView.m
//  WQRingStatisticsView
//
//  Created by hxlc on 2018/6/4.
//  Copyright © 2018年 hxlc. All rights reserved.
//
//环形统计图
#import "WQRingStatisticsView.h"

#import "WQCanClickShapeLayer.h"
#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]

#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))


#define AngleRadian(angle) M_PI / 180.0 * angle
@interface WQRingStatisticsView()
{
    CGFloat startAngle;
    CGFloat endAngle;
    
    NSMutableArray *layerArray;
    NSMutableArray *layerPathArray;
    
    //半径
    CGFloat pieR;
    
}
@end


@implementation WQRingStatisticsView

- (instancetype)initWithFrame:(CGRect)frame andDataArray:(NSArray *)dataArray{
    
    if (self = [super initWithFrame:frame]) {
        self.dataArray = dataArray;
        self.backgroundColor = [UIColor cyanColor];
        
        [self configInit];
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor cyanColor];
        [self configInit];
        
    }
    return self;
}

- (void)configInit{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandle:)];
    [self addGestureRecognizer:tap];
  
}
- (void)tapHandle:(UITapGestureRecognizer *)gesture{
    CGPoint point = [gesture locationInView:self];
    
    
}
- (void)setDataArray:(NSArray *)dataArray{
    
    _dataArray = dataArray;
    layerArray = [[NSMutableArray alloc] init];
    layerPathArray = [[NSMutableArray alloc] init];
   
    for (WQCanClickShapeLayer *layer in self.layer.sublayers) {
        [layer removeFromSuperlayer];
    }
    

    
    
    
    for (int i = 0; i <= dataArray.count; i++) {
        WQCanClickShapeLayer *shapLayer = [WQCanClickShapeLayer layer];
        shapLayer.frame = self.bounds;
        
        
        NSNumber *startNu = [self getEndAngle][i];
        NSNumber *endNu = [self getEndAngle][i+1];
        shapLayer.strokeStart = [startNu floatValue];
        shapLayer.strokeEnd = [endNu floatValue];
        
        
        
        
         UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0) radius:50 startAngle:[startNu floatValue] endAngle:[endNu floatValue] clockwise:NO];
        [bezierPath addArcWithCenter:CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0) radius:50 startAngle:[startNu floatValue] endAngle:[endNu floatValue] clockwise:YES];
        
        shapLayer.lineWidth = self.frame.size.width/2.0;
        shapLayer.fillColor = [UIColor clearColor].CGColor;
        shapLayer.strokeColor = randomColor.CGColor;
        shapLayer.path = bezierPath.CGPath;
        
      
        
        shapLayer.centerPoint = CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0);
        shapLayer.startAngle = [startNu floatValue];
        shapLayer.endAngle = [endNu floatValue];
        shapLayer.radius = 50.0f;
        
        
        
        shapLayer.lineWidth = 20;
        [self.layer addSublayer:shapLayer];
        
        
        CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        
     
        
        basic.fromValue = @([startNu floatValue]);
        basic.toValue = @([endNu floatValue]);
    
        basic.duration = 0.5;
        basic.fillMode = kCAFillModeForwards;
       [shapLayer addAnimation:basic forKey:@"basic"];
        [layerArray addObject:shapLayer];
        [layerPathArray addObject:bezierPath];

        


        
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint touchPoint = [[touches anyObject] locationInView:self];
    
    
    for (WQCanClickShapeLayer *shapeaaLayer in layerArray) {
        if (CGPathContainsPoint(shapeaaLayer.path, 0, touchPoint, YES)) {
            //修改选中状态
            if (shapeaaLayer.selected) {
                
                shapeaaLayer.selected = NO;
            }else{
                shapeaaLayer.selected = YES;
            }
        }
        else {
            
            shapeaaLayer.selected = NO;
        }
    }
}



- (NSArray *)getEndAngle{
    CGFloat totalFee = 0;
    for (NSNumber *persFee in self.dataArray) {
        
        totalFee += [persFee floatValue];
    }
    
    NSMutableArray *feeArray = [@[] mutableCopy];
    [feeArray addObject:@(0)];
    CGFloat perFee = 0.0;
    for (NSNumber *persFee in self.dataArray) {
        
        perFee = perFee +[persFee floatValue]*1.0 / totalFee;
        [feeArray addObject:@(perFee)];
    }
    [feeArray addObject:@(1)];
    return feeArray;
    
}

@end

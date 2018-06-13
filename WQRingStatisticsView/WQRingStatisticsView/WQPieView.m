//
//  WQPieView.m
//  WQRingStatisticsView
//
//  Created by hxlc on 2018/6/5.
//  Copyright © 2018年 hxlc. All rights reserved.
//
#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]

#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))


#define AngleRadian(angle) M_PI / 180.0 * angle
#import "WQPieView.h"

#import "WQCanClickShapeLayer.h"
@interface  WQPieView()
{
    //饼状图 array
    NSMutableArray *pieShapeLayerArray;
    
    //圆心
    CGPoint pieCenter ;
    
//    模拟数据
    NSArray *dataArray;
    
    
    NSMutableArray *coverPathArray;
    
    //各个部分的coverLayer
    NSMutableArray *segmentCoverLayerArray;
}
@property (nonatomic,strong)UILabel *centeerTextLabel;
@end



@implementation WQPieView
@synthesize pieR,innerWhiteRadius;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configInit];
    }
    return self;
}

- (void)configInit{
    pieShapeLayerArray = [[NSMutableArray alloc] init];
    dataArray = @[@20,@30,@40,@10,@50,@50];
    coverPathArray = [[NSMutableArray alloc] init];
    segmentCoverLayerArray = [[NSMutableArray alloc] init];
    _needAnimation = NO;
    _shouldClick = NO;
     pieR =   75;
    _clickOffset = 15;
    _pieShowDuiration = 0.35;
    innerWhiteRadius = 55;
}




- (void)showCustomViewInSuperView:(UIView *)superView{
    
    [superView addSubview:self];
    
    [self loadCustomPieView];
    [self addSubview:self.centeerTextLabel];
    
}


- (void)loadCustomPieView{
    
    pieCenter = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    //    设置点击之后偏移的默认值；
    CGFloat offset = _clickOffset;
    
    CGFloat currentRadian = 0;
    
    
    for (int i = 0; i<dataArray.count; i++) {

        //根据当前数值的占比，计算得到当前的弧度
        CGFloat radian = [self loadPercentRadianWithCurrent:[dataArray[i] floatValue]];
        
        //弧度结束值 初始值＋当前弧度
        CGFloat endAngle = currentRadian+radian;
        
        
        UIBezierPath *bezierpath = [UIBezierPath bezierPath];
        
        [bezierpath moveToPoint:pieCenter];
        [bezierpath addArcWithCenter:pieCenter radius:pieR startAngle:currentRadian endAngle:endAngle clockwise:YES];
        
        [bezierpath addArcWithCenter:pieCenter radius:innerWhiteRadius startAngle:endAngle endAngle:currentRadian clockwise:NO];
        
        [bezierpath addLineToPoint:pieCenter];
        [bezierpath closePath];
        
        UIBezierPath *coverPath = [UIBezierPath bezierPathWithArcCenter:pieCenter radius:pieR/2.0 + offset startAngle:currentRadian endAngle:endAngle  clockwise:YES];
        [coverPathArray addObject:coverPath];
        
    
        
        WQCanClickShapeLayer *radiusLayer = [WQCanClickShapeLayer layer];
        radiusLayer.centerPoint = pieCenter;
        radiusLayer.startAngle = currentRadian;
        radiusLayer.endAngle = endAngle;
        radiusLayer.radius = pieR;
        radiusLayer.innerRadius = innerWhiteRadius;
        radiusLayer.path = bezierpath.CGPath;
        
        radiusLayer.fillColor = randomColor.CGColor;
        currentRadian = endAngle;
        [pieShapeLayerArray addObject:radiusLayer];
        [self.layer addSublayer:radiusLayer];
        
    }
    
    
    
    
//     设置蒙版；
    
    
    for (int i = 0; i<coverPathArray.count; i++) {
        
        CAShapeLayer *coverMaskLayer = [CAShapeLayer layer];
        coverMaskLayer.lineWidth = pieR + offset *2;
        coverMaskLayer.strokeStart = 0;
        coverMaskLayer.strokeEnd = 0;
        coverMaskLayer.strokeColor = [UIColor blackColor].CGColor;
        coverMaskLayer.fillColor = [UIColor clearColor].CGColor;
        UIBezierPath *path = coverPathArray[i];
        WQCanClickShapeLayer *bgLayer =  pieShapeLayerArray[i];
        [segmentCoverLayerArray addObject:coverMaskLayer];
        coverMaskLayer.path = path.CGPath;
        [bgLayer setMask:coverMaskLayer];
    }
   
    [self dotAnimation];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (!_shouldClick) {
        return ;
    }
    CGPoint touchPoint = [[touches anyObject] locationInView:self];
    for (WQCanClickShapeLayer *shapeLayer in pieShapeLayerArray) {
        
        //判断选择区域
      
        
        if (CGPathContainsPoint(shapeLayer.path, 0, touchPoint, YES)) {
            
            //修改选中状态
            if (shapeLayer.selected) {
                
                shapeLayer.selected = NO;
            }else{
                shapeLayer.selected = YES;
                
            }
            
        } else {
            
            shapeLayer.selected = NO;
        }
    }
}


- (CGFloat)loadPercentRadianWithCurrent:(CGFloat)current
{
    CGFloat totalFee = 0;
    for (NSNumber *persFee in dataArray) {
        
        totalFee += [persFee floatValue];
    }
    CGFloat percent = current*1.0/totalFee;
    
    return percent*M_PI*2;
}

- (void)dotAnimation{
    
    for (CAShapeLayer *smallLayer in segmentCoverLayerArray) {
        if (_needAnimation) {
            CABasicAnimation *strokeAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            strokeAnimation.fromValue = @(0);
            strokeAnimation.duration = _pieShowDuiration;
            strokeAnimation.toValue = @(1);
            strokeAnimation.autoreverses = NO; //有无自动恢复效果
            strokeAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            strokeAnimation.removedOnCompletion = YES;
            
            [smallLayer addAnimation:strokeAnimation forKey:@"strokeEndAnimation"];
        }
        
        smallLayer.strokeEnd = 1;
    }
   
   
    
}

- (void)setCenterText:(NSString *)centerText{
    _centerText = centerText;
    
}

- (UILabel *)centeerTextLabel{
    if (!_centeerTextLabel) {
        _centeerTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, innerWhiteRadius*2 - 20, 50)];
        _centeerTextLabel.center = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0);
        _centeerTextLabel.numberOfLines = 0;
        _centeerTextLabel.textAlignment = NSTextAlignmentCenter;
        _centeerTextLabel.text = @"总资产(元)\n110,032.00";
    }
    return _centeerTextLabel;
}
@end

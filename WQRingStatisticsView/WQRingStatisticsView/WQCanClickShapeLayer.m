//
//  WQCanClickShapeLayer.m
//  WQRingStatisticsView
//
//  Created by hxlc on 2018/6/4.
//  Copyright © 2018年 hxlc. All rights reserved.
//

#import "WQCanClickShapeLayer.h"

@implementation WQCanClickShapeLayer
- (void)setSelected:(BOOL)selected{
    _selected = selected;
    CGFloat offset = 15;
    CGPoint newCenterPoint =_centerPoint;
    if (selected) {
        
        //center 往外围移动一点 使用cosf跟sinf函数
        newCenterPoint = CGPointMake(_centerPoint.x + cosf((_startAngle + _endAngle) / 2) * offset, _centerPoint.y + sinf((_startAngle + _endAngle) / 2) * offset);
    }
    //创建一个path
    UIBezierPath *path = [UIBezierPath bezierPath];
    //起始中心点改一下
    [path moveToPoint:newCenterPoint];
    [path addArcWithCenter:newCenterPoint radius:_radius startAngle:_startAngle endAngle:_endAngle clockwise:YES];
    [path addArcWithCenter:newCenterPoint radius:_innerRadius startAngle:_endAngle endAngle:_startAngle clockwise:NO];
    [path closePath];
    self.path = path.CGPath;
    
    //添加动画
    CABasicAnimation *animation = [CABasicAnimation animation];
    //keyPath内容是对象的哪个属性需要动画
    animation.keyPath = @"path";
    //所改变属性的结束时的值
    animation.toValue = path;
    //动画时长
    animation.duration = 0.35;
    //添加动画
    [self addAnimation:animation forKey:nil];
    
   
}
@end

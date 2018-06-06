//
//  WQCanClickShapeLayer.h
//  WQRingStatisticsView
//
//  Created by hxlc on 2018/6/4.
//  Copyright © 2018年 hxlc. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
@interface WQCanClickShapeLayer : CAShapeLayer



/**
 *  起始弧度
 **/
@property (nonatomic,assign) CGFloat startAngle;

/**
 *  结束弧度
 **/
@property (nonatomic,assign) CGFloat endAngle;

/**
 *  圆饼半径
 **/
@property (nonatomic,assign) CGFloat radius;

/**
 *  点击偏移量
 **/
@property (nonatomic,assign) CGFloat clickOffset;

/**
 *  是否点击
 **/
@property (nonatomic,assign) BOOL selected;


/**
 *  圆饼layer的圆心
 **/
@property (nonatomic,assign) CGPoint centerPoint;

/**
 *  内圆半径
 **/
@property (nonatomic,assign) CGFloat innerRadius;

/**
 *  内圆颜色
 **/
@property (nonatomic,strong) UIColor *innerColor;
@end

//
//  WQPieView.h
//  WQRingStatisticsView
//
//  Created by hxlc on 2018/6/5.
//  Copyright © 2018年 hxlc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WQPieView : UIView
/**
 是否支持点击事件选中；
 */
@property (nonatomic,assign)BOOL shouldClick;

/**
 是否显示动画；
 */
@property (nonatomic,assign)BOOL needAnimation;



/**
 外环半径；
 */
@property (nonatomic,assign)CGFloat pieR;
/**
 内环半径；
 */
@property (nonatomic,assign)CGFloat innerWhiteRadius ;

/**
 出现圆环时的时间；   待完善；
 */
@property (nonatomic,assign)NSTimeInterval pieShowDuiration ;

/**
 点击圆环时的偏移量；  待完善；
 */
@property (nonatomic,assign)CGFloat clickOffset ;


@property (nonatomic,strong)NSString *centerText;


- (void)showCustomViewInSuperView:(UIView *)superView;
@end

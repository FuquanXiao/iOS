//
//  WQRingStatisticsView.h
//  WQRingStatisticsView
//
//  Created by hxlc on 2018/6/4.
//  Copyright © 2018年 hxlc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WQRingStatisticsView : UIView

@property (nonatomic,copy)NSArray *dataArray;
- (instancetype)initWithFrame:(CGRect)frame andDataArray:(NSArray *)dataArray ;
@end

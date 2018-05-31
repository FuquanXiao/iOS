//
//  WQAutoScrollView.h
//  WQAutoScrollLabel
//
//  Created by xfq on 2018/5/19.
//  Copyright © 2018年 xfq. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WQAutoScrollView : UIView



//每s移动的点数；（x距离）
@property (nonatomic,assign)CGFloat scrollSpeed;

@property (nonatomic,assign)CGFloat labelGap;

@property (nonatomic, copy, nullable) NSString * text;

- (void)startScroll;


@end

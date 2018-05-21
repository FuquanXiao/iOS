//
//  WQAutoScrollView.h
//  WQAutoScrollLabel
//
//  Created by xfq on 2018/5/19.
//  Copyright © 2018年 xfq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,ScrollOrientation){
    ScrollOrientationFromBottomToTop,
    ScrollOrientationFromTopToBottom,
    ScrollOrientationFromRightToLeft,
    ScrollOrientationFromLeftToRight,
};

@interface WQAutoScrollView : UIView



//每s移动的点数；（x距离）
@property (nonatomic,assign)CGFloat scrollSpeed;

@property (nonatomic,assign)CGFloat labelGap;

@property (nonatomic, copy, nullable) NSString * text;

//@property (nonatomic,assign)ScrollOrientation scrollDirection;


/**
 Scroll the number of rows at a time
 */
//@property (nonatomic,assign)NSInteger rows;
- (void)startScroll;
//- (void)stopScroll;

@end

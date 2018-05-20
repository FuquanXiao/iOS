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




@property (nonatomic,assign)CGFloat scrollSpeed;

@property (nonatomic, copy, nullable) NSArray * dataArray;

@property (nonatomic,assign)ScrollOrientation scrollDirection;


/**
 Scroll the number of rows at a time
 */
@property (nonatomic,assign)NSInteger rows;
- (void)startScroll;
- (void)stopScroll;

@end

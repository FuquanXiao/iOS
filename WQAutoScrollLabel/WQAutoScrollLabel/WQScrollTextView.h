//
//  WQScrollTextView.h
//  WQ
//
//  Created by WQ on 15/5/4.
//  Copyright (c) 2015年 iOS开发者公会. All rights reserved.
//


#import <UIKit/UIKit.h>
@class WQScrollTextView;

@protocol WQScrollTextViewDelegate <NSObject>

@optional
- (void)scrollTextView2:(WQScrollTextView *)scrollTextView currentTextIndex:(NSInteger)index;
- (void)scrollTextView2:(WQScrollTextView *)scrollTextView clickIndex:(NSInteger)index content:(NSString *)content;

@end

@interface WQScrollTextView : UIView

@property (nonatomic,assign) id <WQScrollTextViewDelegate>delegate;

// textDataArr 支持 NSString 和 NSAttributedString类型
// "textDataArr" support <NSString *> and <NSAttributedString *>
@property (nonatomic,copy)   NSArray * textDataArr;


// 文字停留时间，默认为3s。
// Text stay time，default is 3 seconds.
@property (nonatomic,assign) CGFloat textStayTime;

// 文字滚动动画时间，默认为1s。
// Text scrolling animation time，default is 1 seconds.
@property (nonatomic,assign) CGFloat scrollAnimationTime;


@property (nonatomic,copy)   UIFont  * textFont;
@property (nonatomic,copy)   UIColor * textColor;
@property (nonatomic)        NSTextAlignment textAlignment;

@property (nonatomic,assign) BOOL touchEnable; // defualt is YES

- (void)startScrollBottomToTopWithSpace;
- (void)startScrollTopToBottomWithSpace;

- (void)startScrollBottomToTopWithNoSpace;
- (void)startScrollTopToBottomWithNoSpace;

- (void)stop;
- (void)stopToEmpty;

@end

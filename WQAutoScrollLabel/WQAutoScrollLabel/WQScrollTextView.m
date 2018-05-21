//
//  WQScrollTextView.m
//  LMJScrollText
//
//  Created by MajorLi on 15/5/4.
//  Copyright (c) 2015年 iOS开发者公会. All rights reserved.
//
//  iOS开发者公会-技术1群 QQ群号：87440292
//  iOS开发者公会-技术2群 QQ群号：232702419
//  iOS开发者公会-议事区  QQ群号：413102158
//

#import "WQScrollTextView.h"

@interface UIView (WQScrollTextViewExtension)

@property (nonatomic) CGFloat lmj_top;
@property (nonatomic) CGFloat lmj_right;
@property (nonatomic) CGFloat lmj_bottom;
@property (nonatomic) CGFloat lmj_left;
@property (nonatomic) CGFloat lmj_width;
@property (nonatomic) CGFloat lmj_height;

@end

@implementation UIView (WQScrollTextViewExtension)
// getter
- (CGFloat)lmj_top{
    return self.frame.origin.y;
}
- (CGFloat)lmj_right{
    return self.frame.origin.x + self.frame.size.width;
}
- (CGFloat)lmj_bottom{
    return self.frame.origin.y + self.frame.size.height;
}
- (CGFloat)lmj_left{
    return self.frame.origin.x;
}
- (CGFloat)lmj_width{
    return self.frame.size.width;
}
- (CGFloat)lmj_height{
    return self.frame.size.height;
}
// setter
- (void)setLmj_top:(CGFloat)lmj_top{
    self.frame = CGRectMake(self.lmj_left, lmj_top, self.lmj_width, self.lmj_height);
}
- (void)setLmj_right:(CGFloat)lmj_right{
    self.frame = CGRectMake(lmj_right -self.lmj_width, self.lmj_top, self.lmj_width, self.lmj_height);
}
- (void)setLmj_bottom:(CGFloat)lmj_bottom{
    self.frame = CGRectMake(self.lmj_left, lmj_bottom-self.lmj_height, self.lmj_width, self.lmj_height);
}
- (void)setLmj_left:(CGFloat)lmj_left{
    self.frame = CGRectMake(lmj_left, self.lmj_top, self.lmj_width, self.lmj_height);
}
- (void)setLmj_width:(CGFloat)lmj_width{
    self.frame = CGRectMake(self.lmj_left, self.lmj_top, lmj_width, self.lmj_height);
}
- (void)setLmj_height:(CGFloat)lmj_height{
    self.frame = CGRectMake(self.lmj_left, self.lmj_top, self.lmj_width, lmj_height);
}
@end






@interface UILabel (WQScrollTextViewExtension)

@property (nonatomic) id lmj_text;

@end

@implementation UILabel (WQScrollTextViewExtension)
- (id)lmj_text{
    return self.text;
}
- (void)setLmj_text:(id)lmj_text{
    if ([lmj_text isKindOfClass:[NSAttributedString class]]) {
        self.attributedText = lmj_text;
    }else if ([lmj_text isKindOfClass:[NSString class]]) {
        self.text = lmj_text;
    }
}
@end








@implementation WQScrollTextView
{
    UITapGestureRecognizer * _tapGesture;
    
    UIView * _currentScrollLabel;
    UIView * _standbyScrollLabel;

    NSInteger _index;
    
    BOOL _needStop;
    BOOL _isRunning;
    
    BOOL _isHaveSpace;
}
#pragma mark - Init

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.clipsToBounds = YES;
        
        _index = 0;
        
        _needStop  = NO;
        _isRunning = NO;
        
        _isHaveSpace = NO;
        
        _textDataArr   = @[];
        
        _textStayTime  = 3;
        _scrollAnimationTime = 1;
        
        _textFont      = [UIFont systemFontOfSize:12];
        _textColor     = [UIColor blackColor];
        _textAlignment = NSTextAlignmentLeft;
        
        _currentScrollLabel = nil;
        _standbyScrollLabel = nil;
        

    }
    return self;
}




- (void)startScrollBottomToTopWithNoSpace{

    [self resetStateToEmpty];
    //中间有空行了 就no 没有来就yes
//    创建两个label -100 和0的位置
    [self createScrollLabelNeedStandbyLabel:YES];
    
    [self scrollWithNoSpaceByDirection:@(1)];
}

#pragma mark - Clear / Create
- (void)resetStateToEmpty{
    if (_currentScrollLabel) {
        [_currentScrollLabel removeFromSuperview];
        _currentScrollLabel = nil;
    }
    if (_standbyScrollLabel) {
        [_standbyScrollLabel removeFromSuperview];
        _standbyScrollLabel = nil;
    }
    
}


- (void)createScrollLabelNeedStandbyLabel:(BOOL)isNeed{
    _currentScrollLabel = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _currentScrollLabel.backgroundColor = [UIColor magentaColor];

    [self addSubview:_currentScrollLabel];
    

        _standbyScrollLabel = [[UIView alloc] initWithFrame:CGRectMake(0, -100, self.frame.size.width, self.frame.size.height)];
    _standbyScrollLabel.backgroundColor = [UIColor redColor];

        [self addSubview:_standbyScrollLabel];

}


#pragma mark - Scroll Action
- (void)scrollWithNoSpaceByDirection:(NSNumber *)direction{
    // 处于非当前页面，延迟尝试                    获取当前试图控制器
        _standbyScrollLabel.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height);



        [UIView animateWithDuration:_scrollAnimationTime delay:_textStayTime options:0 animations:^{
            
            _currentScrollLabel.frame = CGRectMake(0, -100, self.frame.size.width, self.frame.size.height);
            _standbyScrollLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
            
        } completion:^(BOOL finished) {

//            交换 两个label
            UIView * temp = _currentScrollLabel;
            _currentScrollLabel = _standbyScrollLabel;
            _standbyScrollLabel = temp;

                [self performSelector:@selector(scrollWithNoSpaceByDirection:) withObject:direction];
        }];
}






@end

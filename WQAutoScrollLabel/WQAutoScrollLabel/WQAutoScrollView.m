//
//  WQAutoScrollView.m
//  WQAutoScrollLabel
//
//  Created by xfq on 2018/5/19.
//  Copyright © 2018年 xfq. All rights reserved.
//

//跑马灯
#import "WQAutoScrollView.h"

typedef void(^block)(UILabel *label);

#define countNumber 2


@interface WQAutoScrollView()<UIScrollViewDelegate>
{
    UIView *currentView;
    UIView *standByView;
    UILabel *labels[countNumber];
    NSTimeInterval delayTime;
    NSMutableArray *labelSizeArray ;
}

@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) NSMutableArray *lablSets;




@end
@implementation WQAutoScrollView


- (instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initConfig];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self initConfig];
        
    }
    return self;
}

- (void)initConfig{
    _labelGap = self.bounds.size.width - 30;
    _scrollSpeed = 15;
    delayTime = 0.5;
    [self setScrollDirection:ScrollOrientationFromRightToLeft];
    for (int i = 0; i<countNumber; i++) {
        labels[i] = [[UILabel alloc] init];
        
    }
    
    
    
   
}

- (void)setScrollDirection:(ScrollOrientation)scrollDirection{
    _scrollDirection = scrollDirection;
    [self refreshLabelWithDirection:_scrollDirection];
}

- (void)setText:(NSString *)scrollText{
    _text = scrollText;
    
    for (int i = 0; i<countNumber; i++) {
        UILabel *label = (UILabel *)[self viewWithTag:100+i];
        label.text = scrollText;
    }
    

}

- (void)setTextDataArray:(NSArray *)textDataArray{
    _textDataArray = textDataArray;
    labelSizeArray = [self getTextLengthArray:textDataArray];
    
    
    
}

- (NSMutableArray *)getTextLengthArray:(NSArray *)textArray{
    
    NSMutableArray *sizeArray = [@[] mutableCopy];
    for (int i = 0; i<textArray.count; i++) {
        NSDictionary *attDict = @{NSFontAttributeName:[UIFont systemFontOfSize:21]};
         CGSize size = [self.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 50) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attDict context:nil].size;
        
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:21];
        label.frame = CGRectMake(i*(size.width + _labelGap), 0, (size.width), self.bounds.size.height);
        label.text = _text;
        [self.scrollView addSubview:label];
        offset += (size.width + _labelGap);
        
        CGSize size = [textArray[i] boundingRectWithSize:CGSizeMake(MAXFLOAT, 50) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attDict context:nil].size;
        [sizeArray addObject:@(size.width)];

    }
    return sizeArray;

}

- (void)refreshLabelWithDirection:(ScrollOrientation)scrollDirection{
    if (scrollDirection == ScrollOrientationFromRightToLeft) {
        CGFloat offset = 0;
        for (int i = 0; i<countNumber; i++) {
            NSDictionary *attDict = @{NSFontAttributeName:[UIFont systemFontOfSize:21]};
            CGSize size = [self.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 50) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attDict context:nil].size;
            
            UILabel *label = [[UILabel alloc] init];
            label.font = [UIFont systemFontOfSize:21];
            label.frame = CGRectMake(i*(size.width + _labelGap), 0, (size.width), self.bounds.size.height);
            label.tag = countNumber + 100;
            label.text = _text;
            
            [self.scrollView addSubview:label];
            offset += (size.width + _labelGap);
            
        }
        self.scrollView.contentSize = CGSizeMake(offset, self.scrollView.bounds.size.height);
        
    }
    else if (scrollDirection == ScrollOrientationFromBottomToTop){
        
        for (int i = 0; i<countNumber; i++) {
            UIView *labelView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height * i, self.bounds.size.width, self.bounds.size.height)];
            [self.scrollView addSubview:labelView];
            
        }
        self.scrollView.contentSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height * 2);
        
    }
}

//重新设置ui的位置
- (void)resetUIFrame{
    if (_scrollDirection == ScrollOrientationFromRightToLeft) {
        labels[0].frame = CGRectMake(0, 0, [labelSizeArray[0] floatValue], 50);
        labels[1].frame = CGRectMake([labelSizeArray[0] floatValue] + _labelGap, 0, [labelSizeArray[1] floatValue], 50);
    }
}


- (void)startScroll{
    [self resetUIFrame];
    [self animationStart];
    
    
}

- (void)animationStart{
    if (self.scrollDirection == ScrollOrientationFromRightToLeft) {
        NSDictionary *attDict = @{NSFontAttributeName:[UIFont systemFontOfSize:21]};
        
        
        
        [UIView animateWithDuration:[UIScreen mainScreen].bounds.size.width/_scrollSpeed delay:delayTime options:UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveLinear | UIViewAnimationOptionCurveEaseOut animations:^{
//            self.scrollView.contentOffset = CGPointMake(self.scrollView.contentSize.width/2.0, 0);
            
            
        } completion:^(BOOL finished) {
            
            // 完成后循调用
            if (finished) {
                delayTime = 0.5;
                [self startScroll];
            }
        }];
    }else{
        
        
    }
}



- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.backgroundColor = [UIColor clearColor];
        [self addSubview:_scrollView];
        
//        添加淡出淡入效果；
        CAGradientLayer *_gradLayer = [CAGradientLayer layer];
        NSArray *colors = [NSArray arrayWithObjects:
                           (id)[[UIColor colorWithWhite:0 alpha:0.0] CGColor],
                           (id)[[UIColor colorWithWhite:0 alpha:0.75] CGColor],
                           (id)[[UIColor colorWithWhite:0 alpha:0.85] CGColor],
                           (id)[[UIColor colorWithWhite:0 alpha:0.95] CGColor],
                           (id)[[UIColor colorWithWhite:0 alpha:1.0] CGColor],
                           nil];
        [_gradLayer setColors:colors];
        //渐变起止点，point表示向量 (I.e. [0,0] is the bottom-left
//        * corner of the layer, [1,1] is the top-right corner.)
        [_gradLayer setStartPoint:CGPointMake(1.0f, 0.0f)];
        [_gradLayer setEndPoint:CGPointMake(0.0f, 0.0f)];
        
        [_gradLayer setFrame:self.bounds];
        
        [self.layer setMask:_gradLayer];

    }
    return _scrollView;
}

@end

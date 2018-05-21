//
//  WQAutoScrollView.m
//  WQAutoScrollLabel
//
//  Created by xfq on 2018/5/19.
//  Copyright © 2018年 xfq. All rights reserved.
//

#import "WQAutoScrollView.h"

typedef void(^block)(UILabel *label);

static void each_Object(NSMutableArray *arrays,block labelBlock){
    for (UILabel *label in arrays) {
        labelBlock(label);
    }
}

@interface WQAutoScrollView()<UIScrollViewDelegate>
{
    UIView *currentView;UIView *standByView ;
}

@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) NSMutableArray *lablSets;









/**
  Displaying lines  array  正在展示的label 数组；
  */
@property (nonatomic,strong) NSMutableArray *currentLables;
/**
 WillDisplaylines  array  准备展示的label 数组；
 */
@property (nonatomic,strong) NSMutableArray *standbyLables;


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
   
    _scrollDirection = ScrollOrientationFromBottomToTop;
    _scrollSpeed = 3;//s
    _rows = 1;
    _dataArray = @[];
    [self createScrollViewWithDirection:ScrollOrientationFromBottomToTop andRows:2];
    
}

- (void)createScrollViewWithDirection:(ScrollOrientation)orientation andRows:(NSInteger)lineNumber{
    if (orientation == ScrollOrientationFromBottomToTop || orientation == ScrollOrientationFromTopToBottom) {
//        UILabel *currentLabel[lineNumber];
//        UILabel *standbyLabel[lineNumber];
        for (int i = 0; i<_rows; i++) {
           UILabel *currentLabel = [[UILabel alloc] init];
            [self.currentLables addObject:currentLabel];
           UILabel * standbyLabel = [[UILabel alloc] init];
            [self.standbyLables addObject:standbyLabel];
        }
    }
    else{
        UILabel *currentLabel = [[UILabel alloc] init];
        [self.currentLables addObject:currentLabel];
        UILabel * standbyLabel = [[UILabel alloc] init];
        [self.standbyLables addObject:standbyLabel];
    }
}

- (void)removeAllLabels:(NSMutableArray *)array{
    if (array && array.count > 0) {
       
        
        for (int i = 0; i<array.count; i++) {
            UILabel *label = (UILabel *)array[i];
            [label removeFromSuperview];
            [array removeObject:label];
            label = nil;
        }
    }
}

- (void)startScroll{
    [self removeAllLabels:self.currentLables];
    [self removeAllLabels:self.standbyLables];
    
    [self createScrollViewWithDirection:_scrollDirection andRows:_rows];
    [self reSetFrameOfLableUI];
    
    
    
}

- (void)reSetFrameOfLableUI{
    
    if (_scrollDirection == ScrollOrientationFromBottomToTop ) {
        
        
        currentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height )];
        [self addSubview:currentView];
        currentView.backgroundColor = [UIColor redColor];
        currentView.tag = 10001;
        
        standByView = [[UIView alloc] initWithFrame:CGRectMake(0, -self.bounds.size.height, self.bounds.size.width, self.bounds.size.height)];
        
        [self addSubview:standByView];
        standByView.backgroundColor = [UIColor cyanColor];
        standByView.tag = 10002;
        
        for (int i = 0; i<self.currentLables.count; i++) {
            UILabel *label = (UILabel *)_currentLables[i];
            label.frame = CGRectMake(0, i * self.bounds.size.height * 1.0 / _rows, self.bounds.size.width, self.bounds.size.height * 1.0 / _rows);
            if (i%2 != 1) {
                label.backgroundColor = [UIColor magentaColor];
            }
            [currentView addSubview:label];
        }
        for (int i = 0; i<self.standbyLables.count; i++) {
            UILabel *label = (UILabel *)_standbyLables[i];
            if (i%2 != 1) {
                label.backgroundColor = [UIColor yellowColor];
            }
            label.frame = CGRectMake(0,self.bounds.size.height + (i * self.bounds.size.height * 1.0 / _rows), self.bounds.size.width, self.bounds.size.height * 1.0 / _rows);
            [standByView addSubview:label];
        }
        
    }
    
    [self scrollWithDirection:_scrollDirection];
}
- (void)scrollWithDirection:(ScrollOrientation)dire{
    
    standByView.frame =  CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    
    
    [UIView animateWithDuration:4 delay:0.01 options:UIViewAnimationOptionLayoutSubviews animations:^{
        
        currentView.frame = CGRectMake(0, - self.bounds.size.height, self.bounds.size.width, self.bounds.size.height);
        standByView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
        
    } completion:^(BOOL finished) {
        
        //            当currentindex>arr.count时=0
//        _index = [self nextIndex:_index];
//
//        //            交换 两个label
        UIView * temp = currentView;
        currentView = standByView;
        standByView = temp;
//
//        if (_needStop) {
//            _isRunning = NO;
//        }else{
            [self scrollWithDirection:ScrollOrientationFromBottomToTop];
//        }
    }];
}
- (NSInteger)nextIndex:(NSInteger)index{
    if (index>self.dataArray.count - 1) {
        return 0;
    }
    else{
        return 0;
    }
}
- (void)stopScroll{
    [self scrollWithDirection:ScrollOrientationFromBottomToTop];
}








- (void)setText:(NSString *)scrollText{
    each_Object(self.lablSets, ^(UILabel *label) {
        label.text = scrollText;
    });
    [self refreshLabel];
}

- (UILabel *)scrollLable{
    return self.lablSets.firstObject;
}

- (NSString *)text{
    return self.scrollLable.text;
}

- (void)refreshLabel{
    __block CGFloat offset = 0;
    
    each_Object(self.lablSets, ^(UILabel *label) {
        [label sizeToFit];
        
        NSDictionary *attDict = @{NSFontAttributeName:[UIFont systemFontOfSize:21]};
        NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:label.text attributes:attDict];
        
        CGSize size = [self.text boundingRectWithSize:self.bounds.size options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attDict context:nil].size;
        
        CGSize heightSize = [self.text boundingRectWithSize:CGSizeMake(size.width, self.bounds.size.height) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attDict context:nil].size;
    
        
        label.frame = CGRectMake(offset, 0, size.width, heightSize.height);
        if (size.width>self.bounds.size.width) {
            offset = size.width + 100  + offset;
            
            
        }
        else{
            offset = self.bounds.size.width + 100  + offset;
            
        }
        
        
        
    });
    
    
    self.scrollView.contentSize = CGSizeMake(offset, self.scrollView.bounds.size.height);
    [self scroll];
   
}




- (void)scroll{

    [UIView animateWithDuration:8 delay:0.01 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveLinear | UIViewAnimationOptionCurveEaseOut animations:^{

            self.scrollView.contentOffset = CGPointMake(self.scrollView.contentSize.width/2.0, 0);



    } completion:^(BOOL finished) {

        // 完成后循调用
        if (finished) {
            [self scroll];
        }
    }];
}

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.backgroundColor = [UIColor clearColor];
        [self addSubview:_scrollView];
        CAGradientLayer *_gradLayer = [CAGradientLayer layer];
        NSArray *colors = [NSArray arrayWithObjects:
                           (id)[[UIColor colorWithWhite:0 alpha:1] CGColor],
                           (id)[[UIColor colorWithWhite:0 alpha:0.95] CGColor],
                           (id)[[UIColor colorWithWhite:0 alpha:0.90] CGColor],
                           (id)[[UIColor colorWithWhite:0 alpha:0.85] CGColor],
                           (id)[[UIColor colorWithWhite:0 alpha:0.0] CGColor],
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

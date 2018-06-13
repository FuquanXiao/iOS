//
//  WQProgressHUD.m
//  WQProgressHHD
//
//  Created by xfq on 2018/6/13.
//  Copyright © 2018年 xfq. All rights reserved.
//

#import "WQProgressHUD.h"

@implementation WQProgressHUD

+ (id)showHUDAddedTo:(UIView *)view animated:(BOOL)animated {
    WQProgressHUD *hud = [[self alloc] initWithView:view];
    //    如果完成了就移除
    hud.removeFromSuperViewOnHide = YES;
    [view addSubview:hud];
    [hud showAnimated:animated];
    return hud;
}
//xfq3
- (instancetype)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self commonInit];
    }
    return self;
}


//xfq2
- (id)initWithView:(UIView *)view {
    NSAssert(view, @"View must not be nil.");
    return [self initWithFrame:view.bounds];
}

- (void)commonInit{
    
    _contentColor = [UIColor colorWithWhite:0.f alpha:0.7];
    self.opaque = NO;
    self.backgroundColor = [UIColor clearColor];
    self.alpha = 0.f;
    self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    self.layer.allowsGroupOpacity = NO;
    
    [self setupViews];
}
https://blog.csdn.net/gang544043963/article/details/52440621
- (void)setupViews {
    
    UIView *backgroundView = [[UIView alloc] initWithFrame:self.bounds];
    backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    backgroundView.alpha = 0.f;
    [self addSubview:backgroundView];
    _backgroundView = backgroundView;
    
    WQBackgroundView *contentView = [[WQBackgroundView alloc] initWithFrame:CGRectZero];
    contentView.translatesAutoresizingMaskIntoConstraints = NO;
    contentView.alpha = 0.f;
    [self addSubview:contentView];
    _contentView = contentView;
    
    
}

- (void)showAnimated:(BOOL)animated {
    
}
@end



@implementation WQBackgroundView

- (instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _color = [UIColor colorWithWhite:0.8f alpha:0.6f];
         self.clipsToBounds = YES;
        [self updateForBackgroundStyle];

    }
    return self;
}

- (void)setColor:(UIColor *)color{
    _color = color;
}

- (void)updateForBackgroundStyle{
    self.backgroundColor = self.color;

}

@end


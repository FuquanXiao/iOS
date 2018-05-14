//
//  CustomImageView.m
//  WQProgressHUD
//
//  Created by xfq on 2018/5/10.
//  Copyright © 2018年 xfq. All rights reserved.
//

#import "CustomImageView.h"






@implementation CustomImageView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        WQCircularLoaderHUD *hud = [[WQCircularLoaderHUD alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        [self addSubview:hud];
        hud.progress = 90/100.0;
        [hud revea];
        
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

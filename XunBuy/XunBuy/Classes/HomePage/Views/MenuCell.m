//
//  MenuCell.m
//  XunBuy
//
//  Created by wujianming on 16/1/6.
//  Copyright © 2016年 kimee. All rights reserved.
//  选项菜单：新品、晒单、云购记录、账户充值

#import "MenuCell.h"

@implementation MenuCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 文字标题
        _xb_title           = [[UILabel alloc] init];
        _xb_title.font      = [UIFont boldSystemFontOfSize:12.0];
        _xb_title.textColor = [UIColor grayColor];
        _xb_title.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_xb_title];
        
        // 图片
        _xb_icon            = [[UIImageView alloc] init];
        _xb_icon.contentMode = UIViewContentModeBottom;
        [self addSubview:_xb_icon];

        WS(weakSelf)
        [_xb_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(weakSelf.mas_centerX);
            make.width.mas_equalTo(weakSelf.mas_width);
            make.bottom.mas_equalTo(weakSelf.mas_bottom).offset(-10);
            make.height.mas_equalTo(15);
        }];

        [_xb_icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(weakSelf.mas_centerX);
            make.bottom.mas_equalTo(weakSelf.xb_title.mas_top).offset(-10);
            make.width.mas_equalTo(weakSelf.xb_title.mas_width);
            make.height.mas_equalTo(weakSelf.xb_title.mas_width);
        }];
    }
    
    return self;
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com
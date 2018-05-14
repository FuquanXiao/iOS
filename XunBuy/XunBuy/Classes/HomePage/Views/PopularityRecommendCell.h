//
//  PopularityRecommendCell.h
//  XunBuy
//
//  Created by wujianming on 16/1/9.
//  Copyright © 2016年 kimee. All rights reserved.
//  人气推荐视图

#import <UIKit/UIKit.h>

typedef void (^CellTitleBlock)();

@interface PopularityRecommendCell : UITableViewCell

/** 标题点击事件回调*/
@property (nonatomic, copy) CellTitleBlock cellTitleCallBack;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com
//
//  MenuView.h
//  XunBuy
//
//  Created by wujianming on 16/1/6.
//  Copyright © 2016年 kimee. All rights reserved.
//  选项菜单：新品、晒单、云购记录、账户充值

#import <UIKit/UIKit.h>

typedef void (^XB_menuBlock)(NSInteger index);

@interface MenuView : UICollectionView

/** 每行多少个菜单，不设置默认4个*/
@property (nonatomic, assign) NSInteger xb_menuCountOfLine;

/** 每行菜单高度,不设置默认为控件自身高度*/
@property (nonatomic, assign) CGFloat xb_menuHeight;

/** 菜单点击事件回调*/
@property (nonatomic, copy) XB_menuBlock xb_menuCallBack;

/**
 *  创建一个多选项菜单栏
 *
 *  @param frame  菜单尺寸
 *  @param layout 菜单属性描述，水平滑动或垂直滑动setScrollDirection， 最大最小间距minimumLineSpacing
 *  @param icons  菜单图片数组 与 titles个数要相等
 *  @param titles 菜单标题数组 与 icons个数要相等
 *
 *  @return 返回一个菜单视图
 */
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout withIcons:(NSArray *)icons titles:(NSArray *)titles;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com
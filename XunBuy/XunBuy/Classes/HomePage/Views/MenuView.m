//
//  MenuView.m
//  XunBuy
//
//  Created by wujianming on 16/1/6.
//  Copyright © 2016年 kimee. All rights reserved.
//  选项菜单：新品、晒单、云购记录、账户充值

#import "MenuView.h"
#import "MenuCell.h"

@interface MenuView ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) NSArray *xb_icons;
@property (nonatomic, strong) NSArray *xb_titles;
@property (nonatomic, assign) NSInteger menuItemsCount;

@end

@implementation MenuView

static NSString *_identifier = @"menuCell";

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout withIcons:(NSArray *)icons titles:(NSArray *)titles
{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        _xb_icons            = icons;
        _xb_titles           = titles;
        _menuItemsCount      = _xb_icons.count >= _xb_titles.count ? _xb_titles.count : _xb_icons.count;
        
        self.delegate        = self;
        self.dataSource      = self;
        self.backgroundColor = [UIColor whiteColor];
        [self registerClass:[MenuCell class] forCellWithReuseIdentifier:_identifier]; // 注册cell
    }
    
    return self;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _menuItemsCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MenuCell *cell     = [collectionView dequeueReusableCellWithReuseIdentifier:_identifier forIndexPath:indexPath];
    cell.xb_title.text = _xb_titles[indexPath.row];
    cell.xb_icon.image = [UIImage imageNamed:_xb_icons[indexPath.row]];
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.bounds.size.width / (_xb_menuCountOfLine ? _xb_menuCountOfLine : 4), (_xb_menuHeight && _xb_menuHeight <= self.bounds.size.height) ? _xb_menuHeight : self.bounds.size.height); // 默认固定每行4个菜单, 默认高度等于菜单高度
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.xb_menuCallBack) {
        _xb_menuCallBack(indexPath.row);
    }
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com
//
//  PromotionCell.m
//  XunBuy
//
//  Created by wujianming on 16/1/9.
//  Copyright © 2016年 kimee. All rights reserved.
//  限购专区视图

#import "PromotionCell.h"
#import "PromotionCommodityCell.h"

@interface PromotionCell ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

/** 商品详情*/
@property (nonatomic, strong) UICollectionView *xb_commoditysView;

@end

@implementation PromotionCell

static NSString *_identifier = @"PromotionCell";

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        WS(weakSelf)
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _xb_commoditysView                 = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        
        [self.contentView addSubview:_xb_commoditysView];
        
        _xb_commoditysView.dataSource      = self;
        _xb_commoditysView.delegate        = self;
        _xb_commoditysView.backgroundColor = [UIColor whiteColor];
        _xb_commoditysView.layer.borderWidth = 0.5;
        _xb_commoditysView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        [_xb_commoditysView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.mas_left);
            make.top.mas_equalTo(weakSelf.mas_top);
            make.bottom.mas_equalTo(weakSelf.mas_bottom);
            make.right.mas_equalTo(weakSelf.mas_right);
        }];
        
        [_xb_commoditysView registerClass:[PromotionCommodityCell class] forCellWithReuseIdentifier:_identifier]; // 注册cell
    }
    
    return self;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PromotionCommodityCell *cell     = [collectionView dequeueReusableCellWithReuseIdentifier:_identifier forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        CALayer *rightBorder = [CALayer layer];
        rightBorder.frame = CGRectMake(cell.frame.size.width, 0.0f, 0.5f, cell.frame.size.height);
        rightBorder.backgroundColor = [UIColor lightGrayColor].CGColor;
        [cell.layer addSublayer:rightBorder];
        
        CALayer *bottomBorder = [CALayer layer];
        bottomBorder.frame = CGRectMake(0, cell.frame.size.height, cell.frame.size.width, 0.5);
        bottomBorder.backgroundColor = [UIColor lightGrayColor].CGColor;
        [cell.layer addSublayer:bottomBorder];
    }
    else if (indexPath.row == 1) {
        CALayer *rightBorder = [CALayer layer];
        rightBorder.frame = CGRectMake(cell.frame.size.width, 0.0f, 0.5f, cell.frame.size.height);
        rightBorder.backgroundColor = [UIColor lightGrayColor].CGColor;
        [cell.layer addSublayer:rightBorder];
    }
    else if (indexPath.row == 2 || indexPath.row == 3) {
        CALayer *bottomBorder = [CALayer layer];
        bottomBorder.frame = CGRectMake(0, cell.frame.size.height - 0.5, cell.frame.size.width, 0.5);
        bottomBorder.backgroundColor = [UIColor lightGrayColor].CGColor;
        [cell.layer addSublayer:bottomBorder];
    }
    
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return CGSizeMake(self.bounds.size.width / 2, (self.bounds.size.height / 3) * 2);
    }
    else {
        return CGSizeMake(self.bounds.size.width / 2, self.bounds.size.height / 3);
    }
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    xbLog(@"点击了第%ld个Item", indexPath.row);
}
@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com
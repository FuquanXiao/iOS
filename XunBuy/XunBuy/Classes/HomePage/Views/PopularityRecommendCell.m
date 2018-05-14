//
//  PopularityRecommendCell.m
//  XunBuy
//
//  Created by wujianming on 16/1/9.
//  Copyright © 2016年 kimee. All rights reserved.
//  人气推荐视图

#define CELL_TITLEHEIGHT 35

#import "PopularityRecommendCell.h"
#import "PopularityCommodityCell.h"

@interface PopularityRecommendCell ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

/** 标题*/
@property (nonatomic, strong) UIButton *xb_cellTitle;
/** 商品详情*/
@property (nonatomic, strong) UICollectionView *xb_commoditysView;

@end

@implementation PopularityRecommendCell

static NSString *_identifier = @"popularityRecommendCell";

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _xb_cellTitle                      = [[UIButton alloc] init];
        [self.contentView addSubview:_xb_cellTitle];
        [_xb_cellTitle setImage:[UIImage imageNamed:@"show_more_ic"] forState:UIControlStateNormal];
        [_xb_cellTitle setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _xb_cellTitle.titleLabel.font = [UIFont boldSystemFontOfSize:15.0];
        [_xb_cellTitle setTitle:@"人气推荐" forState:UIControlStateNormal];
        [_xb_cellTitle setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [_xb_cellTitle setImageEdgeInsets:UIEdgeInsetsMake(0, kScreen_Width - 20, 0, 0)];
        [_xb_cellTitle addTarget:self action:@selector(cellTitleDidClick) forControlEvents:UIControlEventTouchUpInside];
        
        WS(weakSelf)
        [_xb_cellTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(weakSelf.mas_width);
            make.height.mas_equalTo(CELL_TITLEHEIGHT);
            make.left.mas_equalTo(weakSelf.mas_left);
            make.top.mas_equalTo(weakSelf.mas_top);
        }];
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _xb_commoditysView                 = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        layout.minimumLineSpacing = -0.5;
        
        [self.contentView addSubview:_xb_commoditysView];
        
        _xb_commoditysView.dataSource      = self;
        _xb_commoditysView.delegate        = self;
        _xb_commoditysView.backgroundColor = [UIColor whiteColor];
        _xb_commoditysView.layer.borderWidth = 0.5;
        _xb_commoditysView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        [_xb_commoditysView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.mas_left);
            make.top.mas_equalTo(weakSelf.xb_cellTitle.mas_bottom);
            make.bottom.mas_equalTo(weakSelf.mas_bottom);
            make.right.mas_equalTo(weakSelf.mas_right);
        }];
        
        [_xb_commoditysView registerClass:[PopularityCommodityCell class] forCellWithReuseIdentifier:_identifier]; // 注册cell
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
    PopularityCommodityCell *cell     = [collectionView dequeueReusableCellWithReuseIdentifier:_identifier forIndexPath:indexPath];
    CALayer *rightBorder = [CALayer layer];
    rightBorder.frame = CGRectMake(cell.frame.size.width, 0.0f, 0.5f, cell.frame.size.height);
    rightBorder.backgroundColor = [UIColor lightGrayColor].CGColor;
    [cell.layer addSublayer:rightBorder];
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.bounds.size.width / 2.5, (self.bounds.size.height - CELL_TITLEHEIGHT));
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    xbLog(@"点击了第%ld个Item", indexPath.row);
}

#pragma mark - private methods

- (void)cellTitleDidClick
{
    if (self.cellTitleCallBack) {
        _cellTitleCallBack();
    }
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com
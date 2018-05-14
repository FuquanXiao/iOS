//
//  HomePageController.m
//  XunBuy
//
//  Created by wujianming on 15/12/31.
//  Copyright © 2015年 kimee. All rights reserved.
//  首页控制器

#define HEADERCONTENVIEW_HEIGHT 265 // 头部视图高度
#define HEADECYCLEVIEW_HEIGHT 165 // banner 高度

// 菜单图片及标题
#define MENUICONS_ARRAY @[@"homepage_new_unselect", @"homepage_share_unselect", @"homepage_record_unselect", @"homepage_charge_unselect"]
#define MENUTITLES_ARRAY @[@"新品", @"晒单", @"云购记录", @"账户充值"]

#import "HomePageController.h"
#import "SDCycleScrollView.h"
#import "MenuView.h"

// 菜单跳转
#import "ShareOrderListController.h"
#import "CloudBuyListController.h"
#import "AccountRechargeController.h"

// cell主体模块
#import "NewestAnnouncedCell.h"
#import "PopularityRecommendCell.h"
#import "PromotionCell.h"

@interface HomePageController ()<UITableViewDataSource,UITableViewDelegate,SDCycleScrollViewDelegate>

@property (nonatomic, strong) UIImageView       *xb_titleView;
@property (nonatomic, strong) UITableView       *xb_tableView;
@property (nonatomic, strong) UIView            *xb_headerContenView;
@property (nonatomic, strong) SDCycleScrollView *xb_cycleView;
@property (nonatomic, strong) MenuView          *xb_menuView;

@property (nonatomic, strong) NewestAnnouncedCell *xb_newestAnnouncedCell;
@property (nonatomic, strong) PopularityRecommendCell *xb_popularityRecommendCell;

@end

@implementation HomePageController

#pragma mark - life cycle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:255/255.0 green:102/255.0 blue:0 alpha:1]] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    
    if (indexPath.section == 0) {
        cell = [[NewestAnnouncedCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        _xb_newestAnnouncedCell = (NewestAnnouncedCell *)cell;
    }
    else if (indexPath.section == 1) {
        cell = [[PopularityRecommendCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        _xb_popularityRecommendCell = (PopularityRecommendCell *)cell;
    }
    else if (indexPath.section == 2) {
        cell = [[PromotionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    }
    else {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    }
    
    if (indexPath.row != 0) {
        cell.layer.borderWidth = 0.5;
        cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [self cellActives];
    
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 13;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 || indexPath.section == 1) {
        return 220;
    }
    else {
        return 280;
    }
}

#pragma mark - SDCycleScrollView delegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    xbLog(@"选中第%li图片", (long)index);
}

#pragma mark - private methods

- (void)setupController
{
    [super setupController];
    
    self.navigationItem.titleView          = self.xb_titleView;
    self.xb_tableView.tableHeaderView      = self.xb_headerContenView;
    [self.xb_headerContenView addSubview:self.xb_cycleView];
    [self.xb_headerContenView addSubview:self.xb_menuView];
    [self.view addSubview:self.xb_tableView];
    
    
    [self.xb_button setImage:[UIImage imageNamed:@"homepage_searchbg_unselect"] forState:UIControlStateNormal];
    [self.xb_button setImage:[UIImage imageNamed:@"homepage_searchbg_select"] forState:UIControlStateHighlighted];

    WS(weakSelf)
    self.xb_rightButtonCallBack = ^() { // 导航右键回调
        xbLog(@"%@-rightButtonDidClick", NSStringFromClass([weakSelf class]));
    };
}

// cell回调事件处理
- (void)cellActives
{
    WS(weakSelf)
    _xb_newestAnnouncedCell.cellTitleCallBack = ^() { // 最新揭晓标题点击回调
        xbLog(@"点击最新揭晓标题");
        weakSelf.tabBarController.selectedIndex = 2;
    };
    
    _xb_popularityRecommendCell.cellTitleCallBack = ^() { // 人气推荐标题点击回调
        xbLog(@"点击人气推荐标题");
        weakSelf.tabBarController.selectedIndex = 1;
    };
}

#pragma mark - getters

- (UIImageView *)xb_titleView
{
    if (!_xb_titleView) {
        _xb_titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"homepage_title"]];
    }
    
    return _xb_titleView;
}

- (UITableView *)xb_tableView
{
    if (!_xb_tableView) {
        CGRect aFrame                        = CGRectMake(0, 0, kScreen_Width, kScreen_Height - NavBar_Height);
        _xb_tableView                        = [[UITableView alloc] initWithFrame:aFrame style:UITableViewStyleGrouped];
        _xb_tableView.dataSource             = self;
        _xb_tableView.delegate               = self;
        _xb_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }

    return _xb_tableView;
}

- (UIView *)xb_headerContenView
{
    if (!_xb_headerContenView) {
        CGRect aFrame                        = CGRectMake(0, 0, kScreen_Width, HEADERCONTENVIEW_HEIGHT);
        _xb_headerContenView                 = [[UIView alloc] initWithFrame:aFrame];
        _xb_headerContenView.backgroundColor = [UIColor whiteColor];
    }

    return _xb_headerContenView;
}

- (SDCycleScrollView *)xb_cycleView
{
    if (!_xb_cycleView) {
        CGRect aFrame                        = CGRectMake(0, 0, kScreen_Width, HEADECYCLEVIEW_HEIGHT);
        _xb_cycleView                        = [[SDCycleScrollView alloc] initWithFrame:aFrame];
        _xb_cycleView.delegate               = self;
        _xb_cycleView.imageURLStringsGroup   = @[@"http://pic18.nipic.com/20120130/7193741_145433542121_2.jpg",
                                               @"http://pic1.nipic.com/2008-11-13/2008111384358912_2.jpg",
                                               @"http://img.61gequ.com/allimg/2011-4/201142614314278502.jpg"]; // 轮播图片
        _xb_cycleView.pageControlStyle       = SDCycleScrollViewPageContolStyleClassic;// 分页图片样式
        _xb_cycleView.placeholderImage       = [UIImage imageNamed:@"placehodleImg"];// 占位图片
        _xb_cycleView.autoScrollTimeInterval = 5.0;// 滚动间隔时间
    }

    return _xb_cycleView;
}

- (MenuView *)xb_menuView
{
    if (!_xb_menuView) {
        CGRect aFrame                        = CGRectMake(0, HEADECYCLEVIEW_HEIGHT, kScreen_Width, HEADERCONTENVIEW_HEIGHT - HEADECYCLEVIEW_HEIGHT);
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        _xb_menuView = [[MenuView alloc] initWithFrame:aFrame
                                  collectionViewLayout:layout
                                             withIcons:MENUICONS_ARRAY
                                                titles:MENUTITLES_ARRAY];
        _xb_menuView.xb_menuCountOfLine = 4; // 每行容纳菜单个数
        _xb_menuView.xb_menuHeight = HEADERCONTENVIEW_HEIGHT - HEADECYCLEVIEW_HEIGHT; // 每行菜单高度
        
        WS(weakSelf)
        _xb_menuView.xb_menuCallBack = ^(NSInteger index) { // 菜单Item事件回调
            xbLog(@"点中了第%ld个菜单图标", (long)index);
            
            switch (index) {
                case 0: // 新品
                {
                    weakSelf.tabBarController.selectedIndex = 1;
                }
                    break;
                    
                case 1: // 晒单
                {
                    ShareOrderListController *shareVc     = [[ShareOrderListController alloc] init];
                    shareVc.hidesBottomBarWhenPushed      = YES;
                    [weakSelf.navigationController pushViewController:shareVc animated:YES];
                }
                    break;
                case 2: // 云购记录
                {
                    CloudBuyListController *cloudVc       = [[CloudBuyListController alloc] init];
                    cloudVc.hidesBottomBarWhenPushed      = YES;
                    [weakSelf.navigationController pushViewController:cloudVc animated:YES];
                }
                    break;
                case 3: // 账户充值
                {
                    AccountRechargeController *rechargeVc = [[AccountRechargeController alloc] init];
                    rechargeVc.hidesBottomBarWhenPushed   = YES;
                    [weakSelf.navigationController pushViewController:rechargeVc animated:YES];
                }
                    break;
                    
                default:
                    break;
            }
        };
    }
    
    return _xb_menuView;
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com
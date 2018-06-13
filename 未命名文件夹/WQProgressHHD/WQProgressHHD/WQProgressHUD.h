//
//  WQProgressHUD.h
//  WQProgressHHD
//
//  Created by xfq on 2018/6/13.
//  Copyright © 2018年 xfq. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface WQBackgroundView:UIView

@property (nonatomic, strong) UIColor *color;

@end








@interface WQProgressHUD : UIView

@property (assign, nonatomic) BOOL removeFromSuperViewOnHide;

@property (nonatomic,strong) UIView *  backgroundView;
@property (nonatomic,strong) WQBackgroundView * contentView;

@property (strong, nonatomic) UIColor *contentColor UI_APPEARANCE_SELECTOR;


+ (instancetype)showHUDAddedTo:(UIView *)view animated:(BOOL)animated;

@end




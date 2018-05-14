//
//  XBAppDelegate.m
//  XunBuy
//
//  Created by wujianming on 15/12/31.
//  Copyright © 2015年 kimee. All rights reserved.
//

#import "XBAppDelegate.h"
#import "BaseTabBarController.h"

@interface XBAppDelegate ()

@end

@implementation XBAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [NSThread sleepForTimeInterval:1.0]; // 休眠1秒
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // 根控制器
    BaseTabBarController *tabBarController = [[BaseTabBarController alloc] init];
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com
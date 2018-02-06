//
//  TanTabBarVC.m
//  Tan_PushAndPresent
//
//  Created by M C on 2018/1/30.
//  Copyright © 2018年 604WorkingRoom. All rights reserved.
//

#import "TanTabBarVC.h"
#import "HomeVC.h"
#import "OtherVC.h"

@interface TanTabBarVC ()

@end

@implementation TanTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HomeVC *vc = [HomeVC new];
    [self addChildViewController:vc];
    
    OtherVC *vc2 = [OtherVC new];
    [self addChildViewController:vc2];
 
    //自定义有设置底部的UITabBarItem
    UITabBarItem *homeItem = [[UITabBarItem alloc] initWithTitle:@"主页" image:[UIImage imageNamed:@"tab_home"] tag:0];
    [homeItem setSelectedImage:[UIImage imageNamed:@"tab_home_sel"]];
   
    
    UITabBarItem *otherItem = [[UITabBarItem alloc] initWithTitle:@"其他" image:[UIImage imageNamed:@"tab_me"] tag:1];
    [otherItem setSelectedImage:[UIImage imageNamed:@"tab_me_sel"]];
    
    vc.tabBarItem = homeItem;
    vc2.tabBarItem = otherItem;
    

    
    //设置UITabBar的样式
    [self.tabBar setBarStyle:UIBarStyleBlack]; //默认样式为UIBarStyleDefault
    
    //设置UITabBar的背景颜色，会覆盖默认的UIBarStyle
//    [self.tabBar setBarTintColor:[UIColor purpleColor]];
    
//    //设置UITabBar的背景, 单独设置UITabBar的背景颜色有色差，可以背景颜色和图片一起设置
//    [self.tabBar setBackgroundColor:[UIColor red]];
//    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"bg_3"]];
    
    //设置UITabBarItem的颜色（文字和图片），默认为蓝色
    [self.tabBar setTintColor:[UIColor yellowColor]]; //设置UITabBarItem的背景颜色
//    [self.tabBar setUnselectedItemTintColor:[UIColor redColor]]; //设置UITabBarItem未选中时颜色
    
    //使用单例设置UITabBar和UITabBarItem颜色是一样的效果
//    [[UITabBar appearance] setBarTintColor:[UIColor redColor]];
//    [[UITabBar appearance] setTintColor:[UIColor greenColor]];
    
    
//    //设置UITabBarItem系统提供的样式
//    UITabBarItem *item3 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:2];
//    [item3 setTitle:@"搜一搜"];  //系统样式UITabBarItem修改文字无效
//    UITabBarItem *item4 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:3];
//    UITabBarItem *item5 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:3];
//    vc2.tabBarItem = item5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

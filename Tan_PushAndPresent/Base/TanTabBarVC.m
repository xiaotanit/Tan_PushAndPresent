//
//  TanTabBarVC.m
//  Tan_PushAndPresent
//
//  Created by M C on 2018/1/30.
//  Copyright © 2018年 604WorkingRoom. All rights reserved.
//

#import "TanTabBarVC.h"
#import "HomeVC.h"

@interface TanTabBarVC ()

@end

@implementation TanTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HomeVC *vc = [HomeVC new];
    [self addChildViewController:vc];
    
    UIViewController *vc2 = [UIViewController new];
    [self addChildViewController:vc2];
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

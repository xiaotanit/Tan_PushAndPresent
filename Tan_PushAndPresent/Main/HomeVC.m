//
//  HomeVC.m
//  Tan_PushAndPresent
//
//  Created by M C on 2018/1/30.
//  Copyright © 2018年 604WorkingRoom. All rights reserved.
//

#import "HomeVC.h"
#import "TanPickerView.h"

@interface HomeVC ()

@property (nonatomic, weak) UILabel *infoLbl; //展示信息
@property (nonatomic, weak) TanPickerView *pickerView;

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = COLOR_BLUE;
    
    UILabel *infoLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, SCREEN_WIDTH, 30)];
    infoLbl.textColor = [UIColor whiteColor];
    infoLbl.font = [UIFont boldSystemFontOfSize:30];
    infoLbl.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:infoLbl];
    self.infoLbl = infoLbl;
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(30, 250, 80, 40)];
    [btn setTitle:@"选择" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(showPickerView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    NSArray *arr = @[@"湖南省", @"湖北省", @"广东省", @"广西省", @"江西省", @"河北省", @"河南省", @"山东省", @"山西省", @"青海省", @"陕西省", @"黑龙江省", @"北京市", @"天津市", @"上海市", @"重庆市", @"浙江省", @"江苏省", @"四川省", @"新疆省", @"西藏省"];
    TanPickerView *pickerView = [[TanPickerView alloc] initWithFrame:CGRectMake(0, 300, SCREEN_WIDTH, 200) withData:arr];
    [self.view addSubview:pickerView];
    self.pickerView = pickerView;
    
    WEAK_SELF
    pickerView.confirmSelected = ^(NSString *content) {
        weakSelf.infoLbl.text = content;
    };
}

//展示pickerView
- (void)showPickerView:(UIButton *)sender{
    self.pickerView.hidden = NO;
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

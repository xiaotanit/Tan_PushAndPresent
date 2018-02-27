//
//  TanPickerView.m
//  Tan_PushAndPresent
//
//  Created by M C on 2018/2/27.
//  Copyright © 2018年 604WorkingRoom. All rights reserved.
//  自定义UIPickerView

#import "TanPickerView.h"

@interface TanPickerView ()<UIPickerViewDataSource, UIPickerViewDelegate>

@end

@implementation TanPickerView{
    UIButton *cancelBtn; //取消按钮
    UIButton *confirmBtn; //确认按钮
    UIPickerView *pickerView;
    
    NSArray *dataArr; //数据源
    NSInteger selectedRow; //当前选中的row索引
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return dataArr.count;
}

#pragma mark - UIPickerViewDelegate
//- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component __TVOS_PROHIBITED;
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 40;
}

// these methods return either a plain NSString, a NSAttributedString, or a view (e.g UILabel) to display the row for the component.
// for the view versions, we cache any hidden and thus unused views and pass them back for reuse.
// If you return back a different object, the old one will be released. the view will be centered in the row rect
//- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
//    
//    return dataArr[row];
//}

//- (nullable NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component{
//
//    NSString *str = dataArr[row];
//    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:str];
//    [attr setAttributes:@{NSForegroundColorAttributeName: COLOR_BLUE} range:NSMakeRange(0, str.length)];
//
//    return attr;
//}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view{
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.text = dataArr[row];
    
    //设置默认第一行的颜色字体
    if (selectedRow == row){
        lbl.textColor = COLOR_BLUE;
        lbl.font = [UIFont boldSystemFontOfSize:28];
    }
    else{
        lbl.textColor = [UIColor redColor];
    }
    
    return lbl;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"当前被选中：%d", (int)row);
    
    selectedRow = row; //设置当前选中的行索引
    
    UILabel *lbl = (UILabel *)[pickerView viewForRow:row forComponent:component];
    lbl.textColor = COLOR_BLUE;
    lbl.font = [UIFont boldSystemFontOfSize:28];
    
    [pickerView reloadAllComponents]; 
}


- (instancetype)initWithFrame:(CGRect)frame withData:(NSArray *)arr{
    
    if (self = [super initWithFrame:frame]){
        [self initSubControls];
        dataArr = arr;
    }
    return self;
}

//初始化子控件
- (void)initSubControls{
    
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderColor = [UIColor redColor].CGColor;
    self.layer.borderWidth = 3;
    
    CGFloat btnW = 80, btnH = 40;
    //1、取消按钮
    cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, btnW, btnH)];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:cancelBtn];
    
    //2、确认按钮
    CGFloat btnX = SCREEN_WIDTH - btnW;
    confirmBtn = [[UIButton alloc] initWithFrame:CGRectMake(btnX, 0, btnW, btnH)];
    [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:COLOR_BLUE forState:UIControlStateNormal];
    [confirmBtn addTarget:self action:@selector(confirm:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:confirmBtn];
    
    //UIPickerView
    pickerView = [[UIPickerView alloc] initWithFrame:self.bounds];
    pickerView.dataSource = self;
    pickerView.delegate = self;
    [self addSubview:pickerView];
    
    [self bringSubviewToFront:cancelBtn];
    [self bringSubviewToFront:confirmBtn];
}

//点击“取消”操作
- (void)cancel:(UIButton *)sender{
    self.hidden = YES;
}

//点击“确认”操作
- (void)confirm:(UIButton *)sender{
    
    if (self.confirmSelected){
        
        NSInteger selectedRow = [pickerView selectedRowInComponent:0];  //当前选中的行索引
        self.confirmSelected(dataArr[selectedRow]);
        self.hidden = YES;
    }
}

@end

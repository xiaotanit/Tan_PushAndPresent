//
//  TanPickerView.h
//  Tan_PushAndPresent
//
//  Created by M C on 2018/2/27.
//  Copyright © 2018年 604WorkingRoom. All rights reserved.
//  自定义UIPickerView

#import <UIKit/UIKit.h>

@interface TanPickerView : UIView

- (instancetype)initWithFrame:(CGRect)frame withData:(NSArray *)arr;

//点击”确定“按钮后，传递数据
@property (nonatomic, copy) void (^confirmSelected)(NSString *content);

@end

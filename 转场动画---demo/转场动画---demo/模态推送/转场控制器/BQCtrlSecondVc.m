//
//  BQCtrlSecondVc.m
//  转场动画---demo
//
//  Created by baiqiang on 16/2/24.
//  Copyright © 2016年 baiqiang. All rights reserved.
//

#import "BQCtrlSecondVc.h"

@interface BQCtrlSecondVc ()

@end

@implementation BQCtrlSecondVc

#pragma mark - 类方法

#pragma mark - 创建方法

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initUI];
    
}
#pragma mark - 实例方法
- (void)initData{
    
}

- (void)initUI{
    [self.backBtn addTarget:self action:@selector(backBtnClickedEvent:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 事件响应方法
- (void)backBtnClickedEvent:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - Method

#pragma mark - set方法

#pragma mark - get方法

@end

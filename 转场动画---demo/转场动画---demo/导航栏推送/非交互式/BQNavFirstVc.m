//
//  BQNavigationFirstVc.m
//  转场动画---demo
//
//  Created by baiqiang on 16/2/24.
//  Copyright © 2016年 baiqiang. All rights reserved.
//

#import "BQNavFirstVc.h"
#import "BQNavSecondVc.h"
#import "BQTransitionAnimation.h"

@interface BQNavFirstVc ()<UINavigationControllerDelegate, UIViewControllerTransitioningDelegate>

@end

@implementation BQNavFirstVc

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
    [self.showNextVcBtn addTarget:self action:@selector(showNextVcBtnClickedEvent:) forControlEvents:UIControlEventTouchUpInside];
}


#pragma mark - 事件响应方法
- (void)showNextVcBtnClickedEvent:(UIButton *)sender {
    BQNavSecondVc *nextVc = [[BQNavSecondVc alloc] init];
    self.navigationController.delegate = self;
    [self.navigationController pushViewController:nextVc animated:YES];
}
#pragma mark - UINavigationControllerDelegate Method
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    return [[BQTransitionAnimation alloc] initWithAnimationType:AnimationType_Right_Bottom];
}
#pragma mark - set方法

#pragma mark - get方法

@end

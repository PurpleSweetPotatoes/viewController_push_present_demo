//
//  BQPresentFirstVc.m
//  转场动画---demo
//
//  Created by baiqiang on 16/2/24.
//  Copyright © 2016年 baiqiang. All rights reserved.
//

#import "BQPresentFirstVc.h"
#import "BQPresentSecondVc.h"
#import "BQTransitionAnimation.h"

@interface BQPresentFirstVc ()<UIViewControllerTransitioningDelegate>

@end

@implementation BQPresentFirstVc

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
    BQPresentSecondVc *nextVc = [[BQPresentSecondVc alloc] init];
    //自定义转场推送模态
    nextVc.modalPresentationStyle = UIModalPresentationCustom;
    //设置转场代理
    nextVc.transitioningDelegate = self;
    [self presentViewController:nextVc animated:YES completion:nil];
}
#pragma mark - UIViewControllerTransitioningDelegate Method
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[BQTransitionAnimation alloc] initWithAnimationType:AnimationType_Rotate];
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[BQTransitionAnimation alloc] initWithAnimationType:AnimationType_Alpha_Change];
}
#pragma mark - set方法

#pragma mark - get方法
@end

//
//  BQCtrlFirstVc.m
//  转场动画---demo
//
//  Created by baiqiang on 16/2/24.
//  Copyright © 2016年 baiqiang. All rights reserved.
//

#import "BQCtrlFirstVc.h"
#import "BQCtrlSecondVc.h"
#import "BQTransitionAnimation.h"
#import "BQPresentationCtl.h"

@interface BQCtrlFirstVc ()<UIViewControllerTransitioningDelegate>

@end

@implementation BQCtrlFirstVc

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
    BQCtrlSecondVc *nextVc = [[BQCtrlSecondVc alloc] init];
    nextVc.modalPresentationStyle = UIModalPresentationCustom;
    nextVc.transitioningDelegate = self;
    [self presentViewController:nextVc animated:YES completion:nil];
}
#pragma mark - UIViewControllerTransitioningDelegate Method
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    //使用默认动画
    return nil;
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    //使用默认动画
    return nil;
}
- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    return [[BQPresentationCtl alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}
#pragma mark - set方法

#pragma mark - get方法
@end

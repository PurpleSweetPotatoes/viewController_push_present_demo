//
//  BQNavigationFirstVc.m
//  转场动画---demo
//
//  Created by baiqiang on 16/2/24.
//  Copyright © 2016年 baiqiang. All rights reserved.
//

#import "BQNavInteractionFirstVc.h"
#import "BQNavInteractionSecondVc.h"
#import "BQTransitionAnimation.h"
#import "BQpercentDrivenInteractive.h"

@interface BQNavInteractionFirstVc ()<UINavigationControllerDelegate>
{
    BOOL _isInteraction;
}
@property (nonatomic, strong) UIScreenEdgePanGestureRecognizer *panGesture;
@end

@implementation BQNavInteractionFirstVc

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
    _isInteraction = NO;

}

- (void)initUI{
    [self.showNextVcBtn addTarget:self action:@selector(showNextVcBtnClickedEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addGestureRecognizer:self.panGesture];
}


#pragma mark - 事件响应方法
- (void)showNextVcBtnClickedEvent:(UIButton *)sender {
    if (sender != nil) {
        _isInteraction = NO;
    }
    BQNavInteractionSecondVc *nextVc = [[BQNavInteractionSecondVc alloc] init];
    self.navigationController.delegate = self;
    [self.navigationController pushViewController:nextVc animated:YES];
}
- (void)panGestureChangeEvent:(UIScreenEdgePanGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        _isInteraction = YES;
        [self showNextVcBtnClickedEvent:nil];
    }
}
#pragma mark - UINavigationControllerDelegate Method
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    return [[BQTransitionAnimation alloc] initWithAnimationType:AnimationType_Alpha_Change];
}
- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    if (_isInteraction == YES) {
        return [[BQpercentDrivenInteractive alloc] initWithPanGesture:self.panGesture];
    }
    return nil;
}
#pragma mark - set方法

#pragma mark - get方法
- (UIScreenEdgePanGestureRecognizer *)panGesture {
    if (_panGesture == nil) {
        _panGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureChangeEvent:)];
        _panGesture.edges = UIRectEdgeRight;
    }
    return _panGesture;
}
@end

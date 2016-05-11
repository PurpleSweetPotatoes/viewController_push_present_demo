//
//  BQPresentationCtl.m
//  转场动画---demo
//
//  Created by baiqiang on 16/2/25.
//  Copyright © 2016年 baiqiang. All rights reserved.
//

#import "BQPresentationCtl.h"

@interface BQPresentationCtl ()

@property (nonatomic, strong) id <UIViewControllerTransitionCoordinator> transitionCoordinator;
@property (nonatomic, strong) UIView *backgroundView;

@end

@implementation BQPresentationCtl

- (void)presentationTransitionWillBegin {
    UIView *backgroundView = [[UIView alloc] initWithFrame:self.containerView.bounds];
    backgroundView.backgroundColor = [UIColor blackColor];
    backgroundView.alpha = 0.0f;
    [self.containerView addSubview:backgroundView];
    self.backgroundView = backgroundView;
    //配置转场协调器
    self.transitionCoordinator = self.presentedViewController.transitionCoordinator;
    //使背景透明度的变化同视图推出动画速率一致
    [self.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        backgroundView.alpha = 0.3f;
    } completion:nil];
    
    UITapGestureRecognizer *gestur = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureRecognizerClickedEvent:)];
    [backgroundView addGestureRecognizer:gestur];
}
- (void)gestureRecognizerClickedEvent:(UITapGestureRecognizer *)sender {
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}
- (void)presentationTransitionDidEnd:(BOOL)completed {
    
}
- (void)dismissalTransitionWillBegin {
    
    self.transitionCoordinator = self.presentingViewController.transitionCoordinator;
    [self.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.backgroundView.alpha = 0.0f;
    } completion:nil];
}
- (void)dismissalTransitionDidEnd:(BOOL)completed {
    
}
//给推出的控制器视图一个新的frame
- (CGRect)frameOfPresentedViewInContainerView {
    return CGRectMake(0, self.containerView.bounds.size.height - 400, self.containerView.bounds.size.width, 400);
}
@end

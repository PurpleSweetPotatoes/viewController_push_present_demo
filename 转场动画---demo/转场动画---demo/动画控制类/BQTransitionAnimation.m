//
//  BQTransitionAnimation.m
//  模态推送动画
//
//  Created by baiqiang on 15/9/17.
//  Copyright (c) 2015年 baiqiang. All rights reserved.
//

#import "BQTransitionAnimation.h"
#import "UIView+BQChangeFrameValue.h"

const CGFloat duration = 0.75f;

@interface BQTransitionAnimation ()
{
    TransitionAnimationType _animationType;
}

@end

@implementation BQTransitionAnimation
- (instancetype)initWithAnimationType:(TransitionAnimationType)animationType {
    self = [super init];
    if (self != nil) {
        _animationType = animationType;
    }
    return self;
}
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return duration;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    switch (_animationType) {
        case AnimationType_Right_Bottom:
            [self startAnimationTypeRightBottomWithTransitionContext:transitionContext];
            break;
        case AnimationType_Alpha_Change:
            [self startAnimationTypeAlphaChangeWithTransitionContext:transitionContext];
            break;
        case AnimationType_Rotate:
            [self startAnimationTypeRotateWithTransitionContext:transitionContext];
            break;
        case AnimationType_Scale:
            [self startAnimationTypeScaleWithTransitionContext:transitionContext];
            break;
        default:
            break;
    }
    return;
}

/**
 *  位移动画
 */
- (void)startAnimationTypeRightBottomWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIView *animationView = [self animationViewFromTransitionContext:transitionContext];
    animationView.x = animationView.width;
    animationView.y = animationView.height;
    animationView.alpha = 0;
    [UIView animateWithDuration:duration animations:^{
        animationView.x = 0;
        animationView.y = 0;
        animationView.alpha = 1;
    } completion:^(BOOL finished) {
        [self completeAnimationWithAnimationView:animationView transitionContext:transitionContext];
    }];
}

/**
 *  透明渐变动画
 */
- (void)startAnimationTypeAlphaChangeWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIView *animationView = [self animationViewFromTransitionContext:transitionContext];
    animationView.alpha = 0;
    [UIView animateWithDuration:duration animations:^{
        animationView.alpha = 1;
    } completion:^(BOOL finished) {
        [self completeAnimationWithAnimationView:animationView transitionContext:transitionContext];
    }];
}

/**
 *  旋转缩放动画
 */
- (void)startAnimationTypeRotateWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIView *animationView = [self animationViewFromTransitionContext:transitionContext];
    animationView.transform = CGAffineTransformConcat(CGAffineTransformRotate(animationView.transform, M_PI * 3), CGAffineTransformScale(animationView.transform, 0.001, 0.001));
    [UIView animateWithDuration:duration animations:^{
        animationView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self completeAnimationWithAnimationView:animationView transitionContext:transitionContext];
    }];
}

/**
 *  缩放动画
 */
- (void)startAnimationTypeScaleWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIView *animationView = [self animationViewFromTransitionContext:transitionContext];
    animationView.transform = CGAffineTransformScale(animationView.transform, 0.001, 0.001);
    [UIView animateWithDuration:duration animations:^{
        animationView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self completeAnimationWithAnimationView:animationView transitionContext:transitionContext];
    }];
}


- (UIView *)animationViewFromTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toViewController.view;
    //对需要动画的视图进行截图，并对截图做动画能较大的提升效率
    UIView *animationView = [toView snapshotViewAfterScreenUpdates:YES];
    [transitionContext.containerView addSubview:animationView];
    return animationView;
}
- (void)completeAnimationWithAnimationView:(UIView *)animationView transitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toViewController.view;
    //正对于Custom推送toView有可能为第一视图控制器，若此时是从第二视图控制器返回，则第一视图控制器视图已经被添加在界面上就不需要再次添加
    if (toView.superview == nil) {
        [transitionContext.containerView addSubview:toView];
    }
    //完成动画的截图移除
    [animationView removeFromSuperview];
    //若转场动画没被打断，则转场动画完成
    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
}
@end

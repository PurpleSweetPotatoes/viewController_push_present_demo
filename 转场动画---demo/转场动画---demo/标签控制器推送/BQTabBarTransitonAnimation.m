//
//  BQTabBarTransitonAnimation.m
//  转场动画---demo
//
//  Created by baiqiang on 16/2/25.
//  Copyright © 2016年 baiqiang. All rights reserved.
//

#import "BQTabBarTransitonAnimation.h"
#import "UIView+BQChangeFrameValue.h"

static CGFloat const durationTime = 0.25;

@interface BQTabBarTransitonAnimation ()
{
    BOOL _isAscending;
}
@end

@implementation BQTabBarTransitonAnimation

- (instancetype)initWithAscending:(BOOL)flag {
    self = [super init];
    if (self != nil) {
        _isAscending = flag;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return durationTime;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toVc.view;
    toView.frame = transitionContext.containerView.bounds;
    toView.x = _isAscending ? transitionContext.containerView.width : -transitionContext.containerView.width;
    [transitionContext.containerView addSubview:toView];
    [UIView animateWithDuration:durationTime animations:^{
        toView.frame = transitionContext.containerView.bounds;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}
@end

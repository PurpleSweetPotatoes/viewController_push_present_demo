//
//  BQInteractionTransition.m
//  转场动画---demo
//
//  Created by baiqiang on 16/2/24.
//  Copyright © 2016年 baiqiang. All rights reserved.
//

#import "BQTransitioningDelegate.h"
#import "BQTransitionAnimation.h"
#import "BQpercentDrivenInteractive.h"

@interface BQTransitioningDelegate ()

@end

@implementation BQTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[BQTransitionAnimation alloc] initWithAnimationType:AnimationType_Alpha_Change];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[BQTransitionAnimation alloc] initWithAnimationType:AnimationType_Rotate];
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator {
    if (self.gesture != nil) {
        return [[BQpercentDrivenInteractive alloc] initWithPanGesture:self.gesture];
    }
    return nil;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator{
    if (self.gesture != nil) {
        return [[BQpercentDrivenInteractive alloc] initWithPanGesture:self.gesture];
    }
    return nil;
}

@end

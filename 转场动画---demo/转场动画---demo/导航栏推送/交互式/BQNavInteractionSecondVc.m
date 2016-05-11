//
//  BQNavigationSecondVc.m
//  转场动画---demo
//
//  Created by baiqiang on 16/2/24.
//  Copyright © 2016年 baiqiang. All rights reserved.
//

#import "BQNavInteractionSecondVc.h"
#import "BQTransitionAnimation.h"
#import "BQpercentDrivenInteractive.h"

@interface BQNavInteractionSecondVc ()<UINavigationControllerDelegate>
{
    BOOL _isInteraction;
}
@property (nonatomic, strong) UIScreenEdgePanGestureRecognizer *panGesture;
@end

@implementation BQNavInteractionSecondVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _isInteraction = NO;
    
    [self.backBtn addTarget:self action:@selector(removeselfBtnClickedEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addGestureRecognizer:self.panGesture];
}
- (void)removeselfBtnClickedEvent:(UIButton *)sender {
    if (sender != nil) {
        _isInteraction = NO;
    }
    self.navigationController.delegate = self;
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)panGestureChangeEvent:(UIScreenEdgePanGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        _isInteraction = YES;
        [self removeselfBtnClickedEvent:nil];
    }
}
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    return [[BQTransitionAnimation alloc] initWithAnimationType:AnimationType_Scale];
}
- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    if (_isInteraction == YES) {
        return [[BQpercentDrivenInteractive alloc] initWithPanGesture:self.panGesture];
    }
    return nil;
}
- (UIScreenEdgePanGestureRecognizer *)panGesture {
    if (_panGesture == nil) {
        _panGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureChangeEvent:)];
        _panGesture.edges = UIRectEdgeLeft;
    }
    return _panGesture;
}
@end

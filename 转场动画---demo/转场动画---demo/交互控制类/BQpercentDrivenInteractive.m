//
//  BQpercentDrivenInteractive.m
//  VCTransitionAnimation_demo
//
//  Created by baiqiang on 16/2/23.
//  Copyright © 2016年 baiqiang. All rights reserved.
//

#import "BQpercentDrivenInteractive.h"

#define Screen_Width [UIScreen mainScreen].bounds.size.width 

@interface BQpercentDrivenInteractive ()
{
    //控制交互动画完成度的手势
    UIScreenEdgePanGestureRecognizer *_gesture;
    id<UIViewControllerContextTransitioning> _transitionContext;
}
@end

@implementation BQpercentDrivenInteractive
- (instancetype)initWithPanGesture:(UIScreenEdgePanGestureRecognizer *)gesture {
    self = [super init];
    if (self) {
        _gesture = gesture;
        //添加手势触发事件
        [_gesture addTarget:self action:@selector(updateViewContorllerTransition:)];
    }
    return self;
}
- (void)dealloc {
    [_gesture removeTarget:self action:@selector(updateViewContorllerTransition:)];
}
//根据手势状态来更新交互动画操作
- (void)updateViewContorllerTransition:(UIScreenEdgePanGestureRecognizer *)sender {
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            
            break;
        case UIGestureRecognizerStateChanged:
            [self updateInteractiveTransition:[self completPercentFromGesture]];
            break;
        case UIGestureRecognizerStateEnded:
        {
            if ([self completPercentFromGesture] >= 0.5) {
                [self finishInteractiveTransition];
            }else {
                [self cancelInteractiveTransition];
            }
        }
            break;
        default:
            [self cancelInteractiveTransition];
            break;
    }
}
//开始交互动画时调用
- (void)startInteractiveTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    _transitionContext = transitionContext;
    [super startInteractiveTransition:transitionContext];
}
//根据手势计算当前手势的完成度
- (CGFloat)completPercentFromGesture {
    UIView *sourceView = _transitionContext.containerView;
    CGPoint point = [_gesture locationInView:sourceView];
    CGFloat percent = 0;
    if (_gesture.edges == UIRectEdgeRight) {
        percent = (Screen_Width - point.x) / Screen_Width;
    }else {
        percent = point.x / Screen_Width;
    }
    NSLog(@"%lf",percent);
    return percent;
}
@end

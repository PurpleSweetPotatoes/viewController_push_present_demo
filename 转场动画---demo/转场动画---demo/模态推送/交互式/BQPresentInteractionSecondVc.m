//
//  BQPresentInteractionSecondVc.m
//  转场动画---demo
//
//  Created by baiqiang on 16/2/24.
//  Copyright © 2016年 baiqiang. All rights reserved.
//

#import "BQPresentInteractionSecondVc.h"
#import "BQPresentInteractionFirstVc.h"
#import "BQTransitioningDelegate.h"

@interface BQPresentInteractionSecondVc ()
@property (nonatomic, strong) UIScreenEdgePanGestureRecognizer *gesture;
@end

@implementation BQPresentInteractionSecondVc

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
    [self.backBtn addTarget:self action:@selector(backBtnClickedEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addGestureRecognizer:self.gesture];
}

#pragma mark - 事件响应方法
- (void)backBtnClickedEvent:(UIButton *)sender {
    if (sender != nil) {
        ((BQTransitioningDelegate *)self.preVc.transitionDelegate).gesture = nil;
    }else{
        __weak typeof(self) weakSelf = self;
        ((BQTransitioningDelegate *)self.preVc.transitionDelegate).gesture = weakSelf.gesture;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)gestureSliderChange:(UIScreenEdgePanGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        [self backBtnClickedEvent:nil];
    }
}
#pragma mark - Method

#pragma mark - set方法

#pragma mark - get方法
- (UIScreenEdgePanGestureRecognizer *)gesture {
    if (_gesture == nil) {
        _gesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(gestureSliderChange:)];
        _gesture.edges = UIRectEdgeLeft;
    }
    return _gesture;
}
@end

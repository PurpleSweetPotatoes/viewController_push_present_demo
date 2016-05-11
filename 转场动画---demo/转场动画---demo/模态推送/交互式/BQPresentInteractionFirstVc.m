//
//  BQPresentInteractionFirstVc.m
//  转场动画---demo
//
//  Created by baiqiang on 16/2/24.
//  Copyright © 2016年 baiqiang. All rights reserved.
//

#import "BQPresentInteractionFirstVc.h"
#import "BQPresentInteractionSecondVc.h"
#import "BQTransitioningDelegate.h"

@interface BQPresentInteractionFirstVc ()
@property (nonatomic, strong) UIScreenEdgePanGestureRecognizer *gesture;
@end

@implementation BQPresentInteractionFirstVc

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
    [self.view addGestureRecognizer:self.gesture];
}

#pragma mark - 事件响应方法
- (void)showNextVcBtnClickedEvent:(UIButton *)sender {
    BQPresentInteractionSecondVc *nextVc = [[BQPresentInteractionSecondVc alloc] init];
    nextVc.modalPresentationStyle = UIModalPresentationCustom;
    //将转场代理设置为单独的一个对象，这样方便控制其是否需要交互
    nextVc.transitioningDelegate = self.transitionDelegate;
    nextVc.preVc = self;
    //通过判断是否通过按钮点击推出
    if (sender != nil) {
        //按钮点击推出，则转场代理手势设置为nil
        self.transitionDelegate.gesture = nil;
    }else {
        //非按钮点击推出(手势交互),则将手势传入转场代理,转场代理根据此手势来进行交互比例判断
        self.transitionDelegate.gesture = self.gesture;
    }
    [self presentViewController:nextVc animated:YES completion:nil];
}
- (void)gestureSliderEvent:(UIScreenEdgePanGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        //模态推送按钮事件
        [self showNextVcBtnClickedEvent:nil];
    }
}
#pragma mark - Method

#pragma mark - set方法

#pragma mark - get方法
- (UIScreenEdgePanGestureRecognizer *)gesture {
    if (_gesture == nil) {
        _gesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(gestureSliderEvent:)];
        _gesture.edges = UIRectEdgeRight;
    }
    return _gesture;
}
- (BQTransitioningDelegate *)transitionDelegate {
    if (_transitionDelegate == nil) {
        _transitionDelegate = [[BQTransitioningDelegate alloc] init];
    }
    return _transitionDelegate;
}
@end

//
//  BQNavigationSecondVc.m
//  转场动画---demo
//
//  Created by baiqiang on 16/2/24.
//  Copyright © 2016年 baiqiang. All rights reserved.
//

#import "BQNavSecondVc.h"
#import "BQTransitionAnimation.h"

@interface BQNavSecondVc ()<UINavigationControllerDelegate>

@end

@implementation BQNavSecondVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.backBtn addTarget:self action:@selector(removeselfBtnClickedEvent:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)removeselfBtnClickedEvent:(UIButton *)sender {
    self.navigationController.delegate = self;
    [self.navigationController popViewControllerAnimated:YES];
}
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    return [[BQTransitionAnimation alloc] initWithAnimationType:AnimationType_Scale];
}
@end

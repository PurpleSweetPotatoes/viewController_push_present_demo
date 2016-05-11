//
//  BQBaseVc.m
//  转场动画---demo
//
//  Created by baiqiang on 16/2/24.
//  Copyright © 2016年 baiqiang. All rights reserved.
//

#import "BQBaseVc.h"
#import "BQFirstVc.h"
#import "BQSecondVc.h"
#import "BQThirdVc.h"
#import "BQTabBarTransitonAnimation.h"

@interface BQBaseVc ()<UITabBarControllerDelegate>
@property (nonatomic, strong) UITabBarController *tabBarController;
@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;
@end

@implementation BQBaseVc

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
    BQFirstVc *firstVc = [[BQFirstVc alloc] init];
    UITabBarItem *firstItem = [[UITabBarItem alloc] initWithTitle:@"first" image:nil selectedImage:nil];
    firstVc.tabBarItem = firstItem;

    BQSecondVc *secondVc = [[BQSecondVc alloc] init];
    UITabBarItem *secondItem = [[UITabBarItem alloc] initWithTitle:@"second" image:nil selectedImage:nil];
    secondVc.tabBarItem = secondItem;
    
    BQThirdVc *thirdVc = [[BQThirdVc alloc] init];
    UITabBarItem *thirdItem = [[UITabBarItem alloc] initWithTitle:@"third" image:nil selectedImage:nil];
    thirdVc.tabBarItem = thirdItem;
    
    self.tabBarController.viewControllers = @[firstVc, secondVc, thirdVc];
}

- (void)initUI{
    [self addChildViewController:self.tabBarController];
    [self.view addSubview:self.tabBarController.view];
    NSLog(@"%@",NSStringFromCGRect(self.tabBarController.view.bounds));
}

#pragma mark - 事件响应方法
- (void)panGestureSliderChange:(UIPanGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        
    }
}
#pragma mark - UITabBarControllerDelegate Method

- (id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    NSInteger fromIndex = [tabBarController.viewControllers indexOfObject:fromVC];
    NSInteger toIndex = [tabBarController.viewControllers indexOfObject:toVC];
    return [[BQTabBarTransitonAnimation alloc] initWithAscending:toIndex > fromIndex];
}
- (nullable id <UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController
                               interactionControllerForAnimationController: (id <UIViewControllerAnimatedTransitioning>)animationController {
    return nil;
}
#pragma mark - set方法

#pragma mark - get方法
- (UITabBarController *)tabBarController {
    if (_tabBarController == nil) {
        _tabBarController = [[UITabBarController alloc] init];
        _tabBarController.delegate = self;
    }
    return _tabBarController;
}
- (UIPanGestureRecognizer *)panGesture {
    if (_panGesture == nil) {
        _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureSliderChange:)];
    }
    return _panGesture;
}
@end

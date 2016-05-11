//
//  BaseFirstViewController.m
//  转场动画---demo
//
//  Created by baiqiang on 16/2/24.
//  Copyright © 2016年 baiqiang. All rights reserved.
//

#import "BaseFirstViewController.h"

@interface BaseFirstViewController ()

@end

@implementation BaseFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.400 green:0.800 blue:1.000 alpha:1.000];
    [self.view addSubview:self.showNextVcBtn];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"first" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backItem;
}

- (UIButton *)showNextVcBtn {
    if (_showNextVcBtn == nil) {
        _showNextVcBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_showNextVcBtn setTitle:@"showNextVc" forState:UIControlStateNormal];
        _showNextVcBtn.bounds = CGRectMake(0, 0, 200, 30);
        _showNextVcBtn.center = self.view.center;
    }
    return _showNextVcBtn;
}

@end

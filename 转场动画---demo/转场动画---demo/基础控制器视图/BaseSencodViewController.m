//
//  BaseSencodViewController.m
//  转场动画---demo
//
//  Created by baiqiang on 16/2/24.
//  Copyright © 2016年 baiqiang. All rights reserved.
//

#import "BaseSencodViewController.h"

@interface BaseSencodViewController ()

@end

@implementation BaseSencodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.backBtn];
}

- (UIButton *)backBtn {
    if (_backBtn == nil) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.bounds = CGRectMake(0, 0, 200, 30);
        [_backBtn setTitle:@"removeSelfVc" forState:UIControlStateNormal];
        _backBtn.center = self.view.center;
    }
    return _backBtn;
}

@end

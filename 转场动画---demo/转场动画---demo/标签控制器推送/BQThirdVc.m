//
//  BQThirdVc.m
//  转场动画---demo
//
//  Created by baiqiang on 16/2/25.
//  Copyright © 2016年 baiqiang. All rights reserved.
//

#import "BQThirdVc.h"

@interface BQThirdVc ()

@end

@implementation BQThirdVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithWhite:0.600 alpha:1.000];
    UILabel *disLabel = [[UILabel alloc] initWithFrame:self.view.bounds];
    disLabel.backgroundColor = [UIColor clearColor];
    disLabel.text = NSStringFromClass([self class]);
    disLabel.textAlignment = NSTextAlignmentCenter;
    disLabel.textColor = [UIColor whiteColor];
    disLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:disLabel];
}



@end

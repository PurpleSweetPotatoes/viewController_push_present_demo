//
//  BQFirstVc.m
//  转场动画---demo
//
//  Created by baiqiang on 16/2/25.
//  Copyright © 2016年 baiqiang. All rights reserved.
//

#import "BQFirstVc.h"

@interface BQFirstVc ()

@end

@implementation BQFirstVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *disLabel = [[UILabel alloc] initWithFrame:self.view.bounds];
    disLabel.backgroundColor = [UIColor clearColor];
    disLabel.text = NSStringFromClass([self class]);
    disLabel.textAlignment = NSTextAlignmentCenter;
    disLabel.textColor = [UIColor whiteColor];
    disLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:disLabel];
    self.view.backgroundColor = [UIColor colorWithRed:0.400 green:0.800 blue:1.000 alpha:1.000];
    
}



@end

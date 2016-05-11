//
//  BQpercentDrivenInteractive.h
//  VCTransitionAnimation_demo
//
//  Created by baiqiang on 16/2/23.
//  Copyright © 2016年 baiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 转场动画中的交互控制类
 */
@interface BQpercentDrivenInteractive : UIPercentDrivenInteractiveTransition

- (instancetype)initWithPanGesture:(UIScreenEdgePanGestureRecognizer *)gesture;
@end

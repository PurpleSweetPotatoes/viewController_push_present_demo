//
//  BQInteractionTransition.h
//  转场动画---demo
//
//  Created by baiqiang on 16/2/24.
//  Copyright © 2016年 baiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BQTransitioningDelegate : NSObject <UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) UIScreenEdgePanGestureRecognizer *gesture;
@end

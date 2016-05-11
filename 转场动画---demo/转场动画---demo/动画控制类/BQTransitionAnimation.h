//
//  BQTransitionAnimation.h
//  模态推送动画
//
//  Created by baiqiang on 15/9/17.
//  Copyright (c) 2015年 baiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TransitionAnimationType) {
    AnimationType_Right_Bottom,
    AnimationType_Alpha_Change,
    AnimationType_Rotate,
    AnimationType_Scale
};


@interface BQTransitionAnimation : NSObject <UIViewControllerAnimatedTransitioning>
- (instancetype)initWithAnimationType:(TransitionAnimationType)animationType;
@end

//
//  UIViewController+PresentAdd.h
//  testNavGesDemo
//
//  Created by Binbin on 2018/5/30.
//  Copyright © 2018年 Binbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (PresentAdd)<UIViewControllerTransitioningDelegate>
@property (nonatomic,strong) UIPercentDrivenInteractiveTransition * percentDrivenTransition;
- (void)addScreenLeftEdgePanGestureRecognizer:(UIView *)view;
@end

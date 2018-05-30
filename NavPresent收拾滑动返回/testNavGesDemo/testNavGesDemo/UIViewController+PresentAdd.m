//
//  UIViewController+PresentAdd.m
//  testNavGesDemo
//
//  Created by Binbin on 2018/5/30.
//  Copyright © 2018年 Binbin. All rights reserved.
//

#import "UIViewController+PresentAdd.h"
#import <objc/runtime.h>
#import "MDPresentTransitionAnimated.h"
#import "MDDismissTransitionAnimated.h"
@implementation UIViewController (PresentAdd)


- (void)addScreenLeftEdgePanGestureRecognizer:(UIView *)view{
    UIScreenEdgePanGestureRecognizer *screenEdgePan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(edgePanGesture:)];
    screenEdgePan.edges = UIRectEdgeLeft;
    [view addGestureRecognizer:screenEdgePan];
}

- (void)edgePanGesture:(UIScreenEdgePanGestureRecognizer *)edgePan{
    CGFloat progress = fabs([edgePan translationInView:[UIApplication sharedApplication].keyWindow].x/[UIApplication sharedApplication].keyWindow.bounds.size.width);
    
    NSLog(@"%f",[edgePan translationInView:[UIApplication sharedApplication].keyWindow].x);
    if (edgePan.state == UIGestureRecognizerStateBegan) {
        self.percentDrivenTransition = [[UIPercentDrivenInteractiveTransition alloc]init];
        if (edgePan.edges == UIRectEdgeLeft) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }else if (edgePan.state == UIGestureRecognizerStateChanged){
        [self.percentDrivenTransition updateInteractiveTransition:progress];
    }else if (edgePan.state == UIGestureRecognizerStateEnded || edgePan.state == UIGestureRecognizerStateCancelled){
        if (progress > 0.5) {
            [self.percentDrivenTransition finishInteractiveTransition];
        }else{
            [self.percentDrivenTransition cancelInteractiveTransition];
        }
        self.percentDrivenTransition = nil;
    }
}


#pragma Mark - UIViewControllerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [[MDPresentTransitionAnimated alloc] init];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[MDDismissTransitionAnimated alloc] init];
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator{
    return self.percentDrivenTransition;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator{
    return self.percentDrivenTransition;
}

static char kPercentDrivenTransitionKey;
#pragma mark - Setter,Getter
- (void)setPercentDrivenTransition:(UIPercentDrivenInteractiveTransition *)percentDrivenTransition
{
    objc_setAssociatedObject(self, &kPercentDrivenTransitionKey, percentDrivenTransition, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIPercentDrivenInteractiveTransition *)percentDrivenTransition
{
    return objc_getAssociatedObject(self, &kPercentDrivenTransitionKey);
}
@end

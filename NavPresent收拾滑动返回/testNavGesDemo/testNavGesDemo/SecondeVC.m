//
//  SecondeVC.m
//  testNavGesDemo
//
//  Created by Binbin on 2018/5/30.
//  Copyright © 2018年 Binbin. All rights reserved.
//

#import "SecondeVC.h"
#import "UIViewController+PresentAdd.h"
@interface SecondeVC ()<UIViewControllerTransitioningDelegate>

@end

@implementation SecondeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.transitioningDelegate = self;
    [self addScreenLeftEdgePanGestureRecognizer:self.view];
}


@end

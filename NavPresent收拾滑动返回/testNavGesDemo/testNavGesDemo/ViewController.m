//
//  ViewController.m
//  testNavGesDemo
//
//  Created by Binbin on 2018/5/30.
//  Copyright © 2018年 Binbin. All rights reserved.
//

#import "ViewController.h"
#import "SecondeVC.h"
#import "PresentTransition.h"


@interface ViewController ()<UIViewControllerTransitioningDelegate>
@property (nonatomic, retain) UIPercentDrivenInteractiveTransition * percentDrivenTransition;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"aaa";

}
- (IBAction)click:(id)sender {
    UIViewController *presentVC = [[SecondeVC alloc] init];
    [self presentViewController:presentVC animated:YES completion:nil];
}





@end

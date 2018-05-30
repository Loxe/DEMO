//
//  PresentTransition.h
//  testNavGesDemo
//
//  Created by Binbin on 2018/5/30.
//  Copyright © 2018年 Binbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PresentTransition : NSObject<UIViewControllerAnimatedTransitioning>
+ (instancetype)shared;
@end

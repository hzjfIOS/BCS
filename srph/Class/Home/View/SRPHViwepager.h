//
//  SRPHViwepager.h
//  srph
//
//  Created by 王祥 on 2017/4/11.
//  Copyright © 2017年 王祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SRPHViwepager : UIView
#pragma 属性

@property (strong, nonatomic) NSTimer *myTimer;

@property (assign, nonatomic) int i;

#pragma 方法

- (instancetype)initWithFrame:(CGRect)frame;

@end

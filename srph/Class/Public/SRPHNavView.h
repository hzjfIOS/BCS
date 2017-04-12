//
//  SRPHNavView.h
//  scph
//
//  Created by 王祥 on 2017/4/6.
//  Copyright © 2017年 王祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SRPHNavView : UIView

@property (strong, nonatomic) UILabel *titleLabel;

@property (strong, nonatomic) UIButton *leftButton;

@property (strong, nonatomic) UIButton *rightButton;

- (instancetype)initWithTitle:(NSString *)title leftButtonTitle:(NSString *)leftTitle leftButtonIma:(NSString *)leftIma rightButtonTitle:(NSString *)rightTitle rightButtonIma:(NSString *)rightIma;



@end

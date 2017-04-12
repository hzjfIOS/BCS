//
//  SRPHNavView.m
//  scph
//
//  Created by 王祥 on 2017/4/6.
//  Copyright © 2017年 王祥. All rights reserved.
//

#import "SRPHNavView.h"

@implementation SRPHNavView


- (instancetype)initWithTitle:(NSString *)title leftButtonTitle:(NSString *)leftTitle leftButtonIma:(NSString *)leftIma rightButtonTitle:(NSString *)rightTitle rightButtonIma:(NSString *)rightIma {
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
        if (title.length) {
            self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH(60), 20, WIDTH(255), 44)];
            self.titleLabel.text = title;
            self.titleLabel.textAlignment = NSTextAlignmentCenter;
            [self addSubview:self.titleLabel];
        }
        if (leftTitle.length || leftIma.length) {
            self.leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, WIDTH(60), 44)];
            [self.leftButton setTitle:@"返回" forState:UIControlStateNormal];
            [self addSubview:self.leftButton];
        }
        
        if (rightTitle.length || rightIma.length) {
            
        }
        
    }
    
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

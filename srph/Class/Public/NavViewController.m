//
//  NavViewController.m
//  NavigationDemo
//
//  Created by 南开承盛 on 2017/1/17.
//  Copyright © 2017年 南开承盛. All rights reserved.
//

#import "NavViewController.h"

@interface NavViewController ()

@end

@implementation NavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
    [self.view addSubview:_navView];
    self.navView.hidden = YES;
    
    [self removeAllSuperSubview];
    // Do any additional setup after loading the view.
}

- (void)removeAllSuperSubview{
    
    for (UIView *seedView in self.view.subviews) {
        
        if ([seedView isKindOfClass:[self.navigationBar class]]) {
            
            [seedView removeFromSuperview];
            break;
        }
    }
}

- (void)createLeftButton:(NSString *)title andTitleColor:(UIColor *)titleColor andBgImaName:(NSString *)imaName andBgColor:(UIColor *)bgColor {
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, 50, 44)];
    [leftBtn setTitle:title forState:UIControlStateNormal];
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:16 weight:1];
    [leftBtn setTitleColor:titleColor forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(popViewControllerAnimated:) forControlEvents:UIControlEventTouchUpInside];
    [self.navView addSubview:leftBtn];
}

- (void)createRigthButton {
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
        CATransition *animation = [CATransition animation];
        animation.duration = 0.5f;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.type = kCATransitionPush;
        animation.subtype = kCATransitionFromRight;
        [self.view.layer addAnimation:animation forKey:nil];
        [super pushViewController:viewController animated:NO];
        return;
    }
    [super pushViewController:viewController animated:YES];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

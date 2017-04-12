//
//  SRPHLoginViewController.m
//  scph
//
//  Created by 王祥 on 2017/4/6.
//  Copyright © 2017年 王祥. All rights reserved.
//

#import "SRPHLoginViewController.h"
#import "TabBarViewController.h"
//#import <UMSocialQQHandler.h>
@interface SRPHLoginViewController ()
@property (strong, nonatomic) UITextField *userNameTextF;
@property (strong, nonatomic) UITextField *passwordTextF;

@property (strong, nonatomic) UIButton *loginButton;

@end

@implementation SRPHLoginViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.userNameTextF = [[UITextField alloc]initWithFrame:CGRectMake(WIDTH(20), HEIGHT(200), WIDTH(335), HEIGHT(44))];
    self.userNameTextF.placeholder = @"请输入用户名";
    self.userNameTextF.font = [UIFont systemFontOfSize:12];
    self.userNameTextF.layer.cornerRadius = WIDTH(5);
    self.userNameTextF.layer.borderWidth = 1;
    self.userNameTextF.layer.borderColor = [UIColor blackColor].CGColor;
    [self.view addSubview:self.userNameTextF];
    
    
    self.passwordTextF = [[UITextField alloc]initWithFrame:CGRectMake(WIDTH(20), HEIGHT(254), WIDTH(335), HEIGHT(44))];
    self.passwordTextF.placeholder = @"请输入密码";
    self.passwordTextF.secureTextEntry = YES;
    self.passwordTextF.font = [UIFont systemFontOfSize:12];
    self.passwordTextF.layer.cornerRadius = WIDTH(5);
    self.passwordTextF.layer.borderWidth = 1;
    self.passwordTextF.layer.borderColor = [UIColor blackColor].CGColor;
    [self.view addSubview:self.passwordTextF];
    
    
    self.loginButton = [[UIButton alloc]initWithFrame:CGRectMake(WIDTH(50), HEIGHT(450), WIDTH(275), HEIGHT(44))];
    self.loginButton.layer.cornerRadius = WIDTH(5);
    self.loginButton.backgroundColor = [UIColor yellowColor];
    self.loginButton.alpha = 0;
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginButton];
    
    CGPoint userNameCenter = self.userNameTextF.center;
    CGPoint passwordCenter = self.passwordTextF.center;
    userNameCenter.x -= 400;
    passwordCenter.x -= 400;
    self.userNameTextF.center = userNameCenter;
    self.passwordTextF.center = passwordCenter;
    
    userNameCenter.x += 400;
    passwordCenter.x += 400;
    
    [UIView animateWithDuration:0.5 animations:^{
        self.userNameTextF.center = userNameCenter;
    }];
    
    [UIView animateWithDuration:0.5 delay:0.5 options:UIViewAnimationOptionLayoutSubviews animations:^{
        
        self.passwordTextF.center = passwordCenter;
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.5 delay:0.3 usingSpringWithDamping:0.2 initialSpringVelocity:0 options:0 animations:^{
            self.loginButton.alpha = 1;
            CGPoint center = self.loginButton.center;
            center.y -= 100;
            self.loginButton.center = center;
            
        } completion:nil];
        
        
    }];


    // Do any additional setup after loading the view.
}



- (void)loginAction {
    [self dismissViewControllerAnimated:NO completion:nil];
    TabBarViewController *myTabBar = [[TabBarViewController alloc] init];
    [self presentViewController:myTabBar animated:YES completion:nil];
//    [self getAuthWithUserInfoFromQQ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

//- (void)getAuthWithUserInfoFromSina
//{
//    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_Sina currentViewController:nil completion:^(id result, NSError *error) {
//        if (error) {
//            
//        } else {
//            UMSocialUserInfoResponse *resp = result;
//            
//            // 授权信息
//            NSLog(@"Sina uid: %@", resp.uid);
//            NSLog(@"Sina accessToken: %@", resp.accessToken);
//            NSLog(@"Sina refreshToken: %@", resp.refreshToken);
//            NSLog(@"Sina expiration: %@", resp.expiration);
//            
//            // 用户信息
//            NSLog(@"Sina name: %@", resp.name);
//            NSLog(@"Sina iconurl: %@", resp.iconurl);
//            NSLog(@"Sina gender: %@", resp.gender);
//            
//            // 第三方平台SDK源数据
//            NSLog(@"Sina originalResponse: %@", resp.originalResponse);
//        }
//    }];
//}
//- (void)getAuthWithUserInfoFromWechat
//{
//    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_WechatSession currentViewController:nil completion:^(id result, NSError *error) {
//        if (error) {
//            
//        } else {
//            UMSocialUserInfoResponse *resp = result;
//            
//            // 授权信息
//            NSLog(@"Wechat uid: %@", resp.uid);
//            NSLog(@"Wechat openid: %@", resp.openid);
//            NSLog(@"Wechat accessToken: %@", resp.accessToken);
//            NSLog(@"Wechat refreshToken: %@", resp.refreshToken);
//            NSLog(@"Wechat expiration: %@", resp.expiration);
//            
//            // 用户信息
//            NSLog(@"Wechat name: %@", resp.name);
//            NSLog(@"Wechat iconurl: %@", resp.iconurl);
//            NSLog(@"Wechat gender: %@", resp.gender);
//            
//            // 第三方平台SDK源数据
//            NSLog(@"Wechat originalResponse: %@", resp.originalResponse);
//        }
//    }];
//}
//
//- (void)getAuthWithUserInfoFromQQ
//{
//    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_QQ currentViewController:nil completion:^(id result, NSError *error) {
//        if (error) {
//            
//        } else {
//            UMSocialUserInfoResponse *resp = result;
//            
//            // 授权信息
//            NSLog(@"QQ uid: %@", resp.uid);
//            NSLog(@"QQ openid: %@", resp.openid);
//            NSLog(@"QQ accessToken: %@", resp.accessToken);
//            NSLog(@"QQ expiration: %@", resp.expiration);
//            
//            // 用户信息
//            NSLog(@"QQ name: %@", resp.name);
//            NSLog(@"QQ iconurl: %@", resp.iconurl);
//            NSLog(@"QQ gender: %@", resp.gender);
//            
//            // 第三方平台SDK源数据
//            NSLog(@"QQ originalResponse: %@", resp.originalResponse);
//        }
//    }];
//}

@end

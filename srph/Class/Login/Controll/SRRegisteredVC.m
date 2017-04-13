//
//  SRRegisteredVC.m
//  srph
//
//  Created by 王祥 on 2017/4/13.
//  Copyright © 2017年 王祥. All rights reserved.
//

#import "SRRegisteredVC.h"
#import "SRTextField.h"
#import <SMS_SDK/SMSSDK.h>
#import "SRSetPasswordVC.h"
@interface SRRegisteredVC ()

@property (strong, nonatomic) SRTextField *telNumberText;

@property (strong, nonatomic) SRTextField *authCodeText;

@end

@implementation SRRegisteredVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.telNumberText = [[SRTextField alloc] initWithFrame:CGRectMake(WIDTH(20), HEIGHT(100), WIDTH(335), HEIGHT(44))];
    self.telNumberText.font = FONT(14);
    self.telNumberText.layer.cornerRadius = 5;
    self.telNumberText.layer.borderWidth = 1;
    self.telNumberText.layer.borderColor = [UIColor grayColor].CGColor;
    self.telNumberText.placeholder = @"请输入手机号码";
    [self.view addSubview:self.telNumberText];
    
    self.authCodeText = [[SRTextField alloc] initWithFrame:CGRectMake(WIDTH(20), HEIGHT(160), WIDTH(185), HEIGHT(44))];
    self.authCodeText.font = FONT(14);
    self.authCodeText.layer.cornerRadius = 5;
    self.authCodeText.layer.borderWidth = 1;
    self.authCodeText.layer.borderColor = [UIColor grayColor].CGColor;
    self.authCodeText.placeholder = @"请输入验证码";
    [self.view addSubview:self.authCodeText];

    UIButton *acquireBtn = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH(220), HEIGHT(160), WIDTH(120), HEIGHT(44))];
    acquireBtn.backgroundColor = COLOR(220, 220, 220, 1);
    [acquireBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [acquireBtn setTitleColor:[UIColor groupTableViewBackgroundColor] forState:UIControlStateNormal];
    [acquireBtn addTarget:self action:@selector(acquireAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:acquireBtn];
    
    UIButton *registeredBtn = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH(20), HEIGHT(260), WIDTH(335), HEIGHT(44))];
    registeredBtn.backgroundColor = [UIColor blueColor];
    [registeredBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registeredBtn setTitleColor:[UIColor groupTableViewBackgroundColor] forState:UIControlStateNormal];
    [registeredBtn addTarget:self action:@selector(aregisteredAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registeredBtn];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)acquireAction {
    
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.telNumberText.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
        if (!error) {
            NSLog(@"获取验证码成功");
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"短信已发送，请注意查收！" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [alert addAction:action];
            
            [self presentViewController:alert animated:YES completion:nil];
            
        } else {
            NSLog(@"错误信息：%@",error);
        }
    }];
   
}

- (void)aregisteredAction {
    [SMSSDK commitVerificationCode:self.authCodeText.text phoneNumber:self.telNumberText.text zone:@"86" result:^(SMSSDKUserInfo *userInfo, NSError *error) {
        
        {
            if (!error)
            {
                
                NSLog(@"验证成功");
                [self.navigationController pushViewController:[[SRSetPasswordVC alloc] init] animated:YES];
            }
            else
            {
                NSLog(@"错误信息:%@",error);
            }
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

//
//  SRSetPasswordVC.m
//  srph
//
//  Created by 王祥 on 2017/4/13.
//  Copyright © 2017年 王祥. All rights reserved.
//

#import "SRSetPasswordVC.h"
#import "SRTextField.h"
@interface SRSetPasswordVC ()

@property (strong, nonatomic) SRTextField *passwordText;

@property (strong, nonatomic) SRTextField *nextPasswordText;
@end

@implementation SRSetPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.passwordText = [[SRTextField alloc] initWithFrame:CGRectMake(WIDTH(20), HEIGHT(100), WIDTH(335), HEIGHT(44))];
    self.passwordText.font = FONT(14);
    self.passwordText.layer.cornerRadius = 5;
    self.passwordText.layer.borderWidth = 1;
    self.passwordText.layer.borderColor = [UIColor grayColor].CGColor;
    self.passwordText.placeholder = @"请输入密码";
    self.passwordText.secureTextEntry = YES;
    [self.view addSubview:self.passwordText];
    
    self.nextPasswordText = [[SRTextField alloc] initWithFrame:CGRectMake(WIDTH(20), HEIGHT(160), WIDTH(335), HEIGHT(44))];
    self.nextPasswordText.font = FONT(14);
    self.nextPasswordText.layer.cornerRadius = 5;
    self.nextPasswordText.layer.borderWidth = 1;
    self.nextPasswordText.layer.borderColor = [UIColor grayColor].CGColor;
    self.nextPasswordText.placeholder = @"请再次输入密码";
    self.nextPasswordText.secureTextEntry = YES;
    [self.view addSubview:self.nextPasswordText];
    
    UIButton *registeredBtn = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH(20), HEIGHT(260), WIDTH(335), HEIGHT(44))];
    registeredBtn.backgroundColor = [UIColor blueColor];
    [registeredBtn setTitle:@"确定" forState:UIControlStateNormal];
    [registeredBtn setTitleColor:[UIColor groupTableViewBackgroundColor] forState:UIControlStateNormal];
    [registeredBtn addTarget:self action:@selector(aregisteredAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registeredBtn];
    
    // Do any additional setup after loading the view.
}

- (void)aregisteredAction {
    if (self.passwordText.text.length) {
        if (self.passwordText.text == self.nextPasswordText.text) {
            
            
            [self.navigationController popToRootViewControllerAnimated:YES];
        }else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"两次密码不一致，请重新输入！" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [alert addAction:action];
            
            [self presentViewController:alert animated:YES completion:nil];
        }
    }else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请设置密码！" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:action];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    
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

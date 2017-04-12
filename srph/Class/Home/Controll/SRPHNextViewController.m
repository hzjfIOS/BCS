//
//  SRPHNextViewController.m
//  scph
//
//  Created by 王祥 on 2017/4/6.
//  Copyright © 2017年 王祥. All rights reserved.
//

#import "SRPHNextViewController.h"
#import "SRPHNavView.h"

@interface SRPHNextViewController ()
@property (strong, nonatomic) UIButton *loginButton;

@end

@implementation SRPHNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    SRPHNavView *navView = [[SRPHNavView alloc] initWithTitle:@"NEXT" leftButtonTitle:nil leftButtonIma:nil rightButtonTitle:nil rightButtonIma:nil];
    navView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:navView];
    
    self.loginButton = [[UIButton alloc]initWithFrame:CGRectMake(WIDTH(50), HEIGHT(450), WIDTH(275), HEIGHT(44))];
    self.loginButton.layer.cornerRadius = WIDTH(5);
    self.loginButton.backgroundColor = [UIColor yellowColor];
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginButton];
    
    // Do any additional setup after loading the view.
}

- (void)loginAction {
    [self.navigationController popViewControllerAnimated:YES];
    [self.tabBarController setHidesBottomBarWhenPushed:NO];
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

//
//  SRPHMyViewController.m
//  scph
//
//  Created by 王祥 on 2017/4/5.
//  Copyright © 2017年 王祥. All rights reserved.
//

#import "SRPHMyViewController.h"
#import "SRPHLoginViewController.h"

@interface SRPHMyViewController ()

@property (strong, nonatomic) UIButton *outButton;

@end

@implementation SRPHMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.outButton = [[UIButton alloc]initWithFrame:CGRectMake(WIDTH(50), HEIGHT(450), WIDTH(275), HEIGHT(44))];
    self.outButton.layer.cornerRadius = WIDTH(5);
    self.outButton.backgroundColor = [UIColor greenColor];
    [self.outButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.outButton addTarget:self action:@selector(outAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.outButton];

    // Do any additional setup after loading the view.
}

- (void)outAction {
   
    [self dismissViewControllerAnimated:NO completion:nil];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [self presentViewController:[[SRPHLoginViewController alloc] init] animated:NO completion:nil];
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

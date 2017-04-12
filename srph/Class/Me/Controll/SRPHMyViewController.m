//
//  SRPHMyViewController.m
//  scph
//
//  Created by admin on 2017/4/11.
//  Copyright © 2017年 商融普惠. All rights reserved.
//

#import "SRPHMyViewController.h"
#import "SRPHLoginViewController.h"
#import "SRPersonHeaderCell.h"
@interface SRPHMyViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UIButton *outButton;
@property(nonatomic,strong)UITableView *mainView;
@property(nonatomic,strong)NSArray *titleArray;
@end

@implementation SRPHMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"个人中心";
    _mainView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH ,SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    _mainView.dataSource=self;
    _mainView.delegate=self;
    _mainView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_mainView];
    _titleArray=[NSArray arrayWithObjects:@"全部订单", @"我的功能",@"免费入驻",nil];
    
    
}
#pragma mark-UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0)
    {
        return 1;
    }
    else if (section==1||section==2)
    {
        return 1;
    }
    else
    {
        return 3;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SRPersonHeaderCell *headCell=[[SRPersonHeaderCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    headCell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section==0)
    {
        return headCell;
    }
    else if (indexPath.section==1)
    {
        
    }
    
    return headCell;
}
#pragma mark-UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0)
    {
        return 0.0001;
    }
    else{
        return 40;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 200;
    }
   else if (indexPath.section==1) {
        return 100;
    }
   else if (indexPath.section==2) {
       return 160;
   }
   else {
       return 100;
   }
    
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

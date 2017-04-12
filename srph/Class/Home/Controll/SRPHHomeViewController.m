//
//  SRPHHomeViewController.m
//  scph
//
//  Created by 王祥 on 2017/4/5.
//  Copyright © 2017年 王祥. All rights reserved.
//

#import "SRPHHomeViewController.h"
#import "SRPHNextViewController.h"
#import "SRPHViwepager.h"


@interface SRPHHomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UIButton *loginButton;

@property (strong, nonatomic) UIButton *locationButton;

@property (strong, nonatomic) UITextField *searchText;

@property (strong, nonatomic) UIImageView *headIma;

@property (strong, nonatomic) UILabel *headName;

@property (strong, nonatomic) UITableView *mainTableView;

@property (strong, nonatomic) UIView *tableViewHeadView;

@property (strong, nonatomic) SRPHViwepager *viwepager;
@end

@implementation SRPHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, HEIGHT(44))];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    
    self.locationButton = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH(10), 0, WIDTH(50), HEIGHT(44))];
    [self.locationButton setTitle:@"杭州▼" forState:UIControlStateNormal];
    [self.locationButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.locationButton.titleLabel.font = FONT(14);
    [topView addSubview:self.locationButton];
    
    UILabel *backgroundLabel = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH(65), HEIGHT(7), WIDTH(260), HEIGHT(30))];
    backgroundLabel.layer.cornerRadius = WIDTH(15);
    backgroundLabel.layer.borderWidth = 1;
    backgroundLabel.layer.borderColor = [UIColor grayColor].CGColor;
    [topView addSubview:backgroundLabel];
    
    self.searchText = [[UITextField alloc] initWithFrame:CGRectMake(WIDTH(85), HEIGHT(7), WIDTH(230), HEIGHT(30))];
    self.searchText.textColor = [UIColor blackColor];
    self.searchText.font = FONT(13);
    self.searchText.placeholder = @"搜索你需要的商品内容";
    [topView addSubview:self.searchText];
    
    self.headIma = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH(330), HEIGHT(0), WIDTH(26), HEIGHT(26))];
    self.headIma.layer.cornerRadius = HEIGHT(13);
    self.headIma.layer.masksToBounds = YES;
    self.headIma.image = [UIImage imageNamed:@"s_me"];
    [topView addSubview:self.headIma];
    
    self.headName = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH(320), HEIGHT(28), WIDTH(40), HEIGHT(14))];
    self.headName.textColor = [UIColor blackColor];
    self.headName.font = FONT(12);
    self.headName.textAlignment = NSTextAlignmentCenter;
    self.headName.text = @"王祥";
    [topView addSubview:self.headName];
    
    
    self.mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20 + HEIGHT(44), SCREEN_WIDTH,SCREEN_HEIGHT - HEIGHT(44) - 69)];
    [self.view addSubview:self.mainTableView];
    
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    
    self.tableViewHeadView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, HEIGHT(200))];
    self.mainTableView.tableHeaderView = self.tableViewHeadView;
    
    self.viwepager = [[SRPHViwepager alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, HEIGHT(200))];
//    self.viwepager.backgroundColor = [UIColor redColor];
    [self.tableViewHeadView addSubview:self.viwepager];
    
    
    self.loginButton = [[UIButton alloc]initWithFrame:CGRectMake(WIDTH(50), HEIGHT(450), WIDTH(275), HEIGHT(44))];
    self.loginButton.layer.cornerRadius = WIDTH(5);
    self.loginButton.backgroundColor = [UIColor yellowColor];
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginButton];

    // Do any additional setup after loading the view.
}

- (void)loginAction {
    [self.tabBarController setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:[[SRPHNextViewController alloc] init] animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return HEIGHT(40);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
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

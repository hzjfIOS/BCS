//
//  TabBarViewController.m
//  scph
//
//  Created by 王祥 on 2017/4/5.
//  Copyright © 2017年 王祥. All rights reserved.
//

#import "TabBarViewController.h"
#import "SRPHHomeViewController.h"
#import "SRPHAroundViewController.h"
#import "SRPHMyViewController.h"
#import "SRPHShopCartViewController.h"
#import "NavViewController.h"

@interface TabBarViewController ()<UITabBarControllerDelegate>

@property (strong, nonatomic) UIView *myView;

@property (strong, nonatomic) NSArray *imaArr;

@property (strong, nonatomic) NSArray *selectImaArr;
@end

@implementation TabBarViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.backgroundColor = [UIColor whiteColor];
    
    //删除现有的tabBar
    CGRect rect = self.tabBar.frame;
    [self.tabBar removeFromSuperview];  //移除TabBarController自带的下部的条
    
    self.imaArr = @[@"home",@"location",@"cart",@"me"];
    
    self.selectImaArr = @[@"s_home",@"s_location",@"s_cart",@"s_me"];
    
    NSArray *nameArr = @[@"首页",@"附近",@"购物车",@"我的"];
    //测试添加自己的视图
    self.myView = [[UIView alloc] init];
    _myView.frame = rect;
    _myView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_myView];
    
    for (int i = 0; i < self.imaArr.count; i++) {
        UIButton *btn = [[UIButton alloc] init];
        
        NSString *imageName = [NSString stringWithFormat:@"%@",self.imaArr[i]];
        NSString *imageNameSel = [NSString stringWithFormat:@"%@", self.selectImaArr[i]];
        
        CGFloat x = i * _myView.frame.size.width / self.imaArr.count;
        btn.frame = CGRectMake(x, 0, _myView.frame.size.width /self.imaArr.count, _myView.frame.size.height);
        
        [_myView addSubview:btn];
        
        btn.tag = i;//设置按钮的标记, 方便来索引当前的按钮,并跳转到相应的视图
        
        //带参数的监听方法记得加"冒号"
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIImageView *btnIma = [[UIImageView alloc] initWithFrame:CGRectMake((_myView.frame.size.width /self.imaArr.count - 20)/2, 5, 20, 20)];
        btnIma.image = [UIImage imageNamed:imageName];
        if (i == 0) {
            btnIma.image = [UIImage imageNamed:imageNameSel];
        }
        btnIma.tag = 70410010 + i;
        [btn addSubview:btnIma];
        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, _myView.frame.size.width /self.imaArr.count, 19)];
        nameLabel.text = nameArr[i];
        nameLabel.font = FONT(13);
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.tag = 70410000 + i;
        if (i == 0) {
            nameLabel.textColor = [UIColor redColor];
        }
        [btn addSubview:nameLabel];
        
        
    }
    
    NavViewController *homeNav = [[NavViewController alloc] initWithRootViewController:[[SRPHHomeViewController alloc] init]];
    homeNav.navigationBarHidden = YES;
    
    NavViewController *AroundNav = [[NavViewController alloc] initWithRootViewController:[[SRPHAroundViewController alloc] init]];
   // AroundNav.navigationBarHidden = YES;
    
    
    NavViewController *shopCartNav = [[NavViewController alloc] initWithRootViewController:[[SRPHShopCartViewController alloc] init]];
   // shopCartNav.navigationBarHidden = YES;
    
    NavViewController *myNav = [[NavViewController alloc] initWithRootViewController:[[SRPHMyViewController alloc] init]];
   // myNav.navigationBarHidden = YES;
        // Do any additional setup after loading the view.
    
    self.viewControllers = @[homeNav,AroundNav,shopCartNav,myNav];
}



/**
 *  自定义TabBar的按钮点击事件
 */
- (void)clickBtn:(UIButton *)button {
    
    self.selectedIndex = button.tag;
    
    for (int i = 0; i < 4; i ++) {
        UILabel *nameLabel = (UILabel *)[self.view viewWithTag:70410000 + i];
        UIImageView *ima = (UIImageView *)[self.view viewWithTag:70410010 + i];
        if (button.tag == i) {
            nameLabel.textColor = [UIColor redColor];
            ima.image = [UIImage imageNamed:self.selectImaArr[i]];
        }else {
            nameLabel.textColor = [UIColor blackColor];
            ima.image = [UIImage imageNamed:self.imaArr[i]];
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setHidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed {
    [self.myView setHidden:hidesBottomBarWhenPushed];
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

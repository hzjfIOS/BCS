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
#import "SRTextField.h"
#import <CoreLocation/CoreLocation.h>
#import "SRMainCollectionCell.h"
#import "SRBodyCollectionCell.h"

@interface SRPHHomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITextFieldDelegate,CLLocationManagerDelegate>

@property (strong, nonatomic) UIButton *loginButton;

@property (strong, nonatomic) UIButton *locationButton;

@property (strong, nonatomic) SRTextField *searchText;

@property (strong, nonatomic) UIImageView *headIma;

@property (strong, nonatomic) UILabel *headName;

@property (strong, nonatomic) UICollectionView *mainCollectionView;

@property (strong, nonatomic) UICollectionViewFlowLayout *cvLayout;

@property (strong, nonatomic) SRPHViwepager *viwepager;

@property (strong, nonatomic) NSArray *typeName;

@property (strong, nonatomic) UIScrollView *myLikeScrollView;

@property (strong, nonatomic)CLLocationManager *locationManager;

@property (copy, nonatomic) NSString *cityName;
@end

@implementation SRPHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.typeName = @[@"新品上架",@"促销活动",@"电子数码",@"服饰箱包",@"返现商城",@"返现中心",@"积分商城",@"分类"];
    
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
    
    self.searchText = [[SRTextField alloc] initWithFrame:CGRectMake(WIDTH(85), HEIGHT(7), WIDTH(230), HEIGHT(30))];
    self.searchText.textColor = [UIColor blackColor];
    self.searchText.font = FONT(13);
    self.searchText.placeholder = @"搜索你需要的商品内容";
    self.searchText.returnKeyType = UIReturnKeySearch;
    self.searchText.delegate = self;
    [topView addSubview:self.searchText];
    
    self.headIma = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH(330), HEIGHT(0), WIDTH(26), HEIGHT(26))];
    self.headIma.layer.cornerRadius = HEIGHT(13);
    self.headIma.layer.masksToBounds = YES;
    self.headIma.image = [UIImage imageNamed:@"222"];
    [topView addSubview:self.headIma];
    
    self.headName = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH(320), HEIGHT(28), WIDTH(40), HEIGHT(14))];
    self.headName.textColor = [UIColor blackColor];
    self.headName.font = FONT(12);
    self.headName.textAlignment = NSTextAlignmentCenter;
    self.headName.text = @"王祥";
    [topView addSubview:self.headName];
    
    self.cvLayout = [[UICollectionViewFlowLayout alloc] init];
    
//    _cvLayout.itemSize = CGSizeMake(70, 100);
    
    self.mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 20 + HEIGHT(44), SCREEN_WIDTH, SCREEN_HEIGHT - 69 - HEIGHT(44)) collectionViewLayout:_cvLayout];
    self.mainCollectionView.backgroundColor = [UIColor whiteColor];
    self.mainCollectionView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.mainCollectionView];
    
    
    [self.mainCollectionView registerClass:[SRMainCollectionCell class] forCellWithReuseIdentifier:@"cell"];
    [self.mainCollectionView registerClass:[SRBodyCollectionCell class] forCellWithReuseIdentifier:@"cell1"];
    
    [self.mainCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];
    
    self.mainCollectionView.delegate = self;
    
    self.mainCollectionView.dataSource = self;
    
    //定位管理
    self.locationManager = [[CLLocationManager alloc]init];
    
    _locationManager.delegate = self;
    
    //开启定位
    [_locationManager requestAlwaysAuthorization];
    
    [self location];
    // Do any additional setup after loading the view.
}

- (void)loginAction {
    [self.tabBarController setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:[[SRPHNextViewController alloc] init] animated:YES];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 8;
    }
    return 10;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        SRMainCollectionCell *cell = (SRMainCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        cell.botlabel.text = [NSString stringWithFormat:@"%@", self.typeName[indexPath.row]];
        cell.topImage.image = [UIImage imageNamed:@"111"];
        return cell;
    }else {
        SRBodyCollectionCell *cell = (SRBodyCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
        cell.topImage.image = [UIImage imageNamed:@"333"];
        
        cell.introduceLabel.text = [NSString stringWithFormat:@"第%ld", indexPath.row];
        cell.priceLabel.text = @"￥123.123";
        cell.numberLabel.text = @"2件已售";
        return cell;
    }
    
}

//每个item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return CGSizeMake(WIDTH(70), HEIGHT(100));
    }else {
        return CGSizeMake(WIDTH(180), HEIGHT(250));
    }
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (section == 0) {
        return UIEdgeInsetsMake(10, 10, 10, 10);
    }
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (section == 0) {
        return WIDTH(10);
    }
    return 0;
}
//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    if (section == 0) {
        return HEIGHT(10);
    }
    return 0;
}

//点击item方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        SRMainCollectionCell *cell = (SRMainCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
        NSString *msg = cell.botlabel.text;
        
        NSLog(@"%@",msg);
    }else {
        NSLog(@"hh");
    }
    
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if(section == 0)
    {
        CGSize size = {SCREEN_WIDTH, HEIGHT(200)};
        return size;
    }
    else
    {
        CGSize size = {SCREEN_WIDTH, HEIGHT(200)};
        return size;
    }
}

//通过设置SupplementaryViewOfKind 来设置头部或者底部的view，其中 ReuseIdentifier 的值必须和 注册是填写的一致，本例都为 “reusableView”
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView" forIndexPath:indexPath];
        headerView.backgroundColor =[UIColor grayColor];
        self.viwepager = [[SRPHViwepager alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, HEIGHT(200))];
        [headerView addSubview:self.viwepager];
        return headerView;
    }else {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView" forIndexPath:indexPath];
        
        UILabel *backgroundLab1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, HEIGHT(20))];
        backgroundLab1.backgroundColor = [UIColor grayColor];
        [headerView addSubview:backgroundLab1];
        
        UILabel *likeLab = [[UILabel alloc] initWithFrame:CGRectMake(0, HEIGHT(20), SCREEN_WIDTH, HEIGHT(30))];
        likeLab.textAlignment = NSTextAlignmentCenter;
        likeLab.text = @"猜你喜欢";
        [headerView addSubview:likeLab];
        
        self.myLikeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, HEIGHT(50), SCREEN_WIDTH, HEIGHT(100))];
        [headerView addSubview:self.myLikeScrollView];
        
        self.myLikeScrollView.contentSize = CGSizeMake(WIDTH(100) * 5, HEIGHT(100));
        
        self.myLikeScrollView.delegate = self;
        
        self.myLikeScrollView.bounces = NO;
        
        NSArray *arr = @[@"333",@"111",@"222",@"333",@"111"];
        
        for (int i = 0; i < arr.count; i ++) {
            
            UIImageView *imaView = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH(100) * i, 0, WIDTH(90), HEIGHT(100))];
            
            imaView.image = [UIImage imageNamed:arr[i]];
            
            [self.myLikeScrollView addSubview:imaView];
            
        }

        UILabel *backgroundLab2 = [[UILabel alloc] initWithFrame:CGRectMake(0, HEIGHT(150), SCREEN_WIDTH, HEIGHT(20))];
        backgroundLab2.backgroundColor = [UIColor grayColor];
        [headerView addSubview:backgroundLab2];
       
        
        UILabel *newLab = [[UILabel alloc] initWithFrame:CGRectMake(0, HEIGHT(170), SCREEN_WIDTH, HEIGHT(30))];
        newLab.textAlignment = NSTextAlignmentCenter;
        newLab.text = @"新品/热销";
        [headerView addSubview:newLab];
        
        return headerView;
    }
    
    
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([string isEqualToString:@"\n"]){ //判断输入的字是否是回车，即按下return
        //在这里做你响应return键的代码
        
        NSLog(@"return");
        [self.view endEditing:YES];
        return NO; //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
    }
    
    return YES;
}

#pragma 自动定位
- (void)location{
    
    if ([CLLocationManager locationServicesEnabled]) {
        //开始定位
        [_locationManager startUpdatingLocation];
    }else{
        NSLog(@"未开启定位");
    }
    
}

#pragma 定位delegate方法
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    //开启线程
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        CLLocation *currentLocation = [locations lastObject];
        
        CLGeocoder *geoCoder = [[CLGeocoder alloc]init];
        
        [geoCoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            
            
            if (placemarks.count > 0) {
                CLPlacemark *placemark = placemarks[0];
                
                NSString *currentCity = placemark.locality;
                
                if (!currentCity) {
                    //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
                    currentCity = placemark.administrativeArea;
                }
                //获取到的城市
                self.cityName = currentCity;
                [self.locationButton setTitle:[NSString stringWithFormat:@"%@▼",_cityName] forState:UIControlStateNormal];
                NSLog(@"%@",_cityName);
            }else if (error==nil&&placemarks.count==0){
                
                NSLog(@"NO location and error returned");
                
            }else if(error){
                
                NSLog(@"error:%@",error);
                
            }
            
        }];
        //系统会一直更新数据，直到选择停止更新，因为我们只需要获得一次经纬度即可，所以获取之后就停止更新
        [manager stopUpdatingHeading];
    });
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

//
//  SRPersonHeaderCell.m
//  srph
//
//  Created by admin on 2017/4/12.
//  Copyright © 2017年 商融普惠. All rights reserved.
//

#import "SRPersonHeaderCell.h"
#import "UIView+Addition.h"
#import "UIColor+HexString.h"
@implementation SRPersonHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self SetUpTopView];
        [self setupBottomView];
        
    }
    return self;
}
-(void)SetUpTopView
{
    _headBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _headBtn.frame=CGRectMake((SCREEN_WIDTH-WIDTH(80))/2, 20, WIDTH(80), WIDTH(80));
    _headBtn.backgroundColor=[UIColor redColor];
    _headBtn.clipsToBounds=YES;
    _headBtn.layer.cornerRadius=40;
    [self addSubview:_headBtn];
    
    _nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(_headBtn.left+10, _headBtn.bottom+10, 100, 10)];
    _nameLabel.text=@"小明";
    _nameLabel.textColor=[UIColor blueColor];
    _nameLabel.font=FONT(12);
    [self addSubview:_nameLabel];
    
    _gradeLabel=[[UILabel alloc]initWithFrame:CGRectMake(_headBtn.left+10, _nameLabel.bottom+10, 100, 10)];
    _gradeLabel.text=@"普通会员";
    _gradeLabel.textColor=[UIColor blackColor];
    _gradeLabel.font=FONT(12);
    [self addSubview:_gradeLabel];
    
}
-(void)setupBottomView
{
    _leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _leftBtn.frame=CGRectMake(0, _gradeLabel.bottom+10,120 ,50 );
    [self addSubview:_leftBtn];
    _balanceLabel=[[UILabel alloc]initWithFrame:CGRectMake(30, 10, 40, 10)];
    _balanceLabel.text=@"0";
    [_leftBtn addSubview:_balanceLabel];
    _balanceLabel2=[[UILabel alloc]initWithFrame:CGRectMake(20, _balanceLabel.bottom+5, 70, 10)];
    _balanceLabel2.text=@"我的余额";
    _balanceLabel2.font=FONT(12);
    [_leftBtn addSubview:_balanceLabel2];
    //
    _centerBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _centerBtn.frame=CGRectMake(_leftBtn.right+10, _gradeLabel.bottom+10,120 ,50 );
    [self addSubview:_centerBtn];
    _pointLabel=[[UILabel alloc]initWithFrame:CGRectMake(30, 10, 40, 10)];
    _pointLabel.text=@"0";
    [_centerBtn addSubview:_pointLabel];
    _pointLabel2=[[UILabel alloc]initWithFrame:CGRectMake(20, _pointLabel.bottom+5, 70, 10)];
    _pointLabel2.text=@"我的积分";
    _pointLabel2.font=FONT(12);
    [_centerBtn addSubview:_pointLabel2];
    
    
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

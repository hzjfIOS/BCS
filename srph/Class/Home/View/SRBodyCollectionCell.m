//
//  SRBodyCollectionCell.m
//  srph
//
//  Created by 王祥 on 2017/4/12.
//  Copyright © 2017年 王祥. All rights reserved.
//

#import "SRBodyCollectionCell.h"

@implementation SRBodyCollectionCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UIView *backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH(180), HEIGHT(250))];
        backgroundView.layer.cornerRadius = 10;
        backgroundView.layer.masksToBounds = YES;
        backgroundView.layer.shadowColor = [UIColor blackColor].CGColor;
        backgroundView.layer.shadowOffset = CGSizeMake(4,4);
        backgroundView.layer.shadowOpacity  = 0.8;
        backgroundView.layer.shadowRadius = 4;
        [self.contentView addSubview:backgroundView];
        
        _topImage  = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH(180), HEIGHT(180))];
        
        _topImage.layer.masksToBounds = YES;
        [backgroundView addSubview:_topImage];
        
        self.introduceLabel = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH(5), HEIGHT(185), WIDTH(170), HEIGHT(20))];
        
        self.introduceLabel.textColor = COLOR(51, 51, 51, 1);
        self.introduceLabel.font = FONT(13);
      
        [backgroundView addSubview:self.introduceLabel];
        
        self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH(5), HEIGHT(220), WIDTH(85), HEIGHT(20))];
        
        self.priceLabel.textColor = [UIColor redColor];
        self.priceLabel.font = FONT(14);
       
        [backgroundView addSubview:self.priceLabel];
        
        self.numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH(90), HEIGHT(220), WIDTH(85), HEIGHT(20))];
        self.numberLabel.textAlignment = NSTextAlignmentRight;
        self.numberLabel.textColor = [UIColor blackColor];
        self.numberLabel.font = FONT(14);
        
        [backgroundView addSubview:self.numberLabel];

    }
    
    return self;
}
@end

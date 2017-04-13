//
//  SRMainCollectionCell.m
//  srph
//
//  Created by 王祥 on 2017/4/12.
//  Copyright © 2017年 王祥. All rights reserved.
//

#import "SRMainCollectionCell.h"

@implementation SRMainCollectionCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _topImage  = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH(15), HEIGHT(10), WIDTH(40), HEIGHT(40))];
        _topImage.backgroundColor = [UIColor redColor];
        _topImage.layer.cornerRadius = WIDTH(20);
        _topImage.layer.masksToBounds = YES;
        [self.contentView addSubview:_topImage];
        
        _botlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, HEIGHT(70), WIDTH(70), HEIGHT(20))];
        _botlabel.textAlignment = NSTextAlignmentCenter;
        _botlabel.font = FONT(12);
        [self.contentView addSubview:_botlabel];
    }
    
    return self;
}

@end

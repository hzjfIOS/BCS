//
//  SRPHViwepager.m
//  srph
//
//  Created by 王祥 on 2017/4/11.
//  Copyright © 2017年 王祥. All rights reserved.
//
#define WXWIDTH self.bounds.size.width
#define WXHEIGHT self.bounds.size.height

#import "SRPHViwepager.h"

@interface SRPHViwepager ()<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *WXScrollView;

@property (strong, nonatomic) UIPageControl *WXPage;
@end

@implementation SRPHViwepager

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.i = 1;
        [self createView];
        
    }
    
    return self;

}
//初始化控件
- (void)createView{
    self.WXScrollView = [[UIScrollView alloc] initWithFrame:self.frame];
    
    [self addSubview:self.WXScrollView];
    
    self.WXScrollView.contentSize = CGSizeMake(WXWIDTH * 5, WXHEIGHT);
    
    self.WXScrollView.pagingEnabled = YES;
    
    self.WXScrollView.delegate = self;
    
    self.WXScrollView.bounces = NO;
    
    NSArray *arr = @[@"333",@"111",@"222",@"333",@"111"];
    
    for (int i = 0; i < arr.count; i ++) {
        
        UIImageView *imaView = [[UIImageView alloc] initWithFrame:CGRectMake(WXWIDTH * i, 0, WXWIDTH, 200)];
        
        imaView.image = [UIImage imageNamed:arr[i]];
        
        [self.WXScrollView addSubview:imaView];
        
    }
    //123
    self.WXPage = [[UIPageControl alloc]initWithFrame:CGRectMake(10, WXHEIGHT - 40, WXWIDTH - 20, 20)];
    
    [self addSubview:self.WXPage];
    
    self.WXPage.numberOfPages = 3;
    
    self.WXPage.currentPage = 0;
    
    [self.WXScrollView setContentOffset:CGPointMake(WXWIDTH, 0)];
    
    [self timerStart];

}

- (void)timerStart {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        self.myTimer = [NSTimer scheduledTimerWithTimeInterval:2.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
            self.i ++ ;
            if (_i == 5) {
                _i = 1;
                [self.WXScrollView setContentOffset:CGPointMake(WXWIDTH * _i, 0)];
                self.i ++ ;
                [self.WXScrollView setContentOffset:CGPointMake(WXWIDTH * _i, 0) animated:YES];
                
            }else {
                [self.WXScrollView setContentOffset:CGPointMake(WXWIDTH * _i, 0) animated:YES];
            }
        }];
        [[NSRunLoop currentRunLoop] run];
        
    });
}


- (void)timerStop {
    [self.myTimer invalidate];
    self.myTimer = nil;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
    if (scrollView.contentOffset.x == WXWIDTH * 4) {
        [self.WXScrollView setContentOffset:CGPointMake(WXWIDTH, 0)];
    }else if (scrollView.contentOffset.x == 0) {
        [self.WXScrollView setContentOffset:CGPointMake(WXWIDTH * 3, 0)];
    }
    
    self.i = (int)self.WXScrollView.contentOffset.x/WXWIDTH;
 
    self.WXPage.currentPage = _i - 1;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self timerStop];
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    [self timerStart];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

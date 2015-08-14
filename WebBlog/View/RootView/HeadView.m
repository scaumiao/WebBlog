//
//  HeadViewController.m
//  WebBlog
//
//  Created by 许汝邈 on 15/8/14.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import "HeadView.h"

@interface HeadView ()

@end

@implementation HeadView

#pragma mark - logo初始化
-(void)initLogo
{
    //set title label and font
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 100, 20)];
    titleLabel.text = @"喵大人专柜";
    UIFont *font = [UIFont boldSystemFontOfSize:20];
    titleLabel.font = font;
    [self addSubview:titleLabel];
    
    //set the logo image
    _logoBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 70, 70)];
    [_logoBtn setBackgroundImage:[UIImage imageNamed:@"logo.jpg"] forState:UIControlStateNormal];
    
    //这两句更改头像为圆形头像
    _logoBtn.layer.cornerRadius = _logoBtn.frame.size.width / 2;
    _logoBtn.clipsToBounds = YES;
    [self addSubview:_logoBtn];
    
    
}




- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initLogo];
        [self initButton];
    }
    return self;
}

-(void)initButton
{
    
    _rssBtn = [[UIButton alloc] initWithFrame:CGRectMake(250, 52, 15, 15)];
    [_rssBtn setBackgroundImage:[UIImage imageNamed:@"rss.png"] forState:UIControlStateNormal];
    
    _adminBtn = [[UIButton alloc] initWithFrame:CGRectMake(280, 52, 15, 15)];
    [_adminBtn setBackgroundImage:[UIImage imageNamed:@"admin.png"] forState:UIControlStateNormal];
    
    _searchBtn = [[UIButton alloc] initWithFrame:CGRectMake(310, 52, 15, 15)];
    [_searchBtn setBackgroundImage:[UIImage imageNamed:@"search.png"] forState:UIControlStateNormal];
    
    [self addSubview:_rssBtn];
    [self addSubview:_adminBtn];
    [self addSubview:_searchBtn];
}

@end

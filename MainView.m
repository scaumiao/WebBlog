//
//  MainView.m
//  WebBlog
//
//  Created by 许汝邈 on 15/8/6.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import "MainView.h"

@implementation MainView


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

#pragma mark - tableView初始化
-(void)initTableView
{
    //set the article table
    _tableView = [[UITableView alloc] init];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, 380, 600) style: UITableViewStyleGrouped];

    //设置cell分割线不可见
    _tableView.separatorStyle = NO;

    [self addSubview:_tableView];
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initLogo];
        [self initTableView];
    }
    return self;
}


@end

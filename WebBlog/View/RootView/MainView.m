//
//  MainView.m
//  WebBlog
//
//  Created by 许汝邈 on 15/8/6.
//  Copyright (c) 2015年 miao. All rights reserved.
//

//主界面tableview显示
#import "MainView.h"

@implementation MainView



#pragma mark - tableView初始化
-(void)initTableView
{
    //set the article table
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 380, 600) style: UITableViewStyleGrouped];

    //设置cell分割线不可见
    //_tableView.separatorStyle = NO;

    [self addSubview:_tableView];
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
     
        [self initTableView];

    }
    return self;
}



@end

//
//  DetailArticleView.m
//  WebBlog
//
//  Created by 许汝邈 on 15/8/16.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import "DetailArticleView.h"

@implementation DetailArticleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initDetail];
    }
    return self;
}

-(void)initDetail
{
    _detailArticleView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
    
    
    [self addSubview:_detailArticleView];
    
}

@end

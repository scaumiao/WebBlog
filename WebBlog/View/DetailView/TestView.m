//
//  TestView.m
//  WebBlog
//
//  Created by 许汝邈 on 15/8/15.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import "TestView.h"

@implementation TestView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initLabel];
       
    }
    return self;
}

-(void)initLabel
{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    titleLabel.text = @"喵大人专柜";
    UIFont *font = [UIFont boldSystemFontOfSize:20];
    titleLabel.font = font;
    [self addSubview:titleLabel];
    self.backgroundColor = [UIColor blackColor];
    
    _logoBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 70, 70)];
    [_logoBtn setBackgroundImage:[UIImage imageNamed:@"logo.jpg"] forState:UIControlStateNormal];
    [self addSubview:_logoBtn];
}
@end

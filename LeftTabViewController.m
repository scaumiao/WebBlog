//
//  LeftTabViewController.m
//  WebBlog
//
//  Created by 许汝邈 on 15/8/5.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import "LeftTabViewController.h"

@interface LeftTabViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation LeftTabViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"aaa");
}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:YES];
    _tabTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    
    _tabTableView.delegate = self;
    _tabTableView.dataSource = self;
    [self.view addSubview:_tabTableView];
    self.view.backgroundColor = [UIColor brownColor];
    
    NSLog(@"11");
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - tableView协议
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    cell.textLabel.text = @"导航栏信息";
    

    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


@end

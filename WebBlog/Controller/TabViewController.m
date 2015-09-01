//
//  TabViewController.m
//  WebBlog
//
//  Created by 许汝邈 on 15/8/18.
//  Copyright © 2015年 miao. All rights reserved.
//

#import "TabViewController.h"

@interface TabViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation TabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tabTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 100, 200) style:UITableViewStylePlain];
    
    _tabTableView.delegate = self;
    _tabTableView.dataSource = self;
    [self.view addSubview:_tabTableView];
   
    
    

    
    
  
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
    
    cell.textLabel.text = @"首页";
    
    
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

#pragma mark - cell点击事件
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
}
@end

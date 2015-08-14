//
//  ArticleViewController.m
//  WebBlog
//
//  Created by 许汝邈 on 15/8/12.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()<UITableViewDataSource,UITableViewDelegate>



@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _headView = [[HeadView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    [_headView.logoBtn addTarget:self action:@selector(logoClickAction:) forControlEvents:UIControlEventTouchUpInside];
    [_headView.searchBtn addTarget:self action:@selector(logoClickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_headView];
    
    _mainView = [[MainView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height)];
    _mainView.tableView.delegate = self;
    _mainView.tableView.dataSource = self;
    
    [self.view addSubview:_mainView];
    [self statusFrames];
}

#pragma mark - 数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  
    return self.statusFrames.count;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ArticleCell *cell = [ArticleCell cellWithTableView:tableView];
    // 3.设置数据
    cell.articleFrame = self.statusFrames[indexPath.row];
    
    // 4.返回
    return cell;
}

#pragma mark - 懒加载
- (NSArray *)statusFrames
{
    if (_statusFrames == nil) {
        NSString *fullPath = [[NSBundle mainBundle] pathForResource:@"article.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:fullPath];
        NSMutableArray *models = [NSMutableArray arrayWithCapacity:dictArray.count];
        for (NSDictionary *dict in dictArray) {
            // 创建模型
            Article *article = [Article articleWithDict:dict];
            // 根据模型数据创建frame模型
            ArticleFrame *arF = [[ArticleFrame alloc] init];
            arF.article = article;
            
            [models addObject:arF];
        }
        self.statusFrames = [models copy];
    }
    
    return _statusFrames;
}



#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"heightForRowAtIndexPath");
    // 取出对应航的frame模型
    ArticleFrame *arF = self.statusFrames[indexPath.row];
   
    return arF.cellHeight;
}



- (BOOL) prefersStatusBarHidden
{
    return YES;
}


#pragma mark - logo点击事件

-(void)logoClickAction:(id)sender
{
   
    NSLog(@"%@",sender);
   
    
}


#pragma mark - cell点击事件
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",indexPath.row);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

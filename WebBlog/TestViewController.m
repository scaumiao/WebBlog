//
//  TestViewController.m
//  WebBlog
//
//  Created by 许汝邈 on 15/8/6.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import "TestViewController.h"


@interface TestViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSDictionary* dic;
    NSArray* keys;
    NSMutableArray *changeArray;//存储更改后的数组
    NSArray *values;
    int tag ;
}
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self initData];
    _mainView = [[MainView alloc] initWithFrame:self.view.frame];
    _mainView.tableView.delegate = self;
    _mainView.tableView.dataSource = self;
    
    [_mainView.logoBtn addTarget:self action:@selector(logoClickAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_mainView];
    [self statusFrames];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - tableView协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [_statusFrames count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ArticleCell *cell = [[ArticleCell alloc] init];
    cell.articleFrame = _statusFrames[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"heightForRowAtIndexPath");
    // 取出对应航的frame模型
    ArticleFrame *arF = self.statusFrames[indexPath.row];
    
    return arF.cellHeight;
}




#pragma mark - logo点击事件

-(void)logoClickAction:(id)sender
{
    NSLog(@"aaaa");
    
    
}

#pragma mark - 懒加载
- (NSArray *)statusFrames
{
    if (_statusFrames == nil) {


        NSString *fullPath = [[NSBundle mainBundle] pathForResource:@"article.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:fullPath];
        //models是用来保存frame的临时变量
        NSMutableArray *models = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array) {
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

/*
#pragma mark - 数据初始化
-(void)initData
{
    //定义测试用的字典数据
    
    values = [NSArray arrayWithObjects:@"test1",@"test2",@"test3",@"test4", nil];
    keys = [NSArray arrayWithObjects:@"title111111111111111111111111111111111111111111",@"title2",@"title3",@"title4", nil];
    dic = [[NSDictionary alloc] initWithObjects:values forKeys:keys];
    // NSLog(@"%@",dic);
    
    
    keys = [dic allKeys];
    
    
    keys = [dic allKeys];
    
    changeArray = [[NSMutableArray alloc] init];
    
    for (id object in keys) {
        [changeArray addObject:object];
        [changeArray addObject:[dic objectForKey:object]];
    }
    
    
    NSString *fullPath = [[NSBundle mainBundle] pathForResource:@"article.plist" ofType:nil];
    
    _dictArray = [NSArray arrayWithContentsOfFile:fullPath];
    NSMutableArray *models = [NSMutableArray arrayWithCapacity:_dictArray.count];
    for (NSDictionary *dict in _dictArray) {
        // 创建模型
        _article = [Article articleWithDict:dict];
        // 根据模型数据创建frame模型
        //        NJWeiboFrame *wbF = [[NJWeiboFrame alloc] init];
        //        wbF.weibo = weibo;
        //        [models addObject:wbF];
        //NSLog(@"%@",_article.tag);
        
    }
    
}
 
 
 -(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 
 
 UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
 //    cell.textLabel.text = changeArray[indexPath.row + indexPath.section * 2];
 
 NSDictionary *dict = [_dictArray objectAtIndex:0];
 Article *art =  [Article articleWithDict:dict];
 switch (indexPath.row) {
 case 0:
 cell.textLabel.text = art.title;
 NSLog(@"%ld",(long)indexPath.row);
 break;
 case 1:
 cell.textLabel.text = art.tag;
 NSLog(@"%ld",(long)indexPath.row);
 break;
 case 2:
 cell.textLabel.text = art.author;
 NSLog(@"%ld",(long)indexPath.row);
 break;
 case 3:
 cell.textLabel.text = art.text;
 NSLog(@"%ld",(long)indexPath.row);
 break;
 default:
 break;
 }
 return cell;
 }

 
*/
@end

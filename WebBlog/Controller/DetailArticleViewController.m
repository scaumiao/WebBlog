//
//  DetailArticleViewController.m
//  WebBlog
//
//  Created by 许汝邈 on 15/8/31.
//  Copyright © 2015年 miao. All rights reserved.
//

#import "DetailArticleViewController.h"

@interface DetailArticleViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation DetailArticleViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self statusFrames];
    

    
}


-(void)viewWillAppear:(BOOL)animated
{
    _detailArticleView = [[DetailArticleView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:_detailArticleView];
    NSLog(@"创建detailView成功");
    _detailArticleView.detailArticleView.delegate = self;
    _detailArticleView.detailArticleView.dataSource = self;
}

/*
 
 NSError *error;
 NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost:8080/longai/picture/getPic?picId=1"]];
 
 NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
 //IOS5自带解析类NSJSONSerialization从response中解析出数据放到字典中
 NSDictionary *weatherDic = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
 
 
 NSLog(@"weatherInfo：%@", weatherDic );
 
 */


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
            DetailArticleFrame *detailF = [[DetailArticleFrame alloc] init];
            detailF.article = article;
            //NSLog(@"%@",article.detail);
            [models addObject:detailF];
        }
        self.statusFrames = [models copy];
    }
    
    return _statusFrames;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DetailArticleCellTableViewCell *cell = [DetailArticleCellTableViewCell cellWithTableView:tableView];
     //3.设置数据
    cell.detailArticleFrame = self.statusFrames[0];
    DetailArticleFrame *frame = self.statusFrames[0];
    // 4.返回
    return cell;
}


#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"heightForRowAtIndexPath");
    // 取出对应航的frame模型
    DetailArticleFrame *arF = self.statusFrames[indexPath.row];
    
    return arF.cellHeight;
}
@end

//
//  NJViewController.m
//  WebBlog
//
//  Created by 许汝邈 on 15/8/3.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import "NJViewController.h"
#import "NJWeibo.h"
#import "NJWeiboCell.h"
#import "NJWeiboFrame.h"

@interface NJViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray *statusFrames;

@end

@implementation NJViewController

	
-(void)viewDidLoad{
    [super viewDidLoad];
    
    _tableVC = [[UITableViewController alloc] init];
    _tableVC.tableView = [[UITableView alloc] initWithFrame:self.view.frame style: UITableViewStyleGrouped];
    _tableVC.tableView.delegate = self;
    _tableVC.tableView.dataSource = self;
    [self.view addSubview:_tableVC.tableView];
    
    [self statusFrames];
}

#pragma mark - 数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusFrames.count;
  
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    NJWeiboCell *cell = [NJWeiboCell cellWithTableView:tableView];
    // 3.设置数据
    cell.weiboFrame = self.statusFrames[indexPath.row];
    
    // 4.返回
    return cell;
}

#pragma mark - 懒加载
- (NSArray *)statusFrames
{
    if (_statusFrames == nil) {
        NSString *fullPath = [[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:fullPath];
        NSMutableArray *models = [NSMutableArray arrayWithCapacity:dictArray.count];
        for (NSDictionary *dict in dictArray) {
            // 创建模型
            NJWeibo *weibo = [NJWeibo weiboWithDict:dict];
            // 根据模型数据创建frame模型
            NJWeiboFrame *wbF = [[NJWeiboFrame alloc] init];
            wbF.weibo = weibo;
            
            [models addObject:wbF];
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
    NJWeiboFrame *wbF = self.statusFrames[indexPath.row];
    NSLog(@"height = %f", wbF.cellHeight);
    return wbF.cellHeight;
}



- (BOOL) prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
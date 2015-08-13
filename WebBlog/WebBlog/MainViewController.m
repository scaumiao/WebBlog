//
//  ViewController.m
//  WebBlog
//
//  Created by 许汝邈 on 15/7/30.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSDictionary* dic;
    NSArray* keys;
    NSMutableArray *changeArray;//存储更改后的数组
    NSArray *values;
    int tag ;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _leftTabVC = [[LeftTabViewController alloc] init];
    _leftTabVC.view = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 90, 300)];
    _leftTabVC.view.backgroundColor = [UIColor purpleColor];
    
    
  
    tag = 0;
    [self initLogo];
    [self initData];
    [self initTableView];

    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 2;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = changeArray[indexPath.row + indexPath.section * 2];
    
    
    return cell;
}

#pragma 一共有多少组，之后通过后台发送过来的JSON解析出的字典转成数组以查组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [keys count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *str = [NSString stringWithFormat:@"%@",@"测试"];

    
    
    return str;
}

#pragma mark - logo初始化
-(void)initLogo
{
    //set title label and font
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 100, 20)];
    titleLabel.text = @"喵大人专柜";
    UIFont *font = [UIFont boldSystemFontOfSize:20];
    titleLabel.font = font;
    [self.view addSubview:titleLabel];
    
    //set the logo image
    _logoBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 70, 70)];
    [_logoBtn setBackgroundImage:[UIImage imageNamed:@"logo.jpg"] forState:UIControlStateNormal];
    
    //这两句更改头像为圆形头像
    _logoBtn.layer.cornerRadius = _logoBtn.frame.size.width / 2;
    _logoBtn.clipsToBounds = YES;
    [self.view addSubview:_logoBtn];
    
    [_logoBtn addTarget:self action:@selector(logoClickAction:) forControlEvents:UIControlEventTouchUpInside];
}

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
    
//    for (id object in changeArray) {
//        NSLog(@"%@",object);
//    }
}
#pragma mark - tableView初始化
-(void)initTableView
{
    //set the article table
    _tableVC = [[UITableViewController alloc] init];
    _tableVC.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, 380, 600) style: UITableViewStyleGrouped];
    _tableVC.tableView.delegate = self;
    _tableVC.tableView.dataSource = self;
    [self.view addSubview:_tableVC.tableView];
}

#pragma mark - logo点击事件

-(void)logoClickAction:(id)sender
{
    if (tag == 1) {
        NSLog(@"tag == 1 click");
        [self hidden];
        tag = 0;
        
    }
    else{
        NSLog(@"tag == 0 click");
       [self show];
        tag = 1;
    }
    
    
}

#pragma mark - 控制导航栏隐藏与显示
-(void)hidden
{
    [_leftTabVC.view removeFromSuperview];
}

-(void)show
{
    [self.view addSubview:_leftTabVC.view];
}





//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    CGFloat height = 100.f;
//    return height;
//}

//之后需要进行代码的整理，把标题跟头像移动到另一个VC中，实现顶端的导航栏TopNavigation

//2015年07月30日20:40:25：完成了tableView的一小部分设计，需解决的问题有如何设置cell的高度，将顶部导航栏移到一个控制器中，实现点击头像弹出左侧导航栏功能，正文部分采用哪种控件（目前是使用TableView，可思考使用何种最为合适）

//2015年07月31日16:22:52：通过heightForRowAtIndexPath方法改变了cell的高度，接下来需要解决如何动态更改，移除某些线条，实现点击事件

//2015年08月02日21:18:25:http://blog.csdn.net/swingpyzf/article/details/18093959
@end

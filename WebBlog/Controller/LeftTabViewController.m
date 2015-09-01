//
//  LeftTabViewController.m
//  WebBlog
//
//  Created by 许汝邈 on 15/8/5.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import "LeftTabViewController.h"
#define DURATION 0.7f
@interface LeftTabViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *array;
}
@end

@implementation LeftTabViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    array = @[@"首页",@"IT猫",@"每日一记"];
    NSLog(@"aaa");
   
    self.view.frame = CGRectMake(0, 20, 70, self.view.frame.size.height);
    //添加手势测试
    //添加轻扫手势
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeGesture:)];
    //设置轻扫方向向右
    swipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    //添加手势
    [self.view addGestureRecognizer:swipeGesture];
    
}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:YES];
    _tabTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    
    _tabTableView.delegate = self;
    _tabTableView.dataSource = self;
    [self.view addSubview:_tabTableView];
    //使UITableView不能滚动
    _tabTableView.scrollEnabled = NO;
    //用来隐藏多余的线条
    [_tabTableView setTableFooterView:[[UIView alloc] init]];
    NSLog(@"%@",[array objectAtIndex:1]);
    
    
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
    
    //cell.textLabel.text = [array objectAtIndex:(int)indexPath];
    
    cell.textLabel.text = @"测试";
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}



//手势,参照http://www.cocoachina.com/ios/20140922/9711.html
-(void)swipeGesture:(id)sender
{
    UISwipeGestureRecognizer *swipe = sender;
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        //向左轻扫做的事情
    }
    if (swipe.direction == UISwipeGestureRecognizerDirectionRight)
    {
        [self animationWithView:self.parentViewController.view WithAnimationTransition:UIViewAnimationTransitionCurlDown];
        
        NSLog(@"滑动了");
        
      //  [self.view removeFromSuperview];
        //向右轻扫做的事情
    }
}

#pragma UIView实现动画
- (void) animationWithView : (UIView *)view WithAnimationTransition : (UIViewAnimationTransition) transition
{
    [UIView animateWithDuration:DURATION animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:transition forView:view cache:YES];
    }];
}

#pragma mark - cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"test");
    
}
@end

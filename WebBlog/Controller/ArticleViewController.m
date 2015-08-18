//
//  ArticleViewController.m
//  WebBlog
//
//  Created by 许汝邈 on 15/8/18.
//  Copyright © 2015年 miao. All rights reserved.
//

#import "ArticleViewController.h"
#define DURATION 0.7f
@interface ArticleViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ArticleViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    _tabVC = [[TabViewController alloc] init];
    [_tabVC.view setFrame:CGRectMake(0, 0, 0, 0)];
    [self.view addSubview:_tabVC.view];
    
    _headView = [[HeadView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    [_headView.logoBtn addTarget:self action:@selector(logoClickAction:) forControlEvents:UIControlEventTouchUpInside];
    [_headView.searchBtn addTarget:self action:@selector(logoClickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_headView];
    
    _mainView = [[MainView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height)];
    
    _mainView.tableView.delegate = self;
    _mainView.tableView.dataSource = self;
    
    [self.view addSubview:_mainView];
    [self statusFrames];
    
    //测试页面跳转
    _detailArticleView = [[DetailArticleView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height)];
    
    
    //添加手势测试
    //添加轻扫手势
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeGesture:)];
    //设置轻扫方向向右
    swipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    //添加手势
    [_detailArticleView addGestureRecognizer:swipeGesture];
    
    [self addChildViewController:_tabVC];
    
    
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
        [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionCurlDown];
        [_testView removeFromSuperview];
        [self.view addSubview:_mainView];
        //向右轻扫做的事情
    }
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
            NSLog(@"%@",article.detail);
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
    
    [self moveMe];
    
    
    
    
    
    
}

- (void)moveMe {
    
    [UIView animateWithDuration:0.5 animations:^{
        _mainView.center = CGPointMake(_mainView.center.x + 100,_mainView.center.y);
    }];
    [UIView animateWithDuration:0.5 animations:^{
        _headView.center = CGPointMake(_headView.center.x + 100,_headView.center.y);
    }];
}


#pragma mark - cell点击事件
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionCurlUp];
    [_mainView removeFromSuperview];
    
    [self.view addSubview:_detailArticleView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//#pragma CATransition动画实现
//- (void) transitionWithType:(NSString *) type WithSubtype:(NSString *) subtype ForView : (UIView *) view
//{
//    //创建CATransition对象
//    CATransition *animation = [CATransition animation];
//
//    //设置运动时间
//    animation.duration = DURATION;
//
//    //设置运动type
//    animation.type = type;
//    if (subtype != nil) {
//
//        //设置子类
//        animation.subtype = subtype;
//    }
//
//    //设置运动速度
//    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
//
//    [view.layer addAnimation:animation forKey:@"animation"];
//}



#pragma UIView实现动画
- (void) animationWithView : (UIView *)view WithAnimationTransition : (UIViewAnimationTransition) transition
{
    [UIView animateWithDuration:DURATION animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:transition forView:view cache:YES];
    }];
}





@end

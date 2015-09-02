//
//  DetailArticleViewController.m
//  WebBlog
//
//  Created by 许汝邈 on 15/8/31.
//  Copyright © 2015年 miao. All rights reserved.
//

#import "DetailArticleViewController.h"

@interface DetailArticleViewController ()

@end

@implementation DetailArticleViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    

    
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



@end

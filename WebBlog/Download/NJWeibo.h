//
//  CellModel.h
//  WebBlog
//
//  Created by 许汝邈 on 15/8/3.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NJWeibo : NSObject

@property (nonatomic, copy) NSString *text; // 内容
@property (nonatomic, copy) NSString *icon; // 头像
@property (nonatomic, copy) NSString *name; // 昵称
@property (nonatomic, copy) NSString *picture; // 配图
@property (nonatomic, assign) BOOL vip;

- (id)initWithDict:(NSDictionary *)dict;
+ (id)weiboWithDict:(NSDictionary *)dict;

@end

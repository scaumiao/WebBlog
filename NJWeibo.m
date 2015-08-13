//
//  CellModel.m
//  WebBlog
//
//  Created by 许汝邈 on 15/8/3.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import "NJWeibo.h"

@implementation NJWeibo

-(id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
                [self setValuesForKeysWithDictionary:dict];
            }
         return self;
    
}

+(id)weiboWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}


@end

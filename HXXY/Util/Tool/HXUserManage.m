//
//  HXUserManage.m
//  zfw
//
//  Created by Apple on 14-7-5.
//  Copyright (c) 2014年 华讯网络投资有限公司. All rights reserved.
//

#import "HXUserManage.h"
#import "HXUser.h"
#import "HXEntityHelper.h"

@implementation HXUserManage

__strong static HXUserManage *sharedInstance = nil;

// 这里使用的是ARC下的单例模式
+ (instancetype)sharedInstance
{
    // dispatch_once不仅意味着代码仅会被运行一次，而且还是线程安全的
    static dispatch_once_t pred = 0;
    dispatch_once(&pred, ^{
        sharedInstance = [[super allocWithZone:NULL] init];
    });
    return sharedInstance;
}

#pragma mark 将user对象数据转化成dictionary
-(NSDictionary *)userToDictionary{
    return [HXEntityHelper entityToDictionary:_user];
}

#pragma mark 将dictionary对象中的数据转化成user类型
-(HXUser *)userByDictionary:(NSDictionary *)dictionary{
    HXUser *user = [[HXUser alloc] init];
    [HXEntityHelper dictionaryToEntity:dictionary entity:user];
//    NSLog(@"user.name-->%@", user.username);
    return user;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

@end

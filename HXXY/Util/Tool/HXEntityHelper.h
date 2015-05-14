//
//  HXEntityHelper.h
//  zfw
//
//  Created by Apple on 14-7-16.
//  Copyright (c) 2014年 华讯网络投资有限公司. All rights reserved.
//  将自定义对象转化成字典工具类

#import <Foundation/Foundation.h>

@interface HXEntityHelper : NSObject

/*字典对象转为实体对象*/
+ (void) dictionaryToEntity:(NSDictionary *)dict entity:(NSObject*)entity;

/*实体对象转为字典对象*/
+ (NSDictionary *) entityToDictionary:(id)entity;

@end

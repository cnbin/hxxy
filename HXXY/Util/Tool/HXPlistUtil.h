//
//  HXPlistUtil.h
//  zfw
//
//  Created by Apple on 14-7-9.
//  Copyright (c) 2014年 华讯网络投资有限公司. All rights reserved.
//  plist文件操作类

#import <Foundation/Foundation.h>

@interface HXPlistUtil : NSObject

/*返回对应路径的plist文件中的数据（以NSDictionary的形式）*/
+(NSDictionary *)dictionaryWithPlistName:(NSString *)plistName;
/*保存传入数据到plist文件中，返回值用于标记是否保存成功*/
+(BOOL)saveDictionary:(NSDictionary *)dictionary withPlistName:(NSString *)plistName;
/*删除对应plist文件的操作*/
+(BOOL)deletePlistFromName:(NSString *)plistName;
/*对指定plist文件添加或者替换数据*/
+(BOOL)setObject:(id)object andKey:(id<NSCopying>)key toPlistWithName:(NSString *)plistName;
/*根据key删除指定plist文件中的数据*/
+(BOOL)deleteObjectFromKey:(id<NSCopying>)key fromPlistName:(NSString *)plistName;
/*根据key查询指定plist文件中的数据*/
+(id)objectByKey:(id<NSCopying>)key fromPlistName:(NSString *)plistName;

@end

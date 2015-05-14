//
//  HXPlistUtil.m
//  zfw
//
//  Created by Apple on 14-7-9.
//  Copyright (c) 2014年 华讯网络投资有限公司. All rights reserved.
//

#import "HXPlistUtil.h"

// 获得app 的documnet 目录
#define DOCUMENTPATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,  NSUserDomainMask,YES) objectAtIndex:0]//应用程序文档目录

/*
 沙盒：
 每个应用程序都有一个/Documents文件夹并且应用程序只能读写该文件夹下的文件。
 常量NSDocumentDirectory表明我们在查找Documents目录的路径。
 常量NSUserDomainMask表明我们希望将搜索限制于我们的应用程序沙盒。
 属性列表序列化:
 序列化对象已被转换为字节流，以便存储到文件中或通过网络进行传输。
 关于plist文件：要把数据写入文件实现数据持久化，会将文件保存在“沙盒”中，每个应用程序都有一个沙盒，这个沙盒只有自己可以访问，写文件
 都保存在/Documents文件夹下。且在把文件写入沙盒的时候，数据类型只能是一下几种类型：
 NSArray;
 NSMutableArray;
 NSDictionary;
 NSNumber;
 NSString;
 NSMutableString;
 NSData;
 其他的自定义对象不能直接写入plist文件,只能先将其序列化，才能在做写文件操作。
 */
@implementation HXPlistUtil

#pragma mark 返回对应路径的plist文件中的数据（以NSDictionary的形式），即反序列化过程
+(NSDictionary *)dictionaryWithPlistName:(NSString *)plistName{
    if (plistName == nil || [plistName isEqualToString:@""]) {
        return nil;
    }
    // 读取配置信息
    NSData *data = [NSData dataWithContentsOfFile:[DOCUMENTPATH stringByAppendingPathComponent:plistName]];

    NSDictionary *dictionary = nil;
    @try {

    //反序列化
        dictionary =[NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    @catch (NSException *exception) {
        NSLog(@"打开出错：%@", exception);
    }
    @finally {
        
    }
    return dictionary;
}

#pragma mark 保存传入数据到plist文件中，返回值用于标记是否保存成功，即序列化过程
+(BOOL)saveDictionary:(NSDictionary *)dictionary withPlistName:(NSString *)plistName{
    if (plistName == nil || [plistName isEqualToString:@""]) {
        return NO;
    }
    //NSLog(@"传入字典：%@", dictionary);
    // 因写入的NSDictionary对象中可能包含NSNull对象，可能会导致出错，需要将NSDictionary对象转化成NSData类型之后再写入文件
    //序列化
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:dictionary];

    //[DOCUMENTPATH stringByAppendingPathComponent:plistName]获得完整路径
    BOOL didWriteSuccessfull = [data writeToFile:[DOCUMENTPATH stringByAppendingPathComponent:plistName] atomically:YES];
    if (didWriteSuccessfull) {
        NSLog(@"写入成功！");
    }
    return didWriteSuccessfull;
}

#pragma mark 删除对应plist文件的操作
+(BOOL)deletePlistFromName:(NSString *)plistName{
    NSError *error;
    if (plistName == nil || [plistName isEqualToString:@""]) {
        return NO;
    }
    // 获取文件管理器NSFileManager，在这里获取应用程序Documents文件夹里的文件及文件夹列表
    NSFileManager *appFileManager = [NSFileManager defaultManager];

    // 获取文件完整路径
    NSString *filePath = [DOCUMENTPATH stringByAppendingPathComponent:plistName];
    
    //测试文件是否存在，不存在就返回NO
    if (![appFileManager fileExistsAtPath:filePath]) {
        return NO;
    }
    
    //测试是否可删除，如果不可以删除，就返回NO
    if (![appFileManager isDeletableFileAtPath:filePath]) {
        return NO;
    }
    
    // 删除文件
    BOOL isDelete = [appFileManager removeItemAtPath:filePath error:&error];

    if (error) {

        // 删除出错则打印出错信息
        NSLog(@"删除plist文件出错：%@", error.localizedDescription);
    }
    
    return isDelete;
}

#pragma mark 对指定plist文件添加或者替换数据
+(BOOL)setObject:(id)object andKey:(id<NSCopying>)key toPlistWithName:(NSString *)plistName{
    if (plistName == nil || [plistName isEqualToString:@""]) {
        return NO;
    }
//    NSLog(@"path-->%@", [DOCUMENTPATH stringByAppendingPathComponent:plistName]);
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary:[self dictionaryWithPlistName:plistName]];
    if (dictionary == nil) {
        dictionary = [NSMutableDictionary dictionary];
    }
    [dictionary setObject:object forKey:key];
    return [self saveDictionary:dictionary withPlistName:plistName];
}

#pragma mark 根据key删除指定plist文件中的数据
+(BOOL)deleteObjectFromKey:(id<NSCopying>)key fromPlistName:(NSString *)plistName{
    if (plistName == nil || [plistName isEqualToString:@""]) {
        return NO;
    }
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary:[self dictionaryWithPlistName:plistName]];
    [dictionary removeObjectForKey:key];
    return [self saveDictionary:dictionary withPlistName:plistName];
}

#pragma mark 根据key查询指定plist文件中的数据
+(id)objectByKey:(id<NSCopying>)key fromPlistName:(NSString *)plistName{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary:[self dictionaryWithPlistName:plistName]];
    id object = [dictionary objectForKey:key];
    return object;
}

@end

//
//  HXEntityHelper.m
//  zfw
//
//  Created by Apple on 14-7-16.
//  Copyright (c) 2014年 华讯网络投资有限公司. All rights reserved.
//

#import "HXEntityHelper.h"
#import <objc/runtime.h>

// 用于屏蔽编译器警告
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

@implementation HXEntityHelper

#pragma mark 字典对象转为实体对象
+ (void) dictionaryToEntity:(NSDictionary *)dict entity:(NSObject *)entity
{
    if (dict && entity) {
        // 遍历获取字典中所有key对应的值
        for (NSString *keyName in [dict allKeys]) {
            //构建出属性的set方法
            NSString *destMethodName = [NSString stringWithFormat:@"set%@:",[keyName capitalizedString]]; //capitalizedString返回每个单词首字母大写的字符串（每个单词的其余字母转换为小写）
//            NSLog(@"方法名：%@", destMethodName);
            SEL destMethodSelector = NSSelectorFromString(destMethodName);
            if ([entity respondsToSelector:destMethodSelector]) {
//                  NSLog(@"方法名：%@，参数类型：%@", destMethodName, NSStringFromClass([[dict objectForKey:keyName] class]));
                // 设置对应属性的值
                SuppressPerformSelectorLeakWarning([entity performSelector:destMethodSelector withObject:[dict objectForKey:keyName]]);
            }
            
        }//end for
        
    }//end if
}

#pragma mark 实体对象转为字典对象
+ (NSDictionary *) entityToDictionary:(id)entity
{
    
    Class entityClass = [entity class];
    
    u_int count;
    
    // 获取所有属性
    objc_property_t* properties = class_copyPropertyList(entityClass, &count);
    // 属性名数组
    /*[NSMutableArray arrayWithCapacity:count] :初始化可变数组对象的长度，如果后面代码继续添加数组超过长度count以后NSMutableArray的长度会自动扩充，
      count是自己可以设置。*/
    NSMutableArray* propertyArray = [NSMutableArray arrayWithCapacity:count];
    // 属性的值的数组
    NSMutableArray* valueArray = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count ; i++)
    {
        objc_property_t prop=properties[i];
        // 获取属性名
        const char* propertyName = property_getName(prop);
        
        [propertyArray addObject:[NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding]];
        
//        const char* attributeName = property_getAttributes(prop);
//        NSLog(@"%@",[NSString stringWithUTF8String:propertyName]);
//        NSLog(@"%@",[NSString stringWithUTF8String:attributeName]);
        
//        id value =  nil;
//        SuppressPerformSelectorLeakWarning(value = [entity performSelector:NSSelectorFromString([NSString stringWithUTF8String:propertyName])]);
        // 获取对应属性的值
        id value = [entity valueForKey:[NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding]];
        if(value == nil){
            // 属性的值为空
            [valueArray addObject:[NSNull null]];
        }else {
            // 属性的值不为空，则直接添加
            [valueArray addObject:value];
        }
//        NSLog(@"%@",value);
    }
    
    free(properties);
    
    // 生成字典
    NSDictionary* returnDic = [NSDictionary dictionaryWithObjects:valueArray forKeys:propertyArray];
    NSLog(@"转换之后的字典：%@", returnDic);
    
    return returnDic;
}

@end

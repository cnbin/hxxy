//
//  HXUserManage.h
//  zfw
//
//  Created by Apple on 14-7-5.
//  Copyright (c) 2014年 华讯网络投资有限公司. All rights reserved.
//  用户信息管理类

#import <Foundation/Foundation.h>

@class HXUser;
@interface HXUserManage : NSObject<NSCopying>

@property (nonatomic, assign) bool isLogin;// 标志用户是否登录
@property (nonatomic, retain) HXUser *user;// 用户信息

/*使用instancetype 返回的一定是调用该方法的实例，而id则不一定，因为id是作为一个范型来使用的。
在写一条返回id的消息前，问自己：这个类返回实例吗？如果返回，用instancetype。
肯定有需要返回id的时候，但你用instancetype的频率应该会更高。
对于简易构造函数(convenience constructor)，应该总是用instancetype。编译器不会自动将id转化为instancetype。
id是通用对象，但如果你用instancetype，编译器就知道方法返回什么类型的对象。
只要一个类返回自身的实例，用instancetype就有好处。*/
+(instancetype)sharedInstance;

/*将user对象数据转化成dictionary*/
-(NSDictionary *)userToDictionary;
/*将dictionary对象中的数据转化成user类型*/
-(HXUser *)userByDictionary:(NSDictionary *)dictionary;

@end

//
//  HXUser.h
//  zfw
//
//  Created by Apple on 14-7-5.
//  Copyright (c) 2014年 华讯网络投资有限公司. All rights reserved.
//  用户实体类

#import <Foundation/Foundation.h>

@interface HXUser : NSObject

/*原子性      : atomic   :   对属性加锁，多线程下线程安全，默认值
                nonatomic:对属性不加锁，多线程下不安全，但是速度快

  读写属性    : readwrite:生成setter、getter,默认值
                readonly : 只生成getter方法

  set方法处理 : assign   :直接赋值，默认值
                retain   :先release原来的值，再retain新值
			    copy     :先realease原来的值，在copy新值

@property的参数分为三类，也就是说参数最多可以有三个，中间用逗号分隔，每类参数可以从上表三类参数中人选一个。
如果不进行设置或者只设置其中一类参数，程序会使用三类中的各个默认参数，默认参数：(atomic,readwrite,assign)
一般情况下如果在多线程开发中一个属性可能会被两个及两个以上的线程同时访问，此时可以考虑atomic属性，
否则建议使用nonatomic，不加锁，效率较高.

通常copy:用在通常用于字符串对象;
  assign:用于基本数据类型;
  retain:通常用于非字符串对象
*/
@property (nonatomic, copy) NSString *username;// 用户名
@property (nonatomic, copy) NSString *password;// 密码
@property (nonatomic, assign) BOOL isautologin;// 标志是否自动登录
@property (nonatomic, copy) NSString *avatarimage;// 用户头像
@property (nonatomic, copy) NSString *realname;// 真实姓名
@property (nonatomic, assign) BOOL sex;// 性别
@property (nonatomic, copy) NSString *district;// 所属地区
@property (nonatomic, copy) NSString *phone;// 电话号码
@property (nonatomic, copy) NSString *cellphone;// 手机号码
@property (nonatomic, copy) NSString *qq;// QQ号码
@property (nonatomic, copy) NSString *mail;// 电子邮箱
@property (nonatomic, copy) NSString *address;// 详细地址
@property (nonatomic, copy) NSString *birthdaydate;// 出生日期




@end

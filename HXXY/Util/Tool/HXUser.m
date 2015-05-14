//
//  HXUser.m
//  zfw
//
//  Created by Apple on 14-7-5.
//  Copyright (c) 2014年 华讯网络投资有限公司. All rights reserved.
//

#import "HXUser.h"
//这个宏定义#define do{...}while(0)的作用是：IOS忽略-Warc-performSelector-leaks警告.因为采用的库，然后编译的时候，库文件会有很多警告，这样程序其他文件的警告就不容易发现了，
//利用宏定义的方法来设置忽略某个文件的警告，在编译的时候不报出来。
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

@implementation HXUser

#pragma mark 重写父类方法
//重写父类Object类的方法

/*
1　　SEL　变量名　=　@selector(方法名字);
2　　SEL　变量名　=　NSSelectorFromString(方法名字的字符串);
3　　NSString　*变量名　=　NSStringFromSelector(SEL参数);

　　其中第1行是直接在程序里面写上方法的名字，第2行是写上方法名字的字符串，第3行是通过SEL变量获得方法的名字。
    我们得到了SEL变量之后，可以通过下面的调用来给一个对象发送消息：

　　[对象　performSelector:SEL变量　withObject:参数1　withObject:参数2];

　　这样的机制大大的增加了我们的程序的灵活性，我们可以通过给一个方法传递SEL参数，让这个方法动态的执行某一个方法；我们
    也可以通过配置文件指定需要执行的方法，程序读取配置文件之后把方法的字符串翻译成为SEL变量然后给相应的对象发送这个消息。
    从效率的角度上来说，执行的时候不是通过方法名字而是方法ID也就是一个整数来查找方法，由于整数的查找和匹配比字符串要快得多，
    所以这样可以在某种程度上提高执行的效率。
*/
-(id)performSelector:(SEL)aSelector withObject:(id)object{
    // 获取方法名
    NSString *selectorName = NSStringFromSelector(aSelector);
    // 若方法名是对应方法，则执行对应操作
    // 当传入参数为NSNumber对象时，设置后使用get方法获取后的值不准确，需把NSNumber对象转化成基本类型调用set方法
    if ([selectorName isEqualToString:@"setSex:"]) {
        [self setSex:[(NSNumber *)object boolValue]];
    }else if ([selectorName isEqualToString:@"setIsautologin:"]){
        [self setIsautologin:[(NSNumber *)object boolValue]];
    }else{
        id result = nil;
        // 设置对应属性的值
        SuppressPerformSelectorLeakWarning(result = [super performSelector:aSelector withObject:object]);
        return result;
    }
    return nil;
}

@end

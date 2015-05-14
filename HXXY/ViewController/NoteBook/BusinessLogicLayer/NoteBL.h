//
//  NoteBL.h
//  notebook
//
//  Created by Apple on 12/11/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"
#import "NoteDAO.h"
@interface NoteBL : NSObject
//插入Note方法
-(NSMutableArray*) createNote:(Note*)model;

//删除Note方法
-(NSMutableArray*) remove:(Note*)model;

//查询所用数据方法
-(NSMutableArray*) findAll;

@end

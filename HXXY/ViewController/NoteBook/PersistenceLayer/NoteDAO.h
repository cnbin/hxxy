//
//  NoteDAO.h
//  notebook
//
//  Created by Apple on 12/11/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "NoteDAODelegate.h"
#import "Note.h"
#import "NSString+URLEncoding.h"
#import "NSNumber+Message.h"
#import "MKNetworkKit.h"

#define HOST_PATH @"/service/mynotes/webservice.php"
#define HOST_NAME @"iosbook1.com"

@interface NoteDAO : NSObject

//保存数据列表
@property (nonatomic,strong) NSMutableArray* listData;

@property (weak, nonatomic) id <NoteDAODelegate> delegate;

//插入Note方法
-(void) create:(Note*)model;

//删除Note方法
-(void) remove:(Note*)model;

//修改Note方法
-(void) modify:(Note*)model;

//查询所有数据方法
-(void) findAll;


@end
//
//  MasterViewController.h
//  HXXY
//
//  Created by Apple on 12/23/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"
#import "NoteDAO.h"
#import "NoteBL.h"
#import "NoteBLDelegate.h"
#import "HXBaseViewController.h"

@interface MasterViewController :UITableViewController<NoteBLDelegate>
//保存数据列表
@property (nonatomic,strong) NSMutableArray* listData;
//删除数据索引
@property (nonatomic,assign) NSUInteger deletedIndex;
//删除数据
@property (nonatomic,strong) Note *deletedNote;
//BL对象
@property (nonatomic,strong) NoteBL *bl;

@end

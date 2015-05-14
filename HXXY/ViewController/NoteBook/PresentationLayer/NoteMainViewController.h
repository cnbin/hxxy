//
//  NoteMainViewController.h
//  HXXY
//
//  Created by Apple on 12/11/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"
#import "NoteDAO.h"
#import "NoteBL.h"
#import "HXBaseViewController.h"
@interface NoteMainViewController :HXBaseViewController<UITableViewDelegate,UITableViewDataSource>{
    UITableView * _tableView;
    UIButton *_navMainButton;// 导航栏按钮
}

//保存数据列表
@property (nonatomic,strong) NSMutableArray* listData;
//保存数据列表
@property (nonatomic,strong)  NoteBL* bl;
@property (strong, nonatomic) UINavigationController *rootNavigationController;


@end

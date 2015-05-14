//
//  MasterViewController.m
//  HXXY
//
//  Created by Apple on 12/23/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "MasterViewController.h"
#import "AddViewController.h"
@interface MasterViewController ()

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"备忘录";
    UIBarButtonItem *addButtonItem = [[ UIBarButtonItem alloc]
                                    initWithBarButtonSystemItem: UIBarButtonSystemItemAdd
                                    target: self
                                    action: @selector(onclickAdd:)
                                    ];
    self.navigationItem.rightBarButtonItem=addButtonItem;
    
    _bl = [NoteBL new];
    _bl.delegate = self;
    [_bl findAllNotes];
    
    //初始化UIRefreshControl
    UIRefreshControl *rc = [[UIRefreshControl alloc] init];
    rc.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新"];
    [rc addTarget:self action:@selector(refreshTableView) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = rc;
}
-(void) refreshTableView
{
    if (self.refreshControl.refreshing) {
        self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"加载中..."];
        
        _bl.delegate = self;
        [_bl findAllNotes];
    }
}
-(void)onclickAdd:(UIButton *)button{
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:[[AddViewController alloc] init]] animated:YES completion:nil];

}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle  reuseIdentifier:CellIdentifier];
        Note  *note = self.listData[indexPath.row];
        cell.textLabel.text = note.content;
        cell.detailTextLabel.text = [note.date description];
        
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;

}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
        return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        _deletedIndex = [indexPath row];
        _deletedNote = [_listData objectAtIndex:_deletedIndex];
        
        _bl.delegate = self;
        [_bl removeNote: _deletedNote];
        
        [self.listData removeObject:_deletedNote];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
#pragma mark - 处理通知
//查询所有数据方法 成功
- (void)findAllNotesFinished:(NSMutableArray *)list
{
    self.listData  = list;
    [self.tableView reloadData];
    if (self.refreshControl) {
        [self.refreshControl endRefreshing];
        self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新"];
    }
}

//查询所有数据方法 失败
- (void)findAllNotesFailed:(NSError*)error
{
    
    NSString *errorStr = [error localizedDescription];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"操作信息"
                                                        message:errorStr
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
    [alertView show];
    if (self.refreshControl) {
        [self.refreshControl endRefreshing];
        self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新"];
    }
}


//删除Note方法 成功
- (void)removeNoteFinished
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"操作信息"
                                                        message:@"删除成功。"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
    [alertView show];
}

//删除Note方法 失败
- (void)removeNoteFailed:(NSError *)error
{
    NSString *errorStr = [error localizedDescription];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"操作信息"
                                                        message:errorStr
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
    [alertView show];
    
    [self.listData insertObject:_deletedNote atIndex:_deletedIndex];
    [self.tableView reloadData];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

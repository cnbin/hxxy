//
//  NoteMainViewController.m
//  HXXY
//
//  Created by Apple on 12/11/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "NoteMainViewController.h"
#import "NoteAddViewController.h"
@interface NoteMainViewController ()

@end

@implementation NoteMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"备忘录";
    _navMainButton= [[UIButton alloc] initWithFrame:CGRectMake(250, 10, 60, 30)];
    //UIControlStateNormal表示正常显示
    [_navMainButton setTitle:@"添加" forState:UIControlStateNormal];
    [_navMainButton addTarget:self action:@selector(onclickAdd:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:_navMainButton];
    
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width,600)];

    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled=YES;
    [self.view addSubview:_tableView];
    
    self.bl = [[NoteBL alloc] init];
    //self.listData = [self.bl findAll];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reloadView:)
                                                 name:@"reloadViewNotification"
                                               object:nil];
    

    
}
-(void)onclickAdd:(UIButton *)button{
      [self presentViewController:[[UINavigationController alloc] initWithRootViewController:[[NoteAddViewController alloc] init]] animated:YES completion:nil];
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
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"yyyy-MM-dd"];
        // cell.detailTextLabel.text = [note.date description];
        cell.detailTextLabel.text = [df stringFromDate:note.date];


    }
    return cell;
}

//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Return NO if you do not want the specified item to be editable.
//    return YES;
//}
//
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        
//        Note *note = [self.listData objectAtIndex:[indexPath row]];
//        NoteBL *bl = [[NoteBL alloc] init];
//        self.listData = [bl remove: note];
//        
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//        
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        
//    }
//}


//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    //    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
//    //        Note  *note = self.listData[indexPath.row];
//    //       // self.detailViewController.detailItem = note;
//    //    }
//}


#pragma mark - 处理通知
-(void)reloadView:(NSNotification*)notification
{
    NSMutableArray *resList = [notification object];
    self.listData  = resList;
    [_tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

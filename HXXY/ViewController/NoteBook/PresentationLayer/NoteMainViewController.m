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
    
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigation.leftImage  = [UIImage imageNamed:@"nav_backbtn.png"];
    //右边导航图片设置为耳机图片
    
    self.navigation.title = @"备忘录";
    self.navigation.navigaionBackColor = [UIColor colorWithRed:124.0f/255.0f green:252.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
    
   _navMainButton= [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width-60, self.navigation.frame.size.height/2.5, 60, 30)];
    //UIControlStateNormal表示正常显示
    [_navMainButton setTitle:@"添加" forState:UIControlStateNormal];
    [_navMainButton addTarget:self action:@selector(onclickAdd:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_navMainButton];
    
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0,self.navigation.frame.size.height+self.navigation.frame.origin.y, self.view.frame.size.width,440)];

    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled=YES;
    [self.view addSubview:_tableView];
    
    self.bl = [[NoteBL alloc] init];
    self.listData = [self.bl findAll];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reloadView:)
                                                 name:@"reloadViewNotification"
                                               object:nil];
    

    
}
-(void)onclickAdd:(UIButton *)button{
    [self presentViewController:[[NoteAddViewController alloc] init] animated:YES completion:nil];
    
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

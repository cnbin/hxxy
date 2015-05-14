//
//  PingAnXiaoYuanViewController.m
//  HXXY
//
//  Created by Apple on 1/16/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import "PingAnXiaoYuanViewController.h"
#define cellHeight 40

@interface PingAnXiaoYuanViewController (){
    UILabel * _bianhaoLabel ;
    UILabel * _dateLabel;
    UILabel * _churuLabel;
    UILabel * _timeLabel;
    
    UILabel * _bianhaonumLabel;
    UILabel * _dateContentLabel;
    UILabel * _churuLabel1;
    UILabel * _churuLabel2;
    UILabel * _timeLabel1;
    UILabel * _timeLabel2;

    NSMutableArray * _bianhaonumNSMutableArray;
    NSMutableArray * _dateContentNSMutableArray;
    NSMutableArray * _churuNSMutableArray;
    NSMutableArray * _churuNSMutableArray2;
    NSMutableArray * _timeNSMutableArray;
    NSMutableArray * _timeNSMutableArray2;
}

@end

@implementation PingAnXiaoYuanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"平安校园";
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    _scrollView.contentSize = CGSizeMake(320,520);
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width,self.view.frame.size.height)];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled=YES;
    [_tableView setSeparatorColor:[UIColor blackColor]];//设置分割线颜色
    [_scrollView  addSubview:_tableView];
    [self.view addSubview:_scrollView];
    
    _bianhaonumNSMutableArray=[@[@"",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"]mutableCopy];
    _dateContentNSMutableArray=[@[@"",@"今天",@"昨天",@"今天",@"昨天",@"今天",@"昨天",@"今天",@"昨天",@"昨天",@"昨天"]mutableCopy];
    _churuNSMutableArray=[@[@"",@"到校",@"到校",@"到校",@"到校",@"到校",@"到校",@"到校",@"到校",@"到校",@"到校"]mutableCopy];
    
    _churuNSMutableArray2=[@[@"",@"离校",@"离校",@"离校",@"离校",@"离校",@"离校",@"离校",@"离校",@"离校",@"离校"]mutableCopy];
    _timeNSMutableArray=[@[@"",@"7:30",@"7:30",@"7:30",@"7:30",@"7:30",@"7:30",@"7:30",@"7:30",@"7:30",@"7:30"]mutableCopy];
    
    _timeNSMutableArray2=[@[@"",@"5:30",@"5:30",@"5:30",@"5:30",@"5:30",@"5:30",@"5:30",@"5:30",@"5:30",@"5:30"]mutableCopy];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  11;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell;
    NSInteger row = indexPath.row;
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        for (int i=1; i<=3; i++) {
            UILabel * tempLabel=[[UILabel alloc]initWithFrame:CGRectMake(80*i+1, 0, 0.5, 40)];
            tempLabel.backgroundColor=[UIColor blackColor];
            [cell addSubview:tempLabel];
        }
        if (row==0) {
            _bianhaoLabel=[[UILabel alloc]initWithFrame:CGRectMake(30, 5, 30, 30)];
            _bianhaoLabel.text=@"编号";
            _bianhaoLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
            [cell.contentView addSubview:_bianhaoLabel];
            
            _bianhaoLabel=[[UILabel alloc]initWithFrame:CGRectMake(30+80, 5, 30, 30)];
            _bianhaoLabel.text=@"日期";
            _bianhaoLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
            [cell.contentView addSubview:_bianhaoLabel];
            
            _bianhaoLabel=[[UILabel alloc]initWithFrame:CGRectMake(30+160, 5, 30, 30)];
            _bianhaoLabel.text=@"出入";
            _bianhaoLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
            [cell.contentView addSubview:_bianhaoLabel];
            
            _bianhaoLabel=[[UILabel alloc]initWithFrame:CGRectMake(30+240, 5, 30, 30)];
            _bianhaoLabel.text=@"时间";
            _bianhaoLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
            [cell.contentView addSubview:_bianhaoLabel];
        }
        else{
            UILabel * tempLabel=[[UILabel alloc]initWithFrame:CGRectMake(161, 20,160, 0.5)];
            tempLabel.backgroundColor=[UIColor blackColor];
            [cell addSubview:tempLabel];
            
            _bianhaonumLabel=[[UILabel alloc]initWithFrame:CGRectMake(40, 5, 30, 30)];
            _bianhaonumLabel.text=[_bianhaonumNSMutableArray objectAtIndex:row];
            _bianhaonumLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
            [cell.contentView addSubview:_bianhaonumLabel];
            
            _dateLabel=[[UILabel alloc]initWithFrame:CGRectMake(110, 5, 30, 30)];
            _dateLabel.text=[_dateContentNSMutableArray objectAtIndex:row];
            _dateLabel.font=[UIFont fontWithName:@"Helvetica" size:13];
            [cell.contentView addSubview:_dateLabel];
            
            _churuLabel1=[[UILabel alloc]initWithFrame:CGRectMake(190, 1, 30, 20)];
            _churuLabel1.text=[_churuNSMutableArray objectAtIndex:row];
            _churuLabel1.font=[UIFont fontWithName:@"Helvetica" size:13];
            [cell.contentView addSubview:_churuLabel1];
            
            _churuLabel2=[[UILabel alloc]initWithFrame:CGRectMake(190, 21, 30, 20)];
            _churuLabel2.text=[_churuNSMutableArray2 objectAtIndex:row];
            _churuLabel2.font=[UIFont fontWithName:@"Helvetica" size:13];
            [cell.contentView addSubview:_churuLabel2];
            
            _timeLabel1=[[UILabel alloc]initWithFrame:CGRectMake(270, 1, 30, 20)];
            _timeLabel1.text=[_timeNSMutableArray objectAtIndex:row];
            _timeLabel1.font=[UIFont fontWithName:@"Helvetica" size:13];
            [cell.contentView addSubview: _timeLabel1];
            
            _timeLabel2=[[UILabel alloc]initWithFrame:CGRectMake(270, 21, 30, 20)];
            _timeLabel2.text=[_timeNSMutableArray2 objectAtIndex:row];
            _timeLabel2.font=[UIFont fontWithName:@"Helvetica" size:13];
            [cell.contentView addSubview:_timeLabel2];
            
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cellHeight;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

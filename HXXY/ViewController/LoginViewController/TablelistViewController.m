//
//  TablelistViewController.m
//  HXXY
//
//  Created by Apple on 11/17/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "TablelistViewController.h"
#import "FMPAImageView.h"
#import "XiaoWuViewController.h"
@interface TablelistViewController ()

@end

@implementation TablelistViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    self.view.backgroundColor = [UIColor whiteColor];
    //导航左边返回箭头图标
    self.navigation.leftImage  = [UIImage imageNamed:@"nav_backbtn.png"];
    self.navigation.title = @"互动宝宝";
    self.navigation.navigaionBackColor = [UIColor colorWithRed:124.0f/255.0f green:252.0f/255.0f blue:0.0f/255.0f alpha:1.0f];

    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0,self.navigation.frame.size.height+self.navigation.frame.origin.y, self.view.frame.size.width,440)];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled=YES;
    [self.view addSubview:_tableView];
   
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   // return [array count];
    return  11;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString *CellIdentifier = @"cell";
    
    UITableViewCell *cell;
    NSInteger row = indexPath.row;
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        /*
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 180, 40)];
        label1.tag=1;
        label1.backgroundColor = [UIColor clearColor];
        
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 180, 40)];
        label2.tag=2;
        label2.backgroundColor = [UIColor clearColor];
        
        UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 180, 40)];
        label3.tag=3;
        label3.backgroundColor = [UIColor clearColor];
        
        UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 180, 40)];
        label4.tag=4;
        label4.backgroundColor = [UIColor clearColor];
        
        UILabel *label5 = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 180, 40)];
        label5.tag=5;
        label5.backgroundColor = [UIColor clearColor];
        
        UILabel *label6= [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 180, 40)];
        label6.tag=6;
        label6.backgroundColor = [UIColor clearColor];
        
        UILabel *label7 = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 180, 40)];
        label7.tag=7;
        label7.backgroundColor = [UIColor clearColor];
        
        UILabel *label8 = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 180, 40)];
        label8.tag=8;
        label8.backgroundColor = [UIColor clearColor];
        
        UILabel *label9= [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 180, 40)];
        label9.tag=9;
        label9.backgroundColor = [UIColor clearColor];
        
        UILabel *label10 = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 180, 40)];
        label10.tag=10;
        label10.backgroundColor = [UIColor clearColor];
        
        UILabel *label11 = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 180, 40)];
        label11.tag=11;
        label11.backgroundColor = [UIColor clearColor];

        [cell.contentView addSubview:label1];
        [cell.contentView addSubview:label2];
        [cell.contentView addSubview:label3];
        [cell.contentView addSubview:label4];
        [cell.contentView addSubview:label5];
        [cell.contentView addSubview:label6];
        [cell.contentView addSubview:label7];
        [cell.contentView addSubview:label8];
        [cell.contentView addSubview:label9];
        [cell.contentView addSubview:label10];
        [cell.contentView addSubview:label11];
        */
        int labeltag=1,imageViewtag=1;
        for(int labelindex=0;labelindex<12;labelindex++)
        {
            UILabel *labelindex=[[UILabel alloc]initWithFrame:CGRectMake(60, 8, 180, 24)];
            labelindex.tag=labeltag;
            [cell.contentView addSubview:labelindex];
            labeltag++;
            /*
            UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"120.png"]];
            imageView.frame = CGRectMake(10.f, 5.f, 40.f, 40.f);
            imageView.layer.masksToBounds = YES;
            imageView.layer.cornerRadius = 20;
            imageView.tag=imageViewtag;
            [cell.contentView addSubview:imageView];
            imageViewtag++;
        */
            
            UIImageView * imageView = [[FMPAImageView alloc] initWithFrame:CGRectMake(12, 2, 36, 36)];
            imageView.image = [UIImage imageNamed:@"120.png"];
            imageView.tag=imageViewtag;
            [cell.contentView addSubview:imageView];
            imageViewtag++;
        
            
        }
        
    }
    switch (row) {
        case 0:
           ((UILabel *)[cell.contentView viewWithTag:1]).text =@"校务信息";
            break;
        case 1:
           ((UILabel *)[cell.contentView viewWithTag:2]).text =@"宝宝每一天";
            break;
        case 2:
           ((UILabel *)[cell.contentView viewWithTag:3]).text =@"家校联系册";
            break;
        case 3:
            ((UILabel *)[cell.contentView viewWithTag:4]).text =@"宝宝在线";
            break;
        case 4:
            ((UILabel *)[cell.contentView viewWithTag:5]).text =@"平安校园";
            break;
        case 5:
            ((UILabel *)[cell.contentView viewWithTag:6]).text =@"家庭作业";
            break;
        case 6:
            ((UILabel *)[cell.contentView viewWithTag:7]).text =@"备忘录";
            break;
        case 7:
            ((UILabel *)[cell.contentView viewWithTag:8]).text =@"意见反馈";
            break;
        case 8:
            ((UILabel *)[cell.contentView viewWithTag:9]).text =@"应用推荐";
            break;
        case 9:
            ((UILabel *)[cell.contentView viewWithTag:10]).text =@"活动投票";
            break;
        case 10:
            ((UILabel *)[cell.contentView viewWithTag:11]).text =@"校园评价";
            break;
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
 
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch ([indexPath row]) {
        case 0:
        {
           XiaoWuViewController *xiaoWuViewController=[[XiaoWuViewController alloc]init];
            [self.navigationController pushViewController:xiaoWuViewController animated:YES];
        }
            break;
        default:
            break;
    }

    }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

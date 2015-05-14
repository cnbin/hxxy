//
//  UserViewController.m
//  HXXY
//
//  Created by Apple on 11/18/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "UserViewController.h"
#import "YiJianFangKuiViewController.h"
@interface UserViewController ()

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    self.view.backgroundColor = [UIColor whiteColor];
    //导航左边返回箭头图标
    self.navigation.leftImage  = [UIImage imageNamed:nil];
    self.navigation.title = @"个人中心";
    self.navigation.navigaionBackColor = [UIColor colorWithRed:124.0f/255.0f green:252.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
    
    CGRect frame = self.view.frame;
    frame.origin.y = 66;
    frame.size.height -= 66;
    //对TableView表格视图style设置为分组形式
    _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    
    UIButton *cancle=[[UIButton alloc]initWithFrame:CGRectMake(20, 370, 280, 30)];
    [cancle setTitle:@"注销" forState:UIControlStateNormal];
    [cancle setTintColor:[UIColor whiteColor]];
    [cancle setBackgroundColor:[UIColor colorWithRed:192.0f/255.0f green:37.0f/255.0f blue:62.0f/255.0f alpha:1.0f]];
    [cancle.layer setMasksToBounds:YES];
    [cancle.layer setCornerRadius:10.0];
    [_tableView addSubview:cancle];
    [self.view addSubview:_tableView];
 
}

#pragma mark 界面即将显示的时候调用
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //reloadData刷新整个表格。
    [_tableView reloadData];
}


#pragma mark 返回分组个数
//numberOfSectionsInTableView是UITableViewDelegate中的方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

#pragma mark 返回对应分组的cell个数
//调用的是UITableViewDataSource的tableView:方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
            //section默认从0开始，即section0=0,section1=1,section2=2
            //cell表示单元格，
        case 0:
            return 2;
            break;
        case 1:
            return 3;
            break;
        case 2:
            return 3;
            break;
        case 4:
            return 0;
            break;
        default:
            break;
    }
    return 0;
}
#pragma mark 返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    NSInteger section = indexPath.section;
    
    
    static NSString *FristCellIdentifier = @"fristCell";
    static NSString *SecondCellIdentifier = @"secondCell";
    static NSString *ThirdCellIdentifier = @"thirdCell";
    UITableViewCell *cell;
    switch (section) {
        case 0:
        {
            // 第一组
            cell =[tableView dequeueReusableCellWithIdentifier:FristCellIdentifier];
            if (cell == nil) {
                cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FristCellIdentifier];
                 cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                switch (row){
                    case 0:
                    {
                        /*
                      UILabel *Label1 = [[UILabel alloc] initWithFrame:CGRectMake(25, 2, 250, 26)];
                      Label1 .backgroundColor = [UIColor clearColor];
                      Label1 .tag =1;
                      Label1.text=@"提醒推送设置";
                      [cell.contentView addSubview:Label1 ];
                        */
                       cell.textLabel.text=@"提醒推送设置";
                    }
                        break;
                    case 1:
                    {
                        /*
                        UILabel *Label2 = [[UILabel alloc] initWithFrame:CGRectMake(25, 2, 250, 26)];
                        Label2.backgroundColor = [UIColor clearColor];
                        Label2.tag =2;
                        Label2.text=@"中国联通互动宝宝使用日期";
                        [cell.contentView addSubview:Label2];
                        */
                        cell.textLabel.text=@"中国联通互动宝宝使用日期";
                    }
                        break;
                  default:
                        break;
                        
               }
          }
         break;
            
        case 1:
        {
            cell =[tableView dequeueReusableCellWithIdentifier:SecondCellIdentifier];
            if (cell == nil) {
                cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SecondCellIdentifier];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

                switch (row){
                    case 0:
                    {
                        /*
                        UILabel *Label1 = [[UILabel alloc] initWithFrame:CGRectMake(25, 2, 250, 26)];
                        Label1 .backgroundColor = [UIColor clearColor];
                        Label1 .tag =1;
                        Label1.text=@"在线更新";
                        [cell.contentView addSubview:Label1 ];
                        */
                        cell.textLabel.text=@"在线更新";
                        cell.textLabel.tag=1;
                    }
                        break;
                    case 1:
                    {
                        /*
                        UILabel *Label2 = [[UILabel alloc] initWithFrame:CGRectMake(25, 2, 250, 26)];
                        Label2.backgroundColor = [UIColor clearColor];
                        Label2.tag =2;
                        Label2.text=@"关于";
                        [cell.contentView addSubview:Label2];
                        */
                        cell.textLabel.text=@"关于";
                        cell.textLabel.tag=2;
 
                    }
                        break;
                    case 2:
                    {
                        /*
                        UILabel *Label3 = [[UILabel alloc] initWithFrame:CGRectMake(25, 2, 250, 26)];
                        Label3.backgroundColor = [UIColor clearColor];
                        Label3.tag =3;
                        Label3.text=@"意见反馈";
                        [cell.contentView addSubview:Label3];
                        */
                        cell.textLabel.text=@"意见反馈";
                        cell.textLabel.tag=3;

                    }
                        break;
                    default:
                        break;
                        
                }
            }
            
        }
            break;
        case 2:
            {
                cell =[tableView dequeueReusableCellWithIdentifier:ThirdCellIdentifier];
                if (cell == nil) {
                    cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ThirdCellIdentifier];
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

                    switch (row){
                        case 0:
                        {
                            /*
                            UILabel *Label1 = [[UILabel alloc] initWithFrame:CGRectMake(25, 2, 250, 26)];
                            Label1 .backgroundColor = [UIColor clearColor];
                            Label1 .tag =1;
                            Label1.text=@"关注我们";
                            [cell.contentView addSubview:Label1 ];
                             */
                            cell.textLabel.text=@"关注我们";
                            cell.textLabel.tag=4;

                        }
                            break;
                        case 1:
                        {
                            /*
                            UILabel *Label2 = [[UILabel alloc] initWithFrame:CGRectMake(25, 2, 250, 26)];
                            Label2.backgroundColor = [UIColor clearColor];
                            Label2.tag =2;
                            Label2.text=@"门站网站:www.abcd.com";
                            [cell.contentView addSubview:Label2];
                            */
                            cell.textLabel.text=@"门站网站:www.abcd.com";
                            cell.textLabel.tag=5;
 
                        }
                            break;
                        case 2:
                        {
                            /*
                            UILabel *Label3 = [[UILabel alloc] initWithFrame:CGRectMake(25, 2, 250, 26)];
                            Label3.backgroundColor = [UIColor clearColor];
                            Label3.tag =3;
                            Label3.text=@"客服电话:400-800-3761";
                            [cell.contentView addSubview:Label3];
                            */
                            cell.textLabel.text=@"客服电话:400-800-3761";
                            cell.textLabel.tag=6;
                        }
                            break;
                        default:
                            break;
                            
                    }
                }
                

            }
            break;
            
       default:
            break;
    }
}
    return cell;
}

#pragma mark 返回各个cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30.f;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch ([indexPath section]) {
        case 0:
        {
            switch ([indexPath row]) {
                case 0:
                {
                    
                 }
                    break;
                    
                case 1:
                {
                    
                }
                    break;
                default:
                    break;
            }
        }

            break;
        case 1:
        {
            switch ([indexPath row]) {
                case 0:
                {
                    
                }
                    break;
                    case 1:
                {
                    
                }
                    break;
                    case 2:
                {
                    YiJianFangKuiViewController *yiJianFangKuiViewController=[[YiJianFangKuiViewController alloc]init];
                    [self.navigationController pushViewController:yiJianFangKuiViewController animated:YES];
                }
                    break;
                default:
                    break;
            }

            
        }
        case 2:
        {
            
        }
            break;
        default:
            break;
    } ;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

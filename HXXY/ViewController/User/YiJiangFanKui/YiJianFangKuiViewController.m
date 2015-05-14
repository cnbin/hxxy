//
//  YiJianFangKuiViewController.m
//  HXXY
//
//  Created by Apple on 11/18/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "YiJianFangKuiViewController.h"
#import "DXAlertView.h"
@interface YiJianFangKuiViewController ()

@end

@implementation YiJianFangKuiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    self.view.backgroundColor = [UIColor whiteColor];
    //导航左边返回箭头图标
    self.navigation.leftImage  = [UIImage imageNamed:@"nav_backbtn.png"];
    self.navigation.title = @"意见反馈";
    self.navigation.navigaionBackColor = [UIColor colorWithRed:124.0f/255.0f green:252.0f/255.0f blue:0.0f/255.0f alpha:1.0f];

    UILabel *titleLabel =[[UILabel alloc]initWithFrame:CGRectMake(20, self.navigation.frame.origin.y+self.navigation.frame.size.height+20, 280, 30)];
    titleLabel.text=@"请提出您对此应用的意见";
    [self.view addSubview:titleLabel];
    
    UILabel *starLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, titleLabel.frame.origin.y+titleLabel.frame.size.height+20, 40, 30)];
    starLabel.text=@"星级:";
    [self.view addSubview:starLabel];
    
    UILabel *contentLabel=[[UILabel alloc]initWithFrame:CGRectMake(20,starLabel.frame.origin.y+starLabel.frame.size.height+20, 40, 30)];
    contentLabel.text=@"内容:";
    [self.view addSubview:contentLabel];
    
    UITextField *contentText=[[UITextField alloc]initWithFrame:CGRectMake(80, starLabel.frame.origin.y+starLabel.frame.size.height+20, 200, 30)];
    contentText.borderStyle = UITextBorderStyleRoundedRect;
    contentText.placeholder = @"请输入评价内容";
    contentText.clearButtonMode = UITextFieldViewModeWhileEditing;
    contentText.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:contentText];
    
    UIButton *commit=[[UIButton alloc]initWithFrame:CGRectMake(20,contentLabel.frame.origin.y+contentLabel.frame.size.height+20, 280, 30)];
    [commit setTitle:@"注销" forState:UIControlStateNormal];
    [commit setTintColor:[UIColor whiteColor]];
    [commit setBackgroundColor:[UIColor colorWithRed:192.0f/255.0f green:37.0f/255.0f blue:62.0f/255.0f alpha:1.0f]];
    [commit.layer setMasksToBounds:YES];
    [commit.layer setCornerRadius:10.0];
    [commit addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:commit];
    
}
-(void)buttonAction:(UIButton *)button
{
    DXAlertView *alert = [[DXAlertView alloc] initWithTitle:@"温馨提示" contentText:@"您确定要退出当前账号吗？" leftButtonTitle:@"取消" rightButtonTitle:@"确定"];
    [alert show];
    alert.leftBlock = ^() {
        NSLog(@"left button clicked");
    };
    alert.rightBlock = ^() {
       
        NSLog(@"注销成功");
    };
    alert.dismissBlock = ^() {
        NSLog(@"Do something interesting after dismiss block");
    };
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

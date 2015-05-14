//
//  HXBaseViewController.m
//  HXXY
//
//  Created by Apple on 11/17/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "HXBaseViewController.h"

@interface HXBaseViewController ()

@end

@implementation HXBaseViewController
@synthesize navigation = _navigation;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //获取手机系统版本号
    NSString * systeam = [UIDevice currentDevice].systemVersion;
    float number = [systeam floatValue];
    
    //如果版本号小于6.9，则隐藏状态栏，反之显示状态栏。
    CGFloat height = 0.0f;
    NSInteger type = 0;
    if (number <= 6.9) {
        type = 0;  //隐藏状态栏。
        height = 44.0f;
    }else{
        type = 1;  //显示状态栏。
        height = 66.0f;
    }
    //获取globle单例
    //globle = [Globle shareGloble];
    
    self.navigation = [[HXNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, height)];
    _navigation.type = type;  //设置状态栏类型是否为显示
    _navigation.leftImage  = [UIImage imageNamed:@"nav_backbtn.png"]; //设置左导航图片
    _navigation.delegate = self; //设置委托
    _navigation.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_navigation];  //添加导航视图
    

}

//左导航按钮点击返回，必须实现的方法。
#pragma mark ##### ZZNavigationViewDelegate ####
-(void)previousToViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

//可以选择实现的方法。
-(void)rightButtonClickEvent
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

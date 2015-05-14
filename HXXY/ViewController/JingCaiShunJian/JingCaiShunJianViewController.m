//
//  JingCaiXunJianViewController.m
//  HXXY
//
//  Created by Apple on 12/13/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "JingCaiShunJianViewController.h"

@interface JingCaiShunJianViewController ()

@end

@implementation JingCaiShunJianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    self.view.backgroundColor = [UIColor whiteColor];
    //左边导航图片设置为空
    self.navigation.leftImage  =nil;// [UIImage imageNamed:@"nav_backbtn.png"];
    //右边导航图片设置为耳机图片
    self.navigation.rightImage =nil;
    //    self.navigation.headerImage = [UIImage imageNamed:@"nav_canadaicon.png"];
    //设置标题
    self.navigation.title = @"精彩瞬间";
    self.navigation.navigaionBackColor = [UIColor colorWithRed:124.0f/255.0f green:252.0f/255.0f blue:0.0f/255.0f alpha:1.0f];

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

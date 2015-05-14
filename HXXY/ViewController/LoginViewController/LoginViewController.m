//
//  ShouYeViewController.m
//  HXXY
//
//  Created by Apple on 11/17/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//
#import "Toast+UIView.h"
#import "LoginViewController.h"
#import "AFNetworking.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

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
    self.navigation.title = @"登录";
    self.navigation.navigaionBackColor = [UIColor colorWithRed:124.0f/255.0f green:252.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
    
    UILabel *phonenum=[[UILabel alloc]initWithFrame:CGRectMake(20, self.navigation.frame.size.height+self.navigation.frame.origin.y+30, 80, 30)];
    phonenum.text=@"手机号码:";
    [self.view addSubview:phonenum];
    
    phonenumText=[[UITextField alloc]initWithFrame:CGRectMake(120, phonenum.frame.origin.y, 170, 30)];
    phonenumText.borderStyle=UITextBorderStyleRoundedRect;
    phonenumText.placeholder=@"请输入你的手机号码";
    [self.view addSubview:phonenumText];
    
    
    UILabel *password =[[UILabel alloc]initWithFrame:CGRectMake(20, phonenum.frame.size.height+phonenum.frame.origin.y+15, 80, 30)];
    password.text=@"验证码:";
    [self.view addSubview:password];
    
    passwordText=[[UITextField alloc]initWithFrame:CGRectMake(120,password.frame.origin.y,100, 30)];
    passwordText.borderStyle=UITextBorderStyleRoundedRect;
    passwordText.placeholder=@"请输入验证码";
    [self.view addSubview:passwordText];
    
    UIImageView *codeImage = [[UIImageView alloc] initWithFrame:CGRectMake(passwordText.frame.size.width+passwordText.frame.origin.x+10,password.frame.origin.y, 70, 30)];
    codeImage.userInteractionEnabled = YES;
    [self getVCCode:codeImage];
    [codeImage addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewEvent:)]];
    [self.view addSubview:codeImage];
    
    loginButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    loginButton.frame=CGRectMake(20, passwordText.frame.origin.y+passwordText.frame.size.height+20, 280, 30);
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton setTintColor:[UIColor whiteColor]];
    [loginButton setBackgroundColor:[UIColor colorWithRed:192.0f/255.0f green:37.0f/255.0f blue:62.0f/255.0f alpha:1.0f]];
    [loginButton.layer setMasksToBounds:YES];
    [loginButton.layer setCornerRadius:10.0];
    [loginButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    cancleButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    cancleButton.frame=CGRectMake(20, loginButton.frame.origin.y+loginButton.frame.size.height+10, 280, 30);
    [cancleButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancleButton setTintColor:[UIColor whiteColor]];
    [cancleButton.layer setMasksToBounds:YES];
    [cancleButton.layer setCornerRadius:10.0];
    [cancleButton setBackgroundColor:[UIColor colorWithRed:192.0f/255.0f green:37.0f/255.0f blue:62.0f/255.0f alpha:1.0f]];
    //[loginButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancleButton];
   
}


#pragma mark 点击验证码图片执行的操作
-(void)imageViewEvent:(UITapGestureRecognizer *)gesture{
    [self getVCCode:(UIImageView *)gesture.view];
}

#pragma mark 获取验证码图片
-(void)getVCCode:(UIImageView *)imageView{
    // 获取当前时间
    NSDate *date = [NSDate date];
    AFHTTPRequestOperationManager *operationManage = [AFHTTPRequestOperationManager manager];
    operationManage.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    // 发送请求获取验证码图片
    [operationManage GET:[NSString stringWithFormat:@"http://192.168.20.5/qzf.mn/CreateCheckCode.aspx?%f", [date timeIntervalSince1970]] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // 设置imageview上的图片
        imageView.image = [UIImage imageWithData:operation.responseData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"imgerror-->%@", error.localizedDescription);
    }];
}

#pragma mark 验证验证码是否正确
-(BOOL)checkCode:(NSString *)code{
    NSArray *cookies = [NSHTTPCookieStorage sharedHTTPCookieStorage].cookies;
    //    NSLog(@"cookies-->%@", cookies);
    for (NSHTTPCookie *cookie in cookies) {
        if ([cookie.name isEqualToString:@"CheckCode"]) {
            // 不考虑大小写比较两个字符串是否相同
            if ([cookie.value caseInsensitiveCompare:code] == NSOrderedSame) {
                return YES;
            }
        }
    }
    return NO;
}


-(void)buttonAction:(UIButton *)button{
    if (phonenumText.text.length == 0) {
        [self.view makeToast:@"用户名不能为空。" duration:1.0 position:@"center"];
        return;
    }
    if (passwordText.text.length == 0) {
        [self.view makeToast:@"密码不能为空。" duration:1.0 position:@"center"];
        return;
    }
    [self.view makeToast:@"登陆成功" duration:1.0 position:@"center"];
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(toastEnd:) userInfo:nil repeats:NO];
}

 -(void)toastEnd:(NSTimer *)timer
 {
     // 注销计时器
 [timer invalidate];
 TablelistViewController *tablelistViewController=[[TablelistViewController alloc]init];
 [self.navigationController pushViewController:tablelistViewController animated:YES];
 
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

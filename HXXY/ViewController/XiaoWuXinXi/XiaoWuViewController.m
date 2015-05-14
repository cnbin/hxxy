//
//  XiaoWuViewController.m
//  HXXY
//
//  Created by Apple on 11/18/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "XiaoWuViewController.h"

@interface XiaoWuViewController ()

@end

@implementation XiaoWuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    self.view.backgroundColor = [UIColor whiteColor];
    //导航左边返回箭头图标
    self.navigation.leftImage  = [UIImage imageNamed:@"nav_backbtn.png"];
    self.navigation.title = @"校务互动";
    self.navigation.navigaionBackColor = [UIColor colorWithRed:124.0f/255.0f green:252.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
    
    WebManagerController *webManagerController=[WebManagerController sharedInstance];
    webManagerController.webView = [[UIWebView alloc] init];
    webManagerController.webView.frame = CGRectMake(0, 66, self.view.frame.size.width, self.view.frame.size.height-66);
    
    webManagerController.webView.delegate = self;
    webManagerController.webView.scalesPageToFit = YES;
     _url=@"http://192.168.20.5/qzfz/";
    [self.view addSubview:webManagerController.webView];
    
    activityIndicatorView = [[UIActivityIndicatorView alloc]initWithFrame : CGRectMake(0.0f, 0.0f, 62.0f, 62.0f)];
    [activityIndicatorView setCenter: self.view.center];
    [activityIndicatorView setActivityIndicatorViewStyle: UIActivityIndicatorViewStyleGray];
    [self.view addSubview : activityIndicatorView];
}


#pragma mark 界面即将显示的时候调用
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadWebPageWithString:_url];
}

#pragma mark 加载地址
- (void)loadWebPageWithString:(NSString *)urlString
{
    NSURL *url =[NSURL URLWithString:urlString];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    WebManagerController *webManagerController=[WebManagerController sharedInstance];
    [webManagerController.webView loadRequest:request];
}

#pragma mark 开始加载
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [activityIndicatorView startAnimating];
}

#pragma mark 加载完毕
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activityIndicatorView stopAnimating];
}

#pragma mark 当请求页面出现错误的时候，我们给予提示
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    UIAlertView *alterview = [[UIAlertView alloc] initWithTitle:@"请求错误：" message:[error localizedDescription]  delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alterview show];
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

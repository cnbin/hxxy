//
//  CommonWebViewController.m
//  HXXY
//
//  Created by Apple on 12/24/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "CommonWebViewController.h"

@interface CommonWebViewController ()

@end

@implementation CommonWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.toolbarHidden = NO;
    self.view.contentMode = UIViewContentModeScaleAspectFill;
    self.title= [WebManagerController sharedInstance].shareTitle;
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *backButton = [[ UIBarButtonItem alloc ] initWithTitle:
                                   @"back"
                                                                     style: UIBarButtonItemStyleBordered
                                                                    target: self
                                                                    action: @selector(navback:)
                                   ];
    self.navigationItem.leftBarButtonItem=backButton;
    UIBarButtonItem *refreshButtonItem = [[UIBarButtonItem alloc]
                                          initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                          target: self
                                          action: @selector(updateActions:)
                                          ];
    UIBarButtonItem *spacerButton1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                  target:nil
                                                                                  action:nil];
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem: UIBarButtonSystemItemReply
                                       target: self
                                       action: @selector(backButton:)
                                       ];
    UIBarButtonItem *spacerButton2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                  target:nil
                                                                                  action:nil];
    UIBarButtonItem *forwardButtonItem =[[UIBarButtonItem alloc]
                                         initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                         target: self
                                         action: @selector(forwardButton:)
                                         ];
    UIBarButtonItem *spacerButton3 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                  target:nil
                                                                                  action:nil];
    UIBarButtonItem *stopButtonItem =[[UIBarButtonItem alloc ] initWithBarButtonSystemItem: UIBarButtonSystemItemStop
                                                                                    target: self
                                                                                    action: @selector(stopButton:)
                                      ];
    self.toolbarItems=[NSArray arrayWithObjects:backButtonItem,spacerButton1,forwardButtonItem,spacerButton2,stopButtonItem,spacerButton3,refreshButtonItem,nil];
    
    [self CacheMethod];
}
-(void)navback:(UIButton *)button{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

//底部toolbar事件
-(void)backButton:(UIButton *)button{
    [_webManagerController.webView goBack];
    [self ReachabilityTest];
}
-(void)forwardButton:(UIButton *)button{
    [_webManagerController.webView goForward];
    [self ReachabilityTest];
}
-(void)stopButton:(UIButton *)button{
    [_webManagerController.webView stopLoading];
}

-(void)updateActions:(UIButton *)button{
    [_webManagerController.webView reload];
    [self ReachabilityTest];
}

#pragma mark 界面即将显示的时候调用
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    [self loadWebPageWithString:_url];
    [self ReachabilityTest];
}
-(void)ReachabilityTest{
    if (![Reachability networkAvailable]) {
        [self.view makeToast:@"当前网络不可用,请检查网络设置" duration:5.0 position:@"center"];
    }
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)CacheMethod{
    //内存为20M,Disk为200M
    CustomURLCache *urlCache = [[CustomURLCache alloc] initWithMemoryCapacity:20 * 1024 * 1024
                                                                 diskCapacity:200 * 1024 * 1024
                                                                     diskPath:nil
                                                                    cacheTime:0];
    [CustomURLCache setSharedURLCache:urlCache];
    
    _webManagerController=[WebManagerController sharedInstance];
    _webManagerController.webView = [[UIWebView alloc] init];
    _webManagerController.webView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    _webManagerController.webView.delegate = self;
    _webManagerController.webView.scalesPageToFit = YES;
    _url=[WebManagerController sharedInstance].shareUrl;
    [self.view addSubview:_webManagerController.webView];
}

#pragma mark 加载地址
- (void)loadWebPageWithString:(NSString *)urlString
{
    NSURL *url =[NSURL URLWithString:urlString];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [_webManagerController.webView loadRequest:request];
}

#pragma mark 开始加载
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"Loading...";
}

#pragma mark 加载完毕
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    CustomURLCache *urlCache = (CustomURLCache *)[NSURLCache sharedURLCache];
    [urlCache removeAllCachedResponses];
    
}



@end

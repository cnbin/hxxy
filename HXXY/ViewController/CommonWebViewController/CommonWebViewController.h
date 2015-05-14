//
//  CommonWebViewController.h
//  HXXY
//
//  Created by Apple on 12/24/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HXBaseViewController.h"
#import "WebManagerController.h"
#import "MBProgressHUD.h"
#import "CustomURLCache.h"
@interface CommonWebViewController :HXBaseViewController<UIWebViewDelegate>
@property (nonatomic, copy) NSString *url;// 需要加载的网页地址
@property (nonatomic, strong) WebManagerController *webManagerController;


@end

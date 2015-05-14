//
//  XiaoWuViewController.h
//  HXXY
//
//  Created by Apple on 11/18/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "HXBaseViewController.h"
#import "WebManagerController.h"
@interface XiaoWuViewController : HXBaseViewController<UIWebViewDelegate>{
    UIActivityIndicatorView *activityIndicatorView;
    UIAlertView *alertView;
}
@property (nonatomic, copy) NSString *url;// 需要加载的网页地址

@end

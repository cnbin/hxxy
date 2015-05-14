//
//  HXBaseViewController.h
//  HXXY
//
//  Created by Apple on 11/17/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HXNavigationView.h"
@interface HXBaseViewController : UIViewController<HXNavigationViewDelegate>

@property (nonatomic,strong) HXNavigationView * navigation;
@end

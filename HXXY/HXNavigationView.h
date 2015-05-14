//
//  HXNavigationView.h
//  HXXY
//
//  Created by Apple on 11/17/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HXNavigationViewDelegate <NSObject>
-(void)previousToViewController;//默认情况下没有写required，即为必须实现的方法，所以在FMBaseViewController中可以看到该方法
@optional //可以选择实现的方法
-(void)rightButtonClickEvent;
@end


@interface HXNavigationView : UIView
@property (nonatomic,assign) id<HXNavigationViewDelegate>delegate;//这个属性必须写。代理对象
@property (nonatomic,retain) UIImage * leftImage;
@property (nonatomic,retain) UIImage * headerImage;
@property (nonatomic,copy) NSString * title;
@property (nonatomic,retain) UIImage * rightImage;
@property (nonatomic,assign) UIColor * navigaionBackColor;
@property (nonatomic) NSInteger type;
@end

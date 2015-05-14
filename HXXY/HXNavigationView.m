//
//  HXNavigationView.m
//  HXXY
//
//  Created by Apple on 11/17/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "HXNavigationView.h"
@interface HXNavigationView()
{
        UIButton * leftBtn;
        UIButton * rightBtn;
        UIImageView * headerImageView;
        UILabel * titleLabel;
        UIImageView * statusBack;
        UIImageView * navigationBack;
        
}
@end

@implementation HXNavigationView
@synthesize leftImage = _leftImage;
@synthesize rightImage = _rightImage;
@synthesize headerImage = _headerImage;
@synthesize title = _title;
@synthesize delegate =_delegate;
@synthesize navigaionBackColor = _navigaionBackColor;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //设置状态栏。
        statusBack = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 20)];
        [self addSubview:statusBack];
        
        //设置导航栏
        navigationBack = [[UIImageView alloc] initWithFrame:CGRectMake(0, statusBack.frame.size.height, self.frame.size.width, self.frame.size.height-statusBack.frame.size.height)];
        //NSLog(@"高度是多少%f",self.frame.size.height);  高度为66. 这里的66是由FMBaseViewController设置而来的。
        navigationBack.userInteractionEnabled = YES;//允许用户交互，默认是NO
        [self addSubview:navigationBack];
        
        //设置导航左边按钮
        leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];  // UIButtonTypeCustom ：是一个背景透明的按钮
        leftBtn.frame = CGRectMake(8, self.frame.size.height/2-_leftImage.size.height/2, _leftImage.size.width, _leftImage.size.height);
        [leftBtn addTarget:self action:@selector(leftButtonEvent) forControlEvents:UIControlEventTouchUpInside];
        [navigationBack addSubview:leftBtn];
        
        //设置导航右边按钮
        rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        rightBtn.frame = CGRectMake(self.frame.size.width-_rightImage.size.width-5, self.frame.size.height/2-_rightImage.size.height/2, _rightImage.size.width, _rightImage.size.height);
        [rightBtn addTarget:self action:@selector(rightButtonEvent) forControlEvents:UIControlEventTouchUpInside];
        [navigationBack addSubview:rightBtn];
        
        //设置导航标题
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.font = [UIFont systemFontOfSize:16.0f];
        [navigationBack addSubview:titleLabel];
        
        headerImageView = [[UIImageView alloc]  initWithFrame:CGRectMake(0,0,0,0)];
        [navigationBack addSubview:headerImageView];
        
    }
    return self;
}

-(void)setLeftImage:(UIImage *)leftImage
{
    leftBtn.frame = CGRectMake(8-10, navigationBack.frame.size.height/2-leftImage.size.height/2-5, leftImage.size.width+20, leftImage.size.height+10);
    [leftBtn setImage:leftImage forState:UIControlStateNormal];
}
-(void)setRightImage:(UIImage *)rightImage
{
    rightBtn.frame = CGRectMake(navigationBack.frame.size.width-rightImage.size.width-8, navigationBack.frame.size.height/2-rightImage.size.height/2, rightImage.size.width, rightImage.size.height);
    [rightBtn setImage:rightImage forState:UIControlStateNormal];
}

-(void)setHeaderImage:(UIImage *)headerImage
{
    headerImageView.frame =  CGRectMake(navigationBack.frame.size.width/2-headerImage.size.width/2, navigationBack.frame.size.height/2-headerImage.size.height/2, headerImage.size.width, headerImage.size.height);
    [headerImageView setImage:headerImage];
}

-(void)setTitle:(NSString *)title
{
    CGSize titleSize = [title sizeWithFont:titleLabel.font constrainedToSize:CGSizeMake(navigationBack.frame.size.width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByClipping];
    if (titleSize.width>200) {
        titleSize.width = 200;
    }
    if (headerImageView.image!=nil) {
        headerImageView.frame = CGRectMake(navigationBack.frame.size.width/2-headerImageView.image.size.width/2-titleSize.width/2, navigationBack.frame.size.height/2-headerImageView.image.size.height/2, headerImageView.frame.size.width, headerImageView.frame.size.height);
        titleLabel.frame = CGRectMake(headerImageView.frame.size.width+headerImageView.frame.origin.x, navigationBack.frame.size.height/2-titleSize.height/2, titleSize.width, titleSize.height);
        
    }else{
        titleLabel.frame = CGRectMake(navigationBack.frame.size.width/2-titleSize.width/2, navigationBack.frame.size.height/2-titleSize.height/2, titleSize.width, titleSize.height);
    }
    titleLabel.text = title;
}

//设置状态栏和导航栏背景颜色
-(void)setNavigaionBackColor:(UIColor *)navigaionBackColor
{
    statusBack.backgroundColor = navigaionBackColor;
    statusBack.alpha = 0.5;//设置状态栏透明度为0.5.即显示电池的那一栏。
    navigationBack.backgroundColor = navigaionBackColor;
}
//设置状态栏类型
-(void)setType:(NSInteger)type
{
    //如果类型为0，则隐藏状态栏。
    if (type==0) {
        statusBack.frame = CGRectMake(0, 0, self.frame.size.width, 0);
    }else if (type ==1){  //为1则显示状态栏。
        statusBack.frame = CGRectMake(0, 0, self.frame.size.width, 20);
    }
    //导航栏根据状态栏的改变而作出改变。
    navigationBack.frame = CGRectMake(0, statusBack.frame.size.height, self.frame.size.width, self.frame.size.height-statusBack.frame.size.height);
}

//左导航按钮点击事件
-(void)leftButtonEvent
{
    [_delegate previousToViewController];
}

//右导航按钮点击事件
-(void)rightButtonEvent
{
    [_delegate rightButtonClickEvent];//在FMBaseViewController中实现了代理方法,也即当按钮点击事件发生时,由该代理对象来执行。
}

@end

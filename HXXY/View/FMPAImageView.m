//
//  SPMImageAsyncView.m
//  ImageDL
//
//  Created by Pierre Abi-aad on 21/03/2014.
//  Copyright (c) 2014 Pierre Abi-aad. All rights reserved.
//

#import "FMPAImageView.h"

#pragma mark - Utils

#define rad(degrees) ((degrees) / (180.0 / M_PI))
#define kLineWidth 3.f

NSString * const spm_identifier = @"spm.imagecache.tg";

#pragma mark - SPMImageAsyncView interface

@interface FMPAImageView ()

@property (nonatomic, strong) CAShapeLayer *backgroundLayer;
@property (nonatomic, strong) CAShapeLayer *progressLayer;//没用到

@property (nonatomic, strong) UIView      *progressContainer;//没用到

@end

#pragma mark - SPMImageAsyncView


@implementation FMPAImageView

//初始化返回绘制圆形的ImageView
- (id)initWithFrame:(CGRect)frame {
    return [[FMPAImageView alloc] initWithFrame:frame
                      backgroundProgressColor:[UIColor whiteColor]];
}
//绘制圆形的ImageView
- (id)initWithFrame:(CGRect)frame backgroundProgressColor:(UIColor *)backgroundProgresscolor
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置圆角
        self.layer.cornerRadius     = CGRectGetWidth(self.bounds)/2.f;
        
        self.layer.masksToBounds    = NO;
        
        //设置超过子图层的部分裁剪掉
        self.clipsToBounds          = YES;
        
        //CGRectGetMidX表示得到一个frame中心点的X坐标，CGRectGetMidY表示得到一个frame中心点的Y坐标
        CGPoint arcCenter           = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
        
        CGFloat radius              = MIN(CGRectGetMidX(self.bounds)-1, CGRectGetMidY(self.bounds)-1);
        
        
        //利用BezierPath画弧线，  UIBezierPath贝塞尔弧线
        UIBezierPath *circlePath    = [UIBezierPath bezierPathWithArcCenter:arcCenter//圆弧中心
                                                                     radius:radius   //圆弧半径
                                                                 startAngle:-rad(90)  //开始角度
                                                                   endAngle:rad(360-90) //结束角度
                                                                  clockwise:YES];//顺时针方向
        
        _backgroundLayer = [CAShapeLayer layer];
        _backgroundLayer.path           = circlePath.CGPath;
        _backgroundLayer.strokeColor    = [backgroundProgresscolor CGColor];
        _backgroundLayer.fillColor      = [[UIColor clearColor] CGColor];
        _backgroundLayer.lineWidth      = kLineWidth;
    }
    return self;
}
@end

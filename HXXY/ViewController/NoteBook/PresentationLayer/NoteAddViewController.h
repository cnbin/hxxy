//
//  NoteAddViewController.h
//  HXXY
//
//  Created by Apple on 12/11/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"
#import "NoteDAO.h"
#import "NoteBL.h"
#import "HXBaseViewController.h"
@interface NoteAddViewController : HXBaseViewController <UITextViewDelegate>
{
    UITextView *_txtView;
    UIButton *_navButton;// 导航栏按钮
}
@end

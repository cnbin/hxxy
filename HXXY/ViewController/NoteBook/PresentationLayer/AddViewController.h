//
//  AddViewController.h
//  HXXY
//
//  Created by Apple on 12/23/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"
#import "NoteDAO.h"
#import "NoteBL.h"
#import "NoteBLDelegate.h"

@interface AddViewController : UIViewController<UITextViewDelegate,NoteBLDelegate>
{
    UITextView *_txtView;
}

//BL对象
@property (nonatomic,strong) NoteBL *bl;


@end

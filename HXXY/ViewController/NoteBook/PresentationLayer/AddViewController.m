//
//  AddViewController.m
//  HXXY
//
//  Created by Apple on 12/23/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title=@"添加";
    UIBarButtonItem *saveButtonItem = [[ UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                      target: self
                                      action: @selector(onclickSave:)
                                      ];
    self.navigationItem.rightBarButtonItem=saveButtonItem;
    
    _txtView=[[UITextView alloc]initWithFrame:CGRectMake(0,0,320,480)];
    [self.view addSubview:_txtView];
    [self setUpForDismissKeyboard];
}

-(void)onclickSave:(UIButton *)button{
    if (!_bl) {
        _bl = [NoteBL new];
        _bl.delegate = self;
    }
    Note *note = [Note new];
    note.date = [[NSDate alloc] init];
    note.content = _txtView.text;
    [_bl createNote: note];

    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}
//插入Note方法 成功
- (void)createNoteFinished
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"操作信息"
                                                        message:@"插入成功。"
                                                       delegate:self
                                              cancelButtonTitle:@"返回"
                                              otherButtonTitles:@"继续", nil];
    [alertView show];
}

//插入Note方法 失败
- (void)createNoteFailed:(NSError *)error
{
    
    NSString *errorStr = [error localizedDescription];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"操作信息"
                                                        message:errorStr
                                                       delegate:self
                                              cancelButtonTitle:@"返回"
                                              otherButtonTitles:@"继续", nil];
    [alertView show];
}

//响应对话框按钮事件
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {//选择返回按钮
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

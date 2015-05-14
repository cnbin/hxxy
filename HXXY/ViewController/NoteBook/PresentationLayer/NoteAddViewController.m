//
//  NoteAddViewController.m
//  HXXY
//
//  Created by Apple on 12/11/14.
//  Copyright (c) 2014 华讯网络投资有限公司. All rights reserved.
//

#import "NoteAddViewController.h"

@interface NoteAddViewController ()

@end

@implementation NoteAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title=@"添加";
    
    _navButton = [[UIButton alloc] initWithFrame:CGRectMake(250, 10, 60, 30)];
    //UIControlStateNormal表示正常显示
    [_navButton setTitle:@"保存" forState:UIControlStateNormal];
    [_navButton addTarget:self action:@selector(onclickSave:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:_navButton];
    
    _txtView=[[UITextView alloc]initWithFrame:CGRectMake(0,0,320,480)];
    [self.view addSubview:_txtView];
    [self setUpForDismissKeyboard];
    
}

-(void)onclickSave:(UIButton *)button{
    
//    NoteBL *bl = [[NoteBL alloc] init];
//    Note *note = [[Note alloc] init];
//    note.date = [[NSDate alloc] init];
//    note.content = _txtView.text;
//    NSMutableArray *reslist = [bl createNote: note];
//    NSLog(@"reslist is %@",reslist);
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadViewNotification" object:reslist userInfo:nil];
//    [_txtView resignFirstResponder];
//    
//    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

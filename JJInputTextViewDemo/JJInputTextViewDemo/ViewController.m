//
//  ViewController.m
//  JJInputTextViewDemo
//
//  Created by 房俊杰 on 2017/7/18.
//  Copyright © 2017年 房俊杰. All rights reserved.
//

#import "ViewController.h"

#import "JJInputTextView.h"

@interface ViewController () <UITextViewDelegate,JJInputTextViewDelegate>

/** 输入框 */
@property (nonatomic,strong) JJInputTextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.textView = [[JJInputTextView alloc] initWithFrame:CGRectMake(10, 100, 355, 36)];
    self.textView.backgroundColor = [UIColor orangeColor];
    self.textView.textColor = [UIColor whiteColor];
    self.textView.delegate = self;
    self.textView.inputTextViewDelegate = self;
    self.textView.placeholder = @"请输入文字";
    self.textView.placeholderTextColor = [UIColor grayColor];
    self.textView.font = [UIFont systemFontOfSize:15];
    self.textView.heightToFit = YES;
    [self.view addSubview:self.textView];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

#pragma mark - UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
    }
    return YES;
}
- (void)inputTextView:(JJInputTextView *)inputTextView height:(CGFloat)height {
    CGRect frame = self.textView.frame;
    frame.size.height = height;
    self.textView.frame = frame;
}


@end
































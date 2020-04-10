//
//  JJInputTextView.m
//  JJInputTextViewDemo
//
//  Created by 房俊杰 on 2017/7/18.
//  Copyright © 2017年 房俊杰. All rights reserved.
//

#import "JJInputTextView.h"

@implementation JJInputTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}
- (void)layoutSubviews {
    [super layoutSubviews];
}
- (void)dealloc {
    self.placeholder = nil;
    self.placeholderTextColor = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma mark - 初始化
- (void)setup {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewTextDidChange) name:UITextViewTextDidChangeNotification object:nil];
    //默认占位文字字体颜色
    self.placeholderTextColor = [UIColor grayColor];
    self.font = [UIFont systemFontOfSize:15];
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.scrollIndicatorInsets = UIEdgeInsetsMake(10.0f, 0.0f, 10.0f, 8.0f);
    self.contentInset = UIEdgeInsetsZero;
    self.scrollEnabled = YES;
    self.scrollsToTop = NO;
    self.userInteractionEnabled = YES;
    self.textColor = [UIColor blackColor];
    self.backgroundColor = [UIColor whiteColor];
    self.keyboardAppearance = UIKeyboardAppearanceDefault;
    self.keyboardType = UIKeyboardTypeDefault;
    self.returnKeyType = UIReturnKeyDefault;
    self.textAlignment = NSTextAlignmentLeft;
}
//输入文字有变化
- (void)textViewTextDidChange {

    if (self.isHeightToFit && self.inputTextViewDelegate && [self.inputTextViewDelegate respondsToSelector:@selector(inputTextView:height:)]) {
        
        if (!self.maxHeight) self.maxHeight = 106;
        
        CGFloat height = [self sizeThatFits:self.frame.size].height;
        if (height > self.maxHeight) height = self.maxHeight;
        [self.inputTextViewDelegate inputTextView:self height:height];
    }
    [self setNeedsDisplay];
}
#pragma mark - setter
#pragma mark - 外部暴露属性
- (void)setPlaceholder:(NSString *)placeholder {
    if([placeholder isEqualToString:_placeholder]) return;
    _placeholder = placeholder;
    [self setNeedsDisplay];
}
- (void)setPlaceholderTextColor:(UIColor *)placeholderTextColor {
    _placeholderTextColor = placeholderTextColor;
    [self setNeedsDisplay];
}
#pragma mark - 重写父类方法
- (void)setText:(NSString *)text {
    [super setText:text];
    [self setNeedsDisplay];
}
- (void)setAttributedText:(NSAttributedString *)attributedText {
    [super setAttributedText:attributedText];
    [self setNeedsDisplay];
}
- (void)setFont:(UIFont *)font {
    [super setFont:font];
    [self setNeedsDisplay];
}
- (void)setTextAlignment:(NSTextAlignment)textAlignment {
    [super setTextAlignment:textAlignment];
    [self setNeedsDisplay];
}


#pragma mark - 绘图
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    if (self.hasText) return;
    
    rect.origin.x = 5;
    rect.origin.y = 8;
    rect.size.width -= 2 * rect.origin.x;
    rect.size.height -= 2 * rect.origin.y;
    
    NSMutableDictionary *attribute = [NSMutableDictionary dictionary];
    attribute[NSFontAttributeName] = self.font;
    attribute[NSForegroundColorAttributeName] = self.placeholderTextColor;
    
    [self.placeholder drawInRect:rect withAttributes:attribute];
}


@end


















































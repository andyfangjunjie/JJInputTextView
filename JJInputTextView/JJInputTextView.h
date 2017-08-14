//
//  JJInputTextView.h
//  JJInputTextViewDemo
//
//  Created by 房俊杰 on 2017/7/18.
//  Copyright © 2017年 房俊杰. All rights reserved.
//

#import <UIKit/UIKit.h>



@class JJInputTextView;
@protocol JJInputTextViewDelegate <NSObject>
/**
 计算高度

 @param inputTextView inputView
 @param height 高度
 */
- (void)inputTextView:(JJInputTextView *)inputTextView height:(CGFloat)height;

@optional

@end

@interface JJInputTextView : UITextView

/** 提示用户输入的标语 */
@property (nonatomic, copy) NSString *placeholder;
/** 标语文本的颜色 */
@property (nonatomic, strong) UIColor *placeholderTextColor;

/** 是否计算高度 */
@property (nonatomic,assign,getter=isHeightToFit) BOOL heightToFit;
/** 代理 */
@property (nonatomic,weak) __weak id<JJInputTextViewDelegate>inputTextViewDelegate;
/** 文本最大高度 */
@property (nonatomic,assign) NSInteger maxHeight;

@end

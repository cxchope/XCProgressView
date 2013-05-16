//
//  XCProgressView.h
//  XCProgressView
//
//  Created by 彩虹の旅途 on 13-5-16.
//  Copyright (c) 2013年 im@chenxiaochi.com. All rights reserved.
// 1.0

#import <UIKit/UIKit.h>

@interface XCProgressView : UIView
{
    float _nowValue;
    float _maxValue;
    float _minValue;
    float _pv;
    BOOL _animated;
    CGFloat _cornerRadius;
    CGFloat _borderWidth;
    int _gap;
    CGRect _okframe;
    NSArray *_autoColor;
    UIColor *_borderColor;
    UIColor *_color;
    UIView *_pr;
}
//可修改：

//现在的值
@property (nonatomic, assign) float nowValue;
//最大值
@property (nonatomic, assign) float maxValue;
//最小值
@property (nonatomic, assign) float minValue;
//是否启用动画（暂不支持）
@property (nonatomic, assign) BOOL animated;
//根据数值自动换颜色，传UIcolor数组
@property (nonatomic, assign) NSArray *autoColor;
//圆角弧度
@property (nonatomic, assign) CGFloat cornerRadius;
//边框粗细
@property (nonatomic, assign) CGFloat borderWidth;
//边框颜色
@property (nonatomic, retain) UIColor *borderColor;
//背景颜色（backgroundColor）
//进度条颜色
@property (nonatomic, retain) UIColor *color;
//内进度条距边框距离
@property (nonatomic, assign) int gap;


//不可修改：
@property (nonatomic, assign) float pv;
@property (nonatomic, retain) UIView *pr;
@property (nonatomic, assign) CGRect okframe;
@end

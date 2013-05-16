//
//  XCProgressView.m
//  XCProgressView
//
//  Created by 彩虹の旅途 on 13-5-16.
//  Copyright (c) 2013年 im@chenxiaochi.com. All rights reserved.
//

#import "XCProgressView.h"
#import <QuartzCore/QuartzCore.h>  
@implementation XCProgressView
@synthesize nowValue=_nowValue, maxValue=_maxValue, minValue=_minValue;
@synthesize pv=_pv, animated=_animated, cornerRadius=_cornerRadius;
@synthesize borderWidth=_borderWidth, gap=_gap, okframe=_okframe;
@synthesize autoColor=_autoColor, borderColor=_borderColor, color=_color, pr=_pr;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        //设置圆角边框
        self.layer.cornerRadius = 0;
        self.layer.masksToBounds = YES;
        //设置边框及边框颜色
        self.layer.borderWidth = 0;
        self.layer.borderColor =[[UIColor grayColor] CGColor];
        
        self.gap = 2;
        //内进度条
        self.okframe = CGRectMake(_gap, _gap, self.frame.size.width - 4, self.frame.size.height - _gap*2);
        UIView *pr = [[UIView alloc] initWithFrame:[self prframe:0]];
        pr.backgroundColor = [UIColor purpleColor];
        //设置圆角边框
        pr.layer.cornerRadius = 0;
        pr.layer.masksToBounds = YES;
        [self addSubview:pr];
        self.pr = pr;
        [pr release];
    }
    return self;
}
- (void)setCornerRadius:(CGFloat)cornerRadius
{
    if (cornerRadius > 2) {
        self.layer.cornerRadius = cornerRadius;
        self.pr.layer.cornerRadius = cornerRadius-_gap;
        _cornerRadius = cornerRadius;
    } else {
        NSLog(@"实现圆角至少为2，已取消圆角。");
        self.layer.cornerRadius = 0;
        self.pr.layer.cornerRadius = 0;
        _cornerRadius = 0;
    }
}
- (void)setGap:(int)gap
{
    _gap = gap;
    self.okframe = CGRectMake(_gap, _gap, self.frame.size.width - _gap*2, self.frame.size.height - _gap*2);
    _pr.frame = [self prframe:_pv];
    [self setCornerRadius:_cornerRadius];
}
- (void)setBorderWidth:(CGFloat)borderWidth
{
    self.layer.borderWidth = borderWidth;
    _borderWidth = borderWidth;
}
- (void)setBorderColor:(UIColor *)borderColor
{
    self.layer.borderColor = [borderColor CGColor];
    _borderColor = borderColor;
}
- (void)setColor:(UIColor *)color
{
    _pr.backgroundColor = color;
    _color = color;
}
- (float)calcValue:(float)nowValue
{
    //    float now = 1-(self.maxValue-self.minValue)*0.001)*nowValue;
    float now = (nowValue-self.minValue)/(self.maxValue-self.minValue);
    return now;
}
- (void)setNowValue:(float)nowValue
{
    if (nowValue > _maxValue) {
        NSLog(@"XCProgress:%f超出最大值范围，当前值变更为%f",nowValue,_maxValue);
        nowValue = _maxValue;
    }
    if (nowValue < _minValue) {
        NSLog(@"XCProgress:%f低于最小值范围，当前值变更为%f",nowValue,_minValue);
        nowValue = _minValue;
    }
    float newVol = [self calcValue:nowValue];
    [self toProgress:newVol];
    _nowValue = nowValue;
}
- (void)setMaxValue:(float)maxValue
{
    float max = [self calcValue:maxValue];
    if (self.pv > max) {
        NSLog(@"XCProgress:最大值小于当前值%f，当前值变更为%f",_nowValue,maxValue);
        [self toProgress:max];
        _nowValue = maxValue;
    }
    _maxValue = maxValue;
}
- (void)setMinValue:(float)minValue
{
    float min = [self calcValue:minValue];
    if (self.pv < min) {
        NSLog(@"XCProgress:最小值大于当前值%f，当前值变更为%f",_nowValue,minValue);
        [self toProgress:min];
        _nowValue = minValue;
    }
    _minValue = minValue;
}
- (void)toProgress:(float)value
{
    if (self.autoColor && self.autoColor.count > 0) {
        float unit = 1.0/self.autoColor.count;
        for (int i = 0; i < self.autoColor.count; i++) {
            if (value > unit*i) {
                if (_pr.backgroundColor != [self.autoColor objectAtIndex:i])
                    _pr.backgroundColor = [self.autoColor objectAtIndex:i];
            }
        }
    }
    _pr.frame = [self prframe:value];
    //[self setProgress:value animated:self.animated];
}
- (CGRect)prframe:(float)value
{
    return CGRectMake(_okframe.origin.x, _okframe.origin.y, _okframe.size.width * value, _okframe.size.height);
}
//- (void)setFrame:(CGRect)frame
//{
//    
//}
- (void)dealloc
{
    if (_autoColor) [_autoColor release];
    if (_borderColor) [_borderColor release];
    if (_color) [_color release];
    [_pr release];
    NSLog(@"释放%s",__FUNCTION__);
    [super dealloc];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
@end

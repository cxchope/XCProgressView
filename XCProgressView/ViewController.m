//
//  ViewController.m
//  XCProgressView
//
//  Created by 彩虹の旅途 on 13-5-16.
//  Copyright (c) 2013年 im@chenxiaochi.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    XCProgressView *xcpv = [[XCProgressView alloc] initWithFrame:CGRectMake(10, 50, self.view.frame.size.width - 20, 20)];//初始化XCProgressView
    xcpv.cornerRadius = 10;//圆角弧度
    xcpv.borderWidth = 1;//边框粗细
    xcpv.borderColor = [UIColor purpleColor];//边框颜色
    xcpv.backgroundColor = [UIColor whiteColor];//背景颜色
    xcpv.color = [UIColor blueColor];//进度条颜色
    xcpv.gap = 2;//内进度条距边框距离
    xcpv.autoColor = nil;//自动换色
    xcpv.minValue = 0;//最小值
    xcpv.maxValue = 100;//最大值
    xcpv.nowValue = 50;//现在的值
    [self.view addSubview:xcpv];
    [xcpv release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

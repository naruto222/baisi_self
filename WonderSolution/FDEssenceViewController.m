//
//  FDEssenceViewController.m
//  WonderSolution
//
//  Created by gong on 16/3/15.
//  Copyright © 2016年 gong. All rights reserved.
//

#import "FDEssenceViewController.h"


@interface FDEssenceViewController ()

@property (nonatomic, weak) UIScrollView *bigScrollView;

@property (nonatomic, strong) NSMutableArray *btnArray;

@property (nonatomic, weak) UIButton *currentBtn;

@end

@implementation FDEssenceViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *scrollview = [[UIScrollView alloc] init];
    [self.view addSubview:scrollview];
    scrollview.frame = CGRectMake(0, 20, self.view.width, 50);
    scrollview.backgroundColor = [UIColor yellowColor];
    scrollview.contentSize = CGSizeMake(1000, 0);
    

    
    
    NSArray *topBtnName = @[
                            @"推荐",
                            @"视频",
                            @"图片",
                            @"段子",
                            @"网红",
                            @"排行",
                            ];
    
    for (int i = 0 ; i < topBtnName.count ; i++)
    {
        UIButton *topBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [scrollview addSubview:topBtn];
        topBtn.frame = CGRectMake(self.view.width * i / 5, 0, self.view.width / 5, scrollview.height);
        
        [topBtn setTitle:topBtnName[i] forState:UIControlStateNormal];
        // 设置普通状态文字颜色
        [topBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        // 设置点击后文字颜色
        [topBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [topBtn addTarget:self action:@selector(topBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        topBtn.tag = i;
        
//        [self.btnArray addObject:topBtn];
    }
    

    UIScrollView *bigScrollView = [[UIScrollView alloc] init];
    bigScrollView.frame = CGRectMake(0, scrollview.height + 20 , self.view.width , self.view.height - scrollview.height - 46 - 20);
    [self.view addSubview:bigScrollView];
    bigScrollView.backgroundColor = [UIColor greenColor];
    bigScrollView.contentSize = CGSizeMake(self.view.width * topBtnName.count, 0);
    
    self.bigScrollView = bigScrollView;
    
    bigScrollView.pagingEnabled = YES;
    bigScrollView.scrollEnabled = NO;
    
    // 测试图片
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, bigScrollView.height)];
    [bigScrollView addSubview:image];
    image.image = [UIImage imageNamed:@"header_cry_icon"];

    UIImageView *image2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.width * 2, 0, self.view.width, bigScrollView.height)];
    [bigScrollView addSubview:image2];
    image2.image = [UIImage imageNamed:@"login_register_background"];
    
    
//    [self topBtnClick:self.btnArray[0]];
}


- (void)topBtnClick:(UIButton *)button
{
//    if (button.selected) return;
//    
//    for (UIButton *btn in self.btnArray)
//    {
//        btn.selected = NO;
//    }
    
//    NSArray *btns = self.topScrollView.subviews;
//    for (UIButton *btn in btns) {
//        btn.selected = NO;
//        NSLog(@"%@", [btn class]);
//    }
    
    
    self.currentBtn.selected = NO;
    self.currentBtn = button;
    button.selected = YES;
    
    self.bigScrollView.contentOffset = CGPointMake(self.view.width * button.tag , 0);
    
}

@end

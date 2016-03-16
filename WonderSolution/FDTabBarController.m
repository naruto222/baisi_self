//
//  FDTabBarController.m
//  WonderSolution
//
//  Created by gong on 16/3/15.
//  Copyright © 2016年 gong. All rights reserved.
//

#import "FDTabBarController.h"

#import "FDNavigationController.h"

#import "FDEssenceViewController.h"
#import "FDNewViewController.h"
#import "FDAttentionViewController.h"
#import "FDMeViewController.h"

#import "FDTopicViewController.h"



@interface FDTabBarController ()

@property (nonatomic, weak) UINavigationController *nav;

@end

@implementation FDTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    FDEssenceViewController *essenceViewController = [[FDEssenceViewController alloc] init];
    [self AddItemViewController:essenceViewController title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    // 隐藏导航栏
    self.nav.navigationBarHidden = YES;

    
    
    FDNewViewController *newViewController = [[FDNewViewController alloc] init];
    [self AddItemViewController:newViewController title:@"新帖" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    // 隐藏导航栏
    self.nav.navigationBarHidden = YES;

    
    FDAttentionViewController *attentionViewController = [[FDAttentionViewController alloc] init];
    [self AddItemViewController:attentionViewController title:@"关注" image:@"tabBar_attention_icon" selectedImage:@"tabBar_attention_click_icon"];
    
    
    FDMeViewController *meViewController = [[FDMeViewController alloc] init];
    [self AddItemViewController:meViewController title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    
}


- (void)AddItemViewController:(UIViewController *)viewController
                        title:(NSString *)viewTitle
                        image:(NSString *)normalImage
                selectedImage:(NSString *)selectedImage
{
    viewController.title = viewTitle;
    
    viewController.tabBarItem.image = [UIImage imageNamed:normalImage];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    // 边界扩展布局
    viewController.edgesForExtendedLayout = UIRectEdgeNone;
    
    FDNavigationController *navigationController = [[FDNavigationController alloc] initWithRootViewController:viewController];
  
//    这个是把每一个界面的 navigationBar 都隐藏了
//    navigationController.navigationBarHidden = YES;
//    弄一个全局的nav变量 每次设置都存起来 就可以某一个单独设置
    self.nav = navigationController;
    
    [self addChildViewController:navigationController];
}



@end

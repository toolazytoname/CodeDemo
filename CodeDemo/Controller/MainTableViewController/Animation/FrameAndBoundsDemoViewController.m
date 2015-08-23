//
//  FrameAndBoundsDemoViewController.m
//  CodeDemo
//
//  Created by weichao on 15/8/23.
//  Copyright (c) 2015年 FatGragon. All rights reserved.
//
//http://blog.csdn.net/mad1989/article/details/8711697
#import "FrameAndBoundsDemoViewController.h"

@interface FrameAndBoundsDemoViewController ()

@end

@implementation FrameAndBoundsDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    // Do any additional setup after loading the view.
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 280, 250)];
    [view1 setBounds:CGRectMake(-20, -20, 280, 250)];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];//添加到self.view
    NSLog(@"view1 frame:%@========view1 bounds:%@",NSStringFromCGRect(view1.frame),NSStringFromCGRect(view1.bounds));
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view2.backgroundColor = [UIColor yellowColor];
    [view1 addSubview:view2];//添加到view1上,[此时view1坐标系左上角起点为(-20,-20)]
    NSLog(@"view2 frame:%@========view2 bounds:%@",NSStringFromCGRect(view2.frame),NSStringFromCGRect(view2.bounds));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

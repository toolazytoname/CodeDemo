//
//  InterviewQuestionsViewController.m
//  CodeDemo
//
//  Created by weichao on 2016/10/19.
//  Copyright © 2016年 FatGragon. All rights reserved.
//

#import "InterviewQuestionsViewController.h"
#import <stdlib.h>

@interface InterviewQuestionsViewController ()

@end

@implementation InterviewQuestionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self numberToString];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)numberToString {
    int num = 100;
    char str[25];
//    itoa(num,str,10);
    sprintf(str, "%d", num);
    printf("number is %d str is %s.",num,str);
//    (ceil(log10(num))+1)
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)barrierDemo {
    dispatch_get_global_queue(<#long identifier#>, <#unsigned long flags#>)
}

@end

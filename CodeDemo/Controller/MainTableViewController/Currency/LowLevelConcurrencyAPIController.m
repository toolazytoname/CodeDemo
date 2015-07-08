//
//  LowLevelConcurrencyAPIController.m
//  CodeDemo
//
//  Created by weichao on 15/7/7.
//  Copyright (c) 2015年 FatGragon. All rights reserved.
//
//译文  Objc的底层并发API - webfrogs http://objccn.io/issue-2-3/
//原文 Low-Level Concurrency APIs http://www.objc.io/issues/2-concurrency/low-level-concurrency-apis/

#import "LowLevelConcurrencyAPIController.h"

@interface LowLevelConcurrencyAPIController ()

@end

@implementation LowLevelConcurrencyAPIController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)foo_dispatch_after
{
/*
1.dispatch_after 不能取消已经提交到diapatch_after 的代码,相比之下NSTimer，能够取消定时器对触发。
2.不可滥用，有的时候发现把这段代码放到diapatch_after里面就好了，一切都运行正常了。应该把代码放到正常的位置。
*/
}

/*
1.为一个类创建它自己的队列而不是使用全局的队列被普遍认为是一种好的风格。？？
2.优先级
优先级反转？？？https://en.wikipedia.org/wiki/Priority_inversion
*/




@end

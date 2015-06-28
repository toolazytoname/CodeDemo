//
//  MainTableViewController.h
//  CodeDemo
//
//  Created by weichao on 15/6/28.
//  Copyright (c) 2015年 FatGragon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewController : UITableViewController
@property (strong, nonatomic) NSArray *mainMenueConfigArray;
@property (copy,nonatomic) void (^didSelectRowBlock)(UIViewController *viewController);
@end

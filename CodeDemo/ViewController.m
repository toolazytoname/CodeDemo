//
//  ViewController.m
//  CodeDemo
//
//  Created by weichao on 15/6/14.
//  Copyright (c) 2015年 FatGragon. All rights reserved.
//

#import "ViewController.h"
#import "MainTableViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (strong, nonatomic) MainTableViewController *mainTableViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Code Demo";
    [self initialTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initialTableView
{
    self.mainTableView.delegate = self.mainTableViewController;
    self.mainTableView.dataSource = self.mainTableViewController;
}

#pragma mark - lazy load
- (MainTableViewController *)mainTableViewController
{
    if (!_mainTableViewController) {
        self.mainTableViewController=[[MainTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
        NSString *mainMenueConfigFilePath = [[NSBundle mainBundle] pathForResource:@"MainMenu" ofType:@"plist"];
        if (mainMenueConfigFilePath) {
            self.mainTableViewController.mainMenueConfigArray = [NSArray arrayWithContentsOfFile:mainMenueConfigFilePath];
            __weak __typeof(self)weakSelf = self;
            self.mainTableViewController.didSelectRowBlock = ^(UIViewController *viewController)
            {
                __strong __typeof(weakSelf)strongSelf = weakSelf;
                [strongSelf.navigationController pushViewController:viewController animated:YES];
            };
        }
    }
    return _mainTableViewController;
}
@end

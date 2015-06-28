//
//  MainTableViewController.m
//  CodeDemo
//
//  Created by weichao on 15/6/28.
//  Copyright (c) 2015年 FatGragon. All rights reserved.
//

#import "MainTableViewController.h"

//cell element keys
#define kElementTitle @"Title"
#define kElemetViewController @"ViewController"


@interface MainTableViewController ()

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark  UITableViewDataSource Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  self.mainMenueConfigArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSArray *elements=[[self.mainMenueConfigArray objectAtIndex:section] objectForKey:@"Elements"];
    return  [elements count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MainTableIdentifier=@"MainTableViewControllerIdentifier";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:MainTableIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MainTableIdentifier];
    }
    NSArray *elements=[[self.mainMenueConfigArray objectAtIndex:indexPath.section] objectForKey:@"Elements"];
    NSDictionary *element=[elements objectAtIndex:indexPath.row];
    cell.textLabel.text=[element objectForKey:kElementTitle];
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate Methods
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *elements=[[self.mainMenueConfigArray objectAtIndex:indexPath.section] objectForKey:@"Elements"];
    NSDictionary *element=[elements objectAtIndex:indexPath.row];
    NSString *viewControllerName=[element objectForKey:kElemetViewController];
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *viewController = [mainStoryBoard instantiateViewControllerWithIdentifier:viewControllerName];
    if (self.didSelectRowBlock) {
        self.didSelectRowBlock(viewController);
    }
}

@end

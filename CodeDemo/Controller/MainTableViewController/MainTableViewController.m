//
//  MainTableViewController.m
//  CodeDemo
//
//  Created by weichao on 15/6/28.
//  Copyright (c) 2015年 FatGragon. All rights reserved.
//

#import "MainTableViewController.h"

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

//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return  [[self.dataDictionary objectForKey:@"Root"] count]>0?[[self.dataDictionary objectForKey:@"Root"] count]:1;
//    //    return 0;
//}
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    
//    //        return 0;
//    NSArray *elements=[[[self.dataDictionary objectForKey:@"Root"] objectAtIndex:section] objectForKey:@"Elements"];
//    return  [elements count];
//    
//}
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *MainTableIdentifier=@"MainTableIdentifier";
//    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:MainTableIdentifier];
//    if (cell==nil) {
//        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MainTableIdentifier];
//    }
//    NSArray *elements=[[[self.dataDictionary objectForKey:@"Root"] objectAtIndex:indexPath.section] objectForKey:@"Elements"];
//    NSDictionary *element=[elements objectAtIndex:indexPath.row];
//    cell.textLabel.text=[element objectForKey:TitleKey];
//    return cell;
//}
//
//
//#pragma mark -
//#pragma mark UITableViewDelegate Methods
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSArray *elements=[[[self.dataDictionary objectForKey:@"Root"] objectAtIndex:indexPath.section] objectForKey:@"Elements"];
//    NSDictionary *element=[elements objectAtIndex:indexPath.row];
//    NSString *viewControllerName=[element objectForKey:ViewControllerNameKEY];
//    NSString *contentUrl=[element objectForKey:ContentKey];
//    NSString *nibName=[element objectForKey:NibNameKey];
//    NSString *viewControllerFileName=[NSString stringWithFormat:@"%@",viewControllerName];
//    UIViewController*  viewController=[[NSClassFromString(viewControllerFileName) alloc] initWithNibName:nibName bundle:nil];
//    viewController.title=[element objectForKey:TitleKey];
//    if ([viewControllerName isEqualToString:@"ListOfOneCartoonViewController"]) {
//        ListOfOneCartoonViewController   *myListOfOneCartoonViewController=(ListOfOneCartoonViewController *)viewController;
//        myListOfOneCartoonViewController.elementDic= element;
//    }
//    [self.currentViewController.navigationController pushViewController:viewController animated:YES];
//    if([viewControllerName isEqualToString:PDFViewController])
//    {
//        [viewController performSelector:@selector(loadPDf:) withObject:contentUrl];
//    }
//    
//    
//}

@end

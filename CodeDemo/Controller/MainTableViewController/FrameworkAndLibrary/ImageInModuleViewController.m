//
//  ImageInModuleViewController.m
//  CodeDemo
//
//  Created by weichao on 15/11/24.
//  Copyright © 2015年 FatGragon. All rights reserved.
//

#import "ImageInModuleViewController.h"
#import "ImageTool.h"
#import "StaticLibraryDemo.h"
#import <DynamicFrameworkDemo/DynamicFrameworkDemo.h>
//#import <StaticLibraryDemo/StaticFrameworkClass.h>
//#import <StaticLibraryBundle.bundle/
#import <StaticFrameworkDemo/StaticFrameworkDemo.h>


@interface ImageInModuleViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *staticLibraryImageView;
@property (weak, nonatomic) IBOutlet UIImageView *staticFrameworkImageView;
@property (weak, nonatomic) IBOutlet UIImageView *dynamicFrameworkImageView;

@end

@implementation ImageInModuleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bundleImages];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)bundleImages {
    [self bundleStaticLibraryImage];
    [self bundleStaticFrameworkImage];
    [self bundleDynamicFrameworkImage];
}
- (void)bundleStaticLibraryImage {
    StaticLibraryDemo *staticLibraryDemo = [[StaticLibraryDemo alloc] init];
    
    NSBundle *staticLibraryBundle = [NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:@"StaticLibraryResource" withExtension:@"bundle"]];
    UIImage *image  = [UIImage imageNamed:@"BgScoreInStaticLibrary_bundle.tiff" inBundle:staticLibraryBundle compatibleWithTraitCollection:nil];
    if (image) {
        NSLog(@"image:%@",image);
        self.staticLibraryImageView.image = image;
    }
}

- (void)bundleStaticFrameworkImage {
//    NSBundle *imageBundle = [NSBundle bundleForClass:[StaticFrameworkClass class]] ;
    
    NSBundle *staticLibraryBundle = [NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:@"StaticFrameworkResource" withExtension:@"bundle"]];
    UIImage *image = [UIImage imageNamed:@"BgScoreInStaticFramework_bundle.tiff" inBundle:staticLibraryBundle compatibleWithTraitCollection:nil];
    self.staticFrameworkImageView.image = image;
    
}

- (void)bundleDynamicFrameworkImage {
    NSBundle *imageBundle = [NSBundle bundleForClass:[DynamicClass class]];
    NSLog(@"dynamic bundle:%@",imageBundle);
    UIImage *image = [UIImage imageNamed:@"BgScoreInDynamicFramework" inBundle:imageBundle compatibleWithTraitCollection:nil];
    self.dynamicFrameworkImageView.image = image;
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

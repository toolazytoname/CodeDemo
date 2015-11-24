//
//  ImageTool.h
//  CodeDemo
//
//  Created by weichao on 15/11/24.
//  Copyright © 2015年 FatGragon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageTool : NSObject
+ (UIImage *)imageNamed:(NSString *)imageName fromBundle:(NSString *)bundle;
@end

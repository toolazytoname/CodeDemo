//
//  ImageTool.m
//  CodeDemo
//
//  Created by weichao on 15/11/24.
//  Copyright © 2015年 FatGragon. All rights reserved.
//

#import "ImageTool.h"

@implementation ImageTool
+ (UIImage *)imageNamed:(NSString *)imageName fromBundle:(NSString *)bundle {
    if (![imageName isKindOfClass:[NSString class]] || ![bundle isKindOfClass:[NSString class]]) {
        return nil;
    }
    NSString *fileName = [imageName stringByDeletingPathExtension];
    NSString *fileType = [imageName pathExtension];
    NSMutableArray *supportFileTypes = @[@"png",@"jpg"].mutableCopy;
    if ([supportFileTypes containsObject:fileType]) {
        [supportFileTypes exchangeObjectAtIndex:0 withObjectAtIndex:[supportFileTypes indexOfObject:fileType]];
    }
    else if (fileType.length > 0) {
        [supportFileTypes insertObject:fileType atIndex:0];
    }
    UIImage *image = nil;
    NSInteger scale = [UIScreen mainScreen].scale;
    do{
        NSString *scaleImageName = scale > 1 ?[fileName stringByAppendingFormat:@"@%@x",@(scale)]:fileName;
        for (int i = 0; i < supportFileTypes.count && !image; i++) {
            NSString *fullImageName = [scaleImageName stringByAppendingFormat:@".%@",supportFileTypes[i]];
            NSString *filePath = [[NSBundle bundleWithPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:bundle]] pathForResource:fullImageName ofType:nil];
            image = [UIImage imageWithData:[NSData dataWithContentsOfFile:filePath] scale:scale];
        }
        if (!image) {
            scale --;
        }
    }while (scale > 0 && !image);
    return image;
}
@end

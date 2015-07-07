//
//  CAShapeLayerDrawingViewController.h
//  CodeDemo
//
//  Created by weichao on 15/7/7.
//  Copyright (c) 2015年 FatGragon. All rights reserved.
//
//url http://oleb.net/blog/2010/12/animating-drawing-of-cgpath-with-cashapelayer/
#import <UIKit/UIKit.h>

@interface CAShapeLayerDrawingViewController : UIViewController
@property (nonatomic, retain) CALayer *animationLayer;
@property (nonatomic, retain) CAShapeLayer *pathLayer;
@property (nonatomic, retain) CALayer *penLayer;

- (IBAction) replayButtonTapped:(id)sender;
- (IBAction) drawingTypeSelectorTapped:(id)sender;

@end

//
//  AnimationsExplainedViewController.m
//  CodeDemo
//
//  Created by weichao on 15/6/29.
//  Copyright (c) 2015年 FatGragon. All rights reserved.
//
/*
 COre Animation maintains two parallel layer hierarchies
 (1)model layer tree
 (2)presention layer tree
 (3)rendering tree(private)
 
 the complete list of supported key paths
 https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/CoreAnimation_guide/Key-ValueCodingExtensions/Key-ValueCodingExtensions.html
 */
#import "AnimationsExplainedViewController.h"
#import "RBBTweenAnimation.h"

@interface AnimationsExplainedViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *rocket1;
@property (weak, nonatomic) IBOutlet UIImageView *rocket2;

@end

@implementation AnimationsExplainedViewController
#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - animation IBAction
- (IBAction)start:(id)sender {
//    [self basicAnimation];
//    [self basicAnimation2];
//    [self multiStageAnimation];
//    [self animation_Along_A_Path];
//    [self timingFunction];
//    [self RBBAnimation];
//    [self animationGroups];
    [self copyfromWeb];
}

#pragma mark - animation demo method
- (void)basicAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @0;
    animation.toValue = @320;
    animation.duration = 1;
    
    [self.rocket1.layer addAnimation:animation forKey:@"basic"];
}

/*
update the property directly on the model layer
 */
- (void)recommendedApproach
{
    self.rocket1.layer.position = CGPointMake(320, 150);

}

- (void)secondApproach:(CABasicAnimation *)animation
{
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
}

- (void)basicAnimation2
{
    //150
    
    //244
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @0;
//    animation.toValue = @300;
    animation.byValue = @100;
    animation.duration = 1;
    [self.rocket1.layer addAnimation:animation forKey:@"basic"];
    self.rocket1.layer.position = CGPointMake(300, 150);
    
    animation.beginTime = CACurrentMediaTime() + 0.5;
    [self.rocket2.layer addAnimation:animation forKey:@"basic"];
    self.rocket2.layer.position = CGPointMake(300, 244);
}

- (void)multiStageAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[ @0, @10, @-10, @10, @0 ];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 0.4;
    
    animation.additive = YES;
    [self.rocket1.layer addAnimation:animation forKey:@"shake"];
}
- (void)animation_Along_A_Path
{
    CGRect boundingRect = CGRectMake(0, 0, 300, 300);
    CAKeyframeAnimation *orbit = [CAKeyframeAnimation animation];
    orbit.keyPath = @"position";
    orbit.path = CFAutorelease(CGPathCreateWithEllipseInRect(boundingRect, NULL));
    orbit.duration = 4;
    orbit.additive = YES;
    orbit.repeatCount = HUGE_VAL;
    orbit.calculationMode = kCAAnimationPaced;
    orbit.rotationMode = kCAAnimationRotateAuto;
    
    [self.rocket1.layer addAnimation:orbit forKey:@"orbit"];
}

- (void)timingFunction
{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @50;
    animation.toValue = @150;
    animation.duration = 1;
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    //Bézier curve
    animation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.5 :0 :0.9 :0.7];
    
    [self.rocket1.layer addAnimation:animation forKey:@"basic"];
    self.rocket1.layer.position = CGPointMake(150, 150);
}

- (void)RBBAnimation
{
    RBBTweenAnimation *animation = [RBBTweenAnimation animation];
    animation.keyPath = @"position.y";
    animation.fromValue = @50;
    animation.toValue = @150;
    animation.duration = 1;
    animation.easing = RBBEasingFunctionEaseOutBounce;
    
    animation.easing = RBBEasingFunctionEaseOutBounce;
    
    [self.rocket1.layer addAnimation:animation forKey:@"RBBTweenAnimation"];
}
//TODO: 没有实现
- (void)animationGroups
{
    CABasicAnimation *zPosition = [CABasicAnimation animation];
    zPosition.keyPath = @"zPosition";
    zPosition.fromValue = @-1;
    zPosition.toValue = @1;
    zPosition.duration = 1.2;
    
    CAKeyframeAnimation *rotation = [CAKeyframeAnimation animation];
    rotation.keyPath = @"transform.rotation";
    rotation.values = @[@0,@0.14,@0];
    rotation.timingFunctions = @[
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                 ];
    
    CAKeyframeAnimation *position =[CAKeyframeAnimation animation];
    position.keyPath = @"position";
    position.values = @[
                        [NSValue valueWithCGPoint:CGPointZero],
                        [NSValue valueWithCGPoint:CGPointMake(110, -20)],
                        [NSValue valueWithCGPoint:CGPointZero]
                        ];
    position.timingFunctions = @[
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                 ];
    position.additive = YES;
    position.duration = 1.2;
    
    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    group.animations = @[zPosition,rotation,position];
    group.duration = 1.2;
    group.beginTime = 0.5;
    
    [self.rocket1.layer addAnimation:group forKey:@"shuffle"];
    self.rocket1.layer.zPosition = 1;
    
}

- (void)copyfromWeb
{
    CABasicAnimation *zPosition = [CABasicAnimation animation];
    zPosition.keyPath = @"zPosition";
    zPosition.fromValue = @-1;
    zPosition.toValue = @1;
    zPosition.duration = 1.2;
    
    CAKeyframeAnimation *rotation = [CAKeyframeAnimation animation];
    rotation.keyPath = @"transform.rotation";
    rotation.values = @[ @0, @0.14, @0 ];
    rotation.duration = 1.2;
    rotation.timingFunctions = @[
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                 ];
    
    CAKeyframeAnimation *position = [CAKeyframeAnimation animation];
    position.keyPath = @"position";
    position.values = @[
                        [NSValue valueWithCGPoint:CGPointZero],
                        [NSValue valueWithCGPoint:CGPointMake(110, -20)],
                        [NSValue valueWithCGPoint:CGPointZero]
                        ];
    position.timingFunctions = @[
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                 ];
    position.additive = YES;
    position.duration = 1.2;
    
    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    group.animations = @[ zPosition, rotation, position ];
    group.duration = 1.2;
    group.beginTime = 0.5;
    
    [self.rocket1.layer addAnimation:group forKey:@"shuffle"];
    
    self.rocket1.layer.zPosition = 1;
}

@end

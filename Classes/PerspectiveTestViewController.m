//
//  PerspectiveTestViewController.m
//  PerspectiveTest
//
//  Created by Kristopher Johnson on 2/14/10.
//  Copyright Capable Hands Technologies, Inc. 2010. All rights reserved.
//

#import "PerspectiveTestViewController.h"

@implementation PerspectiveTestViewController


- (void)awakeFromNib {
    CGImageRef pictureImage = [UIImage imageNamed:@"Picture.jpg"].CGImage;
    CGRect pictureFrameRect = CGRectMake(60.0f, 60.0f, 200.0f, 300.0f);
    
    // Create perspective transformation
    CGFloat zDistance = 1500.0f;
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 1.0f / -zDistance;
    
    // Create perspective transform for reflected layer
    CATransform3D reflectedTransform = CATransform3DMakeTranslation(0.0f, 300.0f, 0.0f);
    reflectedTransform = CATransform3DRotate(reflectedTransform, M_PI, 1.0f, 0.0f, 0.0f);
    reflectedTransform.m34 = 1.0f / -zDistance;
    
    // Create picture
    CALayer *pictureLayer = [CALayer layer];
    pictureLayer.frame = pictureFrameRect;
    pictureLayer.contents = (id)pictureImage;
    pictureLayer.transform = transform;    
    
    // Create reflection of picture
    CALayer *reflectionLayer = [CALayer layer];
    reflectionLayer.frame = pictureLayer.frame;
    reflectionLayer.contents = pictureLayer.contents;
    reflectionLayer.opacity = 0.4f;
    reflectionLayer.transform = reflectedTransform;
    
    // Add layers to the root layer
    [self.view.layer addSublayer:pictureLayer];
    [self.view.layer insertSublayer:reflectionLayer below:pictureLayer];
    
    // Spin the picture
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    anim.fromValue = [NSNumber numberWithFloat:0.0f];
    anim.toValue = [NSNumber numberWithFloat:(2 * M_PI)];
    anim.duration = 3.0f;
    anim.repeatCount = 1e100f;
    [pictureLayer addAnimation:anim forKey:@"anim"];
    
    // Spin the reflection -- must be opposite direction because it's reflected
    CABasicAnimation *reflectAnim = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    reflectAnim.fromValue = [NSNumber numberWithFloat:0.0f];
    reflectAnim.toValue = [NSNumber numberWithFloat:(-2 * M_PI)];
    reflectAnim.duration = anim.duration;
    reflectAnim.repeatCount = anim.repeatCount;
    [reflectionLayer addAnimation:reflectAnim forKey:@"reflectAnim"];
}


@end

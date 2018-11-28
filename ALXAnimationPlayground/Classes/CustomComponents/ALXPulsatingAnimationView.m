//
//  ALXPulsatingAnimationView.m
//  ALXAnimationPlayground
//
//  Created by Alex Miclea on 28/11/2018.
//  Copyright © 2018 Alexei. All rights reserved.
//

#import "ALXPulsatingAnimationView.h"


#pragma mark - Private Interface

@interface ALXPulsatingAnimationView()

#pragma mark - Properties

@property(nonatomic, strong) CABasicAnimation *pulseAnimation;

@end


#pragma mark - Implementation

@implementation ALXPulsatingAnimationView


#pragma mark - Lifecycle Methods

- (void)awakeFromNib {
    [super awakeFromNib];
    self.pulseDuration = 0.6f;
    [self attatchAnimation];
}


#pragma mark - Instance Methods

- (void)startAnimationRepeating:(BOOL)repeat {
    self.pulseAnimation.repeatCount = repeat ? HUGE_VALF : 1;
    [self.layer addAnimation:self.pulseAnimation forKey:@"pulse"];
}


- (void)stopAnimation {
    [self.layer removeAnimationForKey:@"pulse"];
}


#pragma mark - Private Methods

- (void)attatchAnimation {
    self.pulseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    self.pulseAnimation.duration = self.pulseDuration;
    self.pulseAnimation.autoreverses = YES;
    self.pulseAnimation.fromValue = [NSNumber numberWithFloat:1.0f];
    self.pulseAnimation.toValue = [NSNumber numberWithFloat:1.12f];
}

@end

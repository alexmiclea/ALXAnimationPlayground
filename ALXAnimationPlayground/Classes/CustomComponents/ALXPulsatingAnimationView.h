//
//  ALXPulsatingAnimationView.h
//  ALXAnimationPlayground
//
//  Created by Alex Miclea on 28/11/2018.
//  Copyright © 2018 Alexei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALXPulsatingAnimationView : UIView

#pragma mark - Properties

@property (assign, nonatomic) float pulseDuration;


#pragma mark - Instance Methods

- (void)startAnimationRepeating:(BOOL)repeat;
- (void)stopAnimation;

@end


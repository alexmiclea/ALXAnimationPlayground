//
//  ALXPulsatingAnimationViewController.m
//  ALXAnimationPlayground
//
//  Created by Alex Miclea on 28/11/2018.
//  Copyright © 2018 Alexei. All rights reserved.
//

#import "ALXPulsatingAnimationViewController.h"
#import "ALXPulsatingAnimationView.h"

#pragma mark - Private Interface

@interface ALXPulsatingAnimationViewController ()


#pragma mark - Outlets

@property(nonatomic, weak) IBOutlet ALXPulsatingAnimationView *pulsatingView;


@end


#pragma mark - Implementation

@implementation ALXPulsatingAnimationViewController


#pragma mark - Lifecycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.pulsatingView startAnimationRepeating:YES];
}


#pragma mark - Actions

- (IBAction)switchValueChanged:(UISwitch *)sender {
    if (sender.isOn) {
        [self.pulsatingView startAnimationRepeating:YES];
    } else {
        [self.pulsatingView stopAnimation];
    }
}

@end

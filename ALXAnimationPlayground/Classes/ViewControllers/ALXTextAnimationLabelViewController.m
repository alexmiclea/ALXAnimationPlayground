//
//  ALXTextAnimationLabelViewController.m
//  ALXAnimationPlayground
//
//  Created by Alex Miclea on 28/11/2018.
//  Copyright © 2018 Alexei. All rights reserved.
//

#import "ALXTextAnimationLabelViewController.h"
#import "ALXTextAnimationLabel.h"

@interface ALXTextAnimationLabelViewController () <ALXTextAnimationLabelDelegate>

@property(nonatomic, weak) IBOutlet ALXTextAnimationLabel *animationLabel;
@property(nonatomic, weak) IBOutlet UILabel *sizingLabel;

@end

@implementation ALXTextAnimationLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.animationLabel.delegate = self;
    [self.animationLabel sizeToFit];
    [self.animationLabel setSentences:@[@"Bacon ipsum dolor amet prosciutto meatball t-bone, bresaola bacon turducken cupim boudin. Sirloin shoulder ground round tri-tip prosciutto.",
                                        @"Capicola filet mignon frankfurter, swine doner cow ham hamburger tongue andouille sausage brisket shank, capicola filet mignon frankfurter, swine doner cow ham hamburger tongue andouille sausage brisket shank.",
                                        @"Strip steak pork loin prosciutto shankle buffalo turkey bacon boudin tail biltong rump."]];
    [self.animationLabel startAnimation];
}


#pragma mark - ALXTextAnimationLabelDelegate Methods

- (void)startingSentenceAtIndex:(int)index {
    NSLog(@"Started animating sentence number %i.", index);
    self.sizingLabel.text = [self.animationLabel getSentenceAtIndex:index];
}

- (void)sentenceCompletedAtIndex:(int)index {
    NSLog(@"Sentence %i completed animation.", index);
}



@end

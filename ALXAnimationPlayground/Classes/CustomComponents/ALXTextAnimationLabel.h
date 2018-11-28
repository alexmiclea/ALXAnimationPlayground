//
//  ALXTextAnimationLabel.h
//  Fletter
//
//  Created by Alex Miclea on 22/11/2018.
//  Copyright © 2018 Alexei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ALXTextAnimationLabelDelegate <NSObject>

@optional

- (void)startingSentenceAtIndex:(int)index;
- (void)sentenceCompletedAtIndex:(int)index;

@end

@interface ALXTextAnimationLabel : UILabel

#pragma mark - Properties

@property (weak, nonatomic) id<ALXTextAnimationLabelDelegate> delegate;
@property (assign, nonatomic) float intervalBetweenLetters;
@property (assign, nonatomic) float intervalBetweenSentences;

#pragma mark - Instance Methods

- (void)setSentences:(NSArray *)sentences;
- (NSString *)getSentenceAtIndex:(int)index;
- (void)startAnimation;

@end

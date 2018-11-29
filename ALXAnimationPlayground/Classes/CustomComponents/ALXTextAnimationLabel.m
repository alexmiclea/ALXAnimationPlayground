//
//  ALXTextAnimationLabel.m
//  Fletter
//
//  Created by Alex Miclea on 22/11/2018.
//  Copyright © 2018 Alexei. All rights reserved.
//

#import "ALXTextAnimationLabel.h"

#pragma mark - Private Interface

@interface ALXTextAnimationLabel()

@property(nonatomic, strong) NSArray *sentences;
@property(nonatomic, strong) NSTimer *timer;
@property(nonatomic, assign) int index;
@property(nonatomic, assign) int sentenceIndex;

@end

@implementation ALXTextAnimationLabel



#pragma mark - Lifecycle Methods

- (void)awakeFromNib {
    [super awakeFromNib];
    self.timer = [[NSTimer alloc] init];
    self.index = 0;
    self.sentenceIndex = 0;
    self.intervalBetweenLetters = 0.05f;
    self.intervalBetweenSentences = 2.0f;
}

- (void)dealloc {
    [self.timer invalidate];
    self.timer = nil;
}


#pragma mark - Instance Methods

- (void)startAnimation {
    if (self.sentenceIndex < self.sentences.count) {
        self.text = @"";
        [self.delegate startingSentenceAtIndex:self.sentenceIndex];
        NSString *sentence = [self.sentences objectAtIndex:self.sentenceIndex];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:self.intervalBetweenLetters
                                                      target:self
                                                    selector:@selector(typeALetter:)
                                                    userInfo:sentence
                                                     repeats:YES];
    }
}


- (NSString *)getSentenceAtIndex:(int)index {
    
    return [self.sentences objectAtIndex:index];
}


- (void)skipToNextSentence {
    [self trigerNextSentenceWithDelay:0];
}

#pragma mark - Private Methods

- (void)typeALetter:(NSTimer *)timer {
    NSString *string = [timer userInfo];
    if (self.index < string.length) {
        self.text = [self.text stringByAppendingFormat:@"%@", [string substringWithRange:NSMakeRange(self.index, 1)]];
        self.index++;
    } else {
        [self trigerNextSentenceWithDelay:self.intervalBetweenSentences];
    }
}


- (void)trigerNextSentenceWithDelay:(int)delay {
    [self.timer invalidate];
    self.index = 0;
    [self.delegate sentenceCompletedAtIndex:self.sentenceIndex];
    self.sentenceIndex++;
    self.timer = nil;
    [self performSelector:@selector(startAnimation) withObject:nil afterDelay:delay];
}

@end

//
//  RootViewControllerDataSource.h
//  ALXAnimationPlayground
//
//  Created by Alex Miclea on 28/11/2018.
//  Copyright © 2018 Alexei. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RootViewControllerDataSource : NSObject <UITableViewDataSource>

#pragma mark - Instance Methods

- (NSString *)idForIndex:(int)index;

@end


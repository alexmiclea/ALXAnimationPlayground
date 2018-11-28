//
//  RootViewControllerDataSource.m
//  ALXAnimationPlayground
//
//  Created by Alex Miclea on 28/11/2018.
//  Copyright © 2018 Alexei. All rights reserved.
//

#import "RootViewControllerDataSource.h"

#pragma mark - Private Interface

@interface RootViewControllerDataSource()

#pragma mark - Properties

@property(nonatomic, strong) NSArray *dataArray;

@end

#pragma mark - Implementation

@implementation RootViewControllerDataSource


#pragma mark - Lifecycle Methods

- (instancetype)init {
    if (self = [super init]) {
        self.dataArray = [self loadData];
    }
    
    return self;
}


#pragma mark - Instance Methods

- (NSString *)idForIndex:(int)index {
    
    return [self.dataArray objectAtIndex:index];
}


#pragma mark - Private Methods

- (NSArray *)loadData {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [array addObject:@"ALXTextAnimationLabel"];
    [array addObject:@"ALXPulsatingAnimationView"];
    
    return array;
}


#pragma mark - UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    
    return cell;
}


@end

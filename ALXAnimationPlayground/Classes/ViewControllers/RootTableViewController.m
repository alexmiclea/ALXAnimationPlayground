//
//  RootTableViewController.m
//  ALXAnimationPlayground
//
//  Created by Alex Miclea on 28/11/2018.
//  Copyright © 2018 Alexei. All rights reserved.
//

#import "RootTableViewController.h"
#import "RootViewControllerDataSource.h"


#pragma mark - Private Interface

@interface RootTableViewController () <UITableViewDelegate>

#pragma mark - Outlets

@property(nonatomic, weak) IBOutlet UITableView *tableView;

#pragma mark - Properties

@property (strong, nonatomic) RootViewControllerDataSource *dataSource;

@end


#pragma mark - Implementation

@implementation RootTableViewController


#pragma mark - Lifecycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self.dataSource = [[RootViewControllerDataSource alloc] init];
    [self.tableView reloadData];
}


#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NSString *identifier = [self.dataSource idForIndex:(int)indexPath.row];
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:identifier];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end

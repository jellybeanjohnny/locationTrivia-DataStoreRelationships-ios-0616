//
//  FISLocationsTableViewController.m
//  locationTrivia-dataStore
//
//  Created by Matt Amerige on 6/30/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocationsTableViewController.h"
#import "FISLocationsDataStore.h"
#import "FISLocation.h"
#import "FISTriviaTableViewController.h"

static NSString *kCellIdentifier = @"Cell";

@interface FISLocationsTableViewController ()

@property (nonatomic, strong) FISLocationsDataStore *store;

@end

@implementation FISLocationsTableViewController


- (void)viewDidLoad
{
	[super viewDidLoad];
	self.store = [FISLocationsDataStore sharedLocationsDataStore];
	
	self.tableView.accessibilityIdentifier = @"Locations Table";
	self.tableView.accessibilityLabel = @"Locations Table";
	self.navigationItem.rightBarButtonItem.accessibilityLabel = @"addButton";
	self.navigationItem.rightBarButtonItem.accessibilityIdentifier = @"addButton";
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	
	[self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.store.locations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
	
	FISLocation *location = self.store.locations[indexPath.row];
	
	cell.textLabel.text = location.name;
	
	cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld", location.trivia.count];
	
	return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"showTrivia"]) {
		UITableViewCell *cell = (UITableViewCell *)sender;
		NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
		FISLocation *location = self.store.locations[indexPath.row];
		
		FISTriviaTableViewController *triviaVC = (FISTriviaTableViewController *)segue.destinationViewController;
		triviaVC.location = location;
	}
}

@end






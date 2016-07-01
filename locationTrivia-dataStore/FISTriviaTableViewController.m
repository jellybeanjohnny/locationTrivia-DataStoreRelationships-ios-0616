//
//  FISTriviaTableViewController.m
//  locationTrivia-dataStore
//
//  Created by Matt Amerige on 6/30/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISTriviaTableViewController.h"
#import "FISAddTriviaTableViewController.h"

static NSString *kCellIdentifer = @"TriviaCell";

@interface FISTriviaTableViewController ()

@end

@implementation FISTriviaTableViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.tableView.accessibilityIdentifier = @"Trivia Table";
	self.tableView.accessibilityLabel = @"Trivia Table";
	self.navigationItem.rightBarButtonItem.accessibilityLabel = @"Add Trivia Button";
	self.navigationItem.rightBarButtonItem.accessibilityIdentifier = @"Add Trivia Button";
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
	return self.location.trivia.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifer];
	
	FISTrivium *trivumObj = self.location.trivia[indexPath.row];
	
	cell.textLabel.text = trivumObj.content;
	cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld", trivumObj.likes];
	
	return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"ShowAddTrivium"]) {
		FISAddTriviaTableViewController *addTriviaVC = (FISAddTriviaTableViewController *)segue.destinationViewController;
		addTriviaVC.location = self.location;
	}
}

@end

























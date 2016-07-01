//
//  FISAddTriviaTableViewController.m
//  locationTrivia-dataStore
//
//  Created by Matt Amerige on 6/30/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISAddTriviaTableViewController.h"
#import "FISTrivium.h"

@interface FISAddTriviaTableViewController ()

@property (weak, nonatomic) IBOutlet UITextField *triviumTextField;

@end

@implementation FISAddTriviaTableViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	NSLog(@"Location Obj: %@", self.location);
}

- (IBAction)_cancelButtonTapped:(id)sender
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)_saveButtonTapped:(id)sender
{
	FISTrivium *newTrivium = [[FISTrivium alloc] initWithContent:self.triviumTextField.text likes:0];
	
	[self.location.trivia addObject:newTrivium];
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end

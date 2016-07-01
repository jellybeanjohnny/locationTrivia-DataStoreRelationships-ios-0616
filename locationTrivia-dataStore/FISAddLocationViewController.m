//
//  FISAddLocationViewController.m
//  locationTrivia-dataStore
//
//  Created by Matt Amerige on 6/30/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISAddLocationViewController.h"
#import "FISLocation.h"
#import "FISLocationsDataStore.h"

@interface FISAddLocationViewController ()

@property (weak, nonatomic) IBOutlet UITextField *locationNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeTextField;


@end

@implementation FISAddLocationViewController

- (IBAction)_cancelButtonTapped:(id)sender
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)_saveButtonTapped:(id)sender
{
	FISLocation *newLocation = [[FISLocation alloc] initWithName:self.locationNameTextField.text
																											latitude:[self.latitudeTextField.text floatValue]
																										 longitude:[self.longitudeTextField.text floatValue]];
	
	[[FISLocationsDataStore sharedLocationsDataStore].locations addObject:newLocation];
	
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end

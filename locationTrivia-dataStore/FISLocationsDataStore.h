//
//  FISLocationsDataStore.h
//  locationTrivia-dataStore
//
//  Created by Matt Amerige on 6/30/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISLocation.h"

@interface FISLocationsDataStore : NSObject

@property (nonatomic, strong) NSMutableArray *locations;

+ (instancetype)sharedLocationsDataStore;

@end

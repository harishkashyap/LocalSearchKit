//
//  LSMapItem.h
//  LocalSearchKit
//
//  Created by Harish Kashyap on 7/5/14.
//  Copyright (c) 2014 Harish Krishnamurthy. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface LSMapItem : NSObject

@property (nonatomic, readonly) MKCoordinateRegion boundingRegion;
@property (nonatomic, readonly) NSMutableDictionary *searchResults;

- (id)initWithSearchResults:(NSArray *)mapItems boundingRegion:(MKCoordinateRegion)region;
- (id)copyWithZone:(NSZone *)zone;
- (NSString *)description;

@end

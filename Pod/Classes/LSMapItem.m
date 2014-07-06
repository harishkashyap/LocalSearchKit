//
//  LSMapItem.m
//  LocalSearchKit
//
//  Created by Harish Kashyap on 7/5/14.
//  Copyright (c) 2014 Harish Krishnamurthy. All rights reserved.
//

#import "LSMapItem.h"

@implementation LSMapItem

- (id)initWithSearchResults:(NSArray *)mapItems boundingRegion:(MKCoordinateRegion)region {
    _searchResults = [[NSMutableDictionary alloc] init];

    for (MKMapItem *mapItem in mapItems) {
        [_searchResults setObject:mapItem forKey:mapItem.name];
    }
    _boundingRegion = region;
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    LSMapItem *mapItemCopy = [[self class] allocWithZone:zone];
    mapItemCopy->_searchResults = self.searchResults;
    mapItemCopy->_boundingRegion = self.boundingRegion;
    return mapItemCopy;
}

- (NSString *)description {
    NSMutableString *debugDescription = [[NSMutableString alloc] initWithString:@"Search results\n"];
    
    for (id key in [self.searchResults allKeys]) {
        [debugDescription appendString:@"\n"];
        [debugDescription appendString:key];
    }
    [debugDescription appendString:@"\n"];

    return debugDescription;
}

@end

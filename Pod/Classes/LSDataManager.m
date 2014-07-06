//
//  LSDataManager.m
//  LocalSearchKit
//
//  Created by Harish Kashyap on 7/5/14.
//  Copyright (c) 2014 Harish Krishnamurthy. All rights reserved.
//

#import "LSDataManager.h"
#import "LSMapItem.h"

NSString * const kSearchCompleteNotification = @"kSearchCompleteNotification";

@implementation LSDataManager

+ (id)sharedInstance {
    static dispatch_once_t p = 0;
    __strong static LSDataManager *_sharedObject = nil;
    
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
    });
    
    return _sharedObject;
}

- (id)init {
    _responseQueue = [[Queue alloc] init];
    return self;
}

- (LSMapItem *)deQueueMapItem {
    return [self.responseQueue dequeue];
}

- (void)enQueueMapItems:(MKLocalSearchResponse *)response forQuery:(NSString *)query {
    NSAssert(self.responseQueue != nil, @"LSDataManager needs to be allocated first!");
    if (response.mapItems.count) {
        LSMapItem *lsmapItem = [[LSMapItem alloc] initWithSearchResults:response.mapItems boundingRegion:response.boundingRegion];
        [self.responseQueue enqueue:lsmapItem];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:kSearchCompleteNotification object:query];
}

@end

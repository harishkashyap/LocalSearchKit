//
//  LSManager.m
//  LocalSearchKit
//
//  Created by Harish Kashyap on 7/5/14.
//  Copyright (c) 2014 Harish Krishnamurthy. All rights reserved.
//

#import "LSManager.h"
#import "LSOperation.h"
#import "LSDataManager.h"

@interface LSManager()

@property (nonatomic, strong) NSOperationQueue *searchOperationQueue;

@end

@implementation LSManager

+ (id)sharedInstance {
    static dispatch_once_t p = 0;
    __strong static LSManager *_sharedObject = nil;
    
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
    });
    
    return _sharedObject;
}

- (id)init {
    if (self = [super init]) {
        _searchOperationQueue = [[NSOperationQueue alloc]init];
        _searchOperationQueue.name = @"Search Operation Queue";
    }
    
    return self;
}

- (void)startOperationForQuery:(NSString *)query atLocation:(CLLocation *)location {
    LSOperation *_searchOperation = [[LSOperation alloc] initWithQuery:query atLocation:location];
    [self.searchOperationQueue addOperation:_searchOperation];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveSearchResults:) name:kSearchCompleteNotification object:nil];
}

- (void)saveSearchResults:(NSNotification *)notification {
    LSDataManager *dataManager = [LSDataManager sharedInstance];
    LSMapItem *mapItem = dataManager.deQueueMapItem;
    if (mapItem) {
        [self.delegate searchResponse:mapItem forQuery:notification.object];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kSearchCompleteNotification object:nil];
}

@end

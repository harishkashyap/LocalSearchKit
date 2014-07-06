//
//  LSOperation.m
//  LocalSearchKit
//
//  Created by Harish Kashyap on 7/5/14.
//  Copyright (c) 2014 Harish Krishnamurthy. All rights reserved.
//

#import "LSOperation.h"
#import "LSDataManager.h"
#import "LSMapItem.h"

@interface LSOperation()

@property (nonatomic, strong) CLLocation *location;
@property (nonatomic, strong) NSString *query;

@end

@implementation LSOperation

- (id)initWithQuery:(NSString *)query atLocation:(CLLocation *)location {
    if (self = [super init]) {
        _query = query;
        _location = location;
    }
    return self;
}

#pragma mark -
#pragma mark - Run search operation

- (void)main {
    @autoreleasepool {
        if (self.isCancelled) {
            return;
        }
        
        MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
        request.naturalLanguageQuery = self.query;
        request.region = MKCoordinateRegionMakeWithDistance(self.location.coordinate, 3000, 3000);
        
        MKLocalSearch *localSearch = [[MKLocalSearch alloc]initWithRequest:request];
        
        if (self.isCancelled) {
            request = nil;
            localSearch = nil;
            return;
        }
        
#ifdef DEBUG
        NSLog(@"Starting search for %@ at %@", self.query, [self.location description]);
#endif
        
        [localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
            if (response) {
                [[LSDataManager sharedInstance] enQueueMapItems:response forQuery:self.query];
            }else {
#ifdef DEBUG
                NSLog(@"%@", [error description]);
#endif
            }
        }];
    }
}

@end

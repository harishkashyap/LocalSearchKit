//
//  LSManager.h
//  LocalSearchKit
//
//  Created by Harish Kashyap on 7/5/14.
//  Copyright (c) 2014 Harish Krishnamurthy. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "DataStructures.h"

@class LSOperation;

@protocol LSManagerDelegate <NSObject>

- (void)searchResponse:(Queue *)responseQueue forQuery:(NSString *)query;

@end

@interface LSManager : NSObject

@property (nonatomic, assign) id<LSManagerDelegate> delegate;

- (void)startOperationForQuery:(NSString *)query atLocation:(CLLocation *)location;

+ (id)sharedInstance;

@end

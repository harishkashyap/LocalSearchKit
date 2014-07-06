//
//  LSDataManager.h
//  LocalSearchKit
//
//  Created by Harish Kashyap on 7/5/14.
//  Copyright (c) 2014 Harish Krishnamurthy. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <DataStructures/DataStructures.h>

@class LSMapItem;

NSString * const kSearchCompleteNotification;

@interface LSDataManager : NSObject

@property (nonatomic, strong) Queue *responseQueue;

- (LSMapItem *)deQueueMapItem;
- (void)enQueueMapItems:(MKLocalSearchResponse *)response forQuery:(NSString *)query;

+ (id)sharedInstance;

@end

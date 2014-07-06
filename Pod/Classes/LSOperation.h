//
//  LSOperation.h
//  LocalSearchKit
//
//  Created by Harish Kashyap on 7/5/14.
//  Copyright (c) 2014 Harish Krishnamurthy. All rights reserved.
//

#import <MapKit/MapKit.h>

@class LSDataManager;

@interface LSOperation : NSOperation

@property (nonatomic, strong) LSDataManager *dataManager;

- (id)initWithQuery:(NSString *)query atLocation:(CLLocation *)location;

@end

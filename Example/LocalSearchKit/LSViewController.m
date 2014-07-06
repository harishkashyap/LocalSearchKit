//
//  LSViewController.m
//  LocalSearchKit
//
//  Created by Harish Krishnamurthy on 07/05/2014.
//  Copyright (c) 2014 Harish Krishnamurthy. All rights reserved.
//

#import "LSViewController.h"
#import "LSKit.h"

@implementation LSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:42.347181 longitude:-71.077788];
    LSManager *searchManager = [LSManager sharedInstance];
    searchManager.delegate = self;
    
    [searchManager startOperationForQuery:@"restaurants" atLocation:location];
    [searchManager startOperationForQuery:@"theaters" atLocation:location];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)searchResponse:(Queue *)responseQueue forQuery:(NSString *)query {
    NSLog(@"%@ response for query %@", [responseQueue.dequeue description], query);
}

@end

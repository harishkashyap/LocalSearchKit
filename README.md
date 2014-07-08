# LocalSearchKit

[![CI Status](http://img.shields.io/travis/Harish Krishnamurthy/LocalSearchKit.svg?style=flat)](https://travis-ci.org/Harish Krishnamurthy/LocalSearchKit)
[![Version](https://img.shields.io/cocoapods/v/LocalSearchKit.svg?style=flat)](http://cocoadocs.org/docsets/LocalSearchKit)
[![License](https://img.shields.io/cocoapods/l/LocalSearchKit.svg?style=flat)](http://cocoadocs.org/docsets/LocalSearchKit)
[![Platform](https://img.shields.io/cocoapods/p/LocalSearchKit.svg?style=flat)](http://cocoadocs.org/docsets/LocalSearchKit)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

* Use cocoapods to setup your project. If you aren't using cocoapods then install DataStructures library for Objective-C.

* Setup the Delegate - <LSManagerDelegate> in your viewcontroller or model and 
get a sharedInstance of the LSManager:
  - LSManager *searchManager = [LSManager sharedInstance];
  - searchManager.delegate = self;

* Start to query various search operations around a CLLocation object. If you want to run a search operation for restaurants and theaters then:
  - [searchManager startOperationForQuery:@"restaurants" atLocation:location];
  - [searchManager startOperationForQuery:@"theaters" atLocation:location];

* The searchResponse method will receive the LSMapItems that contain the boundingRegion as well as the MKMapItems.
  - (void)searchResponse:(LSMapItem *)mapItem forQuery:(NSString *)query

## Requirements

LocalSearchKit requires DataStructures library. You can install DataStructures through cocoapods.

## Installation

LocalSearchKit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "LocalSearchKit"

## Author

Harish Krishnamurthy, hkashyap@icloud.com

## License

LocalSearchKit is available under the MIT license. See the LICENSE file for more info.


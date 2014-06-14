//
//  AppDelegate.h
//  CodingChallenge
//
//  Created by Waheeda on 6/9/14.
//  Copyright (c) 2014 TenPearls. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "Reachability.h"
#import "DataModel.h"
#import "ProductsViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) Reachability *internetReachability;
@property (strong, nonatomic) Reachability *wifiReachability;
@property (nonatomic) NetworkStatus currentReachabilityStatus;


@end

//
//  AppDelegate.m
//  CodingChallenge
//
//  Created by Waheeda on 6/9/14.
//  Copyright (c) 2014 TenPearls. All rights reserved.
//

#import "AppDelegate.h"
#import "CoreDataHelper.h"
#import "WebServiceModel.h"
#import "JsonHelper.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
     [[CoreDataHelper sharedInstance] initWithStoreName:DB_NAME];
    [self startReachabilityNotifier];
    
    
    ProductsViewController *productsViewController = [[ProductsViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:productsViewController];
    [self.window setRootViewController:navigationController];
    
   return YES;
}


// CHECK FOR REACHABILITY

-(void) startReachabilityNotifier
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
    self.internetReachability = [Reachability reachabilityForInternetConnection];
    [self.internetReachability startNotifier];
    
    self.wifiReachability = [Reachability reachabilityForLocalWiFi];
    [self.wifiReachability startNotifier];
    
    [self setCurrentReachability];
}

/*!
 * Called by Reachability whenever status changes.
 */
- (void) reachabilityChanged:(NSNotification *)note
{
	 [self setCurrentReachability];
}

-(void) setCurrentReachability
{
    NetworkStatus wifiStatus = [self.wifiReachability currentReachabilityStatus];
    NetworkStatus internetStatus = [self.internetReachability currentReachabilityStatus];
    
    if (wifiStatus == ReachableViaWiFi) {
        _currentReachabilityStatus =  ReachableViaWiFi;
        [NOTIFICATION_CENTER postNotificationName:NOTIFICATION_INTERNET_CONNECTION_FOUND object:self];
    }
    else if (wifiStatus != ReachableViaWiFi && internetStatus == ReachableViaWWAN) {
        _currentReachabilityStatus =  ReachableViaWWAN;
        [NOTIFICATION_CENTER postNotificationName:NOTIFICATION_INTERNET_CONNECTION_FOUND object:self];
    }
    else {
        _currentReachabilityStatus = NotReachable;
    }
}



@end

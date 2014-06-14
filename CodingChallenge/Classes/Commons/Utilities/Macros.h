//
//  Macros.h
//  Yuru
//
//  Created by Ali Zohair on 5/17/13.
//  Copyright (c) 2013 Ali Zohair. All rights reserved.
//

#ifndef Yuru_Macros_h
#define Yuru_Macros_h


#define APP_DELEGATE            (AppDelegate*)[[UIApplication sharedApplication] delegate]
#define SCREEN_HEIGHT           [[UIScreen mainScreen] bounds].size.height
#define USER_DEFAULTS           [NSUserDefaults standardUserDefaults]
#define NOTIFICATION_CENTER     [NSNotificationCenter defaultCenter]
#define ALERT                   [Alert sharedInstance]


#define COREDATA_HELPER         [CoreDataHelper sharedInstance]
#define MANAGED_OBJECT_MODEL    COREDATA_HELPER.managedObjectContext 

#define NORMAL_FONT_OF_SIZE(s)  [UIFont fontWithName:APPLICATION_REGULAR_FONT size:s]
#define BOLD_FONT_OF_SIZE(s)    [UIFont fontWithName:APPLICATION_BOLD_FONT size:s]
#define SEMIBOLD_FONT_OF_SIZE(s)    [UIFont fontWithName:APPLICATION_SEMIBOLD_FONT size:s]

#define POSITIVE_COLOR  [UIColor colorWithRed:(75/255.0) green:(222/255.0) blue:(69/255.0) alpha:1.0]
#define NEGATIVE_COLOR  [UIColor colorWithRed:(255/255.0) green:(50/255.0) blue:(109/255.0) alpha:1.0]

// Colors


#define GRAY_COLOR_WITH_VALUE(a)  [UIColor colorWithWhite:a/255.0 alpha:1.0]
#define LIGHT_BG_COLOR                  GRAY_COLOR_WITH_VALUE(98.0)
#define APP_BG_COLOR                    GRAY_COLOR_WITH_VALUE(70.0)
#define CELL_BG_COLOR_LIGHT             GRAY_COLOR_WITH_VALUE(77.0)
#define CELL_BG_COLOR_DARK              GRAY_COLOR_WITH_VALUE(55.0)
#define CELL_BG_COLOR_FOR_ADD_CELL      [UIColor colorWithRed:(50/255.0) green:(225/255.0) blue:(255/255.0) alpha:1.0];
#define TABLEVIEW_SEPARATOR_COLOR       [UIColor colorWithRed:(160/255.0) green:(160/255.0) blue:(160/255.0) alpha:1.0]
#define LIGHT_BLUE_COLOR                [UIColor colorWithRed:22/250.0 green:208/250.0 blue:240/250.0 alpha:1.0]
#define LIGHT_GREEN_COLOR               [UIColor colorWithRed:73/250.0 green:190/250.0 blue:69/250.0 alpha:1.0]
#define FB_BLUE_COLOR                   [UIColor colorWithRed:60/250.0 green:110/250.0 blue:202/250.0 alpha:1.0]
#define GREEN_COLOR                   [UIColor colorWithRed:73/250.0 green:223/250.0 blue:67/250.0 alpha:1.0]
#define TAG_LINE_COLOR  [UIColor colorWithRed:(82/255.0) green:(181/255.0) blue:(197/255.0) alpha:1.0]


// DEVICE SYSTEM VERSION
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


#endif

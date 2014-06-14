//
//  CoreDataHelper.h
//  Test
//
//  Created by Azfar Siddiqui on 12/14/12.
//  Copyright (c) 2012 TenPearls (Pvt.) Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface CoreDataHelper : NSObject {
    
    NSManagedObjectModel *_objectModel;
    NSPersistentStoreCoordinator *_storeCoordinator;
    NSString *_storeName;
}

+ (CoreDataHelper*) sharedInstance;

- (void)initWithStoreName:(NSString*)name;
- (NSManagedObject *) getByPredicate : (NSString*)entityName andPredicate : (NSPredicate *) predicate;
- (NSArray *) getAll : (NSString *) entityName;
- (NSEntityDescription *) insert : (NSString *) entityName;
- (BOOL) save;
- (NSEntityDescription *) get : (NSString *) entityName;
- (BOOL) delete : (NSManagedObject *) entity;
- (int)getCountForFetchRequest : (NSFetchRequest *)fetchRequest;
- (NSArray*) executeFetchRequest:(NSFetchRequest *) fetchRequest;
+ (BOOL)deleteAllEntries:(NSString*)entityName;
@end

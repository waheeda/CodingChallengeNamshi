//
//  CoreDataHelper.m
//  Test
//
//  Created by Azfar Siddiqui on 12/14/12.
//  Copyright (c) 2012 TenPearls (Pvt.) Ltd. All rights reserved.
//

#import "CoreDataHelper.h"
#import <CoreData/CoreData.h>


static CoreDataHelper *coreDataInstance;
static NSManagedObjectContext *_objectModelContext;	    

@interface CoreDataHelper()
    - (NSPersistentStoreCoordinator *)storeCoordinator;
    - (NSManagedObjectContext *)objectModelContext; 
@end

@implementation CoreDataHelper

#pragma mark - CRUD Helper Methods

-(BOOL)save{
    NSError *error = nil;
    if (![_objectModelContext save:&error]) {
        return NO;
    }
    return YES;
}

+ (BOOL)deleteAllEntries:(NSString*)entityName{
    @try {
        NSFetchRequest *userSearchResults = [[NSFetchRequest alloc] init];
        [userSearchResults setEntity:[[CoreDataHelper sharedInstance] get:entityName]];
        
        NSArray *searchResults = [[CoreDataHelper sharedInstance] executeFetchRequest:userSearchResults];
        
        for (NSManagedObject *searchResult in searchResults) {
            [_objectModelContext deleteObject:searchResult];
        }
        return [[CoreDataHelper sharedInstance] save];
    }
    @catch (NSException *exception) {
		NSLog(@"EXCEPTION ========== CoreDataHelper -> deleteAllEntries -> %@", exception.description);
        return NO;
    }
}

-(NSEntityDescription*) insert:(NSString *) name{
    return [NSEntityDescription 
            insertNewObjectForEntityForName:name        
            inManagedObjectContext:_objectModelContext];
}

-(NSEntityDescription*) get:(NSString *) name{
    return [NSEntityDescription 
            entityForName:name inManagedObjectContext:[self objectModelContext]];
}

- (BOOL)delete:(NSManagedObject *)entity{
    @try {
        NSError *err;
        [_objectModelContext deleteObject:(NSManagedObject*)entity];
        [_objectModelContext save:&err];
        return YES;
    }
    @catch (NSException *exception) {
        return NO;
    }
}

- (NSArray *) getAll:(NSString*)entityName{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:entityName];
    return [self executeFetchRequest:request];
}

- (NSManagedObject *) getByPredicate:(NSString*)entityName andPredicate:(NSPredicate*)predicate{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:entityName];
    [request setPredicate:predicate];
    NSArray *rs = [self executeFetchRequest:request];
    if([rs count] > 0)
        return (NSManagedObject *)[rs objectAtIndex:0];
    
    return nil;
}

-(NSArray*) executeFetchRequest:(NSFetchRequest *) fetchRequest{
    NSError *error = nil;
    NSArray *results = [_objectModelContext executeFetchRequest:fetchRequest error:&error];
    return results;
}
- (int ) getCountForFetchRequest : (NSFetchRequest *) fetchRequest {
	@try {
		NSError *error = nil;
		return (int)[_objectModelContext countForFetchRequest:fetchRequest error:&error];
	}
	@catch (NSException *exception) {
		NSLog(@"EXCEPTION ========== CoreDataHelper -> getCountForFetchRequest -> %@", exception.description);
		return 0;
	}
}


#pragma mark - Setup Core Data Store

+ (CoreDataHelper *) sharedInstance {
    
    if(coreDataInstance == nil)
        coreDataInstance = [CoreDataHelper new];
    return coreDataInstance;
}

- (void)initWithStoreName:(NSString*)name{
    _storeName = name;
    [self objectModelContext];
}

- (NSManagedObjectContext *)objectModelContext {
    if (_objectModelContext != nil) {
        return _objectModelContext;
    }
    NSPersistentStoreCoordinator *coordinator = [self storeCoordinator];
    if (coordinator != nil) {
        _objectModelContext = [[NSManagedObjectContext alloc] init];
        [_objectModelContext setPersistentStoreCoordinator: coordinator];
    }
    return _objectModelContext;
}

- (NSManagedObjectModel *)objectModel {
    if (_objectModel != nil) {
        return _objectModel;
    }
    _objectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    return _objectModel;
}

- (NSPersistentStoreCoordinator *)storeCoordinator {
    if (_storeCoordinator != nil) {
        return _storeCoordinator;
    }
    
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 
                                                                       NSUserDomainMask, 
                                                                       YES) lastObject];
    
    NSURL *storeUrl = [NSURL fileURLWithPath: [documentDirectory stringByAppendingPathComponent:_storeName]];
	
	NSError *error = nil;
    _storeCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self objectModel]];
    
    if (![_storeCoordinator addPersistentStoreWithType:NSSQLiteStoreType 
                                         configuration:nil 
                                                   URL:storeUrl 
                                               options:nil 
                                                 error:&error]) {
		NSLog(@"Unresolved error %@, %@", error
              , [error userInfo]);
		abort();
    }    
    
    return _storeCoordinator;
}

@end

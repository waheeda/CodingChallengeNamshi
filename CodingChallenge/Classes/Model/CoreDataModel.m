//
//  CoreDataModel.m
//  CodingChallenge
//
//  Created by Waheeda on 6/10/14.
//  Copyright (c) 2014 TenPearls. All rights reserved.
//

#import "CoreDataModel.h"
#import "CoreDataHelper.h"
#import "Macros.h"

@implementation CoreDataModel


+ (BOOL) saveProduct:(NSDictionary *)productDictionary {
    
    Product *product = (Product*)[COREDATA_HELPER insert:ENTITY_PRODUCT];
    
    [product setValuesWithDictionary:productDictionary];
    
    return [COREDATA_HELPER save];
}

+(NSArray *) getAllProducts
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[COREDATA_HELPER get:ENTITY_PRODUCT]];
    NSArray *result = [COREDATA_HELPER executeFetchRequest:request];
    return result;
}



@end

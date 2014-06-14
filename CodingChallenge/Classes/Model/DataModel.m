//
//  DataModel.m
//  CodingChallenge
//
//  Created by Waheeda on 6/10/14.
//  Copyright (c) 2014 TenPearls. All rights reserved.
//

#import "DataModel.h"
#import "CoreDataModel.h"
#import "WebServiceModel.h"


@implementation DataModel

+ (void) saveProductsIntoCoreData:(NSArray *) products
{
    for (NSDictionary *productDictionary in products) {
        [CoreDataModel saveProduct:productDictionary];
    }
}

+(NSArray *) getAllProducts
{
    return [CoreDataModel getAllProducts];
}

+(BOOL) loadProductsFromAPI:(id) delegate
{
    return [WebServiceModel getProducts:delegate];
}

@end

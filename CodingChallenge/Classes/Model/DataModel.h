//
//  DataModel.h
//  CodingChallenge
//
//  Created by Waheeda on 6/10/14.
//  Copyright (c) 2014 TenPearls. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface DataModel : NSObject

+ (void) saveProductsIntoCoreData:(NSArray *) products;

+(NSArray *) getAllProducts;
+(BOOL) loadProductsFromAPI:(id) delegate;
@end

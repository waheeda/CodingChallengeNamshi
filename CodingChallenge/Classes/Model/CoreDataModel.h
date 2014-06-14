//
//  CoreDataModel.h
//  CodingChallenge
//
//  Created by Waheeda on 6/10/14.
//  Copyright (c) 2014 TenPearls. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"
#import "Constants.h"

@interface CoreDataModel : NSObject

+ (BOOL) saveProduct:(NSDictionary *)productDictionary;

+(NSArray *) getAllProducts;


@end

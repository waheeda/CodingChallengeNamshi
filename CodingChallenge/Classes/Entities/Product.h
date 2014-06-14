//
//  Product.h
//  CodingChallenge
//
//  Created by Waheeda on 6/10/14.
//  Copyright (c) 2014 TenPearls. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Product : NSManagedObject

@property (nonatomic, retain) NSString * brandName;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSNumber * price;
@property (nonatomic, retain) NSString * productName;
@property (nonatomic, retain) NSString * productPage;
@property (nonatomic, retain) NSString * sku;

-(void) setValuesWithDictionary:(NSDictionary *) dictionary;


@end

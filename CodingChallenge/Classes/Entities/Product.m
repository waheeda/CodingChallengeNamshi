//
//  Product.m
//  CodingChallenge
//
//  Created by Waheeda on 6/10/14.
//  Copyright (c) 2014 TenPearls. All rights reserved.
//

#import "Product.h"
#import "StringHelper.h"

@implementation Product

@dynamic brandName;
@dynamic id;
@dynamic image;
@dynamic price;
@dynamic productName;
@dynamic productPage;
@dynamic sku;


-(void) setValuesWithDictionary:(NSDictionary *) dictionary
{
    self.brandName = [StringHelper validateNilString:[dictionary objectForKey:KEY_BRAND_NAME]];
     self.id = [NSNumber numberWithInt:[[StringHelper validateNilString:[dictionary objectForKey:KEY_ID]] intValue]]  ;
     self.image = [StringHelper validateNilString:[dictionary objectForKey:KEY_IMAGE]];
     self.price = [NSNumber numberWithInt:[[StringHelper validateNilString:[dictionary objectForKey:KEY_PRICE]] intValue]]  ;
     self.productName = [StringHelper validateNilString:[dictionary objectForKey:KEY_PRODUCT_NAME]];
     self.productPage = [StringHelper validateNilString:[dictionary objectForKey:KEY_PRODUCT_PAGE]];
     self.sku = [StringHelper validateNilString:[dictionary objectForKey:KEY_SKU]];
    
}

@end

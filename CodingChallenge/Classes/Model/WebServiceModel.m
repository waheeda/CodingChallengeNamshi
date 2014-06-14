//
//  WebServiceModel.m
//  CodingChallenge
//
//  Created by Waheeda on 6/10/14.
//  Copyright (c) 2014 TenPearls. All rights reserved.
//

#import "WebServiceModel.h"

@implementation WebServiceModel

+(NSString *) prepareURL:(NSString *)urlExtention {
    
    return [[NSString alloc]initWithFormat:@"%@%@",API_BASE,urlExtention];
  
}

+ (BOOL) getProducts  :(id)delegate{
    
    return [HttpRequestHelper post:[WebServiceModel prepareURL:API_GET_PRODUCTS] withData:nil withDelegate:delegate withIsAsync:YES RequestMethod:API_REQUESTTYPE_GET];
}



@end

//
//  WebServiceModel.h
//  CodingChallenge
//
//  Created by Waheeda on 6/10/14.
//  Copyright (c) 2014 TenPearls. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpRequestHelper.h"


@interface WebServiceModel : NSObject

+ (BOOL) getProducts  :(id)delegate;

@end

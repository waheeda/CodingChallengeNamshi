//
//  StringHelper.h
//  SocialRadar
//
//  Created by Waheeda on 8/29/12.
//  Copyright (c) 2012 TenPearls. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface StringHelper : NSObject

+ (NSString *)validateEmptyString : (NSString *)string;

+ (NSString *)validateNilString : (NSString *)string;

+ (BOOL)isEmptyOrNull : (NSString *)string;

+ (BOOL)isEmpty : (NSString *)string;

+ (BOOL)isNull : (NSString *)string;

+ (NSString *)getString : (int)value;

+ (NSString *)stringByAppendingCount : (NSString *)string withCount : (int)count;

+ (NSString *)stringByTrimmingWhiteSpaces : (NSString *)string;

+ (NSString *)adjustNewLineCharacterinString : (NSString *)string;

+ (BOOL) isString:(NSString *) value;

@end

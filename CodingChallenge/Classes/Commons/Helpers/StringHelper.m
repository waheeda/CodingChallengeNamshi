//
//  StringHelper.m
//  SocialRadar
//
//  Created by Waheeda on 8/29/12.
//  Copyright (c) 2012 TenPearls. All rights reserved.
//

#import "StringHelper.h"

@implementation StringHelper

+ (NSString *) validateEmptyString : (NSString *) string {
	if ([StringHelper isNull:string]) {
		return @"";
	}
	return string;
}

+ (NSString *) validateNilString : (NSString *) string {
	if ([StringHelper isEmptyOrNull:string]) {
		return nil;
	}
	return string;
}

+ (BOOL) isEmptyOrNull : (NSString *) string {
	if ([StringHelper isNull:string] || [StringHelper isEmpty:string]) {
		return TRUE;
	} else {      return FALSE; }
}

+ (BOOL) isEmpty : (NSString *) string {
	if ([self isString:string] && [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0) {
		return TRUE;
	} else {      return FALSE; }
}

+ (BOOL) isNull : (NSString *) string {
	if (string == nil || [string isKindOfClass:[NSNull class]]) {
		return TRUE;
	} else {      return FALSE; }
}

+ (NSString *) getString : (int) value {
	if (value <= 1) {
		return @"";
	} else {
		return @"s";
	}
}

+ (NSString *) stringByAppendingCount : (NSString *) string withCount : (int) count {
	if (!count) {
		return string;
	} else {  return [NSString stringWithFormat:@"%@ (%d)", string, count]; }
}

+ (NSString *) stringByTrimmingWhiteSpaces : (NSString *) string {
	
    if([self isString:string])
        return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return nil;
}

+ (NSString *) adjustNewLineCharacterinString : (NSString *) string {
	
    NSString *newLineString = @"\n";

    
    if([self isString:string])
        return [string stringByReplacingOccurrencesOfString:@"\\n" withString:newLineString];
    return nil;
}

+(BOOL) isString:(NSString *) value
{
    if([value isKindOfClass:[NSString class]])
        return YES;
    return NO;
}

@end

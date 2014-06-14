//
//  HttpRequestHelper.h
//  SocialRadar
//
//  Created by Mohsin on 1/25/12.
//  Copyright (c) 2012 TenPearls. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "Alert.h"
#import "Constants.h"
#import "Utils.h"
#import "DataModel.h"

@interface HttpRequestHelper : NSObject{}

+ (BOOL) post : (NSString*)url withData:(NSString*)data withDelegate:(id)delegate withIsAsync:(BOOL)isAysnc RequestMethod:(NSString*)requestMethod;

+ (BOOL) post : (NSString*)url withData:(NSString*)data withDelegate:(id)delegate withIsAsync:(BOOL)isAysnc RequestMethod:(NSString*)requestMethod ContentType:(NSString *) contentType;


+ (BOOL) post : (NSString*)url withData:(NSString*)data withDelegate:(id)delegate withIsAsync:(BOOL)isAysnc RequestMethod:(NSString*)requestMethod ContentType:(NSString *) contentType withUserInfo:(NSDictionary *) userInfo;


+ (BOOL) addOperationToQueue : (NSString *) url withData : (NSString *) data withDelegate : (id) delegate withUserInfo : (NSMutableDictionary *) userInfo withOperationPriority : (NSOperationQueuePriority) priority withQueueObject : (NSOperationQueue *) operationQueue;


+ (BOOL) addOperationToQueue : (NSString *) url withData : (NSString *) data withDelegate : (id) delegate withUserInfo : (NSMutableDictionary *) userInfo withOperationPriority : (NSOperationQueuePriority) priority withQueueObject : (NSOperationQueue *) operationQueue withRequestType:(NSString *)requestType withContentType:(NSString *)contentType;


+ (BOOL) addOperationToQueue : (NSString *) url withData : (NSString *) data withDelegate : (id) delegate;


+ (ASIHTTPRequest*)prepareRequestObject : (NSString *) url withData : (NSString *) data withDelegate : (id) delegate withUserInfo : (NSDictionary *) userInfo andRequestType:(NSString*)requestType andContentType:(NSString *) contentType;






@end

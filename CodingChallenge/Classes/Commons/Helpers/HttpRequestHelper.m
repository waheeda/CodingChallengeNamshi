//
//  HttpRequestHelper.m
//  CodingChallenge
//
//  Created by Waheeda on 6/10/14.
//  Copyright (c) 2014 TenPearls. All rights reserved.
//

#import "HttpRequestHelper.h"


static NSOperationQueue *_queue = nil;


@implementation HttpRequestHelper

+ (BOOL) post : (NSString*)url withData:(NSString*)data withDelegate:(id)delegate withIsAsync:(BOOL)isAysnc RequestMethod:(NSString*)requestMethod
{
    return [HttpRequestHelper post:url withData:data withDelegate:delegate withIsAsync:isAysnc RequestMethod:requestMethod ContentType:CONTENT_TYPE_JSON];
}

+ (BOOL) post : (NSString*)url withData:(NSString*)data withDelegate:(id)delegate withIsAsync:(BOOL)isAysnc RequestMethod:(NSString*)requestMethod ContentType:(NSString *) contentType
{
    return [HttpRequestHelper post:url withData:data withDelegate:delegate withIsAsync:isAysnc RequestMethod:requestMethod ContentType:contentType withUserInfo:nil];
    
}

+ (BOOL) post : (NSString*)url withData:(NSString*)data withDelegate:(id)delegate withIsAsync:(BOOL)isAysnc RequestMethod:(NSString*)requestMethod ContentType:(NSString *) contentType withUserInfo:(NSDictionary *) userInfo {
    
    ASIHTTPRequest *request = [HttpRequestHelper prepareRequestObject:url
                                                             withData:data
                                                         withDelegate:delegate
                                                         withUserInfo:userInfo
                                                       andRequestType:requestMethod
                                                       andContentType:contentType];
    
    if(!request)
    {
        [ALERT hideLoader];
        return NO;
    }
    
    
    if(isAysnc)
        [request startAsynchronous];
    else
        [request startSynchronous];
    
    NSError *error = [request error];
    if (error) {
        return NO;
    }
    return YES;
}


+ (BOOL) addOperationToQueue : (NSString *) url withData : (NSString *) data withDelegate : (id) delegate withUserInfo : (NSMutableDictionary *) userInfo withOperationPriority : (NSOperationQueuePriority) priority withQueueObject : (NSOperationQueue *) operationQueue
{
    return  [HttpRequestHelper addOperationToQueue:url withData:data withDelegate:delegate withUserInfo:userInfo withOperationPriority:priority withQueueObject:operationQueue withRequestType:API_REQUESTTYPE_POST withContentType:CONTENT_TYPE_JSON];
}


+ (BOOL) addOperationToQueue : (NSString *) url withData : (NSString *) data withDelegate : (id) delegate withUserInfo : (NSMutableDictionary *) userInfo withOperationPriority : (NSOperationQueuePriority) priority withQueueObject : (NSOperationQueue *) operationQueue withRequestType:(NSString *)requestType withContentType:(NSString *)contentType {
    
    
    
    ASIHTTPRequest *request = [HttpRequestHelper prepareRequestObject:url
                                                             withData:data
                                                         withDelegate:delegate
                                                         withUserInfo:userInfo
                                                       andRequestType:requestType
                                                       andContentType:contentType];
    
    if(request == nil)
        return NO;
	
    [request setQueuePriority:priority];
    
    if (!_queue) {
		_queue = [[NSOperationQueue alloc] init];
	}
    
	if (!operationQueue) {
		[_queue addOperation:request];
	} else {
		[operationQueue addOperation:request];
	}
    
	return YES;
}



+ (BOOL) addOperationToQueue : (NSString *) url withData : (NSString *) data withDelegate : (id) delegate {
	return [HttpRequestHelper addOperationToQueue:url withData:data withDelegate:delegate withUserInfo:nil withOperationPriority:NSOperationQueuePriorityNormal withQueueObject:nil];
}




+ (ASIHTTPRequest*)prepareRequestObject : (NSString *) url withData : (NSString *) data withDelegate : (id) delegate withUserInfo : (NSDictionary *) userInfo andRequestType:(NSString*)requestType andContentType:(NSString *) contentType{
    
    if (![Utils isInternetConnectionAvailable]) {
         [Alert show:@"Error" andMessage:MESSAGE_NO_INTERNET_CONNECTION];
        [ALERT hideLoader];
		return nil;
	}
   
    
    
    if (userInfo == nil) //{
		userInfo = [NSMutableDictionary dictionaryWithObject:url forKey:KEY_URL];
    //	} else {
    //
    //        NSMutableDictionary
    //        [userInfo setObject:url forKey:KEY_URL];
    //	}
    
    
	// Set this flag to TRUE to allow the app to run on GPRS
	[ASIHTTPRequest setShouldThrottleBandwidthForWWAN:YES];
	[ASIHTTPRequest setShouldThrottleBandwidthForWWAN:YES];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:url]];
    [request addRequestHeader:@"Content-Type" value:contentType];
    [request addRequestHeader:@"Content-Length" value:[NSString stringWithFormat:@"%lu",(unsigned long)[data length]]];
    [request setDelegate:delegate];
    [request setPersistentConnectionTimeoutSeconds:API_CONNECTION_TIMEOUT];
    [request setTimeOutSeconds:API_CONNECTION_TIMEOUT];
    [request setRequestMethod:requestType];
    [request setUserInfo:userInfo];
    
    if(data != nil )
        [request appendPostData:[data dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

@end

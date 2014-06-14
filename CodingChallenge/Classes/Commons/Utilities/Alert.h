//
//  Alert.h
//  Yuru
//
//   Created by Waheeda on 5/29/13.
//  Copyright (c) 2013 Ali Zohair. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"
#import "Constants.h"

@protocol AlertDelegate <NSObject>

@optional
- (void)alertDelegateDidCancel : (UIAlertView *)alert;
- (void)alertDelegateDidSelectOk : (UIAlertView *)alert;
@end


@interface Alert : NSObject
@property(nonatomic, retain)  MBProgressHUD *loadingView;
@property(nonatomic, retain)  id<AlertDelegate> delegate;

+ (Alert *)sharedInstance;
+ (void)show : (NSString *)title andMessage : (NSString *)message;
+ (void)show : (NSString *)title andMessage : (NSString *)message andOKButton : (NSString *)okButtonTitle;
- (void)showLoader;
- (void)showLoader : (NSString *)message;
- (void)showLoader : (NSString *) message withDescription:(NSString *) description ;
- (void)hideLoader;
- (void) showTextMessageHud:(NSString *) message;
- (void) hideTextMessageHud;
@end

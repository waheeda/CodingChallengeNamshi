//
//  Alert.m
//  Yuru
//
//   Created by Waheeda on 5/29/13.
//  Copyright (c) 2013 Ali Zohair. All rights reserved.
//

#import "Alert.h"
#import "AppDelegate.h"

@implementation Alert

static Alert *_sharedInstance = nil;

+ (Alert *) sharedInstance {
	if (!_sharedInstance) {
		if ([ [Alert class] isEqual:[self class]]) {
			_sharedInstance = [[Alert alloc] init];
		} else {
			_sharedInstance = [[self alloc] init];
		}
	}
	return _sharedInstance;
}

+ (void) show : (NSString *) title andMessage : (NSString *) message {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];

	[alert show];
}

+ (void) show : (NSString *) title andMessage : (NSString *) message andOKButton : (NSString *) okButtonTitle {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:okButtonTitle otherButtonTitles:nil, nil];

	[alert show];
}

- (void) showLoader {
	[self showLoader:MESSAGE_LOADING];
}

- (void) showLoader : (NSString *) message {
	[self showLoader:message withDescription:@""];
}


- (void) showLoader : (NSString *) message withDescription:(NSString *) description {
	if (_loadingView == nil) {
		_loadingView = [[MBProgressHUD alloc] initWithView:[APP_DELEGATE window]];
		[[APP_DELEGATE window] addSubview:_loadingView];
	}
    _loadingView.userInteractionEnabled = YES;
     [_loadingView setMode:MBProgressHUDModeIndeterminate];
	_loadingView.labelText = message;
    _loadingView.detailsLabelText = description;
	[_loadingView show:YES];
}

- (void) hideLoader {
	[_loadingView hide:YES];
}

-(void) showTextMessageHud:(NSString *) message
{
    if (_loadingView == nil) {
		_loadingView = [[MBProgressHUD alloc] initWithView:[APP_DELEGATE window]];
		[[APP_DELEGATE window] addSubview:_loadingView];
	}
    _loadingView.userInteractionEnabled = NO;
    [_loadingView setMode:MBProgressHUDModeText];
    _loadingView.labelText = @"";
    _loadingView.detailsLabelText = message;
	[_loadingView show:YES];
}

-(void) hideTextMessageHud
{
    [_loadingView hide:YES];
}

- (void) alertView : (UIAlertView *) alertView didDismissWithButtonIndex : (NSInteger) buttonIndex {
	if (buttonIndex == 0) {
		if (_delegate && [_delegate respondsToSelector:@selector(alertDelegateDidCancel:) ]) {
			[_delegate alertDelegateDidCancel:alertView];
		}
		return;
	}

	if (_delegate && [_delegate respondsToSelector:@selector(alertDelegateDidSelectOk:)]) {
		[_delegate alertDelegateDidSelectOk:alertView];
	}
}

@end

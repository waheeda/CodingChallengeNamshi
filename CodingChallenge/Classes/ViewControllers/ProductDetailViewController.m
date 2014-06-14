//
//  ProductDetailViewController.m
//  CodingChallenge
//
//  Created by Waheeda on 14/06/2014.
//  Copyright (c) 2014 TenPearls. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "Constants.h"
#import "Alert.h"
#import "Utils.h"

@implementation ProductDetailViewController

-(void) setProduct:(Product *) product
{
    _product = product;
    self.title = _product.productName;
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self loadURLInWebView];
    
}

-(void) loadURLInWebView
{
   if([Utils isInternetConnectionAvailable])
    {
        [ALERT showLoader];
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_product.productPage]]];
        [NOTIFICATION_CENTER removeObserver:self name:NOTIFICATION_INTERNET_CONNECTION_FOUND object:nil];
    }
    else
    {
         [Alert show:@"Error" andMessage:MESSAGE_NO_INTERNET_CONNECTION];
        [NOTIFICATION_CENTER addObserver:self selector:@selector(loadURLInWebView) name:NOTIFICATION_INTERNET_CONNECTION_FOUND object:nil];
    }
}





//********  WEB VIEW DELEGATE

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    NSURL *url = request.URL;
    NSString *queryString = url.query;
    
    if ([[url absoluteString] isEqualToString:_product.productPage]) {
            [Alert show:@"" andMessage:queryString];
        
    }

    
    
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [ALERT hideLoader];
}


@end

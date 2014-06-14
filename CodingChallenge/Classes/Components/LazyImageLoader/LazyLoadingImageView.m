//
//  LazyLoadingImageView.m
//  FBHelper
//
//  Created by Ali Zohair on 3/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LazyLoadingImageView.h"

@implementation LazyLoadingImageView
@synthesize myPhotoDelegate;


-(id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        
    }
    return self;
}


- (id) initWithData:(NSData *)imageData {

    self = [self init];
    
    if (self) {
        [self setImage:[UIImage imageWithData:imageData]];
        [self.layer setBorderColor: [[UIColor blackColor] CGColor]];
        [self.layer setBorderWidth: 1.0];

    }
    
    return self;
}

- (id) initWithURL: (NSURL *) url :(NSString *)placeHolderImageName center:(CGPoint)center loadColor:(UIColor*)color{

    self = [self init];
    Center=center;
    
    if (self) {
        [self loadWithURL:url LoaderColor:color];
    }
    
    return self;
}



- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {

    [receivedData setLength:0];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {

    [receivedData appendData:data];
}

- (void) loadWithData:(NSData *)imageData {
   
    [self setImage:[UIImage imageWithData:imageData]];
    [self.layer setBorderColor: [[UIColor blackColor] CGColor]];
    [self.layer setBorderWidth: 1.0];
}

- (void) loadWithURL:(NSURL *)url LoaderColor:(UIColor*)color {

    self.image = nil;
    if (indicator==nil) 
        indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [indicator setColor:color];
    
    indicator.center = CGPointMake(self.frame.size.height/2, self.frame.size.width/2);
    [indicator startAnimating];
    
    [self addSubview:indicator];
    
    if ([url path].length != 0) {
        receivedData = [[NSMutableData alloc] init];
        NSURLConnection *connection = [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:url]delegate:self];
       [connection start];
    }

}

- (void) loadWithURL:(NSURL *)url :(NSString *)placeHolderImageName {
    
    
    [self setImage:[UIImage imageNamed:placeHolderImageName]];
    if ([url path].length != 0) {
        receivedData = [[NSMutableData alloc] init];
        NSURLConnection *connection = [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:url]delegate:self];
        [connection start];
    }
    
    
}



- (void) loadWithURL:(NSURL *)url image:(UIImage *)placeHolderImage {
    
    
    [self setImage:placeHolderImage];
    if ([url path].length != 0) {
        receivedData = [[NSMutableData alloc] init];
        NSURLConnection *connection = [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:url]delegate:self];
        [connection start];
    }
    
    
}

- (UIImage *) getImage {
    
    return self.image;
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection {

    self.image = nil;
    self.image = [[UIImage alloc] initWithData:receivedData];
    [indicator stopAnimating];
    [indicator setHidden:YES ];
    [self setContentMode:UIViewContentModeScaleAspectFill];
    [self setClipsToBounds:YES];
//    if(self.image.size.height> self.image.size.width){
//
//    }
//    else{
//       [self setContentMode:UIViewContentModeScaleAspectFit]; 
//    }

    NSString *test=[NSString stringWithFormat:@"%@",connection.originalRequest];
    NSArray *testarray=[test componentsSeparatedByString:@"&"];
    if(testarray.count>1){
        NSString *url=[[testarray objectAtIndex:1] substringWithRange:NSMakeRange(2, [[testarray objectAtIndex:1] length]-2)]; 
    
        [myPhotoDelegate updateMyPhoto:url  image:self.image];
    }
    [UIView beginAnimations:@"fadeIn" context:NULL];
    [UIView setAnimationDuration:0.5];
    self.alpha = 1.0;
    [UIView commitAnimations];
}

@end

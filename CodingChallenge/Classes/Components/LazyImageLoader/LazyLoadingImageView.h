//
//  LazyLoadingImageView.h
//  FBHelper
//
//  Created by Ali Zohair on 3/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@protocol MyPhotoDelegate <NSObject>

-(void) updateMyPhoto:(NSString *)url image:(UIImage*)image;

@end

@interface LazyLoadingImageView : UIImageView {
    
    NSMutableData *receivedData;
    id<MyPhotoDelegate> myPhotoDelegate;
    UIActivityIndicatorView *indicator;
    CGPoint Center;
    
}

@property (nonatomic,retain) id<MyPhotoDelegate> myPhotoDelegate;

- (id) initWithData : (NSData *) imageData;
- (id) initWithURL: (NSURL *) url :(NSString *)placeHolderImageName center:(CGPoint)center loadColor:(UIColor*)color;
- (void) loadWithURL : (NSURL *) url : (NSString*) placeHolderImageName;
- (void) loadWithURL:(NSURL *)url image:(UIImage *)placeHolderImage;
- (void) loadWithData : (NSData *) imageData;
- (void) loadWithURL:(NSURL *)url LoaderColor:(UIColor*)color;
- (UIImage *) getImage;

@end

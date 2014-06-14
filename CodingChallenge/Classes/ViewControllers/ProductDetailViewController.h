//
//  ProductDetailViewController.h
//  CodingChallenge
//
//  Created by Waheeda on 14/06/2014.
//  Copyright (c) 2014 TenPearls. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface ProductDetailViewController : UIViewController<UIWebViewDelegate>
{
    Product *_product;
}
@property(weak, nonatomic) IBOutlet UIWebView *webView;

-(void) setProduct:(Product *) product;

@end

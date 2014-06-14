//
//  ProductCellView.h
//  CodingChallenge
//
//  Created by Waheeda on 6/9/14.
//  Copyright (c) 2014 TenPearls. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LazyLoadingImageView.h"
#import "Constants.h"
#import "Product.h"

@interface ProductCellView : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *labelProductName;
@property (weak, nonatomic) IBOutlet UILabel *labelPrice ;
@property (weak, nonatomic) IBOutlet UILabel *labelBrandName;


-(void) setProductDetail:(Product *) product;
-(void) setImageURL:(NSString*) url;

@end

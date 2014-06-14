//
//  ProductCellView.m
//  CodingChallenge
//
//  Created by Waheeda on 6/9/14.
//  Copyright (c) 2014 TenPearls. All rights reserved.
//

#import "ProductCellView.h"
#import "UIImageView+WebCache.h"

@implementation ProductCellView

@synthesize imageView = _imageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"ProductCellView" owner:nil options:nil];
        
        for (id currentObject in nibs) {
            if ([currentObject isKindOfClass:[UITableViewCell class]]) {
                self = (ProductCellView *)currentObject;
                break;
            }
        }
    }
    return self;
}


-(void) setProductDetail:(Product *) product
{
    self.labelProductName.text = product.productName;
    self.labelBrandName.text = product.brandName;
    self.labelPrice.text = [NSString stringWithFormat:@"%@ %@", product.price, CURRENCY];
}

-(void) setImageURL:(NSString*) url
{
    [self.imageView setImageWithURL:[NSURL URLWithString:url]
                   placeholderImage:[UIImage imageNamed:IMG_PRODUCT_PLACEHOLDER]];
}

@end

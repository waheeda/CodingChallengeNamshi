//
//  ProductsViewController.h
//  CodingChallenge
//
//  Created by Waheeda on 14/06/2014.
//  Copyright (c) 2014 TenPearls. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"
#import "Utils.h"
#import "Constants.h"
#import "Alert.h"
#import "ProductCellView.h"
#import "Product.h"
#import "ProductDetailViewController.h"
#import "StringHelper.h"

@interface ProductsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate>
{
    NSMutableArray *_products;
    NSMutableArray *_filteredSearchArray;
}
@property(nonatomic, weak) IBOutlet UITableView *tableView;
@property(nonatomic, strong) UISearchBar *searchBar;
@property(nonatomic, strong) UISearchDisplayController *productSearchDisplayController;
@property(strong, nonatomic) ProductDetailViewController *productDetailViewController;

@end

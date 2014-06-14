//
//  ProductsViewController.m
//  CodingChallenge
//
//  Created by Waheeda on 14/06/2014.
//  Copyright (c) 2014 TenPearls. All rights reserved.
//

#import "ProductsViewController.h"
#import "ASIHTTPRequest.h"
#import "JsonHelper.h"

@implementation ProductsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _filteredSearchArray = [[NSMutableArray alloc] init];
    [self createSearchBarAndSearchDisplayController];
    [self getProductsData];
    self.title = TITLE_PRODUCTS;
}


//---GET PRODUCTS FROM CACHE OR API ---

-(void) getProductsData
{
    _products = [[DataModel getAllProducts] mutableCopy];
    if(![_products count])
    {
        [self getDataFromServer];
    }
    else
    {
        [_tableView reloadData];
    }
}

-(void) getDataFromServer
{
    if([DataModel loadProductsFromAPI:self])
    {
        [ALERT showLoader:MESSAGE_LOADING_PRODUCTS];
        [NOTIFICATION_CENTER removeObserver:self name:NOTIFICATION_INTERNET_CONNECTION_FOUND object:nil];
    }
    else
    {
        [NOTIFICATION_CENTER addObserver:self selector:@selector(getDataFromServer) name:NOTIFICATION_INTERNET_CONNECTION_FOUND object:nil];
    }
}
         
         
- (void)requestFinished:(ASIHTTPRequest *)request{
    
    NSDictionary *dictionary = [JsonHelper objectWithString:request.responseString];
    [DataModel saveProductsIntoCoreData:[dictionary objectForKey:KEY_PRODUCTS]];
     _products =  [[DataModel getAllProducts] mutableCopy];
    [_tableView reloadData];
    [ALERT hideLoader];
}

- (void)requestFailed:(ASIHTTPRequest *)request {
 
      [ALERT hideLoader];
}
//---------



//---  TABLE VIEW METHODS

-(Product *) getProductForCellIndex:(NSInteger) index
{
    Product *product;
    
    if(_productSearchDisplayController.isActive && _searchBar.text.length != 0)
        product = [_filteredSearchArray objectAtIndex:index];
    else
        product = [_products objectAtIndex:index];
    
    
    return product;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(_productSearchDisplayController.isActive)
        return _filteredSearchArray.count;
    
    return [_products count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Product *product = [self getProductForCellIndex:indexPath.row];
    
   static  NSString *cellIdentifier = @"ProductCell";
  
    ProductCellView *cell = (ProductCellView*)[self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil)
    {
        cell = [[ProductCellView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        [cell setImageURL:product.image];
    }
    
    [cell setProductDetail:product];
    
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
      Product *product = [self getProductForCellIndex:indexPath.row];
    [self openProductDetailViewControllerWithProduct:product];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 134;
}



-(void) openProductDetailViewControllerWithProduct:(Product*) Product
{
    if(_productDetailViewController == nil)
        _productDetailViewController = [[ProductDetailViewController alloc] init];
    
    [self.navigationController pushViewController:_productDetailViewController animated:YES];
    [_productDetailViewController setProduct:Product];
}



//--- Search Bar Methods

-(void) createSearchBarAndSearchDisplayController
{
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    _searchBar.delegate = self;
    _searchBar.placeholder = TITLE_SEARCH;
    _searchBar.showsCancelButton = NO;
    _searchBar.barStyle  = UISearchBarStyleDefault;
    [_tableView setTableHeaderView: _searchBar];
    
    _productSearchDisplayController =[[ UISearchDisplayController alloc] initWithSearchBar:_searchBar contentsController:self];
    _productSearchDisplayController.delegate                = self;
    _productSearchDisplayController.searchResultsDataSource = self;
	_productSearchDisplayController.searchResultsDelegate   = self;
}

#pragma mark - UISearchBarDelegate

- (NSArray *) filterContentForSearchText : (NSString *) searchText {
	NSArray *searchTerms      = [searchText componentsSeparatedByString:@" "];
	NSString *predicateFormat = @"(productName contains[cd] %@) OR (brandName contains[cd] %@)";
	NSPredicate *predicate;
    
	if ([searchTerms count] == 1) {
		NSString *term = [searchTerms objectAtIndex:0];
		predicate = [NSPredicate predicateWithFormat:predicateFormat, term, term, term];
	} else {
		NSMutableArray *subPredicates = [NSMutableArray array];
		for (NSString *term in searchTerms) {
			NSPredicate *p = [NSPredicate predicateWithFormat:predicateFormat, term, term, term];
			[subPredicates addObject:p];
		}
		predicate = [NSCompoundPredicate andPredicateWithSubpredicates:subPredicates];
	}
    
    return [Utils getSortedArray:[_products filteredArrayUsingPredicate:predicate] withKey:@"productName" ascending:YES];
}


- (void) searchBar : (UISearchBar *) searchBar textDidChange : (NSString *) searchText {
	
    [_filteredSearchArray removeAllObjects];
    
    if (![StringHelper isEmptyOrNull:searchText]) {
        
		searchText    = [StringHelper stringByTrimmingWhiteSpaces:searchText];
		[_filteredSearchArray addObjectsFromArray:[self filterContentForSearchText:searchText]];
		[_productSearchDisplayController.searchResultsTableView reloadData];
	}
}
- (void) searchBarSearchButtonClicked : (UISearchBar *) searchBar {
	[searchBar resignFirstResponder];
}


-(void) searchDisplayController:(UISearchDisplayController *)controller willShowSearchResultsTableView:(UITableView *)tableView
{
    tableView.backgroundColor  = [UIColor whiteColor];
}

- (void) searchDisplayControllerDidEndSearch : (UISearchDisplayController *) controller {
    [self.tableView reloadData];
}





@end

//
//  ViewController.m
//  1.2.1
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import "Product.h"
#import "ProductCell.h"
#import "catalog.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, CartDelegate>{
    NSMutableArray* cartItems;
}
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation ViewController
// catalog Delegate : addItem
-(void)addItem:(id)sender{
    // product identifier for index
    NSIndexPath* indexPath = [self.table indexPathForCell:sender];
    Product* product = [[catalog defaultCatalog] productAt:indexPath.row];
    
    [cartItems addObject:product];
    NSIndexSet* indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

// section 0 : catalog, section : cart
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(0 == section){
        return [[catalog defaultCatalog] numberOfProduct];
    }else{
        return  cartItems.count;
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(0 == indexPath.section){
        ProductCell* cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL" forIndexPath:indexPath];
        //viewController conduct cell's delegate
        cell.delegate = self;
        Product* product = [[catalog defaultCatalog] productAt:indexPath.row];
        [cell setProductInfo:product];
        return cell;
    }
    else{
        // second section for cart
        ProductCell* cell = [tableView dequeueReusableCellWithIdentifier:@"CART_CELL" forIndexPath:indexPath];
        cell.delegate = self;
        Product* product = cartItems[indexPath.row];
        cell.textLabel.text = product.productName;
        return cell;
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(0 == section){
        return @"Product";
    }else{
        return @"Items in Cart";
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    cartItems = [[NSMutableArray alloc] init];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

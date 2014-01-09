//
//  Product.h
//  1.2.1
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (strong, nonatomic)NSString* productName;
@property (strong, nonatomic)NSString* productPrice;
@property (strong, nonatomic)NSString* imageName;

+(id)productWithName:(NSString*)name price:(NSString*)price image:(NSString*)image;

@end

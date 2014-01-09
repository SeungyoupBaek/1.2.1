//
//  catalog.m
//  1.2.1
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "catalog.h"
#import "Product.h"

@implementation catalog{
    NSArray* data;
}

-(id)productAt:(NSInteger)index{
    return [data objectAtIndex:index];
}
-(NSInteger)numberOfProduct{
    return data.count;
}


static catalog* _instance = nil;
+(id)defaultCatalog{
    if (nil == _instance){
        _instance = [[catalog alloc]init];
    }
    return _instance;
}

-(id)init{
    self = [super init];
    if (self) {
        data = @[[Product productWithName:@"BaseBall" price:@"100" image:@"Baseball.png"],
                 [Product productWithName:@"BasketBall" price:@"200" image:@"Basketball.png"],
                 [Product productWithName:@"FootBall" price:@"250" image:@"Football.png"],
                 [Product productWithName:@"VolleyBall" price:@"300" image:@"Volleyball.png"]];
    }
    return self;
}
@end

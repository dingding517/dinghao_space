//
//  FoodsBL.m
//  外卖送
//
//  Created by 丁昊 on 15/9/19.
//  Copyright © 2015年 dinghao. All rights reserved.
//

#import "FoodsBL.h"

@implementation FoodsBL
-(NSMutableArray*) readDataAll
{
    FoodsDAO *dao = [FoodsDAO sharedManager];
    
    NSMutableArray* list  = [dao findAll];
    
    return list;
}

-(NSMutableArray*) readDataByBigCateringType:(Foods*)BigCateringType {
    FoodsDAO *dao = [FoodsDAO sharedManager];
    
    NSMutableArray* list  = [dao findByBigCateringtype:BigCateringType];
    
    return list;
}

-(NSMutableArray*) readDataByDetailCateringType:(Foods*)DetailCateringType {
    FoodsDAO *dao = [FoodsDAO sharedManager];
    
    NSMutableArray* list  = [dao findByDetailCateringtype:DetailCateringType];
    
    return list;
}
@end

//
//  FoodsBL.h
//  外卖送
//
//  Created by 丁昊 on 15/9/19.
//  Copyright © 2015年 dinghao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FoodsDAO.h"
#import "Foods.h"
@interface FoodsBL : NSObject
-(NSMutableArray*) readDataAll;
-(NSMutableArray*) readDataByBigCateringType:(Foods*)BigCateringType;
-(NSMutableArray*) readDataByDetailCateringType:(Foods*)DetailCateringType;
@end

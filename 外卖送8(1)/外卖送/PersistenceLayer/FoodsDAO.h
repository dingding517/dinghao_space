//
//  FoodsDAO.h
//  外卖送
//
//  Created by 丁昊 on 15/9/19.
//  Copyright © 2015年 dinghao. All rights reserved.
//

#import "BaseDAO.h"
#import "Foods.h"
@interface FoodsDAO : BaseDAO
+ (FoodsDAO*)sharedManager;

//插入Note方法
-(int) create:(Foods*)model;

//删除Note方法
-(int) remove:(Foods*)model;

//修改Note方法
-(int) modify:(Foods*)model;

//查询所有数据方法
-(NSMutableArray*) findAll;

//按照主键查询数据方法
-(Foods*) findById:(Foods*)model;
//按照主餐饮类型查询数据的方法
-(NSMutableArray*) findByBigCateringtype:(Foods*)model;
//按照细节餐饮类型查询数据的方法
-(NSMutableArray*) findByDetailCateringtype:(Foods*)model;
@end

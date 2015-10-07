//
//  FoodsDAO.m
//  外卖送
//
//  Created by 丁昊 on 15/9/19.
//  Copyright © 2015年 dinghao. All rights reserved.
//

#import "FoodsDAO.h"

@implementation FoodsDAO

static FoodsDAO *sharedManager = nil;

+ (FoodsDAO*)sharedManager
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        
        sharedManager = [[super alloc] init];
        
    });
    return sharedManager;
}

//插入Schedule方法
-(int) create:(Foods*)model
{
    if ([self openDB]) {
        
        NSString *sqlStr = @"insert into Foods (FoodName,FoodIcon,ShopBrand,FoodPrice,BigCateringType,DetailCateringType,CateringWebLink,ShopPic) values (?,?,?,?,?,?,?,?);";
        
        sqlite3_stmt *statement;
        //预处理过程
        if (sqlite3_prepare_v2(db, [sqlStr UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            
            //绑定参数开始
            sqlite3_bind_text(statement, 1, [model.FoodName UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 2, [model.FoodIcon UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 3, [model.ShopBrand UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 4, [model.FoodPrice UTF8String],-1,NULL);
            sqlite3_bind_text(statement, 5, [model.BigCateringType UTF8String],-1,NULL);
            sqlite3_bind_text(statement, 6, [model.DetailCateringType UTF8String],-1,NULL);
            sqlite3_bind_text(statement, 7, NULL,-1,NULL);
            sqlite3_bind_text(statement, 8, [model.ShopPic UTF8String],-1,NULL);
            //执行插入
            if (sqlite3_step(statement) != SQLITE_DONE) {
                NSAssert(NO, @"插入数据失败。");
            }
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    
    return 0;
}

//删除Schedule方法
-(int) remove:(Foods*)model
{
    if ([self openDB]) {
        
        NSString *sqlStr = @"DELETE from Foods where FoodID =?";
        
        sqlite3_stmt *statement;
        //预处理过程
        if (sqlite3_prepare_v2(db, [sqlStr UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            
            //绑定参数开始
            sqlite3_bind_int(statement, 1, (int)model.FoodID);
            //执行
            if (sqlite3_step(statement) != SQLITE_DONE) {
                NSAssert(NO, @"删除数据失败。");
            }
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    
    return 0;
}

//修改Schedule方法
-(int) modify:(Foods*)model
{
    
    if ([self openDB]) {
        
        NSString *sqlStr = @"UPDATE Foods set FoodName=?,FoodIcon=?, ShopBrand=?,FoodPrice =? BigCateringType=?,DetailCateringType=?,CateringWebLink=?,ShopPic=? where FoodID=?";
        
        sqlite3_stmt *statement;
        //预处理过程
        if (sqlite3_prepare_v2(db, [sqlStr UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            
            //绑定参数开始
            sqlite3_bind_text(statement, 1, [model.FoodName UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 2, [model.FoodIcon UTF8String],-1,NULL);
            sqlite3_bind_text(statement, 3, [model.ShopBrand UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 4, [model.FoodPrice UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 5, [model.BigCateringType UTF8String],-1,NULL);
            sqlite3_bind_text(statement, 6, [model.DetailCateringType UTF8String],-1,NULL);
            sqlite3_bind_text(statement, 7, NULL,-1,NULL);
            sqlite3_bind_text(statement, 8, [model.ShopPic UTF8String],-1,NULL);
            sqlite3_bind_int(statement, 9, (int)model.FoodID);
            //执行
            if (sqlite3_step(statement) != SQLITE_DONE) {
                NSAssert(NO, @"修改数据失败。");
            }
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    return 0;
}

//查询所有数据方法
-(NSMutableArray*) findAll
{
    NSMutableArray *listData = [[NSMutableArray alloc] init];
    
    if ([self openDB]) {
        
        NSString *qsql = @"SELECT FoodName, FoodIcon,ShopBrand,FoodPrice,BigCateringType,DetailCateringType,CateringWebLink,ShopPic,FoodID FROM Foods";
        
        sqlite3_stmt *statement;
        //预处理过程
        if (sqlite3_prepare_v2(db, [qsql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            
            //执行
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                Foods* food = [[Foods alloc]init];
                
                char *cFoodName = (char *) sqlite3_column_text(statement, 0);
                food.FoodName = [[NSString alloc] initWithUTF8String: cFoodName];
                
                char *cFoodIcon = (char *) sqlite3_column_text(statement, 1);
                food.FoodIcon = [[NSString alloc] initWithUTF8String: cFoodIcon];
                
                char *cShopBrand = (char *) sqlite3_column_text(statement, 2);
                food.ShopBrand = [[NSString alloc] initWithUTF8String: cShopBrand];
                
                char *cFoodPrice = (char *) sqlite3_column_text(statement, 3);
                food.FoodPrice = [[NSString alloc] initWithUTF8String: cFoodPrice];
                char *cBigCateringType = (char *) sqlite3_column_text(statement, 4);
                food.BigCateringType = [[NSString alloc] initWithUTF8String: cBigCateringType];
                char *cDetailCateringType = (char *) sqlite3_column_text(statement, 5);
                food.DetailCateringType = [[NSString alloc] initWithUTF8String: cDetailCateringType];
               //food.CateringWebLink = nil;
                char *cShopPic = (char *) sqlite3_column_text(statement, 7);
                food.ShopPic = [[NSString alloc] initWithUTF8String: cShopPic];
                
                food.FoodID = sqlite3_column_int(statement, 8);
                
                [listData addObject:food];
            }
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    
    return listData;
}

//按照主键查询数据方法
-(Foods*) findById:(Foods*)model
{
    
    if ([self openDB]) {
        
        NSString *qsql = @"SELECT FoodName, FoodIcon,ShopBrand,FoodPrice,BigCateringType,DetailCateringType,CateringWebLink,ShopPic,FoodID FROM Foods where FoodID=?";
        
        sqlite3_stmt *statement;
        //预处理过程
        if (sqlite3_prepare_v2(db, [qsql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            
            //绑定参数开始
            sqlite3_bind_int(statement, 1, (int)model.FoodID);
            
            //执行
            if (sqlite3_step(statement) == SQLITE_ROW) {
                
                Foods* food = [[Foods alloc] init];
                
                char *cFoodName = (char *) sqlite3_column_text(statement, 0);
                food.FoodName = [[NSString alloc] initWithUTF8String: cFoodName];
                
                char *cFoodIcon = (char *) sqlite3_column_text(statement, 1);
                food.FoodIcon = [[NSString alloc] initWithUTF8String: cFoodIcon];
                
                char *cShopBrand = (char *) sqlite3_column_text(statement, 2);
                food.ShopBrand = [[NSString alloc] initWithUTF8String: cShopBrand];
                
                char *cFoodPrice = (char *) sqlite3_column_text(statement, 3);
                food.FoodPrice = [[NSString alloc] initWithUTF8String: cFoodPrice];
                char *cBigCateringType = (char *) sqlite3_column_text(statement, 4);
                food.BigCateringType = [[NSString alloc] initWithUTF8String: cBigCateringType];
                char *cDetailCateringType = (char *) sqlite3_column_text(statement, 5);
                food.DetailCateringType = [[NSString alloc] initWithUTF8String: cDetailCateringType];
//                char *cCateringWebLink = (char *) sqlite3_column_text(statement, 6);
//                food.CateringWebLink = [[NSString alloc] initWithUTF8String: cCateringWebLink];
                food.CateringWebLink = nil;
                
                char *cShopPic = (char *) sqlite3_column_text(statement, 7);
                food.ShopPic = [[NSString alloc] initWithUTF8String: cShopPic];
                food.FoodID = sqlite3_column_int(statement, 8);
                
                sqlite3_finalize(statement);
                sqlite3_close(db);
                
                return food;
            }
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(db);
        
    }
    return nil;
}


//按照主餐饮类型查询数据的方法
-(NSMutableArray*) findByBigCateringtype:(Foods*)model
{
     NSMutableArray *listData = [[NSMutableArray alloc] init];
    if ([self openDB]) {
        
        NSString *qsql = @"SELECT FoodID,FoodName, FoodIcon,ShopBrand,FoodPrice,DetailCateringType,CateringWebLink,BigCateringType,ShopPic FROM Foods where BigCateringType=?";
        
        sqlite3_stmt *statement;
        //预处理过程
        if (sqlite3_prepare_v2(db, [qsql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            
            //绑定参数开始
            sqlite3_bind_int(statement, 1, (int)model.FoodID);
            
            //执行
            if (sqlite3_step(statement) == SQLITE_ROW) {
                
                Foods* food = [[Foods alloc] init];
                
                food.FoodID = sqlite3_column_int(statement, 0);
                char *cFoodName = (char *) sqlite3_column_text(statement, 1);
                food.FoodName = [[NSString alloc] initWithUTF8String: cFoodName];
                
                char *cFoodIcon = (char *) sqlite3_column_text(statement, 2);
                food.FoodIcon = [[NSString alloc] initWithUTF8String: cFoodIcon];
                
                char *cShopBrand = (char *) sqlite3_column_text(statement, 3);
                food.ShopBrand = [[NSString alloc] initWithUTF8String: cShopBrand];
                
                char *cFoodPrice = (char *) sqlite3_column_text(statement, 4);
                food.FoodPrice = [[NSString alloc] initWithUTF8String: cFoodPrice];
                
                char *cDetailCateringType = (char *) sqlite3_column_text(statement, 5);
                food.DetailCateringType = [[NSString alloc] initWithUTF8String: cDetailCateringType];
//                char *cCateringWebLink = (char *) sqlite3_column_text(statement, 6);
//                food.CateringWebLink = [[NSString alloc] initWithUTF8String: cCateringWebLink];
                food.CateringWebLink = nil;
                
                char *cBigCateringType = (char *) sqlite3_column_text(statement, 7);
                food.BigCateringType = [[NSString alloc] initWithUTF8String: cBigCateringType];
                char *cShopPic = (char *) sqlite3_column_text(statement, 8);
                food.BigCateringType = [[NSString alloc] initWithUTF8String: cShopPic];
                
                [listData addObject:food];
            }
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(db);
        
    }
    return listData;
}



//按照细节餐饮类型查询数据的方法
-(NSMutableArray*) findByDetailCateringtype:(Foods*)model
{
    NSMutableArray *listData = [[NSMutableArray alloc] init];
    if ([self openDB]) {
        
        NSString *qsql = @"SELECT FoodID,FoodName, FoodIcon,ShopBrand,FoodPrice,BigCateringType,CateringWebLink,DetailCateringType,ShopPic FROM Foods where DetailCateringType=?";
        
        sqlite3_stmt *statement;
        //预处理过程
        if (sqlite3_prepare_v2(db, [qsql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            
            //绑定参数开始
            sqlite3_bind_text(statement, 1, [model.DetailCateringType UTF8String],-1,NULL);
            
            //执行
            if (sqlite3_step(statement) == SQLITE_ROW) {
                
                Foods* food = [[Foods alloc] init];
                
                food.FoodID = sqlite3_column_int(statement, 0);
                
                char *cFoodName = (char *) sqlite3_column_text(statement, 1);
                food.FoodName = [[NSString alloc] initWithUTF8String: cFoodName];
                
                char *cFoodIcon = (char *) sqlite3_column_text(statement, 2);
                food.FoodIcon = [[NSString alloc] initWithUTF8String: cFoodIcon];
                
                char *cShopBrand = (char *) sqlite3_column_text(statement, 3);
                food.ShopBrand = [[NSString alloc] initWithUTF8String: cShopBrand];
                
                char *cFoodPrice = (char *) sqlite3_column_text(statement, 4);
                food.FoodPrice = [[NSString alloc] initWithUTF8String: cFoodPrice];
                char *cBigCateringType = (char *) sqlite3_column_text(statement, 5);
                food.BigCateringType = [[NSString alloc] initWithUTF8String: cBigCateringType];
                
//                char *cCateringWebLink = (char *) sqlite3_column_text(statement, 6);
//                food.CateringWebLink = [[NSString alloc] initWithUTF8String: cCateringWebLink];
                food.CateringWebLink = nil;
                
                char *cDetailCateringType = (char *) sqlite3_column_text(statement, 7);
                food.DetailCateringType = [[NSString alloc] initWithUTF8String: cDetailCateringType];
                char *cShopPic = (char *) sqlite3_column_text(statement, 8);
                food.ShopPic = [[NSString alloc] initWithUTF8String: cShopPic];
                [listData addObject:food];
                
            }
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(db);
        
    }
    return listData;
}

@end

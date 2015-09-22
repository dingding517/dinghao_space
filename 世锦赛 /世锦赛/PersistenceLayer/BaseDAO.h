//
//  BaseDAO.h
//  PersistenceLayer
//
//  Created by Jerry Ding on 15-09-21.
//
//  QQ：403488671 邮箱：haoding517@126.com
//

#import "sqlite3.h"
#import "DBHelper.h"

@interface BaseDAO : NSObject
{
    sqlite3 *db;
}

//数据文件全路径
@property(nonatomic, strong) NSString* dbFilePath;


//打开SQLite数据库 true 打开成功 false 打开失败
-(BOOL)openDB;


@end

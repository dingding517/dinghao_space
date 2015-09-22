//
//  DBHelper.h
//  PersistenceLayer
//
//  Created by Jerry Ding on 15-09-21.
//
//  QQ：403488671 邮箱：haoding517@126.com//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

static sqlite3 *db;

@interface DBHelper : NSObject

//获得沙箱Document目录下全路径
+ (NSString *)applicationDocumentsDirectoryFile :(NSString *)fileName;

//初始化并加载数据
+(void) initDB;

//从数据库获得当前数据库版本号
+(int) dbVersionNubmer;

@end

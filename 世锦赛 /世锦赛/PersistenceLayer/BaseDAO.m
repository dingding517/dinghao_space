//
//  BaseDAO.m
//  PersistenceLayer
//
//  Created by Jerry Ding on 15-09-21.
//
//  QQ：403488671 邮箱：haoding517@126.com
//

#import "BaseDAO.h"

@implementation BaseDAO

- (id)init
{
    self = [super init];
    if (self)
    {
        
        self.dbFilePath = [DBHelper applicationDocumentsDirectoryFile:DB_FILE_NAME];
        //初始化数据库
        [DBHelper initDB];        
    }
    
    return self;
}

-(BOOL)openDB
{
    NSLog(@"DbFilePath = %@", self.dbFilePath);
    
    if (sqlite3_open([self.dbFilePath UTF8String], &db) != SQLITE_OK) {
		sqlite3_close(db);
		NSLog(@"数据库打开失败。");
        return false;
	}
    return true;
}

@end

//
//  BaseDAO.m
//  PersistenceLayer
//
//  Created by 关东升 on 2015-3-18.
//  本书网站：http://www.51work6.com
//  智捷iOS课堂在线课堂：http://v.51work6.com
//  智捷iOS课堂新浪微博：http://weibo.com/u/3215753973
//  作者微博：http://weibo.com/516inc
//  QQ：1575716557 邮箱：jylong06@163.com
//  QQ交流群：239148636/274580109
//  
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

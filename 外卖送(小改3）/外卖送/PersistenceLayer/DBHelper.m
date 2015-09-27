//
//  DBHelper.m
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

#import "DBHelper.h"

@implementation DBHelper


+(NSString *)applicationDocumentsDirectoryFile:(NSString *)fileName {
    
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [documentDirectory stringByAppendingPathComponent:fileName];
    
    return path;
}


//初始化并加载数据
+(void) initDB
{

        NSString* dbFilePath = [DBHelper applicationDocumentsDirectoryFile:DB_FILE_NAME];
        
        if (sqlite3_open([dbFilePath UTF8String], &db) != SQLITE_OK) {
            sqlite3_close(db);
            NSAssert(NO,@"数据库打开失败。");
        } else {
            //加载数据到业务表中
            NSLog(@"数据库数据重新载入...");
            char *err;
            
            NSString * createtablePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"createNew" ofType:@"sql"];
            
            NSString* sql = [[NSString alloc]  initWithContentsOfFile:createtablePath encoding:NSUTF8StringEncoding error:nil];
            
            if (sqlite3_exec(db,[sql UTF8String],NULL,NULL,&err) != SQLITE_OK) {
                NSLog(@"数据库数据重新载入失败原因 : %@",[NSMutableString stringWithCString:err encoding: NSUTF8StringEncoding]);
            }
            
            //把当前版本号写回到文件中
            
            sqlite3_close(db);
        }
    
}


@end

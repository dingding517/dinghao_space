//
//  ScheduleDAO.h
//  PersistenceLayer
//
//  Created by Jerry Ding on 15-09-21.
//
//  QQ：403488671 邮箱：haoding517@126.com
//

#import "BaseDAO.h"
#import "Schedule.h"
#import "Events.h"
#import "ScheduleDAO.h"

//比赛日程表 数据访问对象类
@interface ScheduleDAO : BaseDAO

+ (ScheduleDAO*)sharedManager;

//插入Note方法
-(int) create:(Schedule*)model;

//删除Note方法
-(int) remove:(Schedule*)model;

//修改Note方法
-(int) modify:(Schedule*)model;

//查询所有数据方法
-(NSMutableArray*) findAll;

//按照主键查询数据方法
-(Schedule*) findById:(Schedule*)model;

@end

//
//  ScheduleBL.m
//  BusinessLogicLayer
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

#import "ScheduleBL.h"

@implementation ScheduleBL

//查询所用数据方法
-(NSMutableDictionary*) readData
{
    ScheduleDAO *scheduleDAO = [ScheduleDAO sharedManager];
    
    NSMutableArray* schedules  = [scheduleDAO findAll];
    NSMutableDictionary *resDict = [[NSMutableDictionary alloc] init];
    
    EventsDAO *eventsDAO = [EventsDAO sharedManager];
    
    //延迟加载Events数据
    for (Schedule *schedule in schedules) {
        Events *event = [eventsDAO findById:schedule.Event];
        schedule.Event = event;
        
        NSArray  *allkey = [resDict allKeys];
        
        //把NSMutableArray结构转化为NSMutableDictionary结构
        if([allkey containsObject:schedule.GameDate]) {
            NSMutableArray* value = [resDict objectForKey:schedule.GameDate];
             [value addObject:schedule];
        } else {
            
            NSMutableArray* value = [[NSMutableArray alloc] init];
            [value addObject:schedule];
            [resDict setObject:value forKey:schedule.GameDate];
        }
        
    }
    
    return resDict;
}


@end

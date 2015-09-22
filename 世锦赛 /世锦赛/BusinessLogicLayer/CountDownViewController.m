//
//  CountDownViewController.m
//  世锦赛
//
//  Created by Jerry Ding on 15-09-21.
//
//  QQ：403488671 邮箱：haoding517@126.com
//
//

#import "CountDownViewController.h"

@interface CountDownViewController ()

//显示倒计时
@property (weak, nonatomic) IBOutlet UILabel *lblCountDown;

@end

@implementation CountDownViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	 
    //创建NSDateComponents对象
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    //设置NSDateComponents日期
    [comps setDay:5];
    //设置NSDateComponents月
    [comps setMonth:8];
    //设置NSDateComponents年
    [comps setYear:2016];
    //创建日历对象
    NSCalendar *calender = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //获得2016-8-5日的NSDate日期对象
    NSDate *destinationDate = [calender dateFromComponents:comps];
    //获得当前日期到2016-8-5时间的NSDateComponents对象
    NSDateComponents *components = [calender components:NSCalendarUnitDay
                                               fromDate:[NSDate date] toDate:destinationDate options:0];
    //获得当前日期到2016-8-5相差的天数
    NSInteger days = [components day];
    
    NSString* strLabel = [NSString stringWithFormat:@"%li天", days];
    
    self.lblCountDown.text = strLabel;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  EventsDetailViewController_iPad.m
//  PresentationLayer
//
//  世锦赛
//
//  Created by Jerry Ding on 15-09-21.
//
//  QQ：403488671 邮箱：haoding517@126.com
//
//

#import "EventsDetailViewController.h"

@interface EventsDetailViewController ()

@end

@implementation EventsDetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.imgEventIcon.image = [UIImage imageNamed:self.event.EventIcon];
    
    self.lblEventName.text = self.event.EventName;
    self.txtViewBasicsInfo.text = self.event.BasicsInfo;
    self.txtViewKeyInfo.text = self.event.KeyInfo;
    self.txtViewOlympicInfo.text = self.event.OlympicInfo;
    
    self.scrollView.frame = self.view.frame;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end

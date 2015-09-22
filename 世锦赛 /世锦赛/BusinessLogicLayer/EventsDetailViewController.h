//
//  EventsDetailViewController.h
//  PresentationLayer
//
//  世锦赛
//
//  Created by Jerry Ding on 15-09-21.
//
//  QQ：403488671 邮箱：haoding517@126.com
//

#import <UIKit/UIKit.h>
#import "Events.h"

@interface EventsDetailViewController : UIViewController

@property(nonatomic,strong) Events *event;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UILabel *lblEventName;
@property (weak, nonatomic) IBOutlet UIImageView *imgEventIcon;
@property (weak, nonatomic) IBOutlet UITextView *txtViewKeyInfo;
@property (weak, nonatomic) IBOutlet UITextView *txtViewBasicsInfo;
@property (weak, nonatomic) IBOutlet UITextView *txtViewOlympicInfo;


@end

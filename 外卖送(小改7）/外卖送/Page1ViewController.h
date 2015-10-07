//
//  Page1ViewController.h
//  外卖送
//
//  Created by 丁昊 on 15/10/3.
//  Copyright © 2015年 dinghao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Page1ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *page1TableView;

@end

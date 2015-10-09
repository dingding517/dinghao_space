//
//  FirstPageViewController.h
//  外卖送
//
//  Created by 丁昊 on 15/9/20.
//  Copyright © 2015年 dinghao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstPageViewController : UITableViewController 

-(void)perss;
- (IBAction)clickBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *scrollViewTap;

- (IBAction)scrollViewTap:(id)sender;

@end

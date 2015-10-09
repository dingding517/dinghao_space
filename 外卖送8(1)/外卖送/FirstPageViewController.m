//
//  FirstPageViewController.m
//  外卖送
//
//  Created by 丁昊 on 15/9/20.
//  Copyright © 2015年 dinghao. All rights reserved.
//

#import "FirstPageViewController.h"
#import "FoodsBL.h"
#import "Page1ViewController.h"
#import "Page11ViewController.h"
#import "Advertise1ViewController.h"
#import "Advertise2ViewController.h"
#import "Advertise3ViewController.h"
#import "ZhenCanTableViewController.h"
@interface FirstPageViewController () <UIScrollViewDelegate>
@property (strong,nonatomic)UIView* page1;
@property (strong,nonatomic)UIView* page2;
@property (strong,nonatomic)UIView* page3;
@property (strong,nonatomic)UIView* page11;
@property (strong,nonatomic)UIView* page22;
@property (strong,nonatomic)UIView* page33;

@property (strong,nonatomic)Page1ViewController* page1ViewController;
@property (strong,nonatomic)Page11ViewController* page11ViewController;
@property (strong,nonatomic)Page11ViewController* page22ViewController;
@property (strong,nonatomic)Page11ViewController* page33ViewController;

@property (strong,nonatomic)Advertise1ViewController* advertise1;
@property (strong,nonatomic)Advertise2ViewController* advertise2;
@property (strong,nonatomic)Advertise3ViewController* advertise3;
@property (assign,nonatomic)NSInteger whichPage;

@property (strong,nonatomic)ZhenCanTableViewController* zhenCan;

@property (strong,nonatomic)NSMutableArray* listData;

@property (weak, nonatomic) IBOutlet UIView *zxView;
@property (weak, nonatomic) IBOutlet UIScrollView *zxScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *zxPageControl;
@property (weak, nonatomic) IBOutlet UIScrollView *zxScrollView2;
@property (weak, nonatomic) IBOutlet UIPageControl *zxPageControl2;

-(void)scrollTimer;
- (void)pressZhenCan;
@end

@implementation FirstPageViewController
double scrowWidth;
int timeCount = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.listData = [[[FoodsBL alloc]init] readDataAll];
    NSLog(@"self.listData:%@",self.listData);
    
//编辑第一个scrollView框架、幅度范围等属性。
    self.zxScrollView.bounces = NO;
    self.zxScrollView.delegate = self;
    self.zxScrollView.frame = self.view.frame;
    self.zxScrollView.contentSize = CGSizeMake(self.view.frame.size.width*3, self.tableView.frame.size.height/2);
//编辑第二个scrollView框架、幅度范围等属性。
    self.zxScrollView2.bounces = YES;
    self.zxScrollView2.delegate = self;
    self.zxScrollView2.frame = self.view.frame;
    self.zxScrollView2.contentSize = CGSizeMake(self.view.frame.size.width*3, self.view.frame.size.height/2);
    self.zxPageControl2.currentPageIndicatorTintColor = [UIColor blueColor];
    self.zxPageControl2.pageIndicatorTintColor = [UIColor grayColor];
    
    UIStoryboard* mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CGSize iOSDeviceScreenSize = [UIScreen mainScreen].bounds.size;
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
        if (iOSDeviceScreenSize.height > iOSDeviceScreenSize.width) {
            if (iOSDeviceScreenSize.height == 568 ) {
                scrowWidth = 320.0f;
            }else if (iOSDeviceScreenSize.height == 480) {
                scrowWidth = 320.0f;
            }else if (iOSDeviceScreenSize.height == 667) {
                scrowWidth = 375.0f;
            }else if (iOSDeviceScreenSize.height == 736) {
                scrowWidth = 414.0f;
            }else {
                ;
            }
        }
        if (iOSDeviceScreenSize.height < iOSDeviceScreenSize.width) {
            if (iOSDeviceScreenSize.width == 568 ) {
                scrowWidth = 320.0f;
            }else if (iOSDeviceScreenSize.width == 480) {
                scrowWidth = 320.0f;
            }else if (iOSDeviceScreenSize.width == 667) {
                scrowWidth = 375.0f;
            }else if (iOSDeviceScreenSize.width == 736) {
                scrowWidth = 414.0f;
            }else {
                ;
            }
        }
    }
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        if (iOSDeviceScreenSize.height > iOSDeviceScreenSize.width) {
            if (iOSDeviceScreenSize.height == 1024 ) {
                scrowWidth = 768.0f;
            }
        }
        if (iOSDeviceScreenSize.height < iOSDeviceScreenSize.width) {
            if (iOSDeviceScreenSize.width == 1024 ) {
                scrowWidth = 768.0f;
            }
        }
    }
    //广告控制器（三个）的捕捉
    self.advertise1 = [mainStoryBoard instantiateViewControllerWithIdentifier:@"advertise1"];
    self.advertise2 = [mainStoryBoard instantiateViewControllerWithIdentifier:@"advertise2"];
    self.advertise3 = [mainStoryBoard instantiateViewControllerWithIdentifier:@"advertise3"];
    
    //
    self.zhenCan = [mainStoryBoard instantiateViewControllerWithIdentifier:@"zhenCan"];
    
//编辑第一个scrollView的滑动页面。
    UIViewController* page1ViewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"page1"];
    self.page1 = page1ViewController.view;
    self.page1.frame = CGRectMake(0.0f, 0.0f, scrowWidth, self.zxScrollView.frame.size.height/2);
    
    UIViewController* page2ViewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"page2"];
    self.page2 = page2ViewController.view;
    self.page2.frame = CGRectMake(scrowWidth, 0.0f, scrowWidth, self.zxScrollView.frame.size.height/2);
    
    UIViewController* page3ViewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"page3"];
    self.page3 = page3ViewController.view;
    self.page3.frame = CGRectMake(scrowWidth*2, 0.0f, scrowWidth, self.zxScrollView.frame.size.height/2);
    [self.zxScrollView addSubview:self.page1];
    [self.zxScrollView addSubview:self.page2];
    [self.zxScrollView addSubview:self.page3];
 
//编辑第二个scrollView的滑动页面。
    self.page11ViewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"page11"];
    self.page11 = self.page11ViewController.view;
    self.page11.frame = CGRectMake(0.0f, 0.0f, scrowWidth, self.zxScrollView2.frame.size.height);
    
    UIViewController* page22ViewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"page22"];
    self.page22 = page22ViewController.view;
    self.page22.frame = CGRectMake(scrowWidth, 0.0f, scrowWidth, self.zxScrollView2.frame.size.height);
    
    UIViewController* page33ViewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"page33"];
    self.page33 = page33ViewController.view;
    self.page33.frame = CGRectMake(scrowWidth*2, 0.0f, scrowWidth, self.zxScrollView2.frame.size.height);
    [self.zxScrollView2 addSubview:self.page11];
    [self.zxScrollView2 addSubview:self.page22];
    [self.zxScrollView2 addSubview:self.page33];
    [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(scrollTimer)  userInfo:nil repeats:YES];
    
   
    [self.page11ViewController.zaoCanBtn addTarget:self action:@selector(perss) forControlEvents:UIControlEventTouchUpInside];
    [self.page11ViewController.zhenCanBtn addTarget:self action:@selector(pressZhenCan)  forControlEvents:UIControlEventTouchUpInside];
    
    self.scrollViewTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture)];
    self.scrollViewTap.numberOfTapsRequired = 1;
    self.scrollViewTap.numberOfTouchesRequired = 1;
    [self.zxScrollView addGestureRecognizer:self.scrollViewTap];
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"猜你喜欢";
    }
    return @"";
}

- (void)tapGesture {
    if (self.zxPageControl.currentPage == 0) {
        [self.navigationController pushViewController:self.advertise1 animated:YES];
    }else if (self.zxPageControl.currentPage == 1) {
        [self.navigationController pushViewController:self.advertise2 animated:YES];
    }else if (self.zxPageControl.currentPage == 2) {
        [self.navigationController pushViewController:self.advertise3 animated:YES];
    }else {
        ;
    }
}

- (IBAction)scrollViewTap:(id)sender {
    if (self.zxPageControl.currentPage == 0) {
        [self.navigationController pushViewController:self.advertise1 animated:YES];
    }else if (self.zxPageControl.currentPage == 1) {
        [self.navigationController pushViewController:self.advertise2 animated:YES];
    }else if (self.zxPageControl.currentPage == 2) {
        [self.navigationController pushViewController:self.advertise3 animated:YES];
    }else {
        ;
    }

}

- (void)perss {
    [self presentViewController:[[Page11ViewController alloc]init] animated:NO completion:nil];
}
- (void)pressZhenCan {
    [self.navigationController pushViewController:self.zhenCan animated:YES];
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//       [self.navigationController pushViewController:self.page1ViewController animated:YES];
//    NSLog(@"触发了touch方法");
//}

- (IBAction)changePage:(id)sender {
    [UIView animateWithDuration:0.3f animations:^{
        self.whichPage = self.zxPageControl.currentPage;
        self.zxScrollView.contentOffset = CGPointMake(self.whichPage*scrowWidth, 0.0f);
    }];
}

- (IBAction)clickBtn:(id)sender {
    [self presentViewController:self.page11ViewController animated:NO completion:nil];
}

- (IBAction)changePage2:(id)sender {
    [UIView animateWithDuration:0.3f animations:^{
        NSInteger whichPage2 = self.zxPageControl2.currentPage;
        self.zxScrollView2.contentOffset = CGPointMake(scrowWidth*whichPage2, 0.0f);
    }];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint offset = self.zxScrollView.contentOffset;
    self.zxPageControl.currentPage = offset.x/(scrowWidth);
    CGPoint offset2 = self.zxScrollView2.contentOffset;
    self.zxPageControl2.currentPage = offset2.x/(scrowWidth);
}

-(void)scrollTimer{
    timeCount ++;
    NSInteger whichPage = self.zxPageControl.currentPage;
    if (whichPage >= 2) {
        
        [self.zxScrollView setContentOffset:CGPointMake(scrowWidth, 0) animated:NO];
        timeCount = 0;
        whichPage = -1;
    }
    [self.zxScrollView setContentOffset:CGPointMake((whichPage+1)*scrowWidth, 0) animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return self.listData.count;
}

///*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Configure the cell...
    NSString* cellID = @"firstPageCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    NSInteger rowNO = indexPath.row;
    cell.textLabel.text = [self.listData[rowNO] FoodName];
    cell.imageView.image = [UIImage imageNamed:[self.listData[rowNO] FoodIcon]];
    
    cell.detailTextLabel.text = [self.listData[rowNO] FoodPrice];
    return cell;
}
//*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

///*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.


}
//*/

@end

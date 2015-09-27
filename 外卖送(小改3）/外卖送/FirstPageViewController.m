//
//  FirstPageViewController.m
//  外卖送
//
//  Created by 丁昊 on 15/9/20.
//  Copyright © 2015年 dinghao. All rights reserved.
//

#import "FirstPageViewController.h"
#import "Page11ViewController.h"
@interface FirstPageViewController () <UIScrollViewDelegate>
@property (strong,nonatomic)UIView* page1;
@property (strong,nonatomic)UIView* page2;
@property (strong,nonatomic)UIView* page3;
@property (strong,nonatomic)UIView* page11;
@property (strong,nonatomic)UIView* page22;
@property (strong,nonatomic)UIView* page33;
@property (strong,nonatomic)Page11ViewController* page11ViewController;
@property (strong,nonatomic)Page11ViewController* page22ViewController;
@property (strong,nonatomic)Page11ViewController* page33ViewController;

@property (weak, nonatomic) IBOutlet UIView *zxView;
@property (weak, nonatomic) IBOutlet UIScrollView *zxScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *zxPageControl;
@property (weak, nonatomic) IBOutlet UIScrollView *zxScrollView2;
@property (weak, nonatomic) IBOutlet UIPageControl *zxPageControl2;
-(void)scrollTimer;
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
    
//编辑第一个scrollView框架、幅度范围等属性。
    self.zxScrollView.bounces = NO;
    self.zxScrollView.delegate = self;
    self.zxScrollView.frame = self.view.frame;
    self.zxScrollView.contentSize = CGSizeMake(self.view.frame.size.width*3, self.tableView.frame.size.height/9);
//编辑第二个scrollView框架、幅度范围等属性。
    self.zxScrollView2.bounces = YES;
    self.zxScrollView2.delegate = self;
    self.zxScrollView2.frame = self.view.frame;
    self.zxScrollView2.contentSize = CGSizeMake(self.view.frame.size.width*3, self.view.frame.size.height/9);
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
    
    Page11ViewController* page11View = [[Page11ViewController alloc]init];
    [page11View.zaoCanBtn addTarget:self action:@selector(perss) forControlEvents:UIControlEventTouchUpInside];
    
}

- (IBAction)changePage:(id)sender {
    [UIView animateWithDuration:0.3f animations:^{
        NSInteger whichPage = self.zxPageControl.currentPage;
        self.zxScrollView.contentOffset = CGPointMake(scrowWidth*whichPage, 0.0f);
    }];
}

- (void)perss {
    [self presentViewController:[[Page11ViewController alloc]init] animated:NO completion:nil];
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
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

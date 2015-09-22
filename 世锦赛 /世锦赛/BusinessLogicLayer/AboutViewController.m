//
//  AboutViewController.m
//  世锦赛
//
//  Created by Jerry Ding on 15-09-21.
//
//  QQ：403488671 邮箱：haoding517@126.com
//
//

#import "AboutViewController.h"
#import <iAd/iAd.h>

#define AdUnitID @"ca-app-pub-1990684556219793/1962464393"


@interface AboutViewController () <ADBannerViewDelegate>

@property (strong, nonatomic) ADBannerView *bannerView;

@end

@implementation AboutViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.bannerView = [[ADBannerView alloc]initWithAdType:ADAdTypeBanner];
    self.bannerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.bannerView.delegate = self;
    [self.view addSubview:self.bannerView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
    NSLog(@"广告加载成功");
}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
    NSLog(@"广告加载失败");
}

-(void)bannerViewActionDidFinish:(ADBannerView *)banner {
    NSLog(@"广告关闭");
}


@end

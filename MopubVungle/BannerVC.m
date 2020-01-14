//
//  BannerVC.m
//  MopubVungle
//
//  Created by Vincent on 2019/12/30.
//  Copyright © 2019 Vincent. All rights reserved.
//

#import "BannerVC.h"
#import "MPAdView.h"
#import "Constant.h"

@interface BannerVC () <MPAdViewDelegate>
@property (nonatomic) MPAdView *bannerView, *mrecView;
@end

@implementation BannerVC

- (void)viewDidLoad {
    [self createView];
    [super viewDidLoad];
}

- (void)createView {
    self.view.backgroundColor = UIColor.whiteColor;
    
    float x = (self.view.bounds.size.width - 320) / 2;
    
    // Create MPAdView instance
    self.bannerView = [[MPAdView alloc] initWithAdUnitId:bannerPlacement];
    self.bannerView.delegate = self;
    self.bannerView.frame = CGRectMake(x, 200, 320, kMPPresetMaxAdSize50Height.height);
    self.bannerView.backgroundColor = UIColor.orangeColor;
    
    self.mrecView = [[MPAdView alloc] initWithAdUnitId:mrecPlacement];
    self.mrecView.delegate = self;
    self.mrecView.frame = CGRectMake(x, 400, 300, 250);
    self.mrecView.backgroundColor = UIColor.orangeColor;
    
    UIButton *loadBanner = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    loadBanner.frame = CGRectMake(x, 120, 320, 80);
    [loadBanner setTitle:@"Load & Play Banner" forState:UIControlStateNormal];
    [loadBanner addTarget:self action:@selector(loadBanner) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *loadMrec = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    loadMrec.frame = CGRectMake(x, 320, 320, 80);
    [loadMrec setTitle:@"Load & Play MREC" forState:UIControlStateNormal];
    [loadMrec addTarget:self action:@selector(loadMrec) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:loadBanner];
    [self.view addSubview:self.bannerView];
    [self.view addSubview:loadMrec];
    [self.view addSubview:self.mrecView];
}

#pragma mark - load & play
- (void)loadBanner {
    // automatically refreshes an ad unit at a time interval specified via the MoPub web interface
    [self.bannerView loadAdWithMaxAdSize:kMPPresetMaxAdSize50Height];
}

- (void)loadMrec {
    [self.mrecView loadAdWithMaxAdSize:kMPPresetMaxAdSize250Height];
}

#pragma mark - MPAdView Delegate
- (void)adViewDidLoadAd:(MPAdView *)view adSize:(CGSize)adSize {
    NSLog(@"Adunit :%@adViewDidLoadAd",view.adUnitId);
}

- (void)adView:(MPAdView *)view didFailToLoadAdWithError:(NSError *)error {
    NSLog(@"Adunit :%@ didFailToLoadAdWithError:%@",view.adUnitId, error.localizedDescription);
}

- (void)willPresentModalViewForAd:(MPAdView *)view {
    NSLog(@"Adunit :%@ willPresentModalViewForAd", view.adUnitId);
}

- (void)didDismissModalViewForAd:(MPAdView *)view {
    NSLog(@"Adunit :%@ didDismissModalViewForAd", view.adUnitId);
}

- (void)willLeaveApplicationFromAd:(MPAdView *)view {
    NSLog(@"Adunit :%@ willLeaveApplicationFromAd", view.adUnitId);
}

@end

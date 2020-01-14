
# Mopub iOS Mediation with Vungle SDK
This is a sample project by using mediation Mopub include Ad-Network Vungle.

## Goal
This project may help to reproduce issues and narrow down the root cause.

## Getting Started
This project is not include the app id and placement ids.
Go to the file Constant.m and input your placement ids:
```
NSString* const adUnitId = @"";
NSString* const interstitialPlacement = @"";
NSString* const rewardPlacement = @"";
NSString* const bannerPlacement = @"";
NSString* const mrecPlacement = @"";
```
Run the commmand below with your terminal
```
pod install --repo-update
```

You should good to go now!

## Manually Integration
1. Check out a new branch
2. Comment Podfile frameworks as below
```
# comment below lines
# pod 'mopub-ios-sdk', '5.10.0'
# pod "VungleSDK-iOS", '6.5.0'
```
3. Run pod install to remove the frameworks from the project
4. Integrate frameworks manually

## For more details, please check Mopub integration document
https://developers.mopub.com/publishers/ios/integrate/

## Tested Version
Mopub + Vungle + Adapter:
5.10.0 + 6.5.0 + 6.5.0.0


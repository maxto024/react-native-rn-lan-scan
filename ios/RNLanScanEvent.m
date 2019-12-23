//
//  RNLanScanEvent.m
//  RNRnLanScan
//
//  Created by Mohamed Elmi on 12/23/19.
//  Copyright © 2019 Facebook. All rights reserved.
//


#import "RNLanScanEvent.h"
@implementation RNLanScanEvent

RCT_EXPORT_MODULE();

+ (id)allocWithZone:(NSZone *)zone {
    static RNLanScanEvent *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [super allocWithZone:zone];
    });
    return sharedInstance;
}

- (NSArray<NSString *> *)supportedEvents
{
    return @[@"EventReminder"];
}

- (void)startScanning
{
    [self sendEventWithName:@"EventReminder" body:@{@"type":@"start",@"name": @"Started"}];
}
- (void)onNewDeviceFind:(NSMutableArray*)devices
{
    [self sendEventWithName:@"EventReminder" body:@{@"type":@"devices", @"name": devices}];
}
- (void)Finish
{
    [self sendEventWithName:@"EventReminder" body:@{@"type":@"finish",@"name": @"Finish"}];
}

@end

//
//  RNLanScanEvent.h
//  RNRnLanScan
//
//  Created by Mohamed Elmi on 12/23/19.
//  Copyright © 2019 Facebook. All rights reserved.
//


#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface RNLanScanEvent : RCTEventEmitter <RCTBridgeModule>
-(void)startScanning;
-(void)onNewDeviceFind:(NSMutableArray*)devices;
-(void)Finish;
@end

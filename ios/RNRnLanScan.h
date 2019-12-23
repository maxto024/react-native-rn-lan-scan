
#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#import <React/RCTEventEmitter.h>
#else
#import <React/RCTBridgeModule.h>
#import <Foundation/Foundation.h>
#endif
@protocol  MainPresenterDelegate
-(void)mainPresenterIPSearchFinished;
-(void)mainPresenterIPSearchCancelled;
-(void)mainPresenterIPSearchFailed;
@end




@interface RNRnLanScan : NSObject  <RCTBridgeModule>
@property(nonatomic,strong)NSArray *connectedDevices;
@property(nonatomic,assign,readonly)float progressValue;
@property(nonatomic,assign,readonly)BOOL isScanRunning;
-(instancetype)initWithDelegate:(id <MainPresenterDelegate>)delegate;
-(void)scanButtonClicked;
-(NSString*)ssidName;
@end
  



#import "RNRnLanScan.h"

@implementation RNRnLanScan




- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(getModuleList: (RCTResponseSenderBlock)callback)
{
   NSArray *nativeModuleList = @[@"react-native-fbsdk", @"react-native-camera", @"react-native-maps"];
   callback(@[[NSNull null], nativeModuleList]);
}

@end
  

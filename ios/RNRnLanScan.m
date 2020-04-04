
#import "RNRnLanScan.h"
#import "LANProperties.h"
#import "MMLANScanner.h"
#import "MMDevice.h"
#import <React/RCTEventEmitter.h>
#import "RNLanScanEvent.h"


@interface RNRnLanScan ()<MMLANScannerDelegate>


@property (nonatomic,weak)id <MainPresenterDelegate> delegate;
@property(nonatomic,strong)MMLANScanner *lanScanner;
@property(nonatomic,assign,readwrite)BOOL isScanRunning;
@property(nonatomic,assign,readwrite)float progressValue;
@end




@implementation RNRnLanScan {
    NSMutableArray *connectedDevicesMutable;
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

//Initialization with delegate
-(instancetype)initWithDelegate:(id <MainPresenterDelegate>)delegate {

    self = [super init];
       
       if (self) {
           
           self.isScanRunning=NO;
          
           self.delegate=delegate;
           
           self.lanScanner = [[MMLANScanner alloc] initWithDelegate:self];
       }
    
    RNLanScanEvent *manager = [RNLanScanEvent allocWithZone: nil];
          [manager startScanning];
    
       
       return self;
}





RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(getModuleList: (RCTResponseSenderBlock)callback)
{
   self.lanScanner = [[MMLANScanner alloc] initWithDelegate:self];
    [self startNetworkScan];
//   NSArray *nativeModuleList = @[@"react-native-fbsdk", @"react-native-camera", @"react-native-maps"];
    RNLanScanEvent *manager = [RNLanScanEvent allocWithZone: nil];
      [manager startScanning];
   
   callback(@[[NSNull null], connectedDevicesMutable]);
}




#pragma mark - Button Actions
//This method is responsible for handling the tap button action on MainVC. In case the scan is running and the button is tapped it will stop the scan
-(void)scanButtonClicked {
    
    //Checks if is already scanning
    if (self.isScanRunning) {
        
        [self stopNetworkScan];
    }
    else {
        
        [self startNetworkScan];
    }
    
}
-(void)startNetworkScan {
    
    self.isScanRunning=YES;
    
    connectedDevicesMutable = [[NSMutableArray alloc] init];
    
    RNLanScanEvent *manager = [RNLanScanEvent allocWithZone: nil];
          [manager startScanning];
    
    [self.lanScanner start];
};

-(void)stopNetworkScan {
    
    [self.lanScanner stop];
    
    self.isScanRunning=NO;
}

#pragma mark - SSID
//Getting the SSID string using LANProperties
-(NSString*)ssidName {

    return [NSString stringWithFormat:@"SSID: %@",[LANProperties fetchSSIDInfo]];
};

#pragma mark - MMLANScannerDelegate methods
//The delegate methods of MMLANScanner
-(void)lanScanDidFindNewDevice:(MMDevice*)device{
    
    //Check if the Device is already added
    if (![connectedDevicesMutable containsObject:device]) {
        NSMutableArray *nDevices = [[NSMutableArray alloc] initWithObjects:device.ipAddress,device.brand,device.macAddress,device.isLocalDevice,device.macAddress,device.subnetMask, nil];
          
            NSLog(@"Ip:- %@ brand:-%@ mac:-%@ hostname:-%@", device.ipAddress, device.brand,device.macAddress, device.hostname  );
        
        RNLanScanEvent *manager = [RNLanScanEvent allocWithZone: nil];
          [manager onNewDeviceFind:nDevices];
        
        [connectedDevicesMutable addObject:device];
    }
 
    
    
    
    
    NSSortDescriptor *valueDescriptor = [[NSSortDescriptor alloc] initWithKey:@"ipAddress" ascending:YES];
  
    
    //Updating the array that holds the data. MainVC will be notified by KVO
    self.connectedDevices = [connectedDevicesMutable sortedArrayUsingDescriptors:@[valueDescriptor]];
}

-(void)lanScanDidFinishScanningWithStatus:(MMLanScannerStatus)status{
   
    self.isScanRunning=NO;
    RNLanScanEvent *manager = [RNLanScanEvent allocWithZone: nil];
      [manager Finish];
    
    //Checks the status of finished. Then call the appropriate method
    if (status == MMLanScannerStatusFinished) {
        
        [self.delegate mainPresenterIPSearchFinished];
    }
    else if (status==MMLanScannerStatusCancelled) {
       
        [self.delegate mainPresenterIPSearchCancelled];
    }
}

-(void)lanScanProgressPinged:(float)pingedHosts from:(NSInteger)overallHosts {
    
    //Updating the progress value. MainVC will be notified by KVO
    self.progressValue=pingedHosts/overallHosts;
}

-(void)lanScanDidFailedToScan {
   
    self.isScanRunning=NO;

    RNLanScanEvent *manager = [RNLanScanEvent allocWithZone: nil];
      [manager Finish];
    [self.delegate mainPresenterIPSearchFailed];
}


@end






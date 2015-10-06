//
//  ViewController.h
//  Beacon
//
//  Created by Walker, Clayton J. on 9/9/15.
//  Copyright (c) 2015 Walker, Clayton J. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface ViewController : UIViewController<CBPeripheralManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) CLBeaconRegion *myBeaconRegion;
@property (strong, nonatomic) NSDictionary *myBeaconData;
@property (strong, nonatomic) CBPeripheralManager *peripheralManager;

@end


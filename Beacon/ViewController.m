//
//  ViewController.m
//  Beacon
//
//  Created by Walker, Clayton J. on 9/9/15.
//  Copyright (c) 2015 Walker, Clayton J. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Create a NSUUID object
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"CBA4382E-8499-4ECA-9CDA-AE5917C07582"];
    
    //Initialize the Beacon Region
    self.myBeaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid major:1 minor:1 identifier:@"com.ClaytonWalker.testregion"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClicked:(id)sender {
    
    //Get the beacon data to advertise
    self.myBeaconData = [self.myBeaconRegion peripheralDataWithMeasuredPower:nil];
    
    //Start the peripheral manager
    self.peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil options:nil];
}

-(void)peripheralManagerDidUpdateState:(CBPeripheralManager*)peripheral
{
    if (peripheral.state == CBPeripheralManagerStatePoweredOn)
    {
        // Bluetooth is on
        
        // Update our status label
        self.statusLabel.text = @"Broadcasting...";
        
        // Start broadcasting
        [self.peripheralManager startAdvertising:self.myBeaconData];
    }
    else if (peripheral.state == CBPeripheralManagerStatePoweredOff)
    {
        // Update our status label
        self.statusLabel.text = @"Stopped";
        
        // Bluetooth isn't on. Stop broadcasting
        [self.peripheralManager stopAdvertising];
    }
    else if (peripheral.state == CBPeripheralManagerStateUnsupported)
    {
        self.statusLabel.text = @"Unsupported";
    }
}

@end

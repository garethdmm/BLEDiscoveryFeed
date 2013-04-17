//
//  Discovery.m
//  DiscoveryFeed
//
//  Created by Gareth MacLeod on 2013-04-17.
//  Copyright (c) 2013 Gareth MacLeod. All rights reserved.
//

#import "Discovery.h"
#import "DiscoveryFeedViewController.h"

@implementation Discovery

- (id)init {
    self = [super init];
    self.centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:dispatch_get_main_queue()];
    
    return self;
}

- (void)startScanning {
    NSLog(@"Discovery --- StartScanning");
    [self.centralManager scanForPeripheralsWithServices:nil options:nil];
}

#pragma mark - CBCentralManagerDelegate

- (void) centralManagerDidUpdateState:(CBCentralManager *)central
{
    NSLog(@"Discovery --- CentralManagerDidUpdateState");
    
	switch ([self.centralManager state]) {
		case CBCentralManagerStatePoweredOff:
		{
            NSLog(@"Discovery --- CentralManager State Powered Off");
			break;
		}
            
		case CBCentralManagerStateUnauthorized:
		{
			/* Tell user the app is not allowed. */
            NSLog(@"Discovery --- CentralManager State Unauthorized");
			break;
		}
            
		case CBCentralManagerStateUnknown:
		{
			/* Bad news, let's wait for another event. */
            NSLog(@"Discovery --- CentralManager State Unknown");
			break;
		}
            
		case CBCentralManagerStatePoweredOn:
		{
            NSLog(@"Discovery --- CentralManager Powered On");
            [self startScanning];
			break;
		}
            
		case CBCentralManagerStateResetting:
		{
            NSLog(@"Discovery --- CentralManager Resetting");
			break;
		}
	}
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI {
    NSLog(@"Discovery --- didDiscoverPeripheral");

    [self.delegate didDiscoverPeripheral:peripheral];
}

@end

//
//  Discovery.h
//  DiscoveryFeed
//
//  Created by Gareth MacLeod on 2013-04-17.
//  Copyright (c) 2013 Gareth MacLeod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@class DiscoveryFeedViewController;

@protocol DiscoveryDelegate <NSObject>

- (void)didDiscoverPeripheral:(CBPeripheral *)peripheral;

@end

@interface Discovery : NSObject <CBCentralManagerDelegate>

@property (strong, nonatomic) CBCentralManager *centralManager;
@property (strong, nonatomic) DiscoveryFeedViewController *delegate;

@end

//
//  DiscoveryFeedViewController.h
//  DiscoveryFeed
//
//  Created by Gareth MacLeod on 2013-04-17.
//  Copyright (c) 2013 Gareth MacLeod. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Discovery.h"

@interface DiscoveryFeedViewController : UITableViewController <DiscoveryDelegate>

@property (strong, nonatomic) Discovery *discovery;
@property (strong, nonatomic) NSMutableArray *events;

@end

//
//  DiscoveryCell.h
//  DiscoveryFeed
//
//  Created by Gareth MacLeod on 2013-04-17.
//  Copyright (c) 2013 Gareth MacLeod. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DiscoveryCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *deviceNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *timestampLabel;

@end

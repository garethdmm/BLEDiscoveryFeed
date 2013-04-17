//
//  DiscoveryFeedViewController.m
//  DiscoveryFeed
//
//  Created by Gareth MacLeod on 2013-04-17.
//  Copyright (c) 2013 Gareth MacLeod. All rights reserved.
//

#import "DiscoveryFeedViewController.h"
#import "DiscoveryCell.h"

@interface DiscoveryFeedViewController ()

@end

@implementation DiscoveryFeedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.events = [[NSMutableArray alloc] init];
    
    self.discovery = [[Discovery alloc] init];
    [self.discovery setDelegate:self];

    UINib *cellNib = [UINib nibWithNibName:@"DiscoveryCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"DiscoveryCell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollToNewMessage {
    NSIndexPath * path = [NSIndexPath indexPathForRow:([self.tableView numberOfRowsInSection:0] - 1) inSection:0];
    
    [self.tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

#pragma mark - discoverydelegate

- (void)didDiscoverPeripheral:(CBPeripheral *)peripheral {
    NSLog(@"DiscoveryFeed --- didDiscoverPeripheral");
    if (peripheral.name) {
        NSString *event = [NSString stringWithFormat:@"Discovered: %@", peripheral.name];
        [self.events addObject:event];
        [self.tableView reloadData];
        [self scrollToNewMessage];
    }
}

#pragma mark - tableview datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DiscoveryCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"DiscoveryCell"];
   
    NSString *event = [self.events objectAtIndex:indexPath.row];
    
    cell.deviceNameLabel.text = event;
    
    NSDateFormatter *DateFormatter=[[NSDateFormatter alloc] init];
    [DateFormatter setDateFormat:@"hh:mm"];
    
    cell.timestampLabel.text = [DateFormatter stringFromDate:[NSDate date]];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.events count];
}



@end

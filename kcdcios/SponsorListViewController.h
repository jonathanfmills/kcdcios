//
//  SponsorListViewController.h
//  kcdcios
//
//  Created by Lee Brandt on 1/30/13.
//  Copyright (c) 2013 Lee Brandt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SponsorListViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *sponsors;
@property (nonatomic, strong) NSArray *sponsorshipTypes;

@end

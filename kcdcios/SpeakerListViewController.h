//
//  SpeakerListViewController.h
//  kcdc
//
//  Created by Lee Brandt on 1/31/13.
//  Copyright (c) 2013 Lee Brandt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSPullToRefresh.h"

@interface SpeakerListViewController : UITableViewController<SSPullToRefreshViewDelegate>

@property (nonatomic, strong) NSMutableArray *speakers;

@property (nonatomic, strong) SSPullToRefreshView *pullToRefreshView;

@end

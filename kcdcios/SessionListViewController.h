//
//  SessionListViewController.h
//  kcdc
//
//  Created by Lee Brandt on 2/3/13.
//  Copyright (c) 2013 Lee Brandt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSPullToRefresh.h"

@interface SessionListViewController : UITableViewController<SSPullToRefreshViewDelegate>

@property (nonatomic, strong) NSMutableArray *sessions;

@property (nonatomic, strong) IBOutlet UILabel *sessionTitleLabel;
@property (nonatomic, strong) IBOutlet UILabel *sessionDescriptionLabel;
@property (nonatomic, strong) IBOutlet UILabel *sessionTimeLabel;
@property (nonatomic, strong) NSString *speakerId;

@property (nonatomic, strong) SSPullToRefreshView *pullToRefreshView;

@end

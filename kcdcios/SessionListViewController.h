//
//  SessionListViewController.h
//  kcdcios
//
//  Created by Lee Brandt on 2/3/13.
//  Copyright (c) 2013 Lee Brandt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SessionListViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *sessions;

@property (nonatomic, strong) IBOutlet UILabel *sessionTitleLabel;
@property (nonatomic, strong) IBOutlet UILabel *sessionDescriptionLabel;
@property (nonatomic, strong) IBOutlet UILabel *sessionTimeLabel;

@end

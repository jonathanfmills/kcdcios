//
//  ViewController.h
//  kcdcios
//
//  Created by Lee Brandt on 1/28/13.
//  Copyright (c) 2013 Lee Brandt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *sponsors;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

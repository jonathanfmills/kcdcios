//
//  SessionViewController.m
//  kcdc
//
//  Created by Lee Brandt on 2/3/13.
//  Copyright (c) 2013 Lee Brandt. All rights reserved.
//

#import "SessionViewController.h"

@implementation SessionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.sessionNameLabel.text = self.session.name;
    self.sessionSynopsis.text = self.session.synopsis;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

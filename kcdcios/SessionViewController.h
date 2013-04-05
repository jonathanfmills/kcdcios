//
//  SessionViewController.h
//  kcdc
//
//  Created by Lee Brandt on 2/3/13.
//  Copyright (c) 2013 Lee Brandt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Session.h"

@interface SessionViewController : UIViewController

@property (nonatomic, strong) Session *session;
@property (nonatomic, strong) IBOutlet UILabel *sessionNameLabel;
@property (nonatomic, strong) IBOutlet UITextView *sessionSynopsis;

@end

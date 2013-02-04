//
//  SpeakerViewController.h
//  kcdcios
//
//  Created by Lee Brandt on 2/2/13.
//  Copyright (c) 2013 Lee Brandt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Speaker.h"

@interface SpeakerViewController : UIViewController

@property (nonatomic, strong) Speaker *speaker;

@property (nonatomic, strong) IBOutlet UILabel *speakerNameLabel;
@property (nonatomic, strong) IBOutlet UITextView *speakerBioView;
@property (nonatomic, strong) IBOutlet UIImageView *speakerImageView;

@end

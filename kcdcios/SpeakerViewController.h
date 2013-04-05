//
//  SpeakerViewController.h
//  kcdc
//
//  Created by Lee Brandt on 2/2/13.
//  Copyright (c) 2013 Lee Brandt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Speaker.h"

@interface SpeakerViewController : UIViewController

@property (nonatomic, strong) Speaker *speaker;

@property (nonatomic, weak) IBOutlet UILabel *speakerFirstNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *speakerLastNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *speakerLocationLabel;
@property (nonatomic, weak) IBOutlet UITextView *speakerBioView;
@property (nonatomic, weak) IBOutlet UIImageView *speakerImageView;

-(IBAction)didTapViewSessions:(id)sender;

@end

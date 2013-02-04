//
//  SpeakerViewController.m
//  kcdcios
//
//  Created by Lee Brandt on 2/2/13.
//  Copyright (c) 2013 Lee Brandt. All rights reserved.
//

#import "SpeakerViewController.h"

@implementation SpeakerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"%@", self.speaker);

        //self.speakerImageView.image = self.speaker.picUrl;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.speakerNameLabel.text = [NSString stringWithFormat:@"%@ %@", self.speaker.firstName, self.speaker.lastName];
    self.speakerBioView.text = self.speaker.bio;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

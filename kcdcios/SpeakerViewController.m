//
//  SpeakerViewController.m
//  kcdc
//
//  Created by Lee Brandt on 2/2/13.
//  Copyright (c) 2013 Lee Brandt. All rights reserved.
//

#import "SpeakerViewController.h"
#import "SessionListViewController.h"
#import "AFNetworking.h"

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
    self.title = self.speaker.fullName;
    self.speakerFirstNameLabel.text = self.speaker.firstName;
    self.speakerLastNameLabel.text = self.speaker.lastName;
    self.speakerLocationLabel.text = self.speaker.location;
    self.speakerBioView.text = self.speaker.bio;
    [self.speakerImageView setImageWithURL:[NSURL URLWithString:self.speaker.picUrl]
                          placeholderImage:[UIImage imageNamed:@"avatar.jpg"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)didTapViewSessions:(id)sender{
    NSLog(@"Speaker ID is: %@", self.speaker.speakerId);
    SessionListViewController *sessionListViewController = [[SessionListViewController alloc] init];
    [sessionListViewController setSpeakerId:self.speaker.speakerId];
    [self.navigationController pushViewController: sessionListViewController animated:YES];
}

@end

//
//  SpeakerListViewController.m
//  kcdc
//
//  Created by Lee Brandt on 1/31/13.
//  Copyright (c) 2013 Lee Brandt. All rights reserved.
//

#import "SpeakerListViewController.h"
#import "ApiClient.h"
#import "Speaker.h"
#import "AFNetworking.h"
#import "SpeakerViewController.h"
#import "SVProgressHUD.h"
#import "SpeakerCellViewController.h"

@implementation SpeakerListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Speakers";
    self.pullToRefreshView = [[SSPullToRefreshView alloc] initWithScrollView:self.tableView
                                                                    delegate:self];
    self.pullToRefreshView.contentView = [[SSPullToRefreshSimpleContentView alloc] init];
    [SVProgressHUD show];
    [self loadSpeakers];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadSpeakers{
    [[ApiClient sharedInstance] getPath:@"speaker" parameters:nil
                                success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                    NSLog(@"Response: %@", responseObject);
                                    self.speakers = [NSMutableArray array];
                                    for (id speakerDictionary in responseObject) {
                                        Speaker *speaker = [[Speaker alloc] initWithDictionary:speakerDictionary];
                                        [self.speakers addObject:speaker];
                                    }
                                    [self.tableView reloadData];
                                    [self.pullToRefreshView finishLoading];
                                    [SVProgressHUD dismiss];
                                }
                                failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                    NSLog(@"Received an Error: %@", error);
                                }];
}

#pragma mark - PullToRefresh Delegate Methods

- (BOOL)pullToRefreshViewShouldStartLoading:(SSPullToRefreshView *)view{
    return YES;
}

- (void)pullToRefreshViewDidStartLoading:(SSPullToRefreshView *)view{
    [self loadSpeakers];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.speakers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"speakerCell";
    SpeakerCellViewController *cell = (SpeakerCellViewController *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    Speaker *speaker = [self.speakers objectAtIndex:indexPath.row];
    
    cell.speakerName.text = speaker.fullName;
    cell.speakerLocation.text = speaker.location;
    [cell.speakerImage setImageWithURL:[NSURL URLWithString:speaker.picUrl]
                      placeholderImage:[UIImage imageNamed:@"avatar.jpg"]];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    SpeakerViewController *speakerViewController = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    speakerViewController.speaker = [self.speakers objectAtIndex:indexPath.row];
}

@end

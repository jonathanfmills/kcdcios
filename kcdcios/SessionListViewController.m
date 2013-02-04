//
//  SessionListViewController.m
//  kcdcios
//
//  Created by Lee Brandt on 2/3/13.
//  Copyright (c) 2013 Lee Brandt. All rights reserved.
//

#import "SessionListViewController.h"
#import "ApiClient.h"
#import "Session.h"
#import "SVProgressHUD.h"
#import "SessionViewController.h"

@implementation SessionListViewController

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

    [SVProgressHUD show];
    [[ApiClient sharedInstance] getPath:@"session" parameters:nil
                                success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                    NSLog(@"Response: %@", responseObject);
                                    self.sessions = [NSMutableArray array];
                                    for (id sessionDictionary in responseObject) {
                                        Session *session = [[Session alloc] initWithDictionary:sessionDictionary];
                                        [self.sessions addObject:session];
                                    }
                                    [self.tableView reloadData];
                                    [SVProgressHUD dismiss];
                                }
                                failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                    NSLog(@"Received an Error: %@", error);
                                    [SVProgressHUD showErrorWithStatus:@"Unable to retrieve session."];
                                }];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sessions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"sessionCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSLog(@"Sessions: %@", self.sessions);
    
    Session *session = [self.sessions objectAtIndex:indexPath.row];
    
    cell.textLabel.text = session.name;
    cell.detailTextLabel.text = session.synopsis;

    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    SessionViewController *sessionViewController = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    sessionViewController.session = [self.sessions objectAtIndex:indexPath.row];
}

@end

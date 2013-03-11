//
//  SponsorListViewController.m
//  kcdcios
//
//  Created by Lee Brandt on 1/30/13.
//  Copyright (c) 2013 Lee Brandt. All rights reserved.
//

#import "SponsorListViewController.h"
#import "ApiClient.h"
#import "Sponsor.h"
#import "SVProgressHUD.h"

@implementation SponsorListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Sponsors";
    self.sponsorshipTypes = [ NSArray arrayWithObjects:@"Platinum", @"Gold", @"Silver", @"Other", nil ];
    [self loadSponsors];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //[self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadSponsors{
    [SVProgressHUD show];
    [[ApiClient sharedInstance] getPath:@"sponsor" parameters:nil
                                success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                    NSLog(@"Response: %@", responseObject);
                                    self.sponsors = [NSMutableArray array];
                                    for (id sponsorDictionary in responseObject) {
                                        Sponsor *sponsor = [[Sponsor alloc] initWithDictionary:sponsorDictionary];
                                        [self.sponsors addObject:sponsor];
                                    }
                                    [self.tableView reloadData];
                                    [SVProgressHUD dismiss];
                                }
                                failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                    NSLog(@"Received an Error: %@", error);
                                    [SVProgressHUD showErrorWithStatus:error.description];
                                }];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return [self.sponsorshipTypes objectAtIndex:section];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 40)];
    UILabel* headerLabel = [[UILabel alloc] init];
    headerLabel.frame = CGRectMake(12, 0, tableView.frame.size.width, 40);
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.textColor = [UIColor whiteColor];
    headerLabel.font = [UIFont boldSystemFontOfSize:18];
    headerLabel.text = [self tableView:tableView titleForHeaderInSection:section];
    
    [headerView addSubview:headerLabel];
    
    return headerView;
};

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40.0f;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sponsorshipTypes.count;
};

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSPredicate *filter= [NSPredicate predicateWithFormat:@"type == %@", [self.sponsorshipTypes objectAtIndex:section]];
    return [[self.sponsors filteredArrayUsingPredicate:filter] count];
};

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sponsorCell"];

    NSPredicate *filter= [NSPredicate predicateWithFormat:@"type == %@", [self.sponsorshipTypes objectAtIndex:indexPath.section]];
    Sponsor *sponsor = [[self.sponsors filteredArrayUsingPredicate:filter] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = sponsor.name;
    cell.detailTextLabel.text = sponsor.url;
    cell.userInteractionEnabled = NO;//[sponsor.type isEqual: @"Platinum"];
    return cell;
};

@end

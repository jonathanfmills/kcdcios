//
//  ViewController.m
//  kcdcios
//
//  Created by Lee Brandt on 1/28/13.
//  Copyright (c) 2013 Lee Brandt. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "ApiClient.h"
#import "Sponsor.h"

@implementation ViewController


#pragma mark - View Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    

    [[ApiClient sharedInstance] getPath:@"sponsor" parameters:Nil
                                success:^(AFHTTPRequestOperation *operation, id response) {
                                    NSLog(@"Response: %@", response);
                                    self.sponsors = [NSMutableArray array];
                                    for (id responseDictionary in response) {
                                        Sponsor *sponsor = [[Sponsor alloc] initWithDictionary:responseDictionary];
                                        [self.sponsors addObject:sponsor];
                                    }
                                    [self.tableView reloadData];
                                }
                                failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                    NSLog(@"Received HTTP %d", operation.response.statusCode);
                                    NSLog(@"%@", error);
                                }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Datasour

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.sponsors.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    Sponsor *sponsor = [self.sponsors objectAtIndex:indexPath.row];
    cell.textLabel.text = sponsor.name;
    cell.detailTextLabel.text = sponsor.url;
    
    return cell;
}

@end

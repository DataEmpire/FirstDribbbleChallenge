//
//  FDCHomeTableViewController.m
//  FirstDribbbleChallenge
//
//  Created by Rafael Ferreira on 1/11/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import "FDCHomeTableViewController.h"
#import <Mantle/MTLJSONAdapter.h>
#import "UIImageView+AFNetworking.h"
#import "FDCSessionManager+Shots.h"
#import "FDCDetailViewController.h"
#import "FDCDribbbleTableViewCell.h"
#import "FDCConstants.h"

@interface FDCHomeTableViewController ()

@end

@implementation FDCHomeTableViewController

- (void)doRequest
{
    [[FDCSessionManager sharedManager] getShotsOnPage:@1 success:^(NSArray *responseModel) {
        shots = [NSMutableArray arrayWithArray:responseModel];
        
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        [self showAlertMessage:error.localizedDescription];
    }];
}

- (void)registerNibForDribbbleCell {
    [self.tableView registerNib:[UINib nibWithNibName:@"FDCDribbbleTableViewCell" bundle:nil] forCellReuseIdentifier:kDribbbleCellIdentifier];
}

- (void)showAlertMessage:(NSString *)message {
    UIAlertAction *continueAction = [UIAlertAction actionWithTitle:@"continue" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertController *viewController = [UIAlertController alertControllerWithTitle:@"Dribbble Viewer" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [viewController addAction:continueAction];
    
    [self presentViewController:viewController animated:YES completion:nil];
}

#pragma mark - UIViewController methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerNibForDribbbleCell];
    [self doRequest];
}

#pragma mark - UITableViewDataSource methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FDCDribbbleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDribbbleCellIdentifier];
    
    if (!cell) {
        cell = [[FDCDribbbleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kDribbbleCellIdentifier];
    }
    
    [cell setUpWithShotModel:[shots objectAtIndex:indexPath.row]];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return shots.count;
}

#pragma mark - UITableViewDelegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 240;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    shotToDetail = [shots objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:kHomeToDetailSegue sender:self];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:kHomeToDetailSegue]) {
        FDCDetailViewController *detailController = (FDCDetailViewController *)segue.destinationViewController;
        
        detailController.shotToShow = shotToDetail;
    }
}

@end
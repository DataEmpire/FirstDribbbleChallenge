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
#import "FDCMantleBase.h"

@interface FDCHomeTableViewController ()

@end

@implementation FDCHomeTableViewController

/*! @brief Controls what page for Dribbble API I am working. */
static int currentPage = 0;

/*! @brief The loading flag, when its value is YES new requests for getShotsOnPage are not finished. */
static BOOL isLoading = NO;

- (void)doRequest
{
    
    FDCShot *shot = [FDCShot new];
    
    
    if (!isLoading) {
        isLoading = YES;
        
        currentPage++;
        
        [[FDCSessionManager sharedManager] getShotsOnPage:[NSNumber numberWithInteger:currentPage] success:^(NSArray *responseModel) {
            if (shots) {
                [shots addObjectsFromArray:responseModel];
            } else {
                shots = [NSMutableArray arrayWithArray:responseModel];
            }
            
            [self.tableView reloadData];
            
            isLoading = NO;
        } failure:^(NSError *error) {
            [self showAlertMessage:error.localizedDescription];
            
            isLoading = NO;
        }];
    }
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat yCurrent = scrollView.contentOffset.y;
    CGFloat currentHeight = scrollView.contentSize.height - (scrollView.bounds.size.height + 480);
    
    if ((yCurrent > 0) && (yCurrent > currentHeight)) {
        [self doRequest];
    }
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
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
#import "FDCMessageHelper.h"

@implementation FDCHomeTableViewController

/*! @brief Controls what page for Dribbble API I am working. */
static int currentPage = 0;

/*! @brief The loading flag, when its value is YES new requests for getShotsOnPage are not finished. */
static BOOL isLoading = NO;


#pragma mark - UIViewController methods

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchDribbleShots];
}

#pragma mark - UITableViewDataSource methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.dataViewSource tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataViewSource tableView:tableView numberOfRowsInSection:section];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat yCurrent = scrollView.contentOffset.y;
    CGFloat currentHeight = scrollView.contentSize.height - (scrollView.bounds.size.height + 480);
    
    if ((yCurrent > 0) && (yCurrent > currentHeight)) {
        [self fetchDribbleShots];
    }
}

#pragma mark - UITableViewDelegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:kHomeToDetailSegue sender:self.dataViewSource];
}

- (void)fetchDribbleShots
{
    if (!isLoading) {
        isLoading = YES;
        
        currentPage++;
        
        [[FDCSessionManager sharedManager] getShotsOnPage:[NSNumber numberWithInteger:currentPage] success:^(NSArray *responseModel) {
            
            if(self.dataViewSource)
                [self.dataViewSource.modelContainer addObjectsFromArray:responseModel];
            else
                [self initShotDataViewSourceWithModel:responseModel];
            
            [self.tableView reloadData];
            isLoading = NO;
        } failure:^(NSError *error) {
            [FDCMessageHelper showAlertMessage:error.localizedDescription showIn:self];
            isLoading = NO;
        }];
    }
}

-(void) initShotDataViewSourceWithModel:(NSArray*)responseModel
{
    NSMutableArray *modelContainer = [NSMutableArray new];
    [modelContainer addObjectsFromArray:responseModel];
    self.dataViewSource = [[FDCTableViewDataSource alloc] initWithModelContainer:modelContainer  controller:self tableView:self.tableView];
    [self.tableView setDelegate:self.dataViewSource];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:kHomeToDetailSegue]) {
        FDCDetailViewController *detailController = (FDCDetailViewController *)segue.destinationViewController;
        detailController.shotToShow = _dataViewSource.selectedShot;
    }
}

@end
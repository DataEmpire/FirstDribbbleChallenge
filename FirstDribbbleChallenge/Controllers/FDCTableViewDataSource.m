//
//  FDCTableViewDataSource.m
//  FirstDribbbleChallenge
//
//  Created by Douglas Barreto on 1/13/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import "FDCTableViewDataSource.h"
#import "FDCConstants.h"
#import "FDCHomeTableViewController.h"
#import "FDCDribbbleTableViewCell.h"

@implementation FDCTableViewDataSource

/*! @brief Controls what page for Dribbble API I am working. */
static int currentPage = 0;

/*! @brief The loading flag, when its value is YES new requests for getShotsOnPage are not finished. */
static BOOL isLoading = NO;


-(void)additionalInitialSetup{
}

-(void)registerCells{
    [self.tableView registerNib:[UINib nibWithNibName:@"FDCDribbbleTableViewCell" bundle:nil] forCellReuseIdentifier:kDribbbleCellIdentifier];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedShot = [_shots objectAtIndex:indexPath.row];
    [self.modelContainer performSegueWithIdentifier:kHomeToDetailSegue sender:self];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FDCDribbbleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDribbbleCellIdentifier];
    
    if (!cell) {
        cell = [[FDCDribbbleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kDribbbleCellIdentifier];
    }
    
    [cell setUpWithShotModel:[_shots objectAtIndex:indexPath.row]];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _shots.count;
}

- (void)getDribbleShots
{
    if (!isLoading) {
        isLoading = YES;
        
        currentPage++;
        
        [[FDCSessionManager sharedManager] getShotsOnPage:[NSNumber numberWithInteger:currentPage] success:^(NSArray *responseModel) {
            if (_shots) {
                [_shots addObjectsFromArray:responseModel];
            } else {
                _shots = [NSMutableArray arrayWithArray:responseModel];
            }
            
            [self.tableView reloadData];
            
            isLoading = NO;
        } failure:^(NSError *error) {
            FDCHomeTableViewController * controller = (FDCHomeTableViewController *)self.modelContainer;
            [controller showAlertMessage:error.localizedDescription];
            isLoading = NO;
        }];
    }
}
@end

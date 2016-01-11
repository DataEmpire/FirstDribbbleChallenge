//
//  FDCHomeTableViewController.m
//  FirstDribbbleChallenge
//
//  Created by Rafael Ferreira on 1/11/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import "FDCHomeTableViewController.h"
#import <Mantle/MTLJSONAdapter.h>
#import "FDCSessionManager+Shots.h"
#import "FDCDribbbleTableViewCell.h"
#import "FDCConstants.h"
#import "UIImageView+AFNetworking.h"

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerNibForDribbbleCell];
    [self doRequest];
}

#pragma mark - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return shots.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 240;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FDCDribbbleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDribbbleCellIdentifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[FDCDribbbleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kDribbbleCellIdentifier];
    }
    
    [cell setUpWithShotModel:[shots objectAtIndex:indexPath.row]];
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
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


//@interface FDCDribbbleTableViewCell()
//@property (strong, nonatomic)id modelContainer;
//@end

@implementation FDCTableViewDataSource


-(instancetype)initWithModelContainer:(id)modelContainer controller:(UIViewController *)controller tableView:(UITableView *)tableView
{
    self = [super initWithModelContainer:modelContainer controller:controller tableView:tableView];
    if (self) {
        _shots = (NSMutableArray *)modelContainer;
    }
    return self;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [FDCDribbbleTableViewCell cellHeight];
}

-(void)registerCells{
    [FDCDribbbleTableViewCell registerForTableView:self.tableView];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedShot = [self.modelContainer objectAtIndex:indexPath.row];
    [(UITableViewController *)self.controller tableView:tableView didSelectRowAtIndexPath:indexPath];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FDCDribbbleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDribbbleCellIdentifier];
    
    if (!cell) {
        cell = [[FDCDribbbleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kDribbbleCellIdentifier];
    }
    
    [cell setUpWithShotModel:[self.modelContainer objectAtIndex:indexPath.row]];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.modelContainer count];
}
@end

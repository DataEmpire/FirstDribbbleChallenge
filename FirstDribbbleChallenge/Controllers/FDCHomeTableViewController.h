//
//  FDCHomeTableViewController.h
//  FirstDribbbleChallenge
//
//  Created by Rafael Ferreira on 1/11/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Bricks.h>
#import "FDCTableViewDataSource.h"
#import "FDCShot.h"

/*! @brief The table view with the list from Dribbble. */
@interface FDCHomeTableViewController : UITableViewController

@property (nonatomic)FDCTableViewDataSource *dataViewSource;


@end
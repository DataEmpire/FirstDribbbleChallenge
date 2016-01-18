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
@interface FDCHomeTableViewController : UITableViewController {
    
    FDCTableViewDataSource *_dataViewSource;
    //    /*! @brief The shots that will be showed. */
    //    NSMutableArray *_shots;
    //    
    //    /*! @brief The shot that we will show the details on the next page. */
    //    FDCShot *_shotToDetail;
    //    
}

- (void)showAlertMessage:(NSString *)message;

@end
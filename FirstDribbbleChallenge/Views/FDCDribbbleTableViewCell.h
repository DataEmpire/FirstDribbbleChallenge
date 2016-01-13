//
//  FDCDribbbleTableViewCell.h
//  FirstDribbbleChallenge
//
//  Created by Rafael Ferreira on 1/11/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bricks.h"
#import "FDCShot.h"
#import "FDCShotUIView.h"
/*! @brief The code-behind class for a dribbble shot item. */
@interface FDCDribbbleTableViewCell : BKBaseTableViewCell
@property (strong, nonatomic) FDCShotUIView *shotUIView;
- (void)setUpWithShotModel:(FDCShot *)shot;
@end
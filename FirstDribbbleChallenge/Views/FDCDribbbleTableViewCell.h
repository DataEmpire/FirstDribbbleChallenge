//
//  FDCDribbbleTableViewCell.h
//  FirstDribbbleChallenge
//
//  Created by Rafael Ferreira on 1/11/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FDCShot.h"

/*! @brief The code-behind class for a dribbble shot item. */
@interface FDCDribbbleTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *shotImageView;

@property (weak, nonatomic) IBOutlet UILabel *shotDescriptionLabel;

@property (weak, nonatomic) IBOutlet UILabel *viewsCountLabel;

- (void)setUpWithShotModel:(FDCShot *)shot;

@end
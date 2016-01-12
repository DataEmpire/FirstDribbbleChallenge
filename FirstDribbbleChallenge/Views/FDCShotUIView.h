//
//  FDCShotUIView.h
//  FirstDribbbleChallenge
//
//  Created by Douglas Barreto on 1/12/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FDCShot.h"

@interface FDCShotUIView : UIView

@property (nonatomic) IBOutlet UIImageView *shotImageView;

@property (nonatomic) IBOutlet UILabel *shotDescriptionLabel;

@property (nonatomic) IBOutlet UILabel *viewsCountLabel;

@property (strong, nonatomic) UIActivityIndicatorView *activityIndicator;


+ (FDCShotUIView *)initWithNibClassName;
- (void)setUpWithShotModel:(FDCShot *)shot;
- (void)constraintTo:(UIView *) uiComponent;

@end

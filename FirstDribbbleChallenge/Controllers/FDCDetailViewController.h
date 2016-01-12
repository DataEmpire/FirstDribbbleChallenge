//
//  ViewController.h
//  FirstDribbbleChallenge
//
//  Created by Rafael Ferreira on 1/11/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FDCShot.h"
#import "FDCShotUIView.h"

/*! @brief The view controller for a detail view for a specific FDCShot. */
@interface FDCDetailViewController : UIViewController<UIWebViewDelegate>

/*! @brief all view information the shot is here */
@property (weak, nonatomic) FDCShotUIView *shotUIView;

/*! @brief The shot that we must to show to user see its details. */
@property (nonatomic, copy) FDCShot *shotToShow;

/*! @brief holds all view elements about the shot*/
@property (weak, nonatomic) IBOutlet UIView *shotContentView;

@property (weak, nonatomic) IBOutlet UILabel *shotDescriptionLabel;

@property (weak, nonatomic) IBOutlet UILabel *likesCountLabel;

@property (weak, nonatomic) IBOutlet UIImageView *authorImageView;

@property (weak, nonatomic) IBOutlet UILabel *authorNameLabel;

@property (weak, nonatomic) IBOutlet UIWebView *shotDescriptionWebView;

@end
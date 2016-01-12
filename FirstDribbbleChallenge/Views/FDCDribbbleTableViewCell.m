//
//  FDCDribbbleTableViewCell.m
//  FirstDribbbleChallenge
//
//  Created by Rafael Ferreira on 1/11/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//
#import <SDWebImage/UIImageView+WebCache.h>
#import "FDCDribbbleTableViewCell.h"
#import "FDCShotUIView.h"
//#import "UIImageView+AFNetworking.h"


@implementation FDCDribbbleTableViewCell


//- (instancetype)initWithCoder:(NSCoder *)aDecoder
//{
//    self = [super initWithCoder:aDecoder];
//    if (self)
//    {
//        NSBundle *mainBundle = [NSBundle mainBundle];
//        NSArray *loadedViews = [mainBundle loadNibNamed:@"MyView" owner:self options:nil];
//        MyView *loadedSubview = [loadedViews firstObject];
//        
//        [self addSubview:loadedSubview];
//        
//        loadedSubview.translatesAutoresizingMaskIntoConstraints = NO;
//        
//        [self addConstraint:[self pin:loadedSubview attribute:NSLayoutAttributeTop]];
//        [self addConstraint:[self pin:loadedSubview attribute:NSLayoutAttributeLeft]];
//        [self addConstraint:[self pin:loadedSubview attribute:NSLayoutAttributeBottom]];
//        [self addConstraint:[self pin:loadedSubview attribute:NSLayoutAttributeRight]];
//    }
//    return self;
//}

- (NSLayoutConstraint *)pin:(id)item attribute:(NSLayoutAttribute)attribute
{
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:attribute
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:item
                                        attribute:attribute
                                       multiplier:1.0
                                         constant:0.0];
}



- (void)awakeFromNib {
    self.shotUIView = [FDCShotUIView initWithNibClassName];
    
    [self addSubview:self.shotUIView];
    [self.shotUIView constraintTo:self];
    //    self.shotUIView .translatesAutoresizingMaskIntoConstraints = NO;
    //    [self addConstraint:[self pin:self.shotUIView  attribute:NSLayoutAttributeTop]];
    //    [self addConstraint:[self pin:self.shotUIView  attribute:NSLayoutAttributeLeft]];
    //    [self addConstraint:[self pin:self.shotUIView  attribute:NSLayoutAttributeBottom]];
    //    [self addConstraint:[self pin:self.shotUIView  attribute:NSLayoutAttributeRight]];
    //    
    NSLog(@"%@",self.shotUIView);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setUpWithShotModel:(FDCShot *)shot {
    
    if(_shotUIView)
    {
        [_shotUIView setUpWithShotModel:shot];
    }
    
    //    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    //    
    //    NSURL *imageURl = [NSURL URLWithString:[shot getImageURL]];
    //    
    //    __block UIActivityIndicatorView *localActivityIndicator = self.activityIndicator;
    //    localActivityIndicator.center = self.shotImageView.center;
    //    localActivityIndicator.hidesWhenStopped = YES;
    //    [localActivityIndicator startAnimating];
    //    
    //    [self.shotImageView sd_setImageWithURL:imageURl completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
    //        [localActivityIndicator stopAnimating];
    //    }];
    //    
    //    _shotDescriptionLabel.text = shot.title;
    //    _viewsCountLabel.text = [NSString stringWithFormat:@"%lu", [shot.likesCount unsignedIntegerValue]];
}

@end

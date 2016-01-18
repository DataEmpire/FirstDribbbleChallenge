//
//  FDCShotUIView.m
//  FirstDribbbleChallenge
//
//  Created by Douglas Barreto on 1/12/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//
#import <SDWebImage/UIImageView+WebCache.h>
#import "FDCShotUIView.h"

@implementation FDCShotUIView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.shotImageView addSubview:self.activityIndicator];
    
}

- (void)setUpWithShotModel:(FDCShot *)shot {
    NSURL *imageURl = [NSURL URLWithString:[shot getImageURL]];
    __block UIActivityIndicatorView *localActivityIndicator = self.activityIndicator;
    localActivityIndicator.center = self.shotImageView.center;
    localActivityIndicator.hidesWhenStopped = YES;
    [localActivityIndicator startAnimating];
    
    [self.shotImageView sd_setImageWithURL:imageURl completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [localActivityIndicator stopAnimating];
    }];
    
    _shotDescriptionLabel.text = shot.title;
    _viewsCountLabel.text = [NSString stringWithFormat:@"%lu", [shot.likesCount unsignedIntegerValue]];
}

+ (FDCShotUIView *)initWithNibClassName{
    
    return (FDCShotUIView *) [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([FDCShotUIView class]) owner:nil options:0] firstObject];
}


- (NSLayoutConstraint *)pin:(id)item attribute:(NSLayoutAttribute)attribute parent:(UIView *) uiComponent
{
    return [NSLayoutConstraint constraintWithItem:uiComponent
                                        attribute:attribute
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:item
                                        attribute:attribute
                                       multiplier:1.0
                                         constant:0.0];
}


/*@! @brief This method attachs the FDCShotUIView uiComponent*/
- (void)constraintTo:(UIView *) uiComponent {
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [uiComponent addConstraint:[self pin:self  attribute:NSLayoutAttributeTop parent:uiComponent]];
    [uiComponent addConstraint:[self pin:self  attribute:NSLayoutAttributeLeft parent:uiComponent]];
    [uiComponent addConstraint:[self pin:self  attribute:NSLayoutAttributeBottom parent:uiComponent]];
    [uiComponent addConstraint:[self pin:self  attribute:NSLayoutAttributeRight parent:uiComponent]];
}

@end

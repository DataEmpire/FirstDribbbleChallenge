//
//  FDCDribbbleTableViewCell.m
//  FirstDribbbleChallenge
//
//  Created by Rafael Ferreira on 1/11/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import "FDCDribbbleTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@implementation FDCDribbbleTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setUpWithShotModel:(FDCShot *)shot {
    NSURL *teaserImageUrl = [NSURL URLWithString:shot.imageUrls.teaser];
    
    [_shotImageView setImageWithURL:teaserImageUrl];
    
    _shotDescriptionLabel.text = shot.title;
    
    _viewsCountLabel.text = [NSString stringWithFormat:@"%lu", [shot.likesCount unsignedIntegerValue]];
}

@end

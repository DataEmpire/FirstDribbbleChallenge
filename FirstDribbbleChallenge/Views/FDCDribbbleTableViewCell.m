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
    shotDetails = shot;
    
    NSURL *teaserImageUrl = [NSURL URLWithString:shotDetails.imageUrls.teaser];
    
    [self.shotImageView setImageWithURL:teaserImageUrl];
    
    self.shotDescriptionLabel.text = shotDetails.title;
    
    self.viewsCountLabel.text = [NSString stringWithFormat:@"%lu", [shotDetails.likesCount unsignedIntegerValue]];
}

@end

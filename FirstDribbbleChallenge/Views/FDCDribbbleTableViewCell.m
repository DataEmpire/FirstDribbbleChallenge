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

+(CGFloat)cellHeight{
    return 240;
}

-(void)setup:(id)object{
    
}

+(void)registerForTableView:(UITableView*)tableview{
    NSString *identifier = NSStringFromClass(self.class);
    UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
    [tableview registerNib:nib forCellReuseIdentifier:[self cellIdentifier]];
}



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
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setUpWithShotModel:(FDCShot *)shot {
    
    if(_shotUIView)
    {
        [_shotUIView setUpWithShotModel:shot];
    }
}

@end

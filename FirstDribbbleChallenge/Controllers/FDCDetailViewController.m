//
//  ViewController.m
//  FirstDribbbleChallenge
//
//  Created by Rafael Ferreira on 1/11/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import "FDCDetailViewController.h"
#import "UIImageView+AFNetworking.h"

@interface FDCDetailViewController ()

@end

@implementation FDCDetailViewController

#pragma mark - UIViewController methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (_shotToShow) {
        self.title = _shotToShow.title;
        
        [_shotImageView setImageWithURL:[NSURL URLWithString:_shotToShow.imageUrls.hidpi]];
        _shotDescriptionLabel.text = _shotToShow.title;
        _likesCountLabel.text = [NSString stringWithFormat:@"%lu", [_shotToShow.likesCount unsignedIntegerValue]];
        [_authorImageView setImageWithURL:[NSURL URLWithString:_shotToShow.user.avatarUrl]];
        _authorNameLabel.text = _shotToShow.user.name;
        
        [_shotDescriptionWebView loadHTMLString:_shotToShow.shotDescription baseURL:nil];
    }
}

@end
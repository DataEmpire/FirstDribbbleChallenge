//
//  ViewController.m
//  FirstDribbbleChallenge
//
//  Created by Rafael Ferreira on 1/11/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import "FDCDetailViewController.h"

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
    }
}

@end
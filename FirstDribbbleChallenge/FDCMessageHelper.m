//
//  FDCMessageHelper.m
//  FirstDribbbleChallenge
//
//  Created by Douglas Barreto on 1/14/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import "FDCMessageHelper.h"

@implementation FDCMessageHelper

+ (void)showAlertMessage:(NSString *)message showIn: (UIViewController *) viewController{
    UIAlertAction *continueAction = [UIAlertAction actionWithTitle:@"continue" style:UIAlertActionStyleCancel handler:nil];
    UIAlertController *allerViewController = [UIAlertController alertControllerWithTitle:@"Dribbble Viewer" message:message preferredStyle:UIAlertControllerStyleAlert];
    [allerViewController addAction:continueAction];
    
    [viewController presentViewController:allerViewController animated:YES completion:nil];
}


@end

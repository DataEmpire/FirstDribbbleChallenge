//
//  FDCMessageHelper.h
//  FirstDribbbleChallenge
//
//  Created by Douglas Barreto on 1/14/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface FDCMessageHelper : NSObject
+ (void)showAlertMessage:(NSString *)message showIn: (UIViewController *) viewController;
@end

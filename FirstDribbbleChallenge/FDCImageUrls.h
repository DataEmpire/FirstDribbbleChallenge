//
//  FDCImageUrls.h
//  FirstDribbbleChallenge
//
//  Created by Douglas Barreto on 1/11/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface FDCImageUrls : MTLModel<MTLJSONSerializing>

#pragma mark - Model Strings

@property (nonatomic, copy) NSString *hidpi;
@property (nonatomic, copy) NSString *normal;
@property (nonatomic, copy) NSString *teaser;

@end

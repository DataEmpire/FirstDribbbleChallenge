//
//  FDCLinks.h
//  FirstDribbbleChallenge
//
//  Created by Douglas Barreto on 1/11/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface FDCLinks : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString *web;
@property (nonatomic, copy) NSString *twitter;

@end

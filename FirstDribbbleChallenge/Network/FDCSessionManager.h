//
//  FDCSessionManager.h
//  FirstDribbbleChallenge
//
//  Created by Rafael Ferreira on 1/11/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
/*! @brief The custom session manager for network requests. */
@interface FDCSessionManager : AFHTTPSessionManager

/*! @brief The singleton for generate and manager the custom AFHTTPSessionManager. */
+ (instancetype)sharedManager;

@end

//
//  FDCSessionManager+Shots.h
//  FirstDribbbleChallenge
//
//  Created by Rafael Ferreira on 1/11/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import "FDCSessionManager.h"
#import "FDCShot.h"

typedef void(^FDCDribbbleSuccessBlock)(id responseModel);

typedef void(^FDCDribbbleFailureBlock)(NSError *error);

/*! @brief The methods for Shots requests. */
@interface FDCSessionManager (Shots)

- (NSURLSessionDataTask *) getShotsOnPage:(NSNumber *)page success:(FDCDribbbleSuccessBlock)success failure:(FDCDribbbleFailureBlock)failure;

@end

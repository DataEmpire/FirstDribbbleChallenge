//
//  FDCSessionManager+Shots.m
//  FirstDribbbleChallenge
//
//  Created by Rafael Ferreira on 1/11/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import "FDCSessionManager+Shots.h"
#import "FDCConstants.h"

@implementation FDCSessionManager (Shots)

- (NSURLSessionDataTask *) getShotsOnPage:(NSNumber *)page success:(FDCDribbbleSuccessBlock)success failure:(FDCDribbbleFailureBlock)failure {
    NSDictionary *parameters = @{
                                 @"access_token": kClientAccessToken,
                                 @"page": page
                                 };
    
    return [self GET:kShotsEndPoint parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

@end
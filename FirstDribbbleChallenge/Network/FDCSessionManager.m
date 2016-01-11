//
//  FDCSessionManager.m
//  FirstDribbbleChallenge
//
//  Created by Rafael Ferreira on 1/11/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import "FDCSessionManager.h"
#import "FDCConstants.h"

@implementation FDCSessionManager

- (instancetype)init {
    NSURLSessionConfiguration *defaultConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    self = [super initWithBaseURL:[NSURL URLWithString:kDribbleBaseURL] sessionConfiguration:defaultConfiguration];
    
    if (self) {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        
        self.securityPolicy.allowInvalidCertificates = YES;
        self.securityPolicy.validatesDomainName = NO;
    }
    
    return self;
}

+ (instancetype)sharedManager {
    static FDCSessionManager *_sessionManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sessionManager = [self new];
    });
    
    return _sessionManager;
}

@end

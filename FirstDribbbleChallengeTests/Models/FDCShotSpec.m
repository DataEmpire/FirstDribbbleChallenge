//
//  FDCShotSpec.m
//  FirstDribbbleChallenge
//
//  Created by Rafael Ferreira on 1/14/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <TLJsonFactory/TLJsonFactory.h>
#import <OCMock/OCMock.h>

#import "FDCShot.h"

SpecBegin(FDCShotSpec)

describe(@"FDCShot", ^{
    __block FDCShot *shot;
    __block NSError *errorOnParse;
    
    beforeAll(^{
        NSDictionary *dictionary = [TLJsonFactory tl_jsonDictFromFile:@"Shot"];
        
        shot = [FDCShot parse:dictionary error:&errorOnParse];
    });
    
    it(@"should be able to parse", ^{
        expect(shot).toNot.beNil;
    });
});

SpecEnd
//
//  FDCImageUrlsSpec.m
//  FirstDribbbleChallenge
//
//  Created by Rafael Ferreira on 1/15/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <TLJsonFactory/TLJsonFactory.h>
#import <OCMock/OCMock.h>

#import "FDCImageUrls.h"

SpecBegin(FDCImageUrlsSpec)

describe(@"FDCImageUrls", ^{
    __block FDCImageUrls *imageUrls;
    __block NSError *errosOnParse;
    
    beforeAll(^{
        NSDictionary *dictionary = [TLJsonFactory tl_jsonDictFromFile:@"ImageUrls"];
        
        imageUrls = [FDCImageUrls parse:dictionary error:&errosOnParse];
    });
    
    it(@"should be able to parse", ^{
        expect(imageUrls).toNot.beNil;
    });
    
    it(@"should contain urls", ^{
        expect(imageUrls.hidpi).toNot.beNil;
        expect(imageUrls.normal).toNot.beNil;
        expect(imageUrls.teaser).toNot.beNil;
    });
    
    it(@"should contain a valid url for images", ^{
        NSArray *urls = @[imageUrls.teaser, imageUrls.normal, imageUrls.hidpi];
        NSArray *validExtensions = @[@"png", @"gif", @"jpg"];
        
        [urls enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSURL *url = [NSURL URLWithString:obj];
            NSString *extension = [NSString stringWithFormat:@"%@", url.pathExtension];
            
            expect(validExtensions).to.contain(extension);
        }];
    });
});

SpecEnd
//
//  ViewController.m
//  FirstDribbbleChallenge
//
//  Created by Rafael Ferreira on 1/11/16.
//  Copyright © 2016 Data Empire. All rights reserved.
//

#import "FDCDetailViewController.h"
#import "UIImageView+AFNetworking.h"

@interface FDCDetailViewController ()

@end

@implementation FDCDetailViewController

- (NSString*)applyFontToHtmlString:(NSString *)html fontFamily:(NSString *)fontName fontSize:(CGFloat)fontSize {
    if (!html) {
        return nil;
    }
    
    return [NSString stringWithFormat:@"<span style=\"font-family: '%@'; font-size: %i; font-weight: %@;\">%@</span>",
            fontName, (int)fontSize, @"lighter", html];
}

#pragma mark - UIWebViewDelegate methods

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        [[UIApplication sharedApplication] openURL:request.URL];
        
        return NO;
    }
    
    return YES;
}

#pragma mark - UIViewController methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (_shotToShow) {
        self.title = _shotToShow.title;
        
        [_shotImageView setImageWithURL:[NSURL URLWithString:_shotToShow.imageUrls.hidpi]];
        _shotDescriptionLabel.text = _shotToShow.title;
        _likesCountLabel.text = [NSString stringWithFormat:@"%lu", [_shotToShow.likesCount unsignedIntegerValue]];
        [_authorImageView setImageWithURL:[NSURL URLWithString:_shotToShow.user.avatarUrl]];
        _authorNameLabel.text = _shotToShow.user.name;
        
        NSString *htmlWithFixedFont = [self applyFontToHtmlString:_shotToShow.shotDescription fontFamily:@"Helvetica" fontSize:18];
        
        [_shotDescriptionWebView loadHTMLString:htmlWithFixedFont baseURL:nil];
    }
}

@end
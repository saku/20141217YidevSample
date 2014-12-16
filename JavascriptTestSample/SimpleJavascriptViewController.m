//
//  SimpleJavascriptViewController.m
//  JavascriptTestSample
//
//  Created by saku on 2014/12/17.
//  Copyright (c) 2014年 Retty Inc. All rights reserved.
//

#import "SimpleJavascriptViewController.h"

@interface SimpleJavascriptViewController ()

@end

@implementation SimpleJavascriptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.webView loadHTMLString:[self htmlStringWithFileName:@"simpleJavascript"] baseURL:[self baseURL]];
}

@end

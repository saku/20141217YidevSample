//
//  HandlebarsSampleViewController.m
//  JavascriptTestSample
//
//  Created by saku on 2014/12/17.
//  Copyright (c) 2014年 Retty Inc. All rights reserved.
//

#import "HandlebarsSampleViewController.h"

@interface HandlebarsSampleViewController ()

@end

@implementation HandlebarsSampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.webView loadHTMLString:[self htmlStringWithFileName:@"handlebarsSample"] baseURL:[self baseURL]];
}

@end

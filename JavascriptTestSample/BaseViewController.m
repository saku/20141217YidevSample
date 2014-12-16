//
//  BaseViewController.m
//  JavascriptTestSample
//
//  Created by saku on 2014/12/17.
//  Copyright (c) 2014年 Retty Inc. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (NSString *)htmlStringWithFileName:(NSString *)fileName
{
    NSString *inFile =
    [NSString stringWithContentsOfFile:
     [[NSBundle mainBundle] pathForResource:fileName
                                     ofType:@"html"
                                inDirectory:@"www/html"]
                              encoding:NSUTF8StringEncoding
                                 error:nil];
    
    return inFile;
}

- (NSURL *)baseURL
{
    return [NSURL fileURLWithPath:[[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"www/html"]];
}

@end

//
//  BaseViewController.h
//  JavascriptTestSample
//
//  Created by saku on 2014/12/17.
//  Copyright (c) 2014年 Retty Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIWebView *webView;

- (NSString *)htmlStringWithFileName:(NSString *)fileName;
- (NSURL *)baseURL;

@end

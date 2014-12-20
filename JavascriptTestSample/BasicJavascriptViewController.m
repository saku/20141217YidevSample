//
//  BasicJavascriptViewController.m
//  JavascriptTestSample
//
//  Created by saku on 2014/12/20.
//  Copyright (c) 2014年 Retty Inc. All rights reserved.
//

#import "BasicJavascriptViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface BasicJavascriptViewController()

@property (nonatomic, weak) IBOutlet UILabel *sourceLabel;
@property (nonatomic, weak) IBOutlet UILabel *targetLabel;

@end

@implementation BasicJavascriptViewController

- (void)viewDidLoad {
    JSContext *context = [[JSContext alloc] init];
    
    JSValue *value = [context evaluateScript:[NSString stringWithFormat:@"encodeURIComponent('%@');", self.sourceLabel.text]];
    self.targetLabel.text = value.toString;
}

@end

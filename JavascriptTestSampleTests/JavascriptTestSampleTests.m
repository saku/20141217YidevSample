//
//  JavascriptTestSampleTests.m
//  JavascriptTestSampleTests
//
//  Created by saku on 2014/12/17.
//  Copyright (c) 2014年 Retty Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <JavaScriptCore/JavaScriptCore.h>

#define EXP_SHORTHAND
#import <Expecta.h>

@interface JavascriptTestSampleTests : XCTestCase

@end

static JSContext *context;

@implementation JavascriptTestSampleTests

- (void)setUp {
    [super setUp];

    context = [[JSContext alloc] init];
    
    NSString *script;
    script = [NSString stringWithContentsOfFile:
              [[NSBundle mainBundle] pathForResource:@"simple-script"
                                              ofType:@"js"
                                         inDirectory:@"www/js"]
                                       encoding:NSUTF8StringEncoding
                                          error:NULL];
    [context evaluateScript:script];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testgenerateUrlNoParameters {
    JSValue *value;
    
    // no options.
    value = [context evaluateScript:@"generateUrl('http://example.com', 'hoge');"];
    expect(value.toString).to.equal(@"http://example.com/hoge/");
}

- (void)testgenerateUrlFull {
    JSValue *value;

    // no options.
    value = [context evaluateScript:@"generateUrl('http://example.com', 'hoge', { foo : 'bar', baz : 'zoo' });"];
    expect(value.toString).to.equal(@"http://example.com/hoge/?foo=bar&baz=zoo");
}

@end

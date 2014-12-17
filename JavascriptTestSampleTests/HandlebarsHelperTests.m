//
//  HandlebarsHelperTests.m
//  Retty
//
//  Created by saku on 2014/12/04.
//  Copyright (c) 2014年 Retty Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <JavaScriptCore/JavaScriptCore.h>

#define EXP_SHORTHAND
#import <Expecta.h>

@interface HandlebarsHelperTests : XCTestCase

@end

static JSContext *context;

@implementation HandlebarsHelperTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    context = [[JSContext alloc] init];
    
    NSString *script;
    script = [NSString stringWithContentsOfFile:
              [[NSBundle mainBundle] pathForResource:@"handlebars-2.0.0.min"
                                              ofType:@"js"
                                         inDirectory:@"www/js"]
                                       encoding:NSUTF8StringEncoding
                                          error:NULL];
    [context evaluateScript:script];
    script = [NSString stringWithContentsOfFile:
              [[NSBundle mainBundle] pathForResource:@"handlebars-helper"
                                              ofType:@"js"
                                         inDirectory:@"www/js"]
                                       encoding:NSUTF8StringEncoding
                                          error:NULL];
    [context evaluateScript:script];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - test for "==" condition.
#define EQUAL_CONDITION_STRING @"=="

// "hoge" == "hoge" to true
- (void)testIsValidForStringEqualTrue {
    [self compareForEqualHelper:EQUAL_CONDITION_STRING
                     paramValue:@"\"hoge\""
                   compareValue:@"\"hoge\""
                 expectedResult:true];
}

// "ho" == "hoge" to false
- (void)testIsValidForStringEqualFalse {
    [self compareForEqualHelper:EQUAL_CONDITION_STRING
                     paramValue:@"\"ho\""
                   compareValue:@"\"hoge\""
                 expectedResult:false];
}

// 100 == 100 to true
- (void)testIsValidForNumericEqualTrue {
    [self compareForEqualHelper:EQUAL_CONDITION_STRING
                     paramValue:@"100"
                   compareValue:@"100"
                 expectedResult:true];
}

// 10 == 100 to false
- (void)testIsValidForNumericEqualFalse {
    [self compareForEqualHelper:EQUAL_CONDITION_STRING
                     paramValue:@"10"
                   compareValue:@"100"
                 expectedResult:false];
}

// 0 == false to true
- (void)testIsValidForNumericVsBoolEqualTrue {
    [self compareForEqualHelper:EQUAL_CONDITION_STRING
                     paramValue:@"0"
                   compareValue:@"false"
                 expectedResult:true];
}

// undefined == false to true
- (void)testIsValidForUndefinedVsBoolEqualTrue {
    [self compareForEqualHelper:EQUAL_CONDITION_STRING
                     paramValue:@"undefined"
                   compareValue:@"false"
                 expectedResult:true];
}

#pragma mark - test for "<" condition.
#define LESS_CONDITION_STRING @"<"

// 1 < 2 to true
- (void)testIsValidForNumeric1vs2GreaterTrue {
    [self compareForEqualHelper:LESS_CONDITION_STRING
                     paramValue:@"1"
                   compareValue:@"2"
                 expectedResult:true];
}

// 2 < 2 to false
- (void)testIsValidForNumeric2vs2GreaterFalse {
    [self compareForEqualHelper:LESS_CONDITION_STRING
                     paramValue:@"2"
                   compareValue:@"2"
                 expectedResult:false];
}

// undefined(0) < 2 to true
- (void)testIsValidForUndefinedvs2GreaterTrue {
    [self compareForEqualHelper:LESS_CONDITION_STRING
                     paramValue:@"undefined"
                   compareValue:@"2"
                 expectedResult:true];
}


// "" < 2 to true
- (void)testIsValidForEmptyStringvs2GreaterTrue {
    [self compareForEqualHelper:LESS_CONDITION_STRING
                     paramValue:@"\"\""
                   compareValue:@"2"
                 expectedResult:true];
}

#pragma mark - test for "<" condition.
#define LESS_EQUAL_CONDITION_STRING @"<="

// 1 <= 2 to true
- (void)testIsValidForNumeric1vs2GreaterEqualTrue {
    [self compareForEqualHelper:LESS_EQUAL_CONDITION_STRING
                     paramValue:@"1"
                   compareValue:@"2"
                 expectedResult:true];
}

// 2 <= 2 to true
- (void)testIsValidForNumeric2vs2GreaterEqualTrue {
    [self compareForEqualHelper:LESS_EQUAL_CONDITION_STRING
                     paramValue:@"2"
                   compareValue:@"2"
                 expectedResult:true];
}

// 3 <= 2 to true
- (void)testIsValidForNumeric2vs3GreaterEqualFalse {
    [self compareForEqualHelper:LESS_EQUAL_CONDITION_STRING
                     paramValue:@"3"
                   compareValue:@"2"
                 expectedResult:false];
}

// undefined(0) <= 2 to true
- (void)testIsValidForUndefinedvs2GreaterEqualTrue {
    [self compareForEqualHelper:LESS_EQUAL_CONDITION_STRING
                     paramValue:@"undefined"
                   compareValue:@"2"
                 expectedResult:true];
}

// "" <= 2 to true
- (void)testIsValidForEmptyStringvs2GreaterEqualTrue {
    [self compareForEqualHelper:LESS_EQUAL_CONDITION_STRING
                     paramValue:@"\"\""
                   compareValue:@"2"
                 expectedResult:true];
}

#pragma mark - test for ">" condition.
#define GREATER_CONDITION_STRING @">"

// 2 > 1 to true
- (void)testIsValidForNumeric2vs1LessTrue {
    [self compareForEqualHelper:GREATER_CONDITION_STRING
                     paramValue:@"2"
                   compareValue:@"1"
                 expectedResult:true];
}

// 2 > 2 to false
- (void)testIsValidForNumeric2vs2LessFalse {
    [self compareForEqualHelper:GREATER_CONDITION_STRING
                     paramValue:@"2"
                   compareValue:@"2"
                 expectedResult:false];
}

// undefined(0) > 2 to false
- (void)testIsValidForUndefinedvs2LessFalse {
    [self compareForEqualHelper:GREATER_CONDITION_STRING
                     paramValue:@"undefined"
                   compareValue:@"2"
                 expectedResult:false];
}


// "" > 2 to false
- (void)testIsValidForEmptyStringvs2LessFalse {
    [self compareForEqualHelper:GREATER_CONDITION_STRING
                     paramValue:@"\"\""
                   compareValue:@"2"
                 expectedResult:false];
}

#pragma mark - test for ">=" condition.
#define GREATER_EQUAL_CONDITION_STRING @">="

// 2 >= 1 to true
- (void)testIsValidForNumeric2vs1LessEqualTrue {
    [self compareForEqualHelper:GREATER_EQUAL_CONDITION_STRING
                     paramValue:@"2"
                   compareValue:@"1"
                 expectedResult:true];
}

// 2 >= 2 to true
- (void)testIsValidForNumeric2vs2LessEqualTrue {
    [self compareForEqualHelper:GREATER_EQUAL_CONDITION_STRING
                     paramValue:@"2"
                   compareValue:@"2"
                 expectedResult:true];
}

// 2 >= 3 to false
- (void)testIsValidForNumeric2vs3LessEqualFalse {
    [self compareForEqualHelper:GREATER_EQUAL_CONDITION_STRING
                     paramValue:@"2"
                   compareValue:@"3"
                 expectedResult:false];
}

// undefined(0) >= 2 to false
- (void)testIsValidForUndefinedvs2LessEqualFalse {
    [self compareForEqualHelper:GREATER_EQUAL_CONDITION_STRING
                     paramValue:@"undefined"
                   compareValue:@"2"
                 expectedResult:false];
}


// "" >= 2 to false
- (void)testIsValidForEmptyStringvs2LessEqualFalse {
    [self compareForEqualHelper:GREATER_EQUAL_CONDITION_STRING
                     paramValue:@"\"\""
                   compareValue:@"2"
                 expectedResult:false];
}

#pragma mark - test for "typeof" condition.
#define TYPEOF_CONDITION_STRING @"typeof"

// null typeof "object" to true
- (void)testIsValidForNullTypeofToBeObject {
    [self compareForEqualHelper:TYPEOF_CONDITION_STRING
                     paramValue:@"null"
                   compareValue:@"\"object\""
                 expectedResult:true];
}

// "hoge" typeof "string" to true
- (void)testIsValidForStringTypeofToBeString {
    [self compareForEqualHelper:TYPEOF_CONDITION_STRING
                     paramValue:@"\"hoge\""
                   compareValue:@"\"string\""
                 expectedResult:true];
}

// true typeof "boolean" to true
- (void)testIsValidForBoolTrueTypeofToBeBoolean {
    [self compareForEqualHelper:TYPEOF_CONDITION_STRING
                     paramValue:@"true"
                   compareValue:@"\"boolean\""
                 expectedResult:true];
}

// false typeof "boolean" to true
- (void)testIsValidForBoolFalseTypeofToBeBoolean {
    [self compareForEqualHelper:TYPEOF_CONDITION_STRING
                     paramValue:@"false"
                   compareValue:@"\"boolean\""
                 expectedResult:true];
}

// 1 typeof "numeric" to true
- (void)testIsValidForNumericTypeofToBeNumber {
    [self compareForEqualHelper:TYPEOF_CONDITION_STRING
                     paramValue:@"1"
                   compareValue:@"\"number\""
                 expectedResult:true];
}

// -1 typeof "numeric" to true
- (void)testIsValidForNegativeNumericTypeofToBeNumber {
    [self compareForEqualHelper:TYPEOF_CONDITION_STRING
                     paramValue:@"-1"
                   compareValue:@"\"number\""
                 expectedResult:true];
}

// undefined typeof "undefined" to true
- (void)testIsValidForUndefinedTypeofToBeUndefined {
    [self compareForEqualHelper:TYPEOF_CONDITION_STRING
                     paramValue:@"undefined"
                   compareValue:@"\"undefined\""
                 expectedResult:true];
}

- (void)compareForEqualHelper:(NSString *)conditionString
                   paramValue:(NSString *)paramValue
                 compareValue:(NSString *)compareValue
               expectedResult:(BOOL)expectedResult {
    NSString *value;
    
    NSString *sourceString = [NSString stringWithFormat:@"var source = '{{#ifCond value \"%@\" %@}}hoge{{else}}fuga{{/ifCond}}';", conditionString, compareValue];
    NSString *paramsString = [NSString stringWithFormat:@"var params = { value : %@ };", paramValue];
    [context evaluateScript:sourceString];
    [context evaluateScript:paramsString];
    [context evaluateScript:@"var template = Handlebars.compile(source);"];
    
    value = [context evaluateScript:@"template(params);"].toString;
    
    if (expectedResult) {
        expect(value).to.equal(@"hoge");
    } else {
        expect(value).to.equal(@"fuga");
    }
}

@end

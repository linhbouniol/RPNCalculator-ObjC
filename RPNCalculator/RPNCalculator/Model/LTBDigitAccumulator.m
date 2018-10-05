//
//  LTBDigitAccumulator.m
//  RPNCalculator
//
//  Created by Linh Bouniol on 10/4/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

#import "LTBDigitAccumulator.h"

@interface LTBDigitAccumulator ()

@property (nonatomic) NSMutableArray<NSString *> *digits;

@end

@implementation LTBDigitAccumulator

- (instancetype)init
{
    self = [super init];
    if (self) {
        _digits = [[NSMutableArray alloc] init];
    }
    return self;
}


- (void)addDigitWithNumericValue:(NSInteger)digitValue
{
    if (digitValue >= 0 && digitValue <= 9) {
        [self.digits addObject:[NSString stringWithFormat:@"%li", (long)digitValue]];
    }
}

- (void)addDecimalPoint
{
    if (![self.digits containsObject:@"."]) {
        // If the digits don't contain a decimal point yet, then add it
        [self.digits addObject:@"."];
    }
}

- (void)clear
{
    [self.digits removeAllObjects];
}

- (double)value
{
    NSString *stringValue = [self.digits componentsJoinedByString:@""];
    return stringValue.doubleValue;
}

/*
 We want to store the digits as a string in the array, then we can join the strings and get a string representation of the final number, and call .doubleValue to turn the string into a double, which is the type that we want.
 */



@end

//
//  LTBCalculator.m
//  RPNCalculator
//
//  Created by Linh Bouniol on 10/4/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

#import "LTBCalculator.h"
#import "LTBStack.h"

@interface LTBCalculator ()

@property (nonatomic) LTBStack<NSNumber *> *stack;

// if we want to use double, int, float, long, unsigned int, unsigned long, long long, char, BOOL, we need to use NSNumber type. To convert any of these to NSNumber, use @(variable). To get the type we want back from NSNumber, user .doubleValue, .intValue, .boolValue, etc.
// None of these types are ObjC, so we need to put them in NSNumber, which is ObjC, same goes for NSInteger.
// But,...
// If we have an NSInteger and put it inside NSNumber, need to use .integerValue to get back out.

@end

@implementation LTBCalculator

//@synthesize topValue = _topValue;

- (double)topValue
{
//    return _topValue;
    
    return [self.stack peek].doubleValue;
}

- (void)pushNumber:(double)value
{
    [self.stack push:@(value)];
}

- (void)applyOperator:(LTBOperator)operator
{
    double operant2 = [self.stack pop].doubleValue;
    double operant1 = [self.stack pop].doubleValue;
    
    double result = 0;
    
    switch (operator) {
        case LTBOperatorAdd:
            result = operant1 + operant2;
            break;
        case LTBOperatorSubtract:
            result = operant1 - operant2;
            break;
        case LTBOperatorMultiply:
            result = operant1 * operant2;
            break;
        case LTBOperatorDivide:
            result = operant1 / operant2;
            break;
    }
    
    [self.stack push:@(result)];
}

- (void)clear
{
    self.stack = [[LTBStack alloc] initWithArray:@[@0.0, @0.0]];
}

@end

//
//  LTBCalculator.h
//  RPNCalculator
//
//  Created by Linh Bouniol on 10/4/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LTBOperator) {
    LTBOperatorAdd,     // LTBOperatorAdd = 0 to be more cleared
    LTBOperatorSubtract,
    LTBOperatorMultiply,
    LTBOperatorDivide // 0, 1, 2, 3 raw values
};

NS_ASSUME_NONNULL_BEGIN

@interface LTBCalculator : NSObject

- (void)pushNumber:(double)value;
- (void)applyOperator:(LTBOperator)operator;
- (void)clear;

@property (nonatomic, readonly) double topValue;

@end

NS_ASSUME_NONNULL_END

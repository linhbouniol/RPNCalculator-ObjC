//
//  LTBDigitAccumulator.h
//  RPNCalculator
//
//  Created by Linh Bouniol on 10/4/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LTBDigitAccumulator : NSObject

- (void)addDigitWithNumericValue:(NSInteger)digitValue;
- (void)addDecimalPoint;
- (void)clear;

@property (nonatomic, readonly) double value;

@end

NS_ASSUME_NONNULL_END

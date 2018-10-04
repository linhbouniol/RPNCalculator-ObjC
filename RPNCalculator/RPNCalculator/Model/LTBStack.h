//
//  LTBStack.h
//  RPNCalculator
//
//  Created by Linh Bouniol on 10/4/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LTBStack<ObjectType> : NSObject

- (void)push:(ObjectType)value;
- (ObjectType)pop;
- (ObjectType)peek; // what is this supposed to do? peek into the stack

- (instancetype)initWithArray:(NSArray<ObjectType> *)array;

@end

NS_ASSUME_NONNULL_END

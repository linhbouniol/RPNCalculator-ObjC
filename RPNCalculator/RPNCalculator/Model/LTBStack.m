//
//  LTBStack.m
//  RPNCalculator
//
//  Created by Linh Bouniol on 10/4/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

#import "LTBStack.h"

@interface LTBStack ()

@property (nonatomic) NSMutableArray *values;

@end

@implementation LTBStack

#pragma mark - Methods

- (void)push:(id)value
{
    [self.values addObject:value];
}

- (id)pop
{
    id lastObject = self.values.lastObject;
    
    [self.values removeLastObject];
    
    return lastObject;
}

- (id)peek
{
    return [self.values lastObject];
}

#pragma mark - Initializers

- (instancetype)initWithArray:(NSArray *)array
{
    if (self = [super init]) {
        self.values = [[NSMutableArray alloc] initWithArray:array]; // create a new mutableArray
    }
    return self;
    
}

@end

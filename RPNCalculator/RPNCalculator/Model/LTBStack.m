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

- (instancetype)init
{
    return [self initWithArray:@[]];
}

- (instancetype)initWithArray:(NSArray *)array
{
    if (self = [super init]) {
        self.values = [[NSMutableArray alloc] initWithArray:array]; // create a new mutableArray
    }
    return self;
}

/*
 initWithArray is the designated initializer, since its calling super init, so we need the regular initializer to call the designated one.
 The new mutable array isn't set up because no one was calling the initWithArray, so we have the regular init, which is given to us by the NSObject, call it.
 The NSObject has an init, if we don't do anything with it, its just there.
 */

@end

//
//  LTBCalculatorViewController.m
//  RPNCalculator
//
//  Created by Linh Bouniol on 10/4/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

#import "LTBCalculatorViewController.h"
#import "LTBCalculator.h"
#import "LTBDigitAccumulator.h"

@interface LTBCalculatorViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (nonatomic) NSNumberFormatter *numberFormatter;
@property (nonatomic) LTBCalculator *calculator;
@property (nonatomic) LTBDigitAccumulator *digitAccumulator;

@end

@implementation LTBCalculatorViewController

#pragma mark - Actions

- (IBAction)numberButtonTapped:(UIButton *)sender
{
    [self.digitAccumulator addDigitWithNumericValue:sender.tag];
    [self updateDigitAccumulatorValue];
}

- (IBAction)decimalButtonTapped:(UIButton *)sender
{
    [self.digitAccumulator addDecimalPoint];
    [self updateDigitAccumulatorValue];
}

- (IBAction)returnButtonTapped:(UIButton *)sender
{
//    if (self.digitAccumulator.value) {
        [self.calculator pushNumber:self.digitAccumulator.value];
        [self updateCalculatorValue];
//    }
    [self.digitAccumulator clear];
}

- (IBAction)divideButtonTapped:(UIButton *)sender
{
    [self returnButtonTapped:sender];
    [self.calculator applyOperator:LTBOperatorDivide];
    [self updateCalculatorValue];
}

- (IBAction)multiplyButtonTapped:(UIButton *)sender
{
    [self returnButtonTapped:sender];
    [self.calculator applyOperator:LTBOperatorMultiply];
    [self updateCalculatorValue];
}

- (IBAction)subtractButtonTapped:(UIButton *)sender
{
    [self returnButtonTapped:sender];
    [self.calculator applyOperator:LTBOperatorSubtract];
    [self updateCalculatorValue];
}

- (IBAction)plusButtonTapped:(UIButton *)sender
{
    [self returnButtonTapped:sender];
    [self.calculator applyOperator:LTBOperatorAdd];
    [self updateCalculatorValue];
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.numberFormatter = [[NSNumberFormatter alloc] init];
//    self.numberFormatter.allowsFloats = YES;
    [self.numberFormatter setAllowsFloats:YES];
    [self.numberFormatter setMaximumIntegerDigits:20];
    [self.numberFormatter setMinimumFractionDigits:0];
    [self.numberFormatter setMaximumFractionDigits:20];
    
    // initializer calculator and digit accumulator
    self.calculator = [[LTBCalculator alloc] init];
    self.digitAccumulator = [[LTBDigitAccumulator alloc] init];
    
    /*
     Normally, in Swift we can give a value directly to the property (let something = Something()), but in ObjC, we need to set up each property before we can use it. Normally, we would do it in the initializers (initWithNibName, initWithCoder) that apply to the class, but since we are in a UIViewController, and since the properties are internal/private, and will only be used after the view is loaded, we can use the fact that ViewDidLoad is called only once, and initialize the properties there.
     */
    
}

#pragma mark - Methods

- (void)updateCalculatorValue
{
//    if (self.calculator.topValue) {
        self.textField.text = [self.numberFormatter stringFromNumber:@(self.calculator.topValue)];
//    } else {
//        self.textField.text = @"";
//    }
}

- (void)updateDigitAccumulatorValue
{
//    if (self.digitAccumulator.value) {
        self.textField.text = [self.numberFormatter stringFromNumber:@(self.digitAccumulator.value)];
//    } else {
//        self.textField.text = @"";
//    }
}

/*
 Normally, in Swift we can observe a property for changes and call whatever is in didSet to update the value, but in ObjC, we have to do it manually.
 Here, we created two methods that will update the text field when the calculator value or digit accumulator value changes, and call those methods wherever we need them.
In Swift version, we need to check to make sure the values are not nil, but in ObjC, we are returning a double which is no an optional. (All classes are optionals, but double, float, int, bool, etc are not optionals).
 Here, if (self.digitAccumulator.value) is going to return true, so if the value happens to be "0", if (0) will return false, and it will skip the if statement and the text field will not be shown "0", so we remove the if statement.
 */

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    [self.calculator clear];
    [self.digitAccumulator clear];

    return YES;
}

@end

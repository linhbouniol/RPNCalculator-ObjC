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
    if (self.digitAccumulator.value) {
        [self.calculator pushNumber:self.digitAccumulator.value];
        [self updateCalculatorValue];
    }
    [self.digitAccumulator clear];
}

- (IBAction)divideButtonTapped:(UIButton *)sender
{
    [self returnButtonTapped:sender];
    [self.calculator applyOperator:LTBOperatorDivide];
}

- (IBAction)multiplyButtonTapped:(UIButton *)sender
{
    [self returnButtonTapped:sender];
    [self.calculator applyOperator:LTBOperatorMultiply];
}

- (IBAction)subtractButtonTapped:(UIButton *)sender
{
    [self returnButtonTapped:sender];
    [self.calculator applyOperator:LTBOperatorSubtract];
}

- (IBAction)plusButtonTapped:(UIButton *)sender
{
    [self returnButtonTapped:sender];
    [self.calculator applyOperator:LTBOperatorAdd];
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

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    // clear calculator

    return YES;
}

@end

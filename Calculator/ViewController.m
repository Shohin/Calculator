//
//  ViewController.m
//  Calculator
//
//  Created by Admin on 19.02.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"

@interface ViewController ()
{
    BOOL isBeforePressedANumber;
    CalculatorBrain *brain;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    brain = [[CalculatorBrain alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = sender.titleLabel.text;
    NSString *lblText = self.resultLabel.text;
    BOOL isPressedDot = [digit isEqualToString:@"."];
    if (isPressedDot) {
        if ([lblText rangeOfString:@"."].location != NSNotFound) {
            digit = @"";
        }
    }
    
    if (isBeforePressedANumber) {
        self.resultLabel.text = [lblText stringByAppendingString:digit];
    } else {
        if (isPressedDot) {
            digit = [@"0" stringByAppendingString:digit];
        }
        self.resultLabel.text = digit;
        isBeforePressedANumber = YES;
    }
}

- (IBAction)operandPressed:(UIButton *)sender {
    if (isBeforePressedANumber) {
        isBeforePressedANumber = NO;
    }
    brain.operand = [self.resultLabel.text doubleValue];
    double r = [brain performOperand:sender.titleLabel.text];
    self.resultLabel.text = [NSString stringWithFormat:@"%g", r];
}

- (IBAction)utilitiesPressed:(UIButton *)sender {
    NSString *senderTxt = sender.titleLabel.text;
    NSString *lblText = self.resultLabel.text;
    
    if ([senderTxt isEqualToString:@"C"]) {
        self.resultLabel.text = @"";
        isBeforePressedANumber = NO;
    } else if ([senderTxt isEqualToString:@"←"]) {
        if (lblText.length > 0) {
            lblText = [lblText substringWithRange:NSMakeRange(0, lblText.length - 1)];
            if ([lblText isEqualToString:@"-"]) {
                lblText = @"";
            }
            self.resultLabel.text = lblText;
        } else {
            isBeforePressedANumber = NO;
        }
    } else if ([senderTxt isEqualToString:@"±"]) {
        if (lblText.length > 0 && [lblText doubleValue] != 0) {
            if ([lblText rangeOfString:@"-"].location == NSNotFound) {
                lblText = [@"-" stringByAppendingString:lblText];
            } else {
                lblText = [lblText substringFromIndex:1];
            }
            self.resultLabel.text = lblText;
        }
    }
}

@end

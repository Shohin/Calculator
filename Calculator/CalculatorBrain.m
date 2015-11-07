//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Admin on 19.02.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "CalculatorBrain.h"
@interface CalculatorBrain ()
{
    double waitingOperand;
    NSString *waitingOperation;
    
}
@end
@implementation CalculatorBrain

- (double)performOperand:(NSString *)operation
{
    if ([operation isEqualToString:@"√"]) {
        self.operand = sqrt(self.operand);
    } else if ([operation isEqualToString:@"x^2"]) {
        self.operand = self.operand * self.operand;
    } else if ([operation isEqualToString:@"1/x"]) {
        if (self.operand) {
            self.operand = 1 / self.operand;
        }
    } else {
        [self performOperation];
        waitingOperation = operation;
        waitingOperand = self.operand;
    }
    return self.operand;
}

- (void)performOperation
{
    if ([waitingOperation isEqualToString:@"+"]) {
        self.operand = waitingOperand + self.operand;
    } else if ([waitingOperation isEqualToString:@"-"]) {
        self.operand = waitingOperand - self.operand;
    } else if ([waitingOperation isEqualToString:@"×"]) {
        self.operand = waitingOperand * self.operand;
    } else if ([waitingOperation isEqualToString:@"÷"]) {
        if (self.operand != 0) {
            self.operand = waitingOperand / self.operand;
        }
    } else if ([waitingOperation isEqualToString:@"x^y"]) {
        self.operand = pow(waitingOperand, self.operand);
    }
}

@end

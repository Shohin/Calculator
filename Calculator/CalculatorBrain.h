//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Admin on 19.02.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

@property (nonatomic, assign)float operand;

- (double)performOperand:(NSString *)operation;


@end

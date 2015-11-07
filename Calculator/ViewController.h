//
//  ViewController.h
//  Calculator
//
//  Created by Admin on 19.02.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)digitPressed:(UIButton *)sender;
- (IBAction)operandPressed:(UIButton *)sender;
- (IBAction)utilitiesPressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UILabel *resultLabel;


@end


//
//  SCRViewController.m
//  Example
//
//  Created by Max Kramer on 28/06/2014.
//  Copyright (c) 2014 Max Kramer. All rights reserved.
//

#import "SCRViewController.h"
#import "NSString+SCRProfanityChecker.h"

@interface SCRViewController ()

@end

@implementation SCRViewController

- (void)viewDidLoad {
    [self.textField setText:@""];
    [super viewDidLoad];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *candidate = [textField.text stringByReplacingCharactersInRange:range withString:string];
    BOOL containsProfanity = [candidate containsProfanity];
    NSArray *ranges = [candidate rangesOfProfanity];
    [self updateStatusLabelWithFlag:containsProfanity ranges:ranges string:candidate];
    return YES;
}

- (void)updateStatusLabelWithFlag:(BOOL)profanity ranges:(NSArray *)ranges string:(NSString *)string {
    if (profanity) {
        NSMutableArray *words = [NSMutableArray array];
        [ranges enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [words addObject:[string substringWithRange:[obj rangeValue]]];
        }];
        NSString *wordString = [words componentsJoinedByString:@", "];
        [self.resultLabel setText:[NSString stringWithFormat:@"The entered text contains profanity: %@", wordString]];
    }
    else {
        [self.resultLabel setText:@"The entered text is clean"];
    }
}

@end

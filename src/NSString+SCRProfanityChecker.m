//
//  NSString+SCRProfanityChecker.m
//  School Report
//
//  Created by Max Kramer on 28/06/2014.
//  Copyright (c) 2014 Max Kramer. All rights reserved.
//

#import "NSString+SCRProfanityChecker.h"
#import "SCRProfanityChecker.h"

@implementation NSString (SCRProfanityChecker)

- (BOOL)containsProfanity {
    return [[SCRProfanityChecker defaultChecker] stringContainsProfanity:self];
}

- (NSArray *)rangesOfProfanity {
    return [[SCRProfanityChecker defaultChecker] rangesOfProfanityIn:self];
}

@end

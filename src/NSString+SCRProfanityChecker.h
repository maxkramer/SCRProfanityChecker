//
//  NSString+SCRProfanityChecker.h
//  School Report
//
//  Created by Max Kramer on 28/06/2014.
//  Copyright (c) 2014 Max Kramer. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SCRProfanityChecker;

@interface NSString (SCRProfanityChecker)

- (BOOL)containsProfanity;
- (NSArray *)rangesOfProfanity;

@end

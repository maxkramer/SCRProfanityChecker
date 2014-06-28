//
//  SCRProfanityChecker.h
//  School Report
//
//  Created by Max Kramer on 28/06/2014.
//  Copyright (c) 2014 Max Kramer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCRProfanityChecker : NSObject

+ (instancetype)defaultChecker;
- (instancetype)initWithListFilePath:(NSString *)filePath;

- (BOOL)stringContainsProfanity:(NSString *)string;
- (BOOL)fileContainsProfanity:(NSString *)filePath;

- (NSArray *)rangesOfProfanityIn:(NSString *)string;
- (NSArray *)rangesOfProfanityInFile:(NSString *)filePath;

@end

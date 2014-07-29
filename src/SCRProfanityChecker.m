//
//  SCRProfanityChecker.m
//  School Report
//
//  Created by Max Kramer on 28/06/2014.
//  Copyright (c) 2014 Max Kramer. All rights reserved.
//

#import "SCRProfanityChecker.h"

@interface SCRProfanityChecker ()

@property (nonatomic, copy) NSString *filePath;
@property (nonatomic, strong) NSArray *words;

@end

@implementation SCRProfanityChecker

#pragma mark - Singleton

+ (instancetype)defaultChecker {
    static SCRProfanityChecker *_shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Profanity" ofType:@"txt"];
        _shared = [[SCRProfanityChecker alloc] initWithListFilePath:filePath];
    });
    return _shared;
}

#pragma mark - Custom Initialiser

- (id)init {
    return [self initWithListFilePath:nil];
}

- (instancetype)initWithListFilePath:(NSString *)filePath {
    if ((self = [super init])) {
        self.filePath = filePath;
    }
    return self;
}

#pragma mark - Getter

- (NSArray *)words {
    if (_words == nil) {
        NSString *text = [NSString stringWithContentsOfFile:self.filePath encoding:NSUTF8StringEncoding error:nil];
        _words = [text componentsSeparatedByString:@"\n"];
    }
    return _words;
}

#pragma mark - Comparisons

- (BOOL)stringContainsProfanity:(NSString *)string {
    __block BOOL flag = NO;
    string = [string lowercaseString];
    [self.words enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([string rangeOfString:obj].location != NSNotFound) {
            flag = YES;
            *stop = YES;
        }
    }];
    return flag;
}

- (BOOL)fileContainsProfanity:(NSString *)filePath {
    NSError *error;
    NSString *candidate = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        return NO;
    }
    return [self stringContainsProfanity:candidate];
}

- (NSArray *)rangesOfProfanityIn:(NSString *)string {
    string = [string lowercaseString];
    NSMutableArray *ranges = [NSMutableArray array];
    [self.words enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSRange range = [string rangeOfString:obj];
        if (range.location != NSNotFound) {
            [ranges addObject:[NSValue valueWithRange:range]];
        }
    }];
    return ranges;
}

- (NSArray *)rangesOfProfanityInFile:(NSString *)filePath {
    NSError *error;
    NSString *candidate = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        return nil;
    }
    return [self rangesOfProfanityIn:candidate];
}

@end

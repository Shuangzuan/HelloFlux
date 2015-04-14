//
//  AppDispatcher.m
//  HelloFlux
//
//  Created by Shuangzuan He on 4/14/15.
//  Copyright (c) 2015 Pretty Seven. All rights reserved.
//

#import "AppDispatcher.h"

@implementation AppDispatcher

+ (instancetype)sharedDispatcher {
    static AppDispatcher *sharedDispatcher = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDispatcher = [[AppDispatcher alloc] init];
    });
    return sharedDispatcher;
}

@end

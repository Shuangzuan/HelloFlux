//
//  CountryStore.m
//  HelloFlux
//
//  Created by Shuangzuan He on 4/14/15.
//  Copyright (c) 2015 Pretty Seven. All rights reserved.
//

#import "CountryStore.h"
#import "AppDispatcher.h"
#import "CountryActions.h"

@implementation CountryStore

+ (instancetype)sharedStore {
    static CountryStore *sharedStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStore = [[CountryStore alloc] init];
    });
    return sharedStore;
}

- (void)registerCallback {
    self.token = [[AppDispatcher sharedDispatcher] registerWithCallback:^(FluxPayload *payload) {
        if ([payload.actionType isEqualToString:ATCountryUpdate]) {
            self.country = payload.context;
        }
    }];
}

@end

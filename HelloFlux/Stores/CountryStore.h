//
//  CountryStore.h
//  HelloFlux
//
//  Created by Shuangzuan He on 4/14/15.
//  Copyright (c) 2015 Pretty Seven. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Country.h"

@interface CountryStore : NSObject

@property (strong, nonatomic) NSString *token;

@property (strong, nonatomic) Country *country;

+ (instancetype)sharedStore;

- (void)registerCallback;

@end

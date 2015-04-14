//
//  AppDispatcher.h
//  HelloFlux
//
//  Created by Shuangzuan He on 4/14/15.
//  Copyright (c) 2015 Pretty Seven. All rights reserved.
//

#import "FluxDispatcher.h"

@interface AppDispatcher : FluxDispatcher

+ (instancetype)sharedDispatcher;

@end

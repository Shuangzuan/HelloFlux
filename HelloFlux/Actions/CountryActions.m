//
//  CountryActions.m
//  HelloFlux
//
//  Created by Shuangzuan He on 4/14/15.
//  Copyright (c) 2015 Pretty Seven. All rights reserved.
//

#import "CountryActions.h"
#import "AppDispatcher.h"

NSString * const ATCountryUpdate = @"ATCountryUpdate";

@implementation CountryActions

+ (void)updateWithCountry:(Country *)country {
    [[AppDispatcher sharedDispatcher] dispatchWithPayload:[FluxPayload payloadWithActionType:ATCountryUpdate andContext:country]];
}

@end

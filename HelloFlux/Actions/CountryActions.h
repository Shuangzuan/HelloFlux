//
//  CountryActions.h
//  HelloFlux
//
//  Created by Shuangzuan He on 4/14/15.
//  Copyright (c) 2015 Pretty Seven. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Country.h"

extern NSString * const ATCountryUpdate;

@interface CountryActions : NSObject

+ (void)updateWithCountry:(Country *)country;

@end

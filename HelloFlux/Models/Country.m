//
//  Country.m
//  HelloFlux
//
//  Created by Shuangzuan He on 4/14/15.
//  Copyright (c) 2015 Pretty Seven. All rights reserved.
//

#import "Country.h"

@implementation Country

+ (instancetype)countryWithName:(NSString *)name {
    Country *country = [[Country alloc] init];
    country.name = name;
    return country;
}

@end

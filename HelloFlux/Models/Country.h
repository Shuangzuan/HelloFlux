//
//  Country.h
//  HelloFlux
//
//  Created by Shuangzuan He on 4/14/15.
//  Copyright (c) 2015 Pretty Seven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Country : NSObject

@property (strong, nonatomic) NSString *name;

+ (instancetype)countryWithName:(NSString *)name;

@end

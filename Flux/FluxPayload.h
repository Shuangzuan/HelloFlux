//
//  FluxPayload.h
//  Flux
//
//  Created by Shuangzuan He on 4/13/15.
//  Copyright (c) 2015 Pretty Seven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FluxPayload : NSObject

@property (strong, nonatomic) NSString *actionType;
@property (strong, nonatomic) id context;

+ (instancetype)payloadWithActionType:(NSString *)actionType andContext:(id)context;

@end

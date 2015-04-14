//
//  FluxPayload.m
//  Flux
//
//  Created by Shuangzuan He on 4/13/15.
//  Copyright (c) 2015 Pretty Seven. All rights reserved.
//

#import "FluxPayload.h"

@implementation FluxPayload

+ (instancetype)payloadWithActionType:(NSString *)actionType andContext:(id)context {
    FluxPayload *payload = [[FluxPayload alloc] init];
    payload.actionType = actionType;
    payload.context = context;
    return payload;
}

@end

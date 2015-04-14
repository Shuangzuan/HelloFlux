//
//  FluxDispatcher.h
//  Flux
//
//  Created by Shuangzuan He on 4/13/15.
//  Copyright (c) 2015 Pretty Seven. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FluxPayload.h"

typedef void(^DispatcherCallback)(FluxPayload *payload);

@interface FluxDispatcher : NSObject

/**
 *  Is this Dispatcher currently dispatching.
 */
@property (assign, nonatomic, readonly) BOOL isDispatching;

/**
 *  Registers a callback to be invoked with every dispatched payload.
 *
 *  @param callback A dispatcher callback.
 *
 *  @return A token that can be used with `waitForCallbacksWithTokens:`;
 */
- (NSString *)registerWithCallback:(DispatcherCallback)callback;

/**
 *  Removes a callback based on its token.
 *
 *  @param token A token.
 */
- (void)unregisterCallbackWithToken:(NSString *)token;

/**
 *  Waits for the callbacks specified to be invoked before continuing execution of the current callback. This method should only be used by a callback in response to a dispatched payload.
 *
 *  @param tokens Tokens.
 */
- (void)waitForCallbacksWithTokens:(NSArray *)tokens;

/**
 *  Dispatches a payload to all registered callbacks.
 *
 *  @param payload A payload.
 */
- (void)dispatchWithPayload:(FluxPayload *)payload;

@end

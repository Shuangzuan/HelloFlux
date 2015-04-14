//
//  FluxDispatcher.m
//  Flux
//
//  Created by Shuangzuan He on 4/13/15.
//  Copyright (c) 2015 Pretty Seven. All rights reserved.
//

#import "FluxDispatcher.h"

static NSUInteger lastID = 1;
static const NSString *prefix = @"ID_";

static BOOL isYES(NSNumber *number) {
    return number && [number boolValue];
}

@interface FluxDispatcher ()

@property (strong, nonatomic) NSMutableDictionary *callbacks;
@property (strong, nonatomic) NSMutableDictionary *isPending;
@property (strong, nonatomic) NSMutableDictionary *isHandled;
@property (assign, nonatomic, readwrite) BOOL isDispatching;
@property (strong, nonatomic) FluxPayload *pendingPayload;

@end

@implementation FluxDispatcher

#pragma mark - Public APIs

- (NSString *)registerWithCallback:(DispatcherCallback)callback {
    NSString *token = [NSString stringWithFormat:@"%@%lu", prefix, lastID++];
    self.callbacks[token] = [callback copy];
    return token;
}

- (void)unregisterCallbackWithToken:(NSString *)token {
    NSAssert(!!self.callbacks[token], @"-[FluxDispatcher unregisterCallbackWithToken]: %@ does not map to a registered callback.", token);
    
    [self.callbacks removeObjectForKey:token];
}

- (void)waitForCallbacksWithTokens:(NSArray *)tokens {
    NSAssert(self.isDispatching, @"-[FluxDispatcher waitForCallbacksWithTokens]: Must be invoked while dispatching.");
    
    for (NSString *token in tokens) {
        if (isYES(self.isPending[token])) {
            NSAssert(isYES(self.isHandled[token]), @"`-[FluxDispatcher waitForCallbacksWithTokens]: Circular dependency detected while waiting for `%@`.", token);
            
            continue;
        }
        NSAssert(!!self.callbacks[token], @"-[FluxDispatcher waitForCallbacksWithTokens]: %@ does not map to a registered callback.", token);
        
        [self invokeCallbackWithToken:token];
    }
}

- (void)dispatchWithPayload:(FluxPayload *)payload {
    NSAssert(!self.isDispatching, @"-[FluxDispatcher dispatchWithPayload]: Cannot dispatch in the middle of a dispatch.");
    
    [self startDispatchingWithPayload:payload];
    
    @try {
        for (NSString *token in [self.callbacks allKeys]) {
            if (isYES(self.isPending[token])) {
                continue;
            }
            [self invokeCallbackWithToken:token];
        }
    }
    @finally {
        [self stopDispatching];
    }
}

#pragma mark - Private APIs

/**
 *  Call the callback stored with the given id. Also do some internal bookkeeping.
 *
 *  @param token A token.
 */
- (void)invokeCallbackWithToken:(NSString *)token {
    self.isPending[token] = @YES;
    DispatcherCallback callback = self.callbacks[token];
    callback(self.pendingPayload);
    self.isHandled[token] = @YES;
}

/**
 *  Set up bookkeeping needed when dispatching.
 *
 *  @param payload A Payload.
 */
- (void)startDispatchingWithPayload:(FluxPayload *)payload {
    for (NSString *token in [self.callbacks allKeys]) {
        self.isPending[token] = @NO;
        self.isHandled[token] = @NO;
    }
    self.pendingPayload = payload;
    self.isDispatching = YES;
}

/**
 *  Clear bookkeeping used for dispatching.
 */
- (void)stopDispatching {
    self.pendingPayload = nil;
    self.isDispatching = NO;
}

#pragma mark - Properties

- (NSMutableDictionary *)callbacks {
    if (!_callbacks) {
        _callbacks = [NSMutableDictionary dictionary];
    }
    return _callbacks;
}

- (NSMutableDictionary *)isPending {
    if (!_isPending) {
        _isPending = [NSMutableDictionary dictionary];
    }
    return _isPending;
}

- (NSMutableDictionary *)isHandled {
    if (!_isHandled) {
        _isHandled = [NSMutableDictionary dictionary];
    }
    return _isHandled;
}

@end

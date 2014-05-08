//
//  TorManager.h
//  iOS-Tor
//
//  Created by Mathieu Bolard on 05/05/2014.
//  Copyright (c) 2014 Mathieu Bolard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TorWrapper.h"

enum {
	kTorNotReachable = 0,
	kTorReachableViaWWAN,
	kTorReachableViaWiFi
};

@protocol TorManagerDelegate;

@interface TorManager : NSObject

@property (nonatomic) NSUInteger torSocksPort;
@property (nonatomic) NSUInteger torControlPort;

+ (TorManager *)defaultManager;

- (void)startTor;
- (void)stopTor;

- (void)hupTor;

- (void)requestNewTorIdentity;

@end

@protocol TorManagerDelegate <NSObject>

- (void) torStatusUpdate:(NSString *)status;
- (void) torReachabilityChanged:(uint32_t)status;

@end
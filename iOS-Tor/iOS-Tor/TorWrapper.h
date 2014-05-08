//
//  TorWrapper.h
//  iOS-Tor
//
//  Created by Mathieu Bolard on 05/05/2014.
//  Copyright (c) 2014 Mathieu Bolard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TorWrapper : NSThread

-(NSData *)readTorCookie;
@end

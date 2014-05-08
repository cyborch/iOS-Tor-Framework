//
//  NSData+Gzip.h
//  iOS-Tor
//
//  Created by Mathieu Bolard on 08/05/2014.
//  Copyright (c) 2014 Mathieu Bolard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Gzip)
- (NSData *) gzipInflate;
- (NSData *) gzipDeflate;
@end

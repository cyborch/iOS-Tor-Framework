//
//  TorURLProtocol.h
//  iOS-Tor
//
//  Created by Mathieu Bolard on 05/05/2014.
//  Copyright (c) 2014 Mathieu Bolard. All rights reserved.
//

#import "CKHTTPConnection.h"

@interface TorURLProtocol : NSURLProtocol <CKHTTPConnectionDelegate/*, UIAlertViewDelegate*/> {
    NSURLRequest *_request;
    CKHTTPConnection *_connection;
    NSMutableData *_data;
    Boolean isGzippedResponse;
}

- (NSMutableData *)data;

@end

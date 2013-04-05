//
//  ApiClient.h
//  kcdc
//
//  Created by Lee Brandt on 1/28/13.
//  Copyright (c) 2013 Lee Brandt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"

@interface ApiClient : AFHTTPClient

+(id)sharedInstance;

@end

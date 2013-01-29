//
//  Sponsor.h
//  kcdcios
//
//  Created by Lee Brandt on 1/29/13.
//  Copyright (c) 2013 Lee Brandt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sponsor : NSObject
    @property (copy, nonatomic) NSString *name;
    @property (copy, nonatomic) NSString *type;
    @property (copy, nonatomic) NSString *url;

-(id) initWithDictionary:(NSDictionary *)dictionary;
@end

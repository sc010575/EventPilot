//
//  PTJSONLoader.h
//  PhonicsTools
//
//  Created by Suman Chatterjee on 08/12/2013.
//  Copyright (c) 2013 DreamApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DAResourceLoader : NSObject

+ (id)JSONWithFileNameBundle:(NSString*)fileName;
+ (id)stringWithFileName:(NSString*)fileName ofType:(NSString*)type;
+ (id)readJSONFromDocument:(NSString*)fileName;

@end

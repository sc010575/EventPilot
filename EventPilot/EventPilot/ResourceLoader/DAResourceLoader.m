//
//  PTJSONLoader.m
//  PhonicsTools
//
//  Created by Gilbert Jolly on 08/12/2013.
//  Copyright (c) 2013 GilbertJolly. All rights reserved.
//

#import "DAResourceLoader.h"

@implementation DAResourceLoader



+ (id)JSONWithFileName:(NSString*)fileName
{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];

    if (path == nil) {
        NSLog(@"path is wrong");
        return nil;
    }

    NSError *error;
    NSData *json = [NSData dataWithContentsOfFile:path options:kNilOptions error:&error];
    
    if (error) {
        NSLog(@"Error Reading JSON %@", error);
        return nil;
    }
    
    id object = [NSJSONSerialization JSONObjectWithData:json options:kNilOptions error:&error];
    if (error) {
        NSLog(@"Error Parsing JSON %@", error);
        return nil;
    }

    return object;
}




+ (id)stringWithFileName:(NSString*)fileName ofType:(NSString*)type
{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:type];
    NSError *error;
    NSString *string = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    
    if (error) {
        NSLog(@"Error Reading JSON %@", error);
        return nil;
    }
    
    return string;
}



@end
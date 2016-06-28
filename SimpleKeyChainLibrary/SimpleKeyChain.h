//
//  SimpleKeyChain.h
//  SimpleKeyChain
//
//  Created by Mihui on 6/16/16.
//  Copyright © 2016 IBM. All rights reserved.
//
//

#import <Foundation/Foundation.h>

@interface SimpleKeyChain : NSObject

#ifndef ACCOUNT_KEY
    #define ACCOUNT_KEY @"ACCOUNT_KEY"
#endif

/**
 *  get string by key
 *
 *  @param name key name
 *
 *  @return NSString*
 */
+ (NSString*) getStringByKey:(NSString*) name;

/**
 *  set string by key
 *
 *  @param name  key name
 *  @param value value to be stored
 *
 *  @return BOOL
 */
+ (BOOL) setStringByKey:(NSString*) name value: (NSString *) value;

/**
 *  remove string by key
 *
 *  @param name key name
 *
 *  @return BOOL
 */
+ (BOOL) removeStringByKey:(NSString*) name;

@end

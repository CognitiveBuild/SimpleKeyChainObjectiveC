//
//  SimpleKeyChain.m
//  SimpleKeyChain
//
//  Created by Mihui on 6/16/16.
//  Copyright © 2016 IBM. All rights reserved.
//
//

#import "SimpleKeyChain.h"

@implementation SimpleKeyChain

/**
 *  get string by key
 *
 *  @param name key name
 *
 *  @return NSString*
 */
+ (NSString*) getStringByKey:(NSString*) name{
    CFTypeRef result = NULL;
    NSMutableDictionary *query = [SimpleKeyChain query:name account:ACCOUNT_KEY];
    [query setObject:@YES forKey:(__bridge id)kSecReturnData];
    [query setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
    OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)query, &result);
    if (status == errSecSuccess) {
        NSData *dataResult = (__bridge_transfer NSData *)(result);
        return [[NSString alloc] initWithData:dataResult encoding:NSUTF8StringEncoding];
    }
    return nil;
}

/**
 *  set string by key
 *
 *  @param name  key name
 *  @param value value to be stored
 *
 *  @return BOOL
 */
+ (BOOL) setStringByKey:(NSString*) name value: (NSString *) value{
    NSData *data = [value dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableDictionary *query = nil;
    NSMutableDictionary * searchQuery = [SimpleKeyChain query:name account:ACCOUNT_KEY];
    OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)searchQuery, nil);
    if (status == errSecSuccess) {
        query = [[NSMutableDictionary alloc] init];
        [query setObject:data forKey:(__bridge id)kSecValueData];
        status = SecItemUpdate((__bridge CFDictionaryRef)(searchQuery), (__bridge CFDictionaryRef)(query));
    }
    else if(status == errSecItemNotFound){
        query = [SimpleKeyChain query:name account:ACCOUNT_KEY];
        [query setObject:data forKey:(__bridge id)kSecValueData];
        status = SecItemAdd((__bridge CFDictionaryRef)query, NULL);
    }
    return status == errSecSuccess;
}

/**
 *  remove string by key
 *
 *  @param name key name
 *
 *  @return BOOL
 */
+ (BOOL) removeStringByKey:(NSString*) name{
    NSMutableDictionary *query = [SimpleKeyChain query:name account:ACCOUNT_KEY];
    OSStatus status = SecItemDelete((__bridge CFDictionaryRef)query);
    return status == errSecSuccess;
}

#pragma private method
/**
 *  keychain query
 *
 *  @param service service name
 *  @param account account nmae
 *
 *  @return NSMutableDictionary*
 */
+ (NSMutableDictionary *)query: (NSString*) service account: (NSString*) account {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithCapacity:3];
    [dictionary setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];

    [dictionary setObject:service forKey:(__bridge id)kSecAttrService];
    [dictionary setObject:account forKey:(__bridge id)kSecAttrAccount];

    return dictionary;
}

@end

/*
 *  Copyright ©  Mobile Clinic-Electronic Medical Records.
 *  Permission is granted to copy, distribute and/or modify this document
 *  under the terms of the GNU Free Documentation License, Version 1.3
 *  or any later version published by the Free Software Foundation;
 *  with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
 *  A copy of the license is included in the section entitled "GNU
 *  Free Documentation License".
 */
//
//  NSObject+CustomTools.m
//  Mobile Clinic
//
//  Created  on 2/5/13. 
//

#import "NSObject+CustomTools.h"

@implementation NSObject (CustomTools)

-(NSError *)createErrorWithDescription:(NSString *)description andErrorCodeNumber:(int)code inDomain:(NSString*)domain{
    
    NSMutableDictionary* details = [NSMutableDictionary dictionary];
    
    [details setValue:description forKey:NSLocalizedDescriptionKey];
    
    return [[NSError alloc]initWithDomain:domain code:code userInfo:details];
}
@end

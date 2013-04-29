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
//  StatusObject.m
//  Mobile Clinic
//
//  Created  on 1/27/13. 
//
#define ERRORMSG    @"errormsg"
#import "StatusObject.h"

@implementation StatusObject


-(void)unpackageFileForUser:(NSDictionary *)data{
    _errorMessage = [data objectForKey:ERRORMSG];
    _data = [data objectForKey:DATA];
    self.objectType = [[data objectForKey:OBJECTTYPE]intValue];
    _status = [[data objectForKey:STATUS]intValue];
    _commands = [[data objectForKey:OBJECTCOMMAND]intValue];
}

@end

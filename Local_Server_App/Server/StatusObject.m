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

#pragma mark - BaseObjectProtocol Method
#pragma mark -
-(NSDictionary *)consolidateForTransmitting{
    
    NSMutableDictionary* consolidate = [[NSMutableDictionary alloc]initWithCapacity:5];
   
    [consolidate setValue:_errorMessage forKey:ERRORMSG];
    if (_data) {
        [consolidate setValue:_data forKey:DATA];
    }
    [consolidate setValue:[NSNumber numberWithInt:_status] forKey:STATUS];
    [consolidate setValue:[NSNumber numberWithInt:kStatusType] forKey:OBJECTTYPE];
    [consolidate setValue:[NSNumber numberWithInt:kStatusClientWillRecieve] forKey:OBJECTCOMMAND];
    
    return consolidate;
}

-(void)unpackageFileForUser:(NSDictionary *)data{
    _errorMessage = [data objectForKey:ERRORMSG];
    _data = [data objectForKey:DATA];
    self.objectType = [[data objectForKey:OBJECTTYPE]intValue];
    _status = [[data objectForKey:STATUS]intValue];
    _commands = [[data objectForKey:OBJECTCOMMAND]intValue];
}

/* Does not need to be implemented  on the client side */
-(void)saveObject:(ObjectResponse)eventResponse{
    NSLog(@"SaveObject Method has not been implemented");
}

-(void)CommonExecution{

}

#pragma mark - Private Methods
#pragma mark -

@end

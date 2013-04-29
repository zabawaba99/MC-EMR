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
//  StatusObjectProtocol.h
//  Mobile Clinic
//
//  Created  on 4/4/13. 
//


#define DATA      @"data to transfer"
#define STATUS    @"status"

#import "NSObject+CustomTools.h"
#import "BaseObjectProtocol.h"

typedef enum {
    kSuccess                        = 0,
    kErrorDisconnected              = 1,
    kError                          = 2,
    kErrorObjectMisconfiguration    = 4,
    kErrorUserDoesNotExist          = 5,
    kErrorIncorrectLogin            = 6,
    kErrorPermissionDenied          = 7,
    kErrorIncompleteSearch          = 8,
    kErrorBadCommand                = 9,
} ServerStatus;

#import <Foundation/Foundation.h>

@protocol StatusObjectProtocol <NSObject>

@end

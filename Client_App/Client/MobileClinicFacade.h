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
//  MobileClinicFacade.h
//  Mobile Clinic
//
//  Created  on 3/1/13. 
//

/**
 * Mobile Clinic Facade
 * The user will use dictionaries to create and modify any records
 * The primary key/ID of the object should not be used or tampered.
 * Description:
 * The Mobile Clinic Facade consolidates all the appropriate methods to complete the patient workflow
 * @see MobileClinicFacadeProtocol
 */

#import <Foundation/Foundation.h>
#import "StatusObject.h"
#import "MobileClinicFacadeProtocol.h"

@interface MobileClinicFacade : NSObject <MobileClinicFacadeProtocol>
-(id)init;
-(NSString*)GetCurrentUsername;
@end

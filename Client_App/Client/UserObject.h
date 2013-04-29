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
//  UserObject.h
//  Mobile Clinic
//
//  Created  on 1/27/13. 
//

/*
 * Listeners That should be set:
 *
 *
 */


#define STATUS      @"status"
#define EMAIL       @"email"
#define FIRSTNAME   @"firstName"
#define LASTNAME    @"lastName"
#define USERNAME    @"userName"
#define PASSWORD    @"password"
#define USERTYPE    @"userType"
#define SECONDARYTYPE @"secondaryTypes"

#import <Foundation/Foundation.h>
#import "BaseObject.h"
#import "Users.h"
#import "UserObjectProtocol.h"
/* Users of the system */

@interface UserObject : BaseObject<UserObjectProtocol,CommonObjectProtocol>{
    Users* user;
}    


@end

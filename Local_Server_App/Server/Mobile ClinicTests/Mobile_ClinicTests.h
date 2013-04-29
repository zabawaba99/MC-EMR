//
//  Mobile_ClinicTests.h
//  Mobile ClinicTests
//
//  Created  on 1/23/13.
//  Copyright (c) 2013 Florida International University. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "ConnectListContent.h"
@interface Mobile_ClinicTests : SenTestCase{
    ConnectListContent* connectionList;
    BaseObject*obj;
    dispatch_semaphore_t semaphore;
}

@end

//
//  Mobile_ClinicTests.m
//  Mobile ClinicTests
//
//

#import "Mobile_ClinicTests.h"
#import "CloudService.h"

@implementation Mobile_ClinicTests

NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
NSString *username;

-(NSString *) genRandStringLength: (int) len {
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random() % [letters length]]];
    }
    
    return randomString;
}

- (void)setUp
{
    [super setUp];

    semaphore = dispatch_semaphore_create(0);
    [CloudService cloud].kAccessToken = @"5b26ad65877f7502f0e6baf8bf30ea04";
}

- (void)tearDown
{
    [super tearDown];
    semaphore = nil;
}

#pragma Tests Expecting a Valid Response from server


/*
 ********************************************************
 ********************************************************
 ********************************************************
 ********************    Users    ***********************
 ********************************************************
 ********************************************************
 ********************************************************
 */



- (void)testUsers
{
    NSLog(@"\n\nStarting testUsers\n\n");
    [[CloudService cloud] query:@"Users" parameters:nil completion:^(NSError *error, NSDictionary *result) {
         NSLog(@"\nReached Block code\n");
        if(!error){
            STAssertTrue([[result objectForKey:@"result"] isEqualToString:@"true"], @"result has returned true");
            dispatch_semaphore_signal(semaphore);
        }
    }];
    NSLog(@"\nWaiting for block code\n");
    dispatch_semaphore_wait(semaphore, 50000);
}

- (void)testUserForId
{
    NSLog(@"\n\nStarting testUserForId\n\n");
    NSMutableDictionary * mDic = [[NSMutableDictionary alloc]init];
    
    [mDic setObject:@"frederic" forKey:@"userName"];

    [[CloudService cloud] query:@"user_by_id" parameters:mDic completion:^(NSError *error, NSDictionary *result) {
        NSLog(@"\nReached Block code\n");
        if(!error){
            STAssertTrue([[result objectForKey:@"result"] isEqualToString:@"true"], (NSString *)[result objectForKey:@"message"]);
        }else{
            STAssertTrue(NO, [error description]);
        }
        
        dispatch_semaphore_signal(semaphore);
    }];
    NSLog(@"\nWaiting for block code\n");
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
}

- (void)testDeactivateUser
{
    NSLog(@"\n\nStarting testDeactivateUser\n\n");
    NSMutableDictionary * mDic = [[NSMutableDictionary alloc]init];

    [mDic setObject:@"frederic" forKey:@"userName"];
    [mDic setObject:[self genRandStringLength:11] forKey:@"password"];
    [mDic setObject:[self genRandStringLength:5] forKey:@"firstName"];
    [mDic setObject:[self genRandStringLength:9] forKey:@"lastName"];
    [mDic setObject:@"thisisarandomuser@yahoo.com" forKey:@"email"];
    [mDic setObject:@"2" forKey:@"userType"];
    [mDic setObject:@"0" forKey:@"status"];
    
    NSArray *userArra = [NSArray arrayWithObject:mDic];
    
    NSDictionary * params = [NSDictionary dictionaryWithObject:userArra forKey:@"Users"];
    
    [[CloudService cloud] query:@"update_user" parameters:params completion:^(NSError *error, NSDictionary *result) {
        NSLog(@"\nReached Block code\n");
        if(!error){
            STAssertTrue([[result objectForKey:@"result"] isEqualToString:@"true"], (NSString *)[result objectForKey:@"message"]);
        }else{
            STAssertTrue(NO, [error description]);
        }
        
        dispatch_semaphore_signal(semaphore);
    }];
    NSLog(@"\nWaiting for block code\n");
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
}


/*
    ********************************************************
    ********************************************************
    ********************************************************
    ********************    Patients    ********************
    ********************************************************
    ********************************************************
    ********************************************************
 */


-(void)testPatients{
    NSLog(@"\n\nStarting testPatients\n\n");
    
    [[CloudService cloud] query:@"Patients" parameters:nil completion:^(NSError *error, NSDictionary *result) {
        NSLog(@"\nReached Block code\n");
        if(!error){
            STAssertTrue([[result objectForKey:@"result"] isEqualToString:@"true"], (NSString *)[result objectForKey:@"message"]);
        }else{
            STAssertTrue(NO, [error description]);
        }
        
        dispatch_semaphore_signal(semaphore);
    }];
    NSLog(@"\nWaiting for block code\n");
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
}

-(void)testPatientForId{
    NSLog(@"\n\nStarting testPatientForId\n\n");
    
    NSMutableDictionary * mDic = [[NSMutableDictionary alloc]init];
    
    [mDic setObject:@"Rick_Schaefer_1364784189" forKey:@"patientId"];
    
    [[CloudService cloud] query:@"patient_for_id" parameters:mDic completion:^(NSError *error, NSDictionary *result) {
        NSLog(@"\nReached Block code\n");
        if(!error){
            STAssertTrue([[result objectForKey:@"result"] isEqualToString:@"true"], (NSString *)[result objectForKey:@"message"]);
        }else{
            STAssertTrue(NO, [error description]);
        }
        
        dispatch_semaphore_signal(semaphore);
    }];
    NSLog(@"\nWaiting for block code\n");
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
}

- (void)testCreatePatient
{
    NSLog(@"\n\nStarting testCreatePatient\n\n");
    NSMutableDictionary * mDic = [[NSMutableDictionary alloc]init];
    
    [mDic setObject:[self genRandStringLength:8] forKey:@"firstName"];
    [mDic setObject:[self genRandStringLength:11] forKey:@"familyName"];
    [mDic setObject:@"0" forKey:@"sex"];
    [mDic setObject:[self genRandStringLength:9] forKey:@"villageName"];
    [mDic setObject:@"42" forKey:@"age"];
    [mDic setObject:[mDic objectForKey:@"firstName"] forKey:@"patientId"];
    [mDic setObject:@"asdasd" forKey:@"picture"];
    
    NSArray *userArra = [NSArray arrayWithObject:mDic];
    
    NSDictionary * params = [NSDictionary dictionaryWithObject:userArra forKey:@"Patients"];
    
    [[CloudService cloud] query:@"update_patient" parameters:params completion:^(NSError *error, NSDictionary *result) {
        NSLog(@"\nReached Block code\n");
        if(!error){
            STAssertTrue([[result objectForKey:@"result"] isEqualToString:@"true"], (NSString *)[result objectForKey:@"message"]);
        }else{
            STAssertTrue(NO, [error description]);
        }
        
        dispatch_semaphore_signal(semaphore);
    }];
    NSLog(@"\nWaiting for block code\n");
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
}


- (void)testUpdatePatient
{
    NSLog(@"\n\nStarting testUpdatePatient\n\n");
    NSMutableDictionary * mDic = [[NSMutableDictionary alloc]init];
    
    [mDic setObject:[self genRandStringLength:8] forKey:@"firstName"];
    [mDic setObject:[self genRandStringLength:11] forKey:@"familyName"];
    [mDic setObject:@"0" forKey:@"sex"];
    [mDic setObject:[self genRandStringLength:9] forKey:@"villageName"];
    [mDic setObject:@"42" forKey:@"age"];
    [mDic setObject:[mDic objectForKey:@"firstName"] forKey:@"patientId"];
    [mDic setObject:@"asdasd" forKey:@"picture"];
    
    NSArray *userArra = [NSArray arrayWithObject:mDic];
    
    NSDictionary * params = [NSDictionary dictionaryWithObject:userArra forKey:@"Patients"];
    
    [[CloudService cloud] query:@"update_patient" parameters:params completion:^(NSError *error, NSDictionary *result) {
        NSLog(@"\nReached Block code\n");
        if(!error){
            STAssertTrue([[result objectForKey:@"result"] isEqualToString:@"true"], (NSString *)[result objectForKey:@"message"]);
        }else{
            STAssertTrue(NO, [error description]);
        }
        
        dispatch_semaphore_signal(semaphore);
    }];
    NSLog(@"\nWaiting for block code\n");
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
}

- (void)testUploadPatientPhoto
{
    NSLog(@"\n\nStarting testCreatePatient\n\n");
    NSMutableDictionary * mDic = [[NSMutableDictionary alloc]init];
    
    [mDic setObject:[self genRandStringLength:8] forKey:@"firstName"];
    [mDic setObject:[self genRandStringLength:11] forKey:@"familyName"];
    [mDic setObject:@"0" forKey:@"sex"];
    [mDic setObject:[self genRandStringLength:9] forKey:@"villageName"];
    [mDic setObject:@"42" forKey:@"age"];
    [mDic setObject:[mDic objectForKey:@"firstName"] forKey:@"patientId"];
    [mDic setObject:@"asdasd" forKey:@"picture"];
    
    NSArray *userArra = [NSArray arrayWithObject:mDic];
    
    NSDictionary * params = [NSDictionary dictionaryWithObject:userArra forKey:@"Patients"];
    
    [[CloudService cloud] query:@"update_patient" parameters:params completion:^(NSError *error, NSDictionary *result) {
        NSLog(@"\nReached Block code\n");
        if(!error){
            STAssertTrue([[result objectForKey:@"result"] isEqualToString:@"true"], (NSString *)[result objectForKey:@"message"]);
        }else{
            STAssertTrue(NO, [error description]);
        }
        
        dispatch_semaphore_signal(semaphore);
    }];
    NSLog(@"\nWaiting for block code\n");
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
}


/*
 ********************************************************
 ********************************************************
 ********************************************************
 ********************    Visitation    ******************
 ********************************************************
 ********************************************************
 ********************************************************
 */

-(void)testVisitations{
    NSLog(@"\n\nStarting testVisitations\n\n");
    
    [[CloudService cloud] query:@"Visitations" parameters:nil completion:^(NSError *error, NSDictionary *result) {
        NSLog(@"\nReached Block code\n");
        if(!error){
            STAssertTrue([[result objectForKey:@"result"] isEqualToString:@"true"], (NSString *)[result objectForKey:@"message"]);
        }else{
            STAssertTrue(NO, [error description]);
        }
        
        dispatch_semaphore_signal(semaphore);
    }];
    NSLog(@"\nWaiting for block code\n");
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
}

- (void)testCreateVisition
{
    NSLog(@"\n\nStarting testCreateVisitation\n\n");
    NSMutableDictionary * mDic = [[NSMutableDictionary alloc]init];
    
    [mDic setObject:[self genRandStringLength:8] forKey:@"triageIn"];
    [mDic setObject:[self genRandStringLength:11] forKey:@"weight"];
    [mDic setObject:[self genRandStringLength:5] forKey:@"conditions"];
    [mDic setObject:[self genRandStringLength:9] forKey:@"bloodPressure"];
    [mDic setObject:@"thisisarandomuser@yahoo.com" forKey:@"triageOut"];
    [mDic setObject:@"2" forKey:@"doctorIn"];
    [mDic setObject:@"2" forKey:@"doctorOut"];
    [mDic setObject:@"2" forKey:@"doctorId"];
    [mDic setObject:@"2" forKey:@"nurseId"];
    [mDic setObject:@"2" forKey:@"patientId"];
    [mDic setObject:@"2" forKey:@"observation"];
    
    NSArray *userArra = [NSArray arrayWithObject:mDic];
    
    NSDictionary * params = [NSDictionary dictionaryWithObject:userArra forKey:@"Visitation"];
    
    [[CloudService cloud] query:@"update_visit" parameters:params completion:^(NSError *error, NSDictionary *result) {
        NSLog(@"\nReached Block code\n");
        if(!error){
            STAssertTrue([[result objectForKey:@"result"] isEqualToString:@"true"], (NSString *)[result objectForKey:@"message"]);
        }else{
            STAssertTrue(NO, [error description]);
        }
        
        dispatch_semaphore_signal(semaphore);
    }];
    NSLog(@"\nWaiting for block code\n");
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
}

#pragma Tests Expecting False Responses From Server

@end

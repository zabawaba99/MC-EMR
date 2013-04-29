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
//  NSString+StringExt.h
//  StudentConnect
//
//  Created  on 5/20/12. 
//

#import <Foundation/Foundation.h>

@interface NSString (StringExt)

-(BOOL)isMinimumLength;
-(BOOL)isNotEmpty;
-(BOOL)isValidEmailAddress;
-(BOOL)isValidURL;

-(NSString*)getFileTypeFromPath;
-(NSString*)StringWithNoIllegalCharacters;
-(NSString*)capitalizeFirstLetterOfEachWord;
+(NSString *)createFilepathInDocumentsDirectoryWithName:(NSString *)name;
-(BOOL)contains:(NSString*)string;
+(NSString*)getDocumentPath;
+(NSString*)getDownloadPath;
@end

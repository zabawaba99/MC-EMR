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
//  MedicationList.m
//  Mobile Clinic
//
//  Created  on 3/16/13. 
//

#import "MedicationList.h"

@interface MedicationList ()
@property(strong)NSArray* allMedication;
@end


@implementation MedicationList
@synthesize allMedication;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setupView:nil];
    }
    
    return self;
}

- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex
{
    NSDictionary* medication = [allMedication objectAtIndex:rowIndex];
    
    return [medication objectForKey:aTableColumn.identifier]; 
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView
{
    NSInteger list = allMedication.count;
    return list;
}

-(BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row{

    return YES;
}

- (IBAction)destructiveResync:(id)sender {
    
}

- (IBAction)setupView:(id)sender {
    allMedication = [NSArray arrayWithArray:[[[MedicationObject alloc]init] FindAllObjects]];
    [_tableView reloadData];
}
@end

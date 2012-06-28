//
//  InstrumentSelector.m
//  ImageProcessing
//
//  Created by MEng on 19/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "InstrumentSelector.h"
#import "ViewController.h"

const float SELECTOR_HEIGHT = 120.0f;

@implementation InstrumentSelector

@synthesize parent;
@synthesize pickerWheel;

// Tell the picker how many components each option has
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView 
{ 
    return 1;
} 

// Tell the picker the number of options
-(NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component
{    
    return [_options count];
}

// Tell the picker the title for a given component
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component 
{
    return [_options objectAtIndex: row];
} 

// tell the picker the width of each row for a given component
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component 
{ 
    int sectionWidth = 300;  
    return sectionWidth;
}

// Handle the selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component 
{    
    _currentSelection = row;
} 

-(void)show
{
    [parent presentModalViewController: self animated:YES];
    [pickerWheel selectRow:_currentSelection inComponent:0 animated:NO];
}

-(void)hide
{    
    [parent dismissModalViewControllerAnimated: YES];
}

-(void)cancel:(id)sender
{
    [self hide];
}

-(void)select:(id)sender
{
    _activeSelection = _currentSelection;

    [_completionObject performSelector:_onCompletion];
    
    [self hide];
}

-(void)setPickerNames:(NSArray *)names
{
    _options = names;
    [pickerWheel reloadAllComponents];
}

-(void)setCompletionHandler:(NSObject*)object: (SEL)onCompletion
{
    _completionObject = object;
    _onCompletion = onCompletion;
}

-(int)getSelectionIndex
{
    return _currentSelection;
}

@end

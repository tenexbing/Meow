//
//  FilterViewController.m
//  Meow
//
//  Created by b on 3/17/14.
//  Copyright (c) 2014 b. All rights reserved.
//

#import "FilterViewController.h"

@interface FilterViewController ()

@end

@implementation FilterViewController
{
    
    int variabla;
}

@synthesize picker, tfCity, tfPattern;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setStyle];
    
    [picker setHidden:YES];
    
    patternArray = [[NSArray alloc] initWithObjects:@"Appetizers",@"Breakfast",@"Dessert",@"Drinks",
                     @"Main Dish/Entree", @"Salad", @"Side Dish", @"Soup", @"Snack",
                     @"Baby Food", @"Pet Food",nil];
    
    cityArray = [[NSArray alloc] initWithObjects:@"African",@"American",@"Armenian",@"Barbecue",
                    @"Brazilian", @"British", @"Cajun", @"Central American", @"Chicken",
                    @"Chinese", @"Cuban",
                    @"Ethiopian", @"French", @"Greek", @"German", @"Hamburgers",
                    @"Homestyle Cooking", @"Indian", @"Irish", @"Italian", @"Jamaican",
                    @"Japanese", @"Korean", @"Mexican", @"Middle Eastern", @"Pakistani",
                    @"Pancakes /Waffles", @"Persian", @"Pizza", @"Polynesian", @"Russian",
                    @"Sandwiches", @"Seafood", @"Scandinavian", @"Spanish", @"Soul Food",
                    @"South American", @"Steak", @"Vegetarian", @"Tex-Mex", @"Thai",
                    @"Vietnamese",@"Wild Game",nil];
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTap:)]];
    
    
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    [picker setHidden:YES];
    
    if (tfPattern.editing == YES) {
        [tfPattern resignFirstResponder];
        [picker setHidden:NO];
        variabla = 1;
        
    }else if (tfCity.editing == YES) {
        [tfCity resignFirstResponder];
        [picker setHidden:NO];
        variabla = 2;
    }
    NSLog(@"variabla %d",variabla);
    [picker reloadAllComponents];
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    if (variabla == 1) {
        return [patternArray count];
    }else if (variabla == 2) {
        return [cityArray count];
    }else {
        return 0;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    if (variabla == 1) {
        return [patternArray objectAtIndex:row];
    }else if (variabla == 2) {
        return [cityArray objectAtIndex:row];
    }else {
        return 0;
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSString *text = [self pickerView:picker titleForRow:row forComponent:component];
    UITextField *current = nil;
    if (variabla == 1) current = self.tfPattern;
    else if (variabla == 2) current = self.tfCity;
    current.text = text;
}

- (void)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
}
- (IBAction)dismissView:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)backgroundTap:(UITapGestureRecognizer *)tapGR{
    
    self.picker.hidden = YES;
    variabla = 0;
}


#pragma mark - setStyle

- (void)setStyle
{
    self.view.backgroundColor = [UIColor colorWithRed:0.902 green:0.898 blue:0.867 alpha:1.000];
    
    self.sclContent.backgroundColor = [UIColor clearColor];
    
    UIColor *wrapViewColor = [UIColor colorWithRed:1.000 green:1.000 blue:1.000 alpha:1.000];
    
    self.viewCity.backgroundColor = wrapViewColor;
    self.viewPattern.backgroundColor = wrapViewColor;
    self.viewAge.backgroundColor = wrapViewColor;
    self.viewSex.backgroundColor = wrapViewColor;
    
    UIColor *textColor = [UIColor colorWithRed:0.246 green:0.657 blue:0.646 alpha:1.000];
    
    self.lblCity.textColor = textColor;
    self.lblPattern.textColor = textColor;
    self.lblAge.textColor = textColor;
    self.lblSex.textColor = textColor;
    
    UIColor *tfColor = [UIColor colorWithRed:0.941 green:0.937 blue:0.922 alpha:1.000];
    
    self.tfCity.backgroundColor = tfColor;
    self.tfPattern.backgroundColor = tfColor;
    
    UIColor *tfText = [UIColor colorWithRed:0.722 green:0.714 blue:0.639 alpha:1.000];
    
    self.tfCity.textColor = tfText;
    self.tfPattern.textColor = tfText;
}


@end

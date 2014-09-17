//
//  AddViewController.m
//  Lost
//
//  Created by Ben Bueltmann on 8/12/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "AddViewController.h"
#import "MasterViewController.h"
#import "Character.h"

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *actorText;
@property (weak, nonatomic) IBOutlet UITextField *characterText;

@end

@implementation AddViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onAddButtonPressed:(UIBarButtonItem *)sender {
    //add two keys with the strings of the textfields to the character array…
    Character *newCharacter = [NSEntityDescription insertNewObjectForEntityForName:@"Character" inManagedObjectContext:self.managedObjectContext];
    newCharacter.actor = self.actorText.text;
    newCharacter.passenger = self.characterText.text;
    [self.managedObjectContext save:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

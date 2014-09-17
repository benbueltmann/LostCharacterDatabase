//
//  MasterViewController.m
//  Lost
//
//  Created by Ben Bueltmann on 8/12/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "AddViewController.h"
#import "Character.h"

@interface MasterViewController ()
@property NSMutableArray *characters;
@property NSDictionary *dict;
@property NSArray *sortDescriptor;

@end

@implementation MasterViewController

-(void)viewDidLoad{
    self.characters = [NSMutableArray new];

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"lost" ofType:@"plist"];
    NSArray *plistArray = [NSMutableArray arrayWithContentsOfFile:filePath];

    for (NSDictionary *dict in plistArray) {
        Character *character = [NSEntityDescription insertNewObjectForEntityForName:@"Character" inManagedObjectContext:self.managedObjectContext];
        character.actor = dict[@"actor"];
        character.passenger = dict[@"passenger"];
        [self.characters addObject:character];
    }
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"actor" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Character"];
    request.sortDescriptors = sortDescriptors;
    self.characters = [[self.managedObjectContext executeFetchRequest:request error:nil] mutableCopy];
    [self.tableView reloadData];

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    Character *character = [self.characters objectAtIndex:indexPath.row];
    cell.textLabel.text = character.actor;
    cell.detailTextLabel.text = character.passenger;
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.characters.count;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    AddViewController *vc = segue.destinationViewController;
    vc.managedObjectContext =  self.managedObjectContext;
}

-(IBAction)unwindToRoot:(UIStoryboardSegue *)sender
{
    [self.tableView reloadData];
}


@end

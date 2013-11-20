//
//  TableViewController.m
//  SearchDemo
//
//  Created by Abhishek Panchal on 19/11/13.
//

#import "TableViewController.h"
#import "ViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

@synthesize isRoot;
@synthesize mode;
@synthesize index;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    if (isRoot == NO)
    {
        //
        UIBarButtonItem *rootItem = [[UIBarButtonItem alloc] initWithTitle:@"Root" style:UIBarButtonItemStylePlain
                                                                                    target:self action:@selector(gotoRoot:)];
        self.navigationItem.rightBarButtonItem = rootItem;

        //
        UIBarButtonItem *demoItem = [[UIBarButtonItem alloc] initWithTitle:@"BugDemo" style:UIBarButtonItemStylePlain target:self action:@selector(bugDemo:)];
        self.toolbarItems = [[NSArray alloc] initWithObjects:demoItem, nil];
    }

    if (isRoot == YES)
    {
        if(mode == MODE_NUMBERS)
        {
            self.title = @"Numbers";
        }
        else
        {
            self.title = @"Alphabets";
        }
    }
    else
    {
        if(mode == MODE_NUMBERS)
        {
            self.title = [NSString stringWithFormat:@"%d", (index)];
        }
        else
        {
            self.title = [NSString stringWithFormat:@"%c", (index + 65)];
        }
    }
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (globalIsAutoPush && globalAutoPushCount > 0)
    {
        TableViewController* table = [[TableViewController alloc] initWithNibName:@"TableViewController" bundle:nil];
        table.mode = mode;
        globalAutoPushCount -= 1;
        globalIsAutoPush = (globalAutoPushCount == 0);
        [self.navigationController pushViewController:table animated:globalIsAnimated];
    }
}

- (void)bugDemo:(id)sender
{
    ViewController *root = (ViewController *)[[self.navigationController viewControllers] objectAtIndex:0];
    [self.navigationController popToViewController:root animated:globalIsAnimated];
    NSInteger autoPushMode = (self.mode == MODE_NUMBERS) ? MODE_ALPHABETS : MODE_NUMBERS;
    [root performAutoPushWithMode:autoPushMode andCount:1];
}

- (void)gotoRoot:(id)sender
{
    ViewController *root = (ViewController *)[[self.navigationController viewControllers] objectAtIndex:0];
    [self.navigationController popToViewController:root animated:globalIsAnimated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if(mode == MODE_NUMBERS){
        return 10;
    }else{
        return  26;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

   cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
   if(mode == MODE_NUMBERS)
   {
       cell.textLabel.text = [NSString stringWithFormat:@"%d", (indexPath.item)];
       cell.textLabel.textColor = COLOR_NUMBERS;
   }
   else
   {
       cell.textLabel.text = [NSString stringWithFormat:@"%c", (indexPath.item + 65)];
       cell.textLabel.textColor = COLOR_ALPHABETS;
   }
   return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    TableViewController* table = [[TableViewController alloc] initWithNibName:@"TableViewController" bundle:nil];
    table.mode = self.mode;
    table.index = indexPath.item;
    // Push the view controller.
    [self.navigationController pushViewController:table animated:YES];
}

@end

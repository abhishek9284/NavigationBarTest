//
//  ViewController.m
//  SearchDemo
//
//  Created by Abhishek Panchal on 19/11/13.
//

#import "ViewController.h"
#import "TableViewController.h"

BOOL globalIsAnimated = NO;
BOOL globalIsAutoPush = NO;
int  globalAutoPushCount = 0;

#define AutoPushInViewDidApear

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionNumbers:(id)sender
{
    TableViewController* table = [[TableViewController alloc] initWithNibName:@"TableViewController" bundle:nil];
    table.mode = MODE_NUMBERS;
    table.isRoot = YES;
    [self.navigationController pushViewController:table animated:YES];
}

- (IBAction)actionAlphabets:(id)sender
{
    TableViewController* table = [[TableViewController alloc] initWithNibName:@"TableViewController" bundle:nil];
    table.mode = MODE_ALPHABETS;
    table.isRoot = YES;
    [self.navigationController pushViewController:table animated:YES];
}

- (void)performAutoPushWithMode:(NSInteger)mode andCount:(NSInteger)count
{
#ifdef AutoPushInViewDidApear
    globalIsAutoPush = YES;
    globalAutoPushCount = count;
#endif

    TableViewController* table = [[TableViewController alloc] initWithNibName:@"TableViewController" bundle:nil];
    table.mode = mode;
    table.isRoot = YES;
    [self.navigationController pushViewController:table animated:globalIsAnimated];

#ifndef AutoPushInViewDidApear
    for (int i = 0; i < count; i++)
    {
        TableViewController* table = [[TableViewController alloc] initWithNibName:@"TableViewController" bundle:nil];
        table.mode = mode;
        table.index = i;
        [self.navigationController pushViewController:table animated:globalIsAnimated];
    }
#endif
}

@end

//
//  TableViewController.h
//  SearchDemo
//
//  Created by Abhishek Panchal on 19/11/13.
//

#import <UIKit/UIKit.h>

#define MODE_NUMBERS    0
#define MODE_ALPHABETS  1

#define COLOR_NUMBERS       [UIColor redColor]
#define COLOR_ALPHABETS     [UIColor greenColor]

@interface TableViewController : UITableViewController

@property (nonatomic, assign) BOOL isRoot;
@property (nonatomic, assign) NSUInteger mode;
@property (nonatomic, assign) NSUInteger index;

@end

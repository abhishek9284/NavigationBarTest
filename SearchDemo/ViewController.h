//
//  ViewController.h
//  SearchDemo
//
//  Created by Abhishek Panchal on 19/11/13.
//

#import <UIKit/UIKit.h>

extern BOOL globalIsAnimated;
extern BOOL globalIsAutoPush;
extern int  globalAutoPushCount;

@interface ViewController : UIViewController

- (IBAction)actionNumbers:(id)sender;
- (IBAction)actionAlphabets:(id)sender;

- (void)performAutoPushWithMode:(NSInteger)mode andCount:(NSInteger)count;

@end

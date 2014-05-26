//
//  CEViewController.m
//  Bubble
//
//  Created by Julius Magsino on 5/4/14.
//  Copyright (c) 2014 Code Eevee. All rights reserved.
//

#import "CEViewController.h"
#import "CEChatViewController.h"

#import "CEPhotoViewController.h"

//THINGS I ADDED IN FOR TESTING
#import "CEAddFriendsController.h"
#import "CEAppDelegate.h"


@interface CEViewController ()

@property (nonatomic, strong) CEAppDelegate *appDelegate;
@property (nonatomic, strong) NSMutableArray *arrConnectedDevices;


-(void)peerDidChangeStateWithNotification:(NSNotification *)notification;

@end


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

@implementation CEViewController

- (IBAction)Next {
    CEChatViewController *second = [[CEChatViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:second animated:YES completion:NULL];
}

- (IBAction)Next2 {
    CEPhotoViewController *second = [[CEPhotoViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:second animated:YES completion:NULL];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Bubble Text_35.png"]];
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    _appDelegate = (CEAppDelegate *)[[UIApplication sharedApplication] delegate];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






////////////////////////


#pragma mark - UITableView Delegate and Datasource method implementation

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_arrConnectedDevices count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    
    cell.textLabel.text = [_arrConnectedDevices objectAtIndex:indexPath.row];
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0;
}






@end

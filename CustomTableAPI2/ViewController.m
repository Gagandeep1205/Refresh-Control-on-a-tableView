//
//  ViewController.m
//  CustomTableAPI
//
//  Created by Gagandeep Kaur on 08/07/15.
//  Copyright (c) 2015 Gagandeep Kaur. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"
#import "DataModal.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self getData];
    // Initialize the refresh control.
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor purpleColor];
    self.refreshControl.tintColor = [UIColor whiteColor];
    [self.refreshControl addTarget:self action:@selector(reloadData) forControlEvents:UIControlEventValueChanged];
    [_TableViewData addSubview:_refreshControl];
}


-(void)getData{
    DataModal * dataModal= [[DataModal alloc] init];
    [dataModal CallApi:(@"lat=30.7500&lng=76.7800") :^(NSDictionary *response_success) {
        
        NSLog(@"%@",response_success);
        
        _arrData = [NSMutableArray new];
        _arrData = [[response_success valueForKey:@"data"] mutableCopy];
        //        _dictionary = [NSDictionary new];
        //        _dictionary = response_success;
        
    }:^(NSError *response_error) {
        NSLog(@"Couldn't Load Images");
        
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_arrData count];
}

- (CustomTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CustomTableViewCell"];
    
    [cell.imgUserImage sd_setImageWithURL:[[_arrData objectAtIndex:indexPath.row] valueForKey:@"image"] placeholderImage:nil];
    cell.labelUsername.text = [[_arrData objectAtIndex:indexPath.row] valueForKey:@"u_name"];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    if (_arrData) {
        
        self.TableViewData.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        return 1;
        
    } else {
        
        // Display a message when the table is empty
        UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        
        messageLabel.text = @"No data is currently available. Please pull down to refresh.";
        messageLabel.textColor = [UIColor blackColor];
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = NSTextAlignmentCenter;
        messageLabel.font = [UIFont fontWithName:@"Palatino-Italic" size:20];
        [messageLabel sizeToFit];
        
        self.TableViewData.backgroundView = messageLabel;
        self.TableViewData.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    
    return 0;
}

- (void)reloadData
{
    // Reload table data
    [self.TableViewData reloadData];
    
    // End the refreshing
    if (self.refreshControl) {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MMM d, h:mm a"];
        NSString *title = [NSString stringWithFormat:@"Last update: %@", [formatter stringFromDate:[NSDate date]]];
        NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObject:[UIColor whiteColor]
                                                                    forKey:NSForegroundColorAttributeName];
        NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:title attributes:attrsDictionary];
        self.refreshControl.attributedTitle = attributedTitle;
        
        [self.refreshControl endRefreshing];
    }
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

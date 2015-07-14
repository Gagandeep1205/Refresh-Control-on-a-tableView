//
//  CustomTableViewCell.h
//  CustomTableAPI
//
//  Created by Gagandeep Kaur on 08/07/15.
//  Copyright (c) 2015 Gagandeep Kaur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgUserImage;
@property (weak, nonatomic) IBOutlet UILabel *labelUsername;

-(void)getData:(NSDictionary *)dictionary;
@end

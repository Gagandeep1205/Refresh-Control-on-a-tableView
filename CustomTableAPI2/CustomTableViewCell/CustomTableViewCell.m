//
//  CustomTableViewCell.m
//  CustomTableAPI
//
//  Created by Gagandeep Kaur on 08/07/15.
//  Copyright (c) 2015 Gagandeep Kaur. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Custom initialization
        NSArray *nibArray= [[NSBundle mainBundle] loadNibNamed:@"CustomTableViewCell" owner:self options:nil];
        self= [nibArray objectAtIndex:0];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)getData:(NSDictionary *)dictionary{
    
}
@end

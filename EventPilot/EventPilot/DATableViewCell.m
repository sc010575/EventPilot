//
//  DATableViewCell.m
//  EventPilot
//
//  Created by Suman Chatterjee on 28/05/2014.
//  Copyright (c) 2014 Suman Chatterjee. All rights reserved.
//

#import "DATableViewCell.h"

@implementation DATableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

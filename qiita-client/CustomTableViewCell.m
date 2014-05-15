//
//  CustomTableViewCell.m
//  qiita-client
//
//  Created by sasata299 on 5/14/14.
//  Copyright (c) 2014 sasata299. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

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

- (void)setStock:(NSDictionary *)stock
{
    _stock = stock;

    NSString *userImageURL = self.stock[@"user"][@"profile_image_url"];
    [self.userImage setImageWithURL:[NSURL URLWithString:userImageURL]
                   placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    self.titleLabel.text = self.stock[@"title"];
}

@end

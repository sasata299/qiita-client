//
//  CustomTableViewCell.h
//  qiita-client
//
//  Created by sasata299 on 5/14/14.
//  Copyright (c) 2014 sasata299. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) NSDictionary *stock;

@end

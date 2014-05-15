//
//  QiitaDelegate.m
//  qiita-client
//
//  Created by sasata299 on 5/14/14.
//  Copyright (c) 2014 sasata299. All rights reserved.
//

#import "QiitaDelegate.h"
#import "CustomTableViewCell.h"

@implementation QiitaDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static CustomTableViewCell *sizingCell;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        UINib *nib = [UINib nibWithNibName:@"CustomCell" bundle:nil];
        sizingCell = [[nib instantiateWithOwner:nil options:nil] firstObject];
    });

    sizingCell.bounds = CGRectMake(0.0, 0.0, CGRectGetWidth(tableView.bounds), CGRectGetHeight(sizingCell.bounds));

    sizingCell.stock = self.stocks[indexPath.row];

    [sizingCell setNeedsLayout];
    [sizingCell layoutIfNeeded];

    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height;
}

@end

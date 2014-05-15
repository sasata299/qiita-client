//
//  QiitaDataSource.m
//  qiita-client
//
//  Created by sasata299 on 5/14/14.
//  Copyright (c) 2014 sasata299. All rights reserved.
//

#import "QiitaDataSource.h"
#import "CustomTableViewCell.h"

@implementation QiitaDataSource

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.stocks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    cell.stock = self.stocks[indexPath.row];
    return cell;
}

@end

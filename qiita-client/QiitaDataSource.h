//
//  QiitaDataSource.h
//  qiita-client
//
//  Created by sasata299 on 5/14/14.
//  Copyright (c) 2014 sasata299. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QiitaDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *stocks;

@end

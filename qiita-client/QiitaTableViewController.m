//
//  QiitaTableViewController.m
//  qiita-client
//
//  Created by sasata299 on 5/14/14.
//  Copyright (c) 2014 sasata299. All rights reserved.
//

#import "QiitaTableViewController.h"
#import "QiitaDelegate.h"
#import "QiitaDataSource.h"

@interface QiitaTableViewController ()

@property (nonatomic, copy) NSString *token;

@property (nonatomic, strong) QiitaDelegate *qiitaDelegate;
@property (nonatomic, strong) QiitaDataSource *qiitaDataSource;

@end

@implementation QiitaTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.tableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:@"MyCell"];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    if (!self.token) {
        [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];

        // Authentication params
        NSDictionary *params = @{ @"url_name": @"YOUR_NAME", @"password": @"YOUR_PASSWORD" };
        
        [manager POST:kQiitaAuthAPIPath
           parameters:params
              success:^(AFHTTPRequestOperation *operation, id responseObject) {
                  self.token = responseObject[@"token"];

                  NSString *path = [kQiitaStockAPIPath stringByAppendingString:self.token];
                  [manager GET:path
                    parameters:nil
                       success:^(AFHTTPRequestOperation *operation, id responseObject) {
                           [self setDelegateAndDataSourceWithStocks:responseObject];
                           [self.tableView reloadData];
                           
                           [SVProgressHUD showSuccessWithStatus:@"読み込み完了しました"];
                       }
                       failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                           NSLog(@"Error: %@", error);
                       }];

              }
              failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                  NSLog(@"Error: %@", error);
              }];
    }
}

- (void)setDelegateAndDataSourceWithStocks:(NSMutableArray *)stocks
{
    self.qiitaDelegate = [[QiitaDelegate alloc] init];
    self.qiitaDelegate.stocks = stocks;

    self.qiitaDataSource = [[QiitaDataSource alloc] init];
    self.qiitaDataSource.stocks = stocks;

    self.tableView.delegate = self.qiitaDelegate;
    self.tableView.dataSource = self.qiitaDataSource;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end

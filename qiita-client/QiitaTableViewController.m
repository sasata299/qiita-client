//
//  QiitaTableViewController.m
//  qiita-client
//
//  Created by sasata299 on 5/14/14.
//  Copyright (c) 2014 sasata299. All rights reserved.
//

#import "QiitaTableViewController.h"

@interface QiitaTableViewController ()

@property (nonatomic, copy) NSString *token;

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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    if (!self.token) {
        [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];

        
        [manager POST:kQiitaAuthAPIPath
           parameters:params
              success:^(AFHTTPRequestOperation *operation, id responseObject) {
                  self.token = responseObject[@"token"];

                  NSString *path = [kQiitaStockAPIPath stringByAppendingString:self.token];
                  [manager GET:path
                    parameters:nil
                       success:^(AFHTTPRequestOperation *operation, id responseObject) {
                           for (id obj in responseObject) {
                               NSLog(@"title: %@", obj[@"title"]);
                               NSLog(@"username: %@", obj[@"user"][@"url_name"]);
                               NSLog(@"url: %@", obj[@"url"]);
                               NSLog(@"created_at: %@", obj[@"created_at"]);

                               [SVProgressHUD showSuccessWithStatus:@"読み込み完了しました"];
                           }
                       }
                       failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                           NSLog(@"Error: %@", error);
                       }];

              }
              failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                  NSLog(@"Error: %@", error);
              }];
    }

//    NSString *path = [kQiitaUserAPIPath stringByAppendingString:@"sasata299"];
//    [manager GET:path
//      parameters:nil
//         success:^(AFHTTPRequestOperation *operation, id responseObject) {
//             NSLog(@"JSON: %@", responseObject);
//             NSLog(@"Website URL: %@", [responseObject objectForKey:@"website_url"]);
//         }
//         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//             NSLog(@"Error: %@", error);
//         }];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

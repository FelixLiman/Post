//
//  ViewController.m
//  Pets
//
//  Created by Felix Liman on 05/12/24.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "NSString+Extension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)setupSearchBar {
    UISearchController *searchController = [[UISearchController alloc] initWithSearchResultsController: nil];
    searchController.searchBar.placeholder = @"Search Posts";
    searchController.obscuresBackgroundDuringPresentation = NO;
    searchController.searchResultsUpdater = self;
    searchController.searchBar.delegate = self;
    
    self.navigationItem.searchController = searchController;
    self.navigationItem.hidesSearchBarWhenScrolling = YES;
    
}


- (void)getPostData {
    NSMutableURLRequest *request = NSMutableURLRequest.new;
    [request setURL: [[NSURL alloc] initWithString: @"https://jsonplaceholder.typicode.com/posts"]];
    [request setHTTPMethod: @"GET"];
    [request addValue:@"text/plain" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"text/plain" forHTTPHeaderField:@"Accept"];

    NSURLSession *session = [NSURLSession sessionWithConfiguration: [NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session dataTaskWithRequest: request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *objects = [NSJSONSerialization
                                JSONObjectWithData: data
                                options: 0
                                error: &error];

        if(! error) {
            NSMutableArray *array = [[NSMutableArray alloc] init];

            for (NSObject *object in objects) {
                PostModel *post = [[PostModel alloc] init];
                post.userId = [object valueForKey:@"userId"];
                post.postId = [object valueForKey:@"id"];
                post.title = [object valueForKey:@"title"];
                post.body = [object valueForKey:@"body"];
                [array addObject: post];
            }
            
            self.postData = array;
            self.postViewData = array;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        } else {
            NSLog(@"Error in parsing JSON");
        }
    }] resume];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"Posts";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    
    [self getPostData];
    
    [self setupSearchBar];
    
//    [self.tableView registerClass: UITableViewCell.class forCellReuseIdentifier:@"cellId"];
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.postViewData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellReuseID"];
    
    cell.textLabel.text = self.postViewData[indexPath.item].title;
    cell.detailTextLabel.text = [NSString stringWithFormat: @"Post ID: %@", self.postViewData[indexPath.item].postId];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName: @"Main" bundle: nil];
    DetailViewController *detailVC = [storyboard instantiateViewControllerWithIdentifier: @"DetailViewController"];
    PostModel *postModel = self.postViewData[indexPath.item];
    detailVC.post = postModel;
    [self.navigationController pushViewController: detailVC animated: YES];
}

//- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
//    [self dismissViewControllerAnimated: YES completion: nil];
//    [searchBar resignFirstResponder];
//}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *searchText = searchController.searchBar.text.lowercaseString;
    
    
    if (searchText == nil || [searchText isStringEmpty]) {
        self.postViewData = self.postData;
    } else {
        NSArray *searchResult = [self.postData filteredArrayUsingPredicate: [NSPredicate predicateWithBlock:^BOOL(PostModel *evaluatedObject, NSDictionary *bindings) {
            return [evaluatedObject.title.lowercaseString containsString: searchText];
        }]];
        self.postViewData = [[NSMutableArray alloc] initWithArray: searchResult];
    }
    
    [self.tableView reloadData];
}

@end

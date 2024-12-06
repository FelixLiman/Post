//
//  ViewController.h
//  Pets
//
//  Created by Felix Liman on 05/12/24.
//

#import <UIKit/UIKit.h>
#import "PostModel.h"

@class DetailViewController;

@interface ViewController : UITableViewController <UISearchBarDelegate, UISearchResultsUpdating>

@property (nonatomic, retain) NSMutableArray<PostModel *> *postData;
@property (nonatomic, retain) NSMutableArray<PostModel *> *postViewData;

@end


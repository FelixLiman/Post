//
//  DetailViewController.m
//  Pets
//
//  Created by Felix Liman on 05/12/24.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (nonatomic, weak) IBOutlet UILabel *postUserIdLbl;
@property (nonatomic, weak) IBOutlet UILabel *postTitleLbl;
@property (nonatomic, weak) IBOutlet UILabel *postIdLbl;
@property (nonatomic, weak) IBOutlet UILabel *postBodyLbl;

@end

@implementation DetailViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"Post Detail";
    
    self.postUserIdLbl.text = [NSString stringWithFormat: @"%@", self.post.userId];
    self.postTitleLbl.text = self.post.title;
    self.postIdLbl.text = [NSString stringWithFormat: @"%@", self.post.postId];
    self.postBodyLbl.text = self.post.body;
    // Do any additional setup after loading the view from its nib.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

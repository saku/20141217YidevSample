//
//  Copyright (c) 2014 Yoichiro Sakurai. All rights reserved.
//

#import "SelectViewController.h"

@interface SelectViewController ()

@property NSArray *samples;

@end

@implementation SelectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Sample Selection";
    _samples = @[
                 @"SimpleJavascript",
                 @"HandlebarsSample",
                 ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _samples.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.adjustsFontSizeToFitWidth = YES;
    }
    
    // Configure the cell...
    cell.textLabel.text = _samples[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *className = [NSString stringWithFormat:@"%@ViewController", _samples[indexPath.row]];
    @try {
        UIViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:className];
        viewController.title = _samples[indexPath.row];
        
        [self.navigationController pushViewController:viewController animated:YES];
    }
    @catch (NSException *exception) {
        // if class not exist in storyboard, do nothing.
    }
}

@end

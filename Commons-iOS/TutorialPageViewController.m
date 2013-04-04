//
//  TutorialPageViewController.m
//  Commons-iOS
//
//  Created by Brion on 4/4/13.
//  Copyright (c) 2013 Wikimedia. All rights reserved.
//

#import "TutorialPageViewController.h"

@interface TutorialPageViewController ()
{
    NSArray *pages;
}
@end

@implementation TutorialPageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        pages = @[];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.delegate = self;
    self.dataSource = self;
    
    pages = @[[self loadPage:1],
              [self loadPage:2],
              [self loadPage:3]];
    
    [self setViewControllers:@[pages[0]] direction:UIPageViewControllerNavigationOrientationHorizontal animated:NO completion:nil];
}

- (UIViewController *)loadPage:(NSInteger)page
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    NSString *storyboardId = [NSString stringWithFormat:@"TutorialPage%d", page];
    return [storyboard instantiateViewControllerWithIdentifier:storyboardId];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UIPageViewControllerDataProvider methods
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    NSLog(@"presentationCountForPageViewController: %d", pages.count);
    return pages.count;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    NSLog(@"presentationIndexForPageViewController: %d", 1);
    return 1; // fixme?
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    int index = [pages indexOfObject:viewController] + 1;
    if (index < pages.count) {
        NSLog(@"viewControllerAfterViewController: %d %@", index, pages[index]);
        return pages[index];
    } else {
        NSLog(@"viewControllerAfterViewController: %d nil", index);
        return nil;
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    int index = [pages indexOfObject:viewController] - 1;
    if (index >= 0) {
        NSLog(@"viewControllerBeforeViewController: %d %@", index, pages[index]);
        return pages[index];
    } else {
        NSLog(@"viewControllerBeforeViewController: %d nil", index);
        return nil;
    }
}

#pragma mark - UIPageViewControllerDelegate methods

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers
{
    // ?
}

@end

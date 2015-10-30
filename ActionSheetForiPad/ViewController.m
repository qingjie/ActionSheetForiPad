//
//  ViewController.m
//  ActionSheetForiPad
//
//  Created by qingjie on 10/13/15.
//  Copyright © 2015 qingjie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong ,nonatomic) UIAlertController *actionSheet;
@property (strong ,nonatomic) UIActivityViewController *controller;

@end

@implementation ViewController
UIPopoverPresentationController *pop = nil;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initClickB];
}

-(void) initClickB {
    
    
}

- (void) showFileList:(id) sender {
    
}

- (void) share:(id) sender {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clickMeTapped:(id)sender {
    pop = self.actionSheet.popoverPresentationController;
    pop.delegate = self;
    pop.sourceView = self.view;
    // 显示在中心位置
    //pop.sourceRect = CGRectMake((CGRectGetWidth(pop.sourceView.bounds)-2)*0.5f, (CGRectGetHeight(pop.sourceView.bounds)-2)*0.5f, 2, 2);
    //pop.sourceRect = CGRectMake(610.0, 730.0, 2, 2);
    
    
    if([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeLeft)
    {
        pop.sourceRect = CGRectMake(610.0, 730.0, 100.0, 100.0);
    }
    else if([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeRight)
    {
        pop.sourceRect = CGRectMake(610.0, 730.0, 100.0, 100.0);
     
    }
    else if([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait)
    {
        
        pop.sourceRect = CGRectMake(440.0, 980.0, 100.0, 100.0);
    }
    else if([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        
        pop.sourceRect = CGRectMake(440.0, 980.0, 100.0, 100.0);
    }
    
    
    
    
    [self presentViewController:self.actionSheet animated:YES completion:nil];
    
}


- (IBAction)clickAtapped:(id)sender {
    
   
    
    UIPopoverPresentationController *pop = self.controller.popoverPresentationController;
    pop.delegate = self;
    pop.sourceView = self.view;
  
    if([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeLeft)
    {
        pop.sourceRect = CGRectMake(610.0, 730.0, 100.0, 100.0);
    }
    else if([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeRight)
    {
        pop.sourceRect = CGRectMake(610.0, 730.0, 100.0, 100.0);
        
    }
    else if([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait)
    {
        
        pop.sourceRect = CGRectMake(440.0, 980.0, 100.0, 100.0);
    }
    else if([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        
        pop.sourceRect = CGRectMake(440.0, 980.0, 100.0, 100.0);
    }

    
    
    [self presentViewController:self.controller animated:YES completion:nil];
    
    
    /*
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:@"hello"]];
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSArray *objectsToShare = @[data];
            
            UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
     
             // Exclude all activities except AirDrop.
             NSArray *excludedActivities = @[UIActivityTypePostToTwitter, UIActivityTypePostToFacebook,
             UIActivityTypePostToWeibo,
             UIActivityTypeMessage, UIActivityTypeMail,
             UIActivityTypePrint, UIActivityTypeCopyToPasteboard,
             UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll,
             UIActivityTypeAddToReadingList, UIActivityTypePostToFlickr,
             UIActivityTypePostToVimeo, UIActivityTypePostToTencentWeibo];
             
             controller.excludedActivityTypes = excludedActivities;
     
         
            // Present the controller
            [self presentViewController:controller animated:YES completion:nil];
        });
        
    });
*/
}


- (UIActivityViewController *)controller {
    if (_controller == nil) {
         NSArray *objectsToShare = @[@"123"];
        _controller = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
    }
    return _controller;
}

- (UIAlertController *)actionSheet
{
    if (_actionSheet == nil) {
        _actionSheet = [UIAlertController alertControllerWithTitle:@"Hello"
                                                           message:@"Syracuse University"
                                                    preferredStyle:UIAlertControllerStyleActionSheet];
        // 在action sheet中，UIAlertActionStyleCancel不起作用
        UIAlertAction *act1 = [UIAlertAction actionWithTitle:@"Zhao" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        }];
        UIAlertAction *act2 = [UIAlertAction actionWithTitle:@"Qing" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        }];
        UIAlertAction *act3 = [UIAlertAction actionWithTitle:@"Jie" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        }];
        [_actionSheet addAction:act1];
        [_actionSheet addAction:act2];
        [_actionSheet addAction:act3];
    }
    return _actionSheet;
}


#pragma mark - UIPopoverPresentationControllerDelegate
- (void)prepareForPopoverPresentation:(UIPopoverPresentationController *)popoverPresentationController
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}
// Called on the delegate when the popover controller will dismiss the popover. Return NO to prevent the
// dismissal of the view.
- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return YES;
}
// Called on the delegate when the user has taken action to dismiss the popover. This is not called when the popover is dimissed programatically.
- (void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController
{
    pop = nil;
    NSLog(@"%s", __PRETTY_FUNCTION__);
}
/* -popoverPresentationController:willRepositionPopoverToRect:inView: is called on your delegate when the popover may require a different view or rectangle. */
- (void)popoverPresentationController:(UIPopoverPresentationController *)popoverPresentationController
          willRepositionPopoverToRect:(inout CGRect *)rect
                               inView:(inout UIView **)view
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    NSLog(@"--------------,%@",self.actionSheet);
    

            
    // 显示在中心位置
    //*rect = CGRectMake(440.0, 980.0, 2, 2);
    if([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeLeft)
    {
        *rect = CGRectMake(610.0, 730.0, 100.0, 100.0);
    }
    else if([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationLandscapeRight)
    {
        *rect = CGRectMake(610.0, 730.0, 100.0, 100.0);
        
    }
    else if([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait)
    {
        
        *rect = CGRectMake(440.0, 980.0, 100.0, 100.0);
    }
    else if([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        
        *rect = CGRectMake(440.0, 980.0, 100.0, 100.0);
    }

}


- (IBAction)clickBTapped:(id)sender {
    
    
}

@end

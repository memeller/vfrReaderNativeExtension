//
//  NativePdfHelper.m
//  VfrReader Native Extension
//
//  Created by Paweł Meller
//

#import "NativePdfReaderHelper.h"

@implementation NativePdfReaderHelper



-(void) showPdf:(NSString *)filePath 
       password:(NSString *)password
{
NSString *phrase = nil; // Document password (for unlocking most encrypted PDF files)
if (password != nil && ![password isEqualToString:@""])
    phrase=password;
ReaderDocument *document = [ReaderDocument withDocumentFilePath:filePath password:phrase];
if (document != nil) // Must have a valid ReaderDocument object in order to proceed with things
{
    ReaderViewController *readerViewController = [[ReaderViewController alloc] initWithReaderDocument:document];
    
    readerViewController.delegate = self; // Set the ReaderViewController delegate to self
    
    
    readerViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    readerViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    
    //ios 6 deprecated presentModalViewController, but we still need ios 5 compatibility
    if([[[[[UIApplication sharedApplication] windows] objectAtIndex:0] rootViewController] respondsToSelector:@selector(presentViewController:animated:completion:)])
        [[[[[UIApplication sharedApplication] windows] objectAtIndex:0] rootViewController] presentViewController:readerViewController animated:YES completion:^{/* done */}];
    else
        [[[[[UIApplication sharedApplication] windows] objectAtIndex:0] rootViewController] presentViewController:readerViewController animated:YES completion:nil];

}
}


- (void)dismissReaderViewController:(ReaderViewController *)viewController
{
    //ios 6 deprecated dismissModalViewControllerAnimated, but we still need ios 5 compatibility
    if([[[[UIApplication sharedApplication] keyWindow] rootViewController] respondsToSelector:@selector(dismissViewControllerAnimated:completion:)])
        [[[[UIApplication sharedApplication] keyWindow] rootViewController] dismissViewControllerAnimated:(YES) completion:nil];
    else if([[[[UIApplication sharedApplication] keyWindow] rootViewController] respondsToSelector:@selector(dismissModalViewControllerAnimated:)])
        [[[[UIApplication sharedApplication] keyWindow] rootViewController] dismissViewControllerAnimated:YES completion:nil];
    //[[[[UIApplication sharedApplication] keyWindow] rootViewController] dismissModalViewControllerAnimated:YES];
    
}


-(void)setContext:(FREContext)ctx {
    context = ctx;
}

@end

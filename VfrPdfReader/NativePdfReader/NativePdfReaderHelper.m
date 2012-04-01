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
    
    [[[[[UIApplication sharedApplication] windows] objectAtIndex:0] rootViewController] presentModalViewController:readerViewController animated:YES];
    
    [readerViewController release]; // Release the ReaderViewController
}
}


- (void)dismissReaderViewController:(ReaderViewController *)viewController
{
    [[[[UIApplication sharedApplication] keyWindow] rootViewController] dismissModalViewControllerAnimated:YES];
    
}


-(void)setContext:(FREContext)ctx {
    context = ctx;
}

@end

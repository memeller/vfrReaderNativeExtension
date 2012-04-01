//
//  NativePdfHelper.h
//  VfrReader Native Extension
//
//  Created by Paweł Meller
//

#import <UIKit/UIKit.h>

#import "ReaderViewController.h"
#import "FlashRuntimeExtensions.h"

@interface NativePdfReaderHelper : NSObject<ReaderViewControllerDelegate> {
	FREContext context;
}

-(void) showPdf:(NSString *)fileName 
               password:(NSString *)password;
- (void)dismissReaderViewController:(ReaderViewController *)viewController;
-(void)setContext:(FREContext)ctx;

@end

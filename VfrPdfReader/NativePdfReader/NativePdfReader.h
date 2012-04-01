//
//  MailExtension.h
//  MailExtension
//
//  Created by Piotr Kościerzyński on 11-11-29.
//  Copyright (c) 2011 Randori. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlashRuntimeExtensions.h"
#import "NativePdfReaderHelper.h"

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>
#import <ImageIO/ImageIO.h>

@interface NativePdfReader : NSObject {

   

}


//int canSendMail(void);
//FREObject PKIsMailComposerAvailable(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
//FREObject PKSendMailWithOptions(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
//Required methods
FREObject NativePdfReaderIsSupported(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject NativePdfReaderShowFile(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
void NativePdfReaderContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, 
						uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet);
void NativePdfReaderContextFinalizer(FREContext ctx);
void NativePdfReaderExtInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, 
                    FREContextFinalizer* ctxFinalizerToSet);
void NativePdfReaderExtFinalizer(void* extData);

@end

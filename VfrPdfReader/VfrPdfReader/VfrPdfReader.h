//
//  VfrPdfReader.h
//  VfrPdfReader
//
//  Created by Pawel Meller
//

#import <Foundation/Foundation.h>
#import "FlashRuntimeExtensions.h"
#import "NativePdfReaderHelper.h"

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>
#import <ImageIO/ImageIO.h>
@interface VfrPdfReader : NSObject
//int canSendMail(void);
//FREObject PKIsMailComposerAvailable(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
//FREObject PKSendMailWithOptions(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
//Required methods
FREObject vfrPdfReaderIsSupported(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
FREObject vfrPdfReaderShowFile(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]);
void vfrPdfReaderContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, 
                                       uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet);
void vfrPdfReaderContextFinalizer(FREContext ctx);
void vfrPdfReaderExtInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, 
                                   FREContextFinalizer* ctxFinalizerToSet);
void vfrPdfReaderExtFinalizer(void* extData);

@end
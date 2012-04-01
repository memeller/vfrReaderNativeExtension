//
//  MailExtension.m
//  MailExtension
//
//  Created by Piotr Kościerzyński on 11-11-29.
//  Copyright (c) 2011 Randori. All rights reserved.
//

#import "NativePdfReader.h"


@implementation NativePdfReader



FREContext g_ctx;
NativePdfReaderHelper *nativePdfReader;

/*- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}*/


FREObject NativePdfReaderIsSupported(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]) {
        
    BOOL ret = true;
        FREObject retVal;
        
        FRENewObjectFromBool(ret, &retVal);
        return retVal;    
    }
FREObject NativePdfReaderShowFile(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]) {
    uint32_t pathLength;
    const uint8_t *pathCString;
    NSString *pathString = nil;
    if (FRE_OK == FREGetObjectAsUTF8(argv[0], &pathLength, &pathCString)) {
        pathString = [NSString stringWithUTF8String:(char*)pathCString];
    }
    uint32_t passLength;
    const uint8_t *passCString;
    NSString *passString = nil;
    if (FRE_OK == FREGetObjectAsUTF8(argv[1], &passLength, &passCString)) {
        passString = [NSString stringWithUTF8String:(char*)passCString];
    }
    if (nativePdfReader) {
	}
    else {
        nativePdfReader = [[NativePdfReaderHelper alloc] init];
    }
    
    [nativePdfReader setContext:ctx];
    [nativePdfReader showPdf:pathString 
                    password:passString];
    return NULL;

}

// ContextInitializer()
//
// The context initializer is called when the runtime creates the extension context instance.
void NativePdfReaderContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, 
						uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet) 
{
    //we expose two methods to ActionScript
	*numFunctionsToTest = 2;
    
	FRENamedFunction* func = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * 2);
	func[0].name = (const uint8_t*) "NativePdfReaderShowFile";
	func[0].functionData = NULL;
    func[0].function = &NativePdfReaderShowFile;
    
    func[1].name = (const uint8_t*) "isSupported";
	func[1].functionData = NULL;
    func[1].function = &NativePdfReaderIsSupported;
    
	*functionsToSet = func;
	
	g_ctx = ctx;
}

// ContextFinalizer()
//
// The context finalizer is called when the extension's ActionScript code
// calls the ExtensionContext instance's dispose() method.
// If the AIR runtime garbage collector disposes of the ExtensionContext instance, the runtime also calls
// ContextFinalizer().

void NativePdfReaderContextFinalizer(FREContext ctx) {

	[nativePdfReader setContext:NULL];
	[nativePdfReader release];
	nativePdfReader = nil;

    return;
}

// ExtInitializer()
//
// The extension initializer is called the first time the ActionScript side of the extension
// calls ExtensionContext.createExtensionContext() for any context.
void NativePdfReaderExtInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, 
                    FREContextFinalizer* ctxFinalizerToSet) {
    
    *extDataToSet = NULL;
    *ctxInitializerToSet = &NativePdfReaderContextInitializer;
    *ctxFinalizerToSet = &NativePdfReaderContextFinalizer;

}

// ExtFinalizer()
//
// The extension finalizer is called when the runtime unloads the extension. However, it is not always called.
void NativePdfReaderExtFinalizer(void* extData) {

    return;
}

@end

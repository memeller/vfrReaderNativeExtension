//
//  VfrPdfReader.m
//  VfrPdfReader
//
//  Created by Pawel Meller
//

#import "VfrPdfReader.h"

@implementation VfrPdfReader

FREContext g_ctx;
NativePdfReaderHelper *nativePdfReader;


FREObject vfrPdfReaderIsSupported(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]) {
    
    BOOL ret = true;
    FREObject retVal;
    NSLog(@"check if supported");
    FRENewObjectFromBool(ret, &retVal);
    return retVal;    
}
FREObject vfrPdfReaderShowFile(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]) {
    BOOL ret = true;
    FREObject retVal;
    uint32_t pathLength;
    const uint8_t *pathCString;
    NSString *pathString = nil;
    if (FRE_OK == FREGetObjectAsUTF8(argv[0], &pathLength, &pathCString)) {
        pathString = [NSString stringWithUTF8String:(char*)pathCString];
    }
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:pathString];
    if(fileExists)
    {
    uint32_t passLength;
    const uint8_t *passCString;
    NSString *passString = nil;
    if (argc>1 && FRE_OK == FREGetObjectAsUTF8(argv[1], &passLength, &passCString)) {
        passString = [NSString stringWithUTF8String:(char*)passCString];
    }
    else
    {
        passString=@"";
    }
    if (nativePdfReader) {
	}
    else {
        nativePdfReader = [[NativePdfReaderHelper alloc] init];
    }
    
    [nativePdfReader setContext:ctx];
        [nativePdfReader showPdf:pathString 
                    password:passString];
    }
    else
    {
        ret=false;
        NSLog(@"file not found %@",pathString);
    }
    FRENewObjectFromBool(ret, &retVal);
    return retVal;    
    
}

// ContextInitializer()
//
// The context initializer is called when the runtime creates the extension context instance.
void vfrPdfReaderContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, 
                                       uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet) 
{
    //we expose two methods to ActionScript
	*numFunctionsToTest = 2;
    
	FRENamedFunction* func = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * 2);
	func[0].name = (const uint8_t*) "vfrPdfReaderShowFile";
	func[0].functionData = NULL;
    func[0].function = &vfrPdfReaderShowFile;
    
    func[1].name = (const uint8_t*) "vfrPdfReaderIsSupported";
	func[1].functionData = NULL;
    func[1].function = &vfrPdfReaderIsSupported;
    
	*functionsToSet = func;
	
	g_ctx = ctx;
}

// ContextFinalizer()
//
// The context finalizer is called when the extension's ActionScript code
// calls the ExtensionContext instance's dispose() method.
// If the AIR runtime garbage collector disposes of the ExtensionContext instance, the runtime also calls
// ContextFinalizer().

void vfrPdfReaderContextFinalizer(FREContext ctx) {
    
	[nativePdfReader setContext:NULL];

	nativePdfReader = nil;
    
    return;
}

// ExtInitializer()
//
// The extension initializer is called the first time the ActionScript side of the extension
// calls ExtensionContext.createExtensionContext() for any context.
void vfrPdfReaderExtInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, 
                                   FREContextFinalizer* ctxFinalizerToSet) {
    
    *extDataToSet = NULL;
    *ctxInitializerToSet = &vfrPdfReaderContextInitializer;
    *ctxFinalizerToSet = &vfrPdfReaderContextFinalizer;
    
}

// ExtFinalizer()
//
// The extension finalizer is called when the runtime unloads the extension. However, it is not always called.
void vfrPdfReaderExtFinalizer(void* extData) {
    
    return;
}

@end

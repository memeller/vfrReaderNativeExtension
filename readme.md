# vfr Rader Native Extension #

### Latest changes:
* Updated the vfr reader to latest version from github (2.6, includes ARC support)
* Updated for iOS 6 (but also kept iOS 5 support)
* Included localization strings for German, Polish and English
* Included a version for iOS simulator

** important **

* if you get any errors about missing functions during compilation of your app, please make sure that you are using latest air SDK
* the example project does not include the Readme.pdf file, so it will not show you any file if you don't include your own pdf 

### About ###

Use the alternative vfr Reader for viewing pdf files in Adobe AIR for iOS

Original source - `https://github.com/vfr/Reader`, screens available at http://www.vfr.org/

You can donate money to the original author on above page, i've only made this accessible from AIR for iOS.

author of this extension: Paweł Meller

Currently supported:

* `showFile(filePath:String,password:String=""):Boolean`
opens pdf using optional password.   
The viewer adds thumbs, bookmarks, mail and print options, just as in the original vfr reader
* `VfrPdfReader.isSupported():Boolean`
reutrns true if supported, false if not supported


### Usage ###
download [.swc](https://github.com/memeller/vfrReaderNativeExtension/raw/master/build/VfrPdfReader.swc) and [.ane](https://github.com/memeller/vfrReaderNativeExtension/raw/master/build/VfrPdfReader.ane) files from build directory and add them to project  
Example project is included, to open pdf just use:
    
    var vfrReader:VfrPdfReader=new VfrPdfReader();
    var file:File=File.applicationDirectory;
    file.resolvePath("Reader.pdf");
    vfrReader.showFile(file.nativePath+"/Reader.pdf");

### ANE compilation ###
To compile the ane, osx with iOS SDK is needed. 

example command:

    /Applications/Adobe\ Flash\ Builder\ 4.6/sdks/4.6.0/bin/adt -package -target ane VfrPdfReader.ane ./extension.xml 
    -swc VfrPdfReader.swc -platform iPhone-ARM -C ./ios . -platformoptions ios-platformoptions.xml -platform default library.swf

please note, that ios directory contains a couple of images, that are used in the application, if you choose not to include them, some buttons and functions will not work
It is possible to change the toolbar icons by replacing these images and compiling the ane with new ones.
platform options file has to be specified, including these frameworks:

`-framework MessageUI -framework ImageIO` (other ones are already included in AIR)

Tested on iPad, iOS 5.01, iOS 6.0
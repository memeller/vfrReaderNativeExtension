#!/bin/sh
/Applications/Adobe\ Flash\ Builder\ 4.6/sdks/4.6.0/bin/adt -package -target ane VfrPdfReader.ane ./extension.xml -swc VfrPdfReader.swc -platform iPhone-ARM -C ./ios . -platformoptions ios-platformoptions.xml -platform default library.swf

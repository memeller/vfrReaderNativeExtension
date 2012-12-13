#!/bin/sh
"/Users/me/Documents/4.6 copy.0_test/bin/adt" -package -target ane VfrPdfReader.ane ./extension.xml -swc VfrPdfReader.swc -platform iPhone-ARM -C ./ios . -platformoptions ios-platformoptions.xml -platform iPhone-x86 -C ./ios_simulator . -platformoptions ios-platformoptions.xml -platform default library.swf

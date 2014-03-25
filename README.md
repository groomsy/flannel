# Flannel

A stylish log formatter for CocoaLumberjack

[![Version](http://cocoapod-badges.herokuapp.com/v/Flannel/badge.png)](http://cocoadocs.org/docsets/Flannel)
[![Platform](http://cocoapod-badges.herokuapp.com/p/Flannel/badge.png)](http://cocoadocs.org/docsets/Flannel)

## Requirements

[CocoaLumberjack](https://github.com/CocoaLumberjack/CocoaLumberjack)

## Installation

Flannel is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "Flannel"

## Use
Create an instance of one of the loggers in Flannel (as of 1.0.1, there is only `FLAVerboseLogFormatter`) and set this instance as the log formatter for your loggers.

    FLAVerboseLogFormatter *formatter = [[FLAVerboseLogFormatter alloc] init];
    [[DDASLLogger sharedInstance] setLogFormatter:formatter];
    [[DDTTYLogger sharedInstance] setLogFormatter:formatter];

## Formatters and Example Log Statements
### FLAVerboseLogFormatter
#### Log Statement (Code)
    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
    {
    	DDLogInfo(@"Application is launching.");
    	return YES;    }
#### Log Statement (Output)
    2014-03-25 13:28:07:263 AppDelegate (application:didFinishLaunchingWithOptions:)[Info]: Application is launching.

## Author

Todd Grooms, todd.grooms@gmail.com

## License

Flannel is available under the MIT license. See the LICENSE file for more info.
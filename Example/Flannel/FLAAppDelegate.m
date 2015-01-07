//
//  FLAAppDelegate.m
//  Flannel
//
//  Created by CocoaPods on 01/06/2015.
//  Copyright (c) 2014 Todd Grooms. All rights reserved.
//

#import "FLAAppDelegate.h"

// Flannel
#import <Flannel/FLAVerboseLogFormatter.h>

@implementation FLAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    FLAVerboseLogFormatter *formatter = [[FLAVerboseLogFormatter alloc] init];
    [[DDASLLogger sharedInstance] setLogFormatter:formatter];
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    
    [[DDTTYLogger sharedInstance] setLogFormatter:formatter];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    return YES;
}

@end

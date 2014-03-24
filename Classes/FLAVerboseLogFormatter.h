#import <Foundation/Foundation.h>

/**
 * Welcome to Flannel!
 * 
 * The project page can be found at:
 * https://github.com/groomsy/flannel
 * 
 * This formatter will format log statements into the following format:
 * yyyy-MM-dd HH:mm:ss:SSS ClassName (methodOriginatedIn)[LOG_LEVEL]: The log statement
 * 
 * To Use:
 * 
 * Step 1:
 * Import the header in your implementation file:
 * 
 * #import "FLAVerboseLogFormatter.h"
 * 
 * Step 2:
 * Add the formatter to your loggers:
 *
 * FLAVerboseLogFormatter *formatter = [[FLAVerboseLogFormatter alloc] init];
 * [[DDASLLogger sharedInstance] setLogFormatter:formatter];
 **/

@protocol DDLogFormatter;

@interface FLAVerboseLogFormatter : NSObject <DDLogFormatter>

@end

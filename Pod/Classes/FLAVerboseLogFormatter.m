#import "DDLog.h"
#import "FLAVerboseLogFormatter.h"

/**
 * Welcome to Flannel!
 * 
 * The project page can be found at:
 * https://github.com/groomsy/flannel
 * 
**/

@interface FLAVerboseLogFormatter ()
{
    NSDateFormatter *_dateFormatter;
    NSLock *_dateFormatterLock;
}

@end

@implementation FLAVerboseLogFormatter

- (id)init
{
    if (self = [super init])
    {
        NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
        [_dateFormatter setLocale:usLocale];
        [_dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss:SSS"];
        [_dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];

        _dateFormatterLock = [[NSLock alloc] init];
    }

    return self;
}

- (void)dealloc
{
    _dateFormatter = nil;
    _dateFormatterLock = nil;
}

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage
{
    NSString *copy;
    @autoreleasepool
    {
        NSString *logLevel;
        switch (logMessage->_flag)
        {
            case DDLogFlagError:
                logLevel = @"[Error]";
                break;
            case DDLogFlagWarning:
                logLevel = @"[Warn]";
                break;
            case DDLogFlagInfo:
                logLevel = @"[Info]";
                break;
            case DDLogFlagDebug:
                logLevel = @"[Debug]";
                break;
            case DDLogFlagVerbose:
                logLevel = @"[Verbose]";
                break;
        }
        
        NSDate *timestamp = logMessage->_timestamp;
        
        [_dateFormatterLock lock];
        NSString *dateAndTime = [_dateFormatter stringFromDate:timestamp];
        [_dateFormatterLock unlock];
        
        NSString *logMsg = logMessage->_message;
        
        NSString *logMessageString = [NSString stringWithFormat:@"%@ %@ (%@)%@: %@\n", dateAndTime, logMessage->_fileName, logMessage->_function, logLevel, logMsg];
        
        copy = [logMessageString copy];
    }
    
    return copy;
}

@end

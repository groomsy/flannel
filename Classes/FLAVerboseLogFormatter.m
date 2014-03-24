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
        switch (logMessage->logFlag)
        {
            case LOG_FLAG_ERROR:
                logLevel = @"[Error]"; break;
            case LOG_FLAG_WARN:
                logLevel = @"[Warn]"; break;
            case LOG_FLAG_INFO:
                logLevel = @"[Info]"; break;
            default:
                logLevel = @"[Verbose]"; break;
        }
        
        NSDate *timestamp = logMessage->timestamp;
        
        [_dateFormatterLock lock];
        NSString *dateAndTime = [_dateFormatter stringFromDate:timestamp];
        [_dateFormatterLock unlock];
        
        NSString *filePath = [[NSString alloc] initWithCString:logMessage->file encoding:NSUTF8StringEncoding];
        NSString *fileName = [[filePath lastPathComponent] stringByDeletingPathExtension];
        
        NSString *logMsg = logMessage->logMsg;
        
        NSString *logMessageString = [NSString stringWithFormat:@"%@ %@ (%s)%@: %@\n", dateAndTime, fileName, logMessage->function, logLevel, logMsg];
        
        copy = [logMessageString copy];
    }
    
    return copy;
}

@end

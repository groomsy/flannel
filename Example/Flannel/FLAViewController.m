//
//  FLAViewController.m
//  Flannel
//
//  Created by Todd Grooms on 01/06/2015.
//  Copyright (c) 2014 Todd Grooms. All rights reserved.
//

#import "FLAViewController.h"

@interface FLAViewController ()
@property (weak, nonatomic) IBOutlet UIButton *verboseLogButton;
@property (weak, nonatomic) IBOutlet UIButton *debugLogButton;
@property (weak, nonatomic) IBOutlet UIButton *infoLogButton;
@property (weak, nonatomic) IBOutlet UIButton *warnLogButton;
@property (weak, nonatomic) IBOutlet UIButton *errorLogButton;

@end

@implementation FLAViewController

- (IBAction)log:(id)sender {
    if ( [self.verboseLogButton isEqual:sender] ) {
        DDLogVerbose(@"You pressed the verbose button!");
    }
    else if ( [self.debugLogButton isEqual:sender] ) {
        DDLogDebug(@"You pressed the debug button!");
    }
    else if ( [self.infoLogButton isEqual:sender] ) {
        DDLogInfo(@"You pressed the info button!");
    }
    else if ( [self.warnLogButton isEqual:sender] ) {
        DDLogWarn(@"You pressed the warn button!");
    }
    else if ( [self.errorLogButton isEqual:sender] ) {
        DDLogError(@"You pressed the error button!");
    }
}

@end

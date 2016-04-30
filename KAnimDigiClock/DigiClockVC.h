//
//  DigiClockVC.h
//  KAnimDigiClock
//
//  Created by khr on 4/29/16.
//  Copyright © 2016 khr. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DigiClockVC : NSViewController

@property (strong) IBOutlet NSView *hour1View;
@property (strong) IBOutlet NSView *hour2View;
@property (strong) IBOutlet NSView *minute1View;
@property (strong) IBOutlet NSView *minute2View;
@property (strong) IBOutlet NSView *second1View;
@property (strong) IBOutlet NSView *second2View;

@end

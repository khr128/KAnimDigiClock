//
//  DigiClockVC.m
//  KAnimDigiClock
//
//  Created by khr on 4/29/16.
//  Copyright © 2016 khr. All rights reserved.
//

#import "DigiClockVC.h"

@interface DigiClockVC ()

@end

@implementation DigiClockVC {

  NSTimer *_timer;

}

- (void)viewDidLoad {

  [super viewDidLoad];

  [self setupDigitViews];

  _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
}

- (void)setupDigitView:(NSView *)view image:(NSImage *)image {

  view.layer.contents = image;
  view.layer.contentsRect = CGRectMake(0.0f, 0.0f, 0.1, 1.0);
  view.layer.contentsGravity = kCAGravityResizeAspect;
  view.layer.magnificationFilter = kCAFilterNearest;

}

- (void)setupDigitViews {

  NSImage *digits = [NSImage imageNamed:@"Digits"];

  [self setupDigitView:self.hour1View image: digits];
  [self setupDigitView:self.hour2View image: digits];
  [self setupDigitView:self.minute1View image: digits];
  [self setupDigitView:self.minute2View image: digits];
  [self setupDigitView:self.second1View image: digits];
  [self setupDigitView:self.second2View image: digits];

}

- (void)setDigit:(NSInteger)digit forView:(NSView *)view {

  view.layer.contentsRect = CGRectMake(digit * 0.1f, 0, 0.1, 1.0);

}

- (void)tick {

  NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  NSUInteger units = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
  NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];

  [self setDigit:components.hour / 10 forView:_hour1View];
  [self setDigit:components.hour % 10 forView:_hour2View];
  [self setDigit:components.minute / 10 forView:_minute1View];
  [self setDigit:components.minute % 10 forView:_minute2View];
  [self setDigit:components.second / 10 forView:_second1View];
  [self setDigit:components.second % 10 forView:_second2View];

}

@end

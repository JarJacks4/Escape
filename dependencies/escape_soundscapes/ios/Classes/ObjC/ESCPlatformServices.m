//  ESCPlatformServices.m
//  Info.plist keys used: NSLocationWhenInUseUsageDescription, NSHealthShareUsageDescription,
//  NSCalendarsFullAccessUsageDescription. Capability: HealthKit (read heart rate only).

#import "ESCPlatformServices.h"
#import <CoreLocation/CoreLocation.h>
#import <EventKit/EventKit.h>
#import <HealthKit/HealthKit.h>
#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>

ESCPermission const ESCPermissionLocation = @"location";
ESCPermission const ESCPermissionHealth = @"health";
ESCPermission const ESCPermissionCalendar = @"calendar";

NSString *const ESCNotificationSunriseWake = @"escape.sunrise-wake";
NSString *const ESCNotificationCirclePrefix = @"escape.circle.";
NSString *const ESCNotificationCompositionReady = @"escape.composition-ready";

static NSString *const ESCHealthAskedKey = @"esc.health.asked";

@interface ESCPlatformServices () <CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong, nullable) HKHealthStore *healthStore;
@property (nonatomic, strong) NSMutableArray<ESCBoolCompletion> *authWaiters;
@property (nonatomic, strong) NSMutableArray<void (^)(CLLocation *_Nullable)> *locationWaiters;
@end

@implementation ESCPlatformServices

+ (instancetype)shared {
    static ESCPlatformServices *shared;
    static dispatch_once_t once;
    dispatch_once(&once, ^{ shared = [[ESCPlatformServices alloc] init]; });
    return shared;
}

- (instancetype)init {
    if ((self = [super init])) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyKilometer; // weather only needs ~1 km
        _authWaiters = [NSMutableArray array];
        _locationWaiters = [NSMutableArray array];
        if ([HKHealthStore isHealthDataAvailable]) _healthStore = [[HKHealthStore alloc] init];
#if DEBUG
        _analyticsHandler = ^(NSString *event, NSDictionary<NSString *, NSString *> *properties) {
            NSLog(@"[analytics] %@ %@", event, properties);
        };
#endif
    }
    return self;
}

static void ESCMain(dispatch_block_t block) {
    if ([NSThread isMainThread]) block(); else dispatch_async(dispatch_get_main_queue(), block);
}

#pragma mark - Permissions

- (BOOL)hasPermission:(ESCPermission)permission {
    if ([permission isEqualToString:ESCPermissionLocation]) {
        CLAuthorizationStatus s = self.locationManager.authorizationStatus;
        return s == kCLAuthorizationStatusAuthorizedWhenInUse || s == kCLAuthorizationStatusAuthorizedAlways;
    }
    if ([permission isEqualToString:ESCPermissionHealth]) {
        // HealthKit never reveals read authorization; treat "asked once" as granted.
        return self.healthStore != nil && [NSUserDefaults.standardUserDefaults boolForKey:ESCHealthAskedKey];
    }
    if ([permission isEqualToString:ESCPermissionCalendar]) {
        return [EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent] == EKAuthorizationStatusFullAccess;
    }
    return NO;
}

- (void)requestPermission:(ESCPermission)permission completion:(ESCBoolCompletion)completion {
    if ([self hasPermission:permission]) { ESCMain(^{ completion(YES); }); return; }

    if ([permission isEqualToString:ESCPermissionLocation]) {
        CLAuthorizationStatus s = self.locationManager.authorizationStatus;
        if (s == kCLAuthorizationStatusDenied || s == kCLAuthorizationStatusRestricted) { ESCMain(^{ completion(NO); }); return; }
        [self.authWaiters addObject:[completion copy]];
        [self.locationManager requestWhenInUseAuthorization];
        return;
    }
    if ([permission isEqualToString:ESCPermissionHealth]) {
        if (!self.healthStore) { ESCMain(^{ completion(NO); }); return; }
        HKQuantityType *heart = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate];
        [self.healthStore requestAuthorizationToShareTypes:nil readTypes:[NSSet setWithObject:heart] completion:^(BOOL success, NSError *error) {
            if (success) [NSUserDefaults.standardUserDefaults setBool:YES forKey:ESCHealthAskedKey];
            ESCMain(^{ completion(success); });
        }];
        return;
    }
    if ([permission isEqualToString:ESCPermissionCalendar]) {
        EKEventStore *store = [[EKEventStore alloc] init];
        [store requestFullAccessToEventsWithCompletion:^(BOOL granted, NSError *error) {
            ESCMain(^{ completion(granted); });
        }];
        return;
    }
    ESCMain(^{ completion(NO); });
}

- (void)locationManagerDidChangeAuthorization:(CLLocationManager *)manager {
    if (manager.authorizationStatus == kCLAuthorizationStatusNotDetermined) return;
    BOOL granted = [self hasPermission:ESCPermissionLocation];
    NSArray<ESCBoolCompletion> *waiters = [self.authWaiters copy];
    [self.authWaiters removeAllObjects];
    for (ESCBoolCompletion w in waiters) w(granted);
}

#pragma mark - Location

- (void)currentLocationWithCompletion:(void (^)(BOOL, double, double))completion {
    if (![self hasPermission:ESCPermissionLocation]) { ESCMain(^{ completion(NO, 0, 0); }); return; }
    CLLocation *cached = self.locationManager.location;
    if (cached && -cached.timestamp.timeIntervalSinceNow < 15 * 60) {
        ESCMain(^{ completion(YES, cached.coordinate.latitude, cached.coordinate.longitude); });
        return;
    }
    __block BOOL done = NO;
    void (^finish)(CLLocation *_Nullable) = ^(CLLocation *_Nullable loc) {
        if (done) return;
        done = YES;
        completion(loc != nil, loc.coordinate.latitude, loc.coordinate.longitude);
    };
    [self.locationWaiters addObject:[finish copy]];
    [self.locationManager requestLocation];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ finish(nil); });
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    [self flushLocation:locations.lastObject];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    [self flushLocation:nil];
}

- (void)flushLocation:(nullable CLLocation *)location {
    NSArray *waiters = [self.locationWaiters copy];
    [self.locationWaiters removeAllObjects];
    for (void (^w)(CLLocation *_Nullable) in waiters) w(location);
}

#pragma mark - Heart rate

- (void)latestHeartRateWithCompletion:(void (^)(double))completion {
    if (!self.healthStore) { ESCMain(^{ completion(0); }); return; }
    HKQuantityType *heart = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate];
    NSSortDescriptor *newest = [NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierEndDate ascending:NO];
    NSPredicate *recent = [HKQuery predicateForSamplesWithStartDate:[NSDate dateWithTimeIntervalSinceNow:-30 * 60] endDate:nil options:0];
    HKSampleQuery *q = [[HKSampleQuery alloc] initWithSampleType:heart predicate:recent limit:1 sortDescriptors:@[newest]
                                                  resultsHandler:^(HKSampleQuery *query, NSArray<__kindof HKSample *> *results, NSError *error) {
        HKQuantitySample *s = results.firstObject;
        double bpm = s ? [s.quantity doubleValueForUnit:[[HKUnit countUnit] unitDividedByUnit:[HKUnit minuteUnit]]] : 0;
        ESCMain(^{ completion(bpm); });
    }];
    [self.healthStore executeQuery:q];
}

#pragma mark - Notifications

- (void)ensureNotificationAuth:(ESCBoolCompletion)completion {
    UNUserNotificationCenter *center = UNUserNotificationCenter.currentNotificationCenter;
    [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings *settings) {
        if (settings.authorizationStatus == UNAuthorizationStatusAuthorized || settings.authorizationStatus == UNAuthorizationStatusProvisional) {
            ESCMain(^{ completion(YES); });
            return;
        }
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert | UNAuthorizationOptionSound)
                              completionHandler:^(BOOL granted, NSError *error) { ESCMain(^{ completion(granted); }); }];
    }];
}

+ (BOOL)parseClock:(NSString *)hhmm hour:(NSInteger *)hour minute:(NSInteger *)minute {
    NSArray<NSString *> *parts = [hhmm componentsSeparatedByString:@":"];
    if (parts.count != 2) return NO;
    NSScanner *h = [NSScanner scannerWithString:parts[0]], *m = [NSScanner scannerWithString:parts[1]];
    NSInteger hv = 0, mv = 0;
    if (![h scanInteger:&hv] || !h.isAtEnd || ![m scanInteger:&mv] || !m.isAtEnd) return NO;
    if (hv < 0 || hv > 23 || mv < 0 || mv > 59) return NO;
    if (hour) *hour = hv;
    if (minute) *minute = mv;
    return YES;
}

- (void)scheduleSunriseWakeAt:(NSString *)hhmm completion:(ESCBoolCompletion)completion {
    NSInteger hour = 0, minute = 0;
    if (![ESCPlatformServices parseClock:hhmm hour:&hour minute:&minute]) { ESCMain(^{ completion(NO); }); return; }
    [self ensureNotificationAuth:^(BOOL granted) {
        if (!granted) { completion(NO); return; }
        UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
        content.title = @"Good morning";
        content.body = @"Lucille is bringing the light up slowly.";
        // Add sunrise_wake.caf to the bundle for the soft alarm; falls back to the default sound.
        content.sound = [UNNotificationSound soundNamed:@"sunrise_wake.caf"] ?: UNNotificationSound.defaultSound;
        if (@available(iOS 15.0, *)) content.interruptionLevel = UNNotificationInterruptionLevelTimeSensitive;
        NSDateComponents *at = [[NSDateComponents alloc] init];
        at.hour = hour;
        at.minute = minute;
        UNCalendarNotificationTrigger *trigger = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:at repeats:YES];
        UNNotificationRequest *req = [UNNotificationRequest requestWithIdentifier:ESCNotificationSunriseWake content:content trigger:trigger];
        [UNUserNotificationCenter.currentNotificationCenter addNotificationRequest:req withCompletionHandler:^(NSError *error) {
            ESCMain(^{ completion(error == nil); });
        }];
    }];
}

- (void)cancelSunriseWake {
    [UNUserNotificationCenter.currentNotificationCenter removePendingNotificationRequestsWithIdentifiers:@[ESCNotificationSunriseWake]];
}

+ (nullable NSDate *)dateForCircleWhen:(NSString *)when now:(NSDate *)now calendar:(NSCalendar *)calendar {
    NSArray<NSString *> *parts = [when componentsSeparatedByString:@"·"];
    if (parts.count != 2) return nil;
    NSString *day = [parts[0] stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceCharacterSet].lowercaseString;
    NSString *time = [parts[1] stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceCharacterSet];
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    f.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
    f.dateFormat = @"h:mm a";
    f.timeZone = calendar.timeZone;
    NSDate *clock = [f dateFromString:time];
    if (!clock) return nil;
    NSDateComponents *c = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:clock];
    NSInteger offset = [day isEqualToString:@"today"] ? 0 : [day isEqualToString:@"tomorrow"] ? 1 : -1;
    if (offset < 0) return nil;
    NSDate *base = [calendar dateByAddingUnit:NSCalendarUnitDay value:offset toDate:[calendar startOfDayForDate:now] options:0];
    return [calendar dateBySettingHour:c.hour minute:c.minute second:0 ofDate:base options:0];
}

- (void)scheduleCircleReminderWithId:(NSString *)circleId title:(NSString *)title when:(NSString *)when completion:(ESCBoolCompletion)completion {
    NSDate *start = [ESCPlatformServices dateForCircleWhen:when now:[NSDate date] calendar:NSCalendar.currentCalendar];
    NSDate *fire = [start dateByAddingTimeInterval:-10 * 60];
    if (!fire || fire.timeIntervalSinceNow < 5) { ESCMain(^{ completion(NO); }); return; }
    [self ensureNotificationAuth:^(BOOL granted) {
        if (!granted) { completion(NO); return; }
        UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
        content.title = title;
        content.body = @"Your Listening Circle starts in 10 minutes.";
        content.sound = UNNotificationSound.defaultSound;
        content.userInfo = @{@"circleId": circleId};
        UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:fire.timeIntervalSinceNow repeats:NO];
        NSString *identifier = [ESCNotificationCirclePrefix stringByAppendingString:circleId];
        UNNotificationRequest *req = [UNNotificationRequest requestWithIdentifier:identifier content:content trigger:trigger];
        [UNUserNotificationCenter.currentNotificationCenter addNotificationRequest:req withCompletionHandler:^(NSError *error) {
            ESCMain(^{ completion(error == nil); });
        }];
    }];
}

- (void)cancelCircleReminderWithId:(NSString *)circleId {
    NSString *identifier = [ESCNotificationCirclePrefix stringByAppendingString:circleId];
    [UNUserNotificationCenter.currentNotificationCenter removePendingNotificationRequestsWithIdentifiers:@[identifier]];
}

- (void)notifyCompositionReadyWithTitle:(NSString *)title {
    // Only when the app is in the background; in the foreground the screen already shows it.
    if (UIApplication.sharedApplication.applicationState == UIApplicationStateActive) return;
    [self ensureNotificationAuth:^(BOOL granted) {
        if (!granted) return;
        UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
        content.title = @"Your soundscape is ready";
        content.body = [NSString stringWithFormat:@"Lucille finished “%@”.", title];
        content.sound = UNNotificationSound.defaultSound;
        UNNotificationRequest *req = [UNNotificationRequest requestWithIdentifier:ESCNotificationCompositionReady content:content trigger:nil];
        [UNUserNotificationCenter.currentNotificationCenter addNotificationRequest:req withCompletionHandler:nil];
    }];
}

#pragma mark - Purchases, Focus Shield

- (void)purchaseProductId:(NSString *)productId completion:(ESCPurchaseCompletion)completion {
    if (!self.purchaseHandler) {
        NSError *e = [NSError errorWithDomain:@"ESCPlatformServices" code:1
                                     userInfo:@{NSLocalizedDescriptionKey: @"Set ESCPlatformServices.purchaseHandler (RevenueCat) at launch."}];
#if DEBUG
        // Debug builds unlock Premium so the paywall flow can be tested end to end.
        ESCMain(^{ completion(YES, nil); });
#else
        ESCMain(^{ completion(NO, e); });
#endif
        (void)e;
        return;
    }
    self.purchaseHandler(productId, ^(BOOL entitled, NSError *error) { ESCMain(^{ completion(entitled, error); }); });
}

- (void)restorePurchasesWithCompletion:(ESCPurchaseCompletion)completion {
    if (!self.restoreHandler) { ESCMain(^{ completion(NO, nil); }); return; }
    self.restoreHandler(^(BOOL entitled, NSError *error) { ESCMain(^{ completion(entitled, error); }); });
}

- (void)setFocusShield:(BOOL)on completion:(ESCBoolCompletion)completion {
    if (!self.focusShieldHandler) { ESCMain(^{ completion(!on); }); return; } // turning off always succeeds
    self.focusShieldHandler(on, ^(BOOL ok) { ESCMain(^{ completion(ok); }); });
}

#pragma mark - Haptics, analytics

- (void)playHaptic:(ESCHaptic)haptic {
    ESCMain(^{
        switch (haptic) {
            case ESCHapticSelection: [[[UISelectionFeedbackGenerator alloc] init] selectionChanged]; break;
            case ESCHapticLight: [[[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight] impactOccurred]; break;
            case ESCHapticMedium: [[[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium] impactOccurred]; break;
            case ESCHapticSuccess: [[[UINotificationFeedbackGenerator alloc] init] notificationOccurred:UINotificationFeedbackTypeSuccess]; break;
            case ESCHapticWarning: [[[UINotificationFeedbackGenerator alloc] init] notificationOccurred:UINotificationFeedbackTypeWarning]; break;
        }
    });
}

- (void)track:(NSString *)event properties:(NSDictionary<NSString *, NSString *> *)properties {
    if (self.analyticsHandler) self.analyticsHandler(event, properties ?: @{});
}

@end

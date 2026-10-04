//  ESCPlatformServices.h
//  Objective-C team: device services the Soundscapes screens need.
//
//  Swift reaches this class through `ObjCHostServices` (Services/ObjCHostServices.swift),
//  which implements the `HostServices` protocol the AppStore uses. Every method is safe to
//  call on the main thread and calls its completion on the main queue.

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// Matches InputSetting.Permission in Swift ("location", "health", "calendar").
typedef NSString *ESCPermission NS_TYPED_ENUM;
extern ESCPermission const ESCPermissionLocation;
extern ESCPermission const ESCPermissionHealth;
extern ESCPermission const ESCPermissionCalendar;

/// Matches HapticKind in Swift.
typedef NS_ENUM(NSInteger, ESCHaptic) {
    ESCHapticSelection = 0,
    ESCHapticLight,
    ESCHapticMedium,
    ESCHapticSuccess,
    ESCHapticWarning,
};

/// Notification identifiers, so the main app can route taps.
extern NSString *const ESCNotificationSunriseWake;      // "escape.sunrise-wake"
extern NSString *const ESCNotificationCirclePrefix;     // "escape.circle." + circle id
extern NSString *const ESCNotificationCompositionReady; // "escape.composition-ready"

typedef void (^ESCBoolCompletion)(BOOL granted);
typedef void (^ESCPurchaseCompletion)(BOOL entitled, NSError *_Nullable error);
/// Purchases go through RevenueCat (or StoreKit) in the main app. Set this block once at launch:
///     services.purchaseHandler = ^(NSString *productId, ESCPurchaseCompletion done) {
///         [[RCPurchases sharedPurchases] getProductsWithIdentifiers:@[productId] completion:^(NSArray *products) {
///             [[RCPurchases sharedPurchases] purchaseProduct:products.firstObject withCompletion:^(RCStoreTransaction *t, RCCustomerInfo *info, NSError *e, BOOL cancelled) {
///                 done(info.entitlements[@"premium"].isActive, e);
///             }];
///         }];
///     };
typedef void (^ESCPurchaseHandler)(NSString *productId, ESCPurchaseCompletion completion);
typedef void (^ESCRestoreHandler)(ESCPurchaseCompletion completion);
/// Focus Shield needs the Family Controls entitlement (Swift-only API). The main app sets this.
typedef void (^ESCFocusShieldHandler)(BOOL on, ESCBoolCompletion completion);
/// Analytics sink (Segment, Amplitude, Firebase Analytics…). Defaults to NSLog in Debug.
typedef void (^ESCAnalyticsHandler)(NSString *event, NSDictionary<NSString *, NSString *> *properties);

@interface ESCPlatformServices : NSObject

@property (class, nonatomic, readonly, strong) ESCPlatformServices *shared;

#pragma mark Permissions (only after the PermissionPrimer's "Allow")
- (BOOL)hasPermission:(ESCPermission)permission
    NS_SWIFT_NAME(hasPermission(_:));
- (void)requestPermission:(ESCPermission)permission completion:(ESCBoolCompletion)completion
    NS_SWIFT_NAME(requestPermission(_:completion:));

#pragma mark Inner weather inputs
/// Last known location. Completion gets NO when there's no permission or no fix within 5 s.
- (void)currentLocationWithCompletion:(void (^)(BOOL ok, double latitude, double longitude))completion
    NS_SWIFT_NAME(currentLocation(completion:));
/// Most recent heart-rate sample from HealthKit (bpm), or 0 when unavailable.
- (void)latestHeartRateWithCompletion:(void (^)(double bpm))completion
    NS_SWIFT_NAME(latestHeartRate(completion:));

#pragma mark Local notifications
/// "07:00" → a repeating daily notification with the soft Sunrise Wake sound.
- (void)scheduleSunriseWakeAt:(NSString *)hhmm completion:(ESCBoolCompletion)completion
    NS_SWIFT_NAME(scheduleSunriseWake(at:completion:));
- (void)cancelSunriseWake;
/// `when` is the display string from the API ("Tomorrow · 9:00 AM"); fires 10 minutes before.
- (void)scheduleCircleReminderWithId:(NSString *)circleId title:(NSString *)title when:(NSString *)when completion:(ESCBoolCompletion)completion
    NS_SWIFT_NAME(scheduleCircleReminder(id:title:when:completion:));
- (void)cancelCircleReminderWithId:(NSString *)circleId
    NS_SWIFT_NAME(cancelCircleReminder(id:));
/// "Your soundscape is ready" when Lucille finishes while the user is elsewhere.
- (void)notifyCompositionReadyWithTitle:(NSString *)title
    NS_SWIFT_NAME(notifyCompositionReady(title:));

#pragma mark Purchases, Focus Shield, haptics, analytics
@property (nonatomic, copy, nullable) ESCPurchaseHandler purchaseHandler;
@property (nonatomic, copy, nullable) ESCRestoreHandler restoreHandler;
@property (nonatomic, copy, nullable) ESCFocusShieldHandler focusShieldHandler;
@property (nonatomic, copy, nullable) ESCAnalyticsHandler analyticsHandler;

- (void)purchaseProductId:(NSString *)productId completion:(ESCPurchaseCompletion)completion
    NS_SWIFT_NAME(purchase(productId:completion:));
- (void)restorePurchasesWithCompletion:(ESCPurchaseCompletion)completion
    NS_SWIFT_NAME(restorePurchases(completion:));
- (void)setFocusShield:(BOOL)on completion:(ESCBoolCompletion)completion
    NS_SWIFT_NAME(setFocusShield(_:completion:));
- (void)playHaptic:(ESCHaptic)haptic
    NS_SWIFT_NAME(playHaptic(_:));
- (void)track:(NSString *)event properties:(NSDictionary<NSString *, NSString *> *)properties
    NS_SWIFT_NAME(track(_:properties:));

/// Parses "HH:mm" (24 h). Returns NO for bad input. Exposed for unit tests.
+ (BOOL)parseClock:(NSString *)hhmm hour:(NSInteger *)hour minute:(NSInteger *)minute;
/// Parses the API's circle time ("Today · 6:30 PM", "Tomorrow · 9:00 AM") relative to `now`. nil if unparseable.
+ (nullable NSDate *)dateForCircleWhen:(NSString *)when now:(NSDate *)now calendar:(NSCalendar *)calendar;

@end

NS_ASSUME_NONNULL_END

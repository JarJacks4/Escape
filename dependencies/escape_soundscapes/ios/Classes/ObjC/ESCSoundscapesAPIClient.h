//  ESCSoundscapesAPIClient.h
//  Objective-C client for every endpoint in shared/openapi.yaml.
//
//  The SwiftUI screens use the Swift `APIClient`; this one is for the Objective-C parts of the
//  Escape app (legacy screens, widgets, push handlers, the Sleep alarm extension) so they can
//  read and write the same Soundscapes data. Responses are the parsed JSON (NSDictionary /
//  NSArray, NSNull for JSON null). Completions run on the main queue.

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

extern NSErrorDomain const ESCAPIErrorDomain;
/// userInfo keys on ESCAPIErrorDomain errors. error.code is the HTTP status (0 = transport/JSON).
extern NSString *const ESCAPIErrorCodeKey;    // e.g. @"premium_required"
extern NSString *const ESCAPIErrorStatusKey;  // NSNumber HTTP status

typedef void (^ESCJSONCompletion)(id _Nullable json, NSError *_Nullable error);
/// Hand back a Firebase ID token (or "dev:<uid>" for the local backend), or nil to send no header.
typedef void (^ESCTokenProvider)(void (^done)(NSString *_Nullable token));

@interface ESCSoundscapesAPIClient : NSObject

- (instancetype)initWithBaseURL:(NSURL *)baseURL tokenProvider:(nullable ESCTokenProvider)tokenProvider session:(nullable NSURLSession *)session NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;
/// http://localhost:8080 with dev auth as `uid`.
+ (instancetype)devClientWithUid:(NSString *)uid;

@property (nonatomic, readonly) NSURL *baseURL;

/// Low-level call. `path` is relative ("v1/home"), `query` values are strings, `body` is JSON-serialisable.
/// Returns the task when it started synchronously (nil when the token provider is asynchronous).
- (nullable NSURLSessionDataTask *)requestMethod:(NSString *)method path:(NSString *)path
                                  query:(nullable NSDictionary<NSString *, NSString *> *)query
                                   body:(nullable id)body completion:(ESCJSONCompletion)completion;

/// True when `error` is a 402 → show the Premium paywall.
+ (BOOL)isPremiumRequired:(nullable NSError *)error;

#pragma mark Home
- (void)fetchContent:(ESCJSONCompletion)completion;                                                // GET /v1/content
- (void)fetchHomeWithTimeZone:(nullable NSString *)tz latitude:(nullable NSNumber *)lat longitude:(nullable NSNumber *)lon
                     heartBpm:(nullable NSNumber *)bpm completion:(ESCJSONCompletion)completion;  // GET /v1/home
- (void)fetchInputsNowWithTimeZone:(nullable NSString *)tz latitude:(nullable NSNumber *)lat longitude:(nullable NSNumber *)lon
                          heartBpm:(nullable NSNumber *)bpm completion:(ESCJSONCompletion)completion; // GET /v1/inputs/now

#pragma mark Me
- (void)fetchMe:(ESCJSONCompletion)completion;                                                     // GET /v1/me
- (void)updateProfileFirstName:(nullable NSString *)firstName timeZone:(nullable NSString *)tz completion:(ESCJSONCompletion)completion; // PATCH /v1/me
- (void)deleteAccount:(ESCJSONCompletion)completion;                                               // DELETE /v1/me
- (void)fetchExperiments:(ESCJSONCompletion)completion;                                            // GET /v1/experiments
- (void)fetchPreferences:(ESCJSONCompletion)completion;                                            // GET /v1/me/preferences
- (void)updatePreferences:(NSDictionary *)patch completion:(ESCJSONCompletion)completion;          // PATCH /v1/me/preferences
- (void)completeOnboarding:(ESCJSONCompletion)completion;                                          // POST /v1/me/onboarding/complete

#pragma mark Inputs
- (void)fetchInputs:(ESCJSONCompletion)completion;                                                 // GET /v1/me/inputs
- (void)setInput:(NSString *)inputId enabled:(BOOL)enabled completion:(ESCJSONCompletion)completion; // PUT /v1/me/inputs/{id}
- (void)deleteInputHistory:(ESCJSONCompletion)completion;                                          // DELETE /v1/me/inputs/history
- (void)postMoodCheckInValue:(double)value tags:(NSArray<NSString *> *)tags source:(NSString *)source completion:(ESCJSONCompletion)completion; // POST /v1/me/mood-checkins
- (void)fetchLatestMoodCheckIn:(ESCJSONCompletion)completion;                                      // GET /v1/me/mood-checkins/latest
- (void)fetchLatestMoodScan:(ESCJSONCompletion)completion;                                         // GET /v1/me/mood-scan/latest

#pragma mark Catalog
- (void)fetchModes:(ESCJSONCompletion)completion;                                                  // GET /v1/modes
- (void)fetchBrowse:(NSString *)mode completion:(ESCJSONCompletion)completion;                     // GET /v1/browse/{mode}
- (void)fetchCatalogForMode:(NSString *)mode completion:(ESCJSONCompletion)completion;             // GET /v1/catalog?mode=
- (void)fetchJourneys:(ESCJSONCompletion)completion;                                               // GET /v1/journeys
- (void)fetchJourney:(NSString *)journeyId completion:(ESCJSONCompletion)completion;               // GET /v1/journeys/{id}
- (void)startJourney:(NSString *)journeyId completion:(ESCJSONCompletion)completion;               // POST /v1/journeys/{id}/start
- (void)fetchWhisperTopics:(ESCJSONCompletion)completion;                                          // GET /v1/whisper/topics
- (void)fetchVisualPresetsForMode:(nullable NSString *)mode completion:(ESCJSONCompletion)completion; // GET /v1/visual-presets
- (void)fetchPremiumPlans:(ESCJSONCompletion)completion;                                           // GET /v1/premium/plans

#pragma mark Compositions
- (void)fetchDailyDrop:(ESCJSONCompletion)completion;                                              // GET /v1/daily-drop
- (void)compose:(NSDictionary *)request completion:(ESCJSONCompletion)completion;                  // POST /v1/compose
- (void)fetchMyCompositionsLimit:(NSInteger)limit completion:(ESCJSONCompletion)completion;        // GET /v1/compositions
- (void)fetchComposition:(NSString *)compositionId completion:(ESCJSONCompletion)completion;       // GET /v1/compositions/{id}
- (void)variationOf:(NSString *)compositionId completion:(ESCJSONCompletion)completion;            // POST /v1/compositions/{id}/variation
- (void)retune:(NSString *)compositionId energy:(double)energy texture:(double)texture completion:(ESCJSONCompletion)completion; // POST /v1/compositions/{id}/retune
/// Polls GET /v1/compositions/{id} every `interval` seconds until ready/failed or `timeout`.
- (void)waitForComposition:(NSString *)compositionId interval:(NSTimeInterval)interval timeout:(NSTimeInterval)timeout completion:(ESCJSONCompletion)completion;

#pragma mark Library + playlists
- (void)fetchLibraryKind:(nullable NSString *)kind completion:(ESCJSONCompletion)completion;       // GET /v1/library?kind=saved|downloads|memory
- (void)saveComposition:(NSString *)compositionId offline:(BOOL)offline completion:(ESCJSONCompletion)completion; // POST /v1/library
- (void)setLibraryItem:(NSString *)itemId offline:(BOOL)offline completion:(ESCJSONCompletion)completion; // PATCH /v1/library/{id}
- (void)removeLibraryItem:(NSString *)itemId completion:(ESCJSONCompletion)completion;             // DELETE /v1/library/{id}
- (void)saveMemoryForSession:(NSString *)sessionId title:(nullable NSString *)title completion:(ESCJSONCompletion)completion; // POST /v1/memories
- (void)fetchPlaylists:(ESCJSONCompletion)completion;                                              // GET /v1/playlists
- (void)fetchPlaylist:(NSString *)playlistId completion:(ESCJSONCompletion)completion;             // GET /v1/playlists/{id}
- (void)setLikePlaylist:(NSString *)playlistId track:(NSString *)trackId liked:(BOOL)liked completion:(ESCJSONCompletion)completion; // PUT …/like

#pragma mark Circles
- (void)fetchCircles:(ESCJSONCompletion)completion;                                                // GET /v1/circles
- (void)joinCircle:(NSString *)circleId completion:(ESCJSONCompletion)completion;                  // POST /v1/circles/{id}/join
- (void)leaveCircle:(NSString *)circleId completion:(ESCJSONCompletion)completion;                 // POST /v1/circles/{id}/leave
- (void)setCircleReminder:(NSString *)circleId on:(BOOL)on completion:(ESCJSONCompletion)completion; // PUT /v1/circles/{id}/reminder

#pragma mark Sessions
- (void)startSessionMode:(NSString *)mode compositionId:(nullable NSString *)compositionId startedFrom:(NSString *)origin completion:(ESCJSONCompletion)completion; // POST /v1/sessions/start
- (void)completeSession:(NSString *)sessionId minutes:(nullable NSNumber *)minutes moodAfter:(nullable NSNumber *)moodAfter completion:(ESCJSONCompletion)completion; // POST /v1/sessions/{id}/complete
- (void)sendBetaFeedbackCalm:(NSInteger)calmRating visual:(nullable NSString *)visual note:(nullable NSString *)note
                   sessionId:(nullable NSString *)sessionId mode:(nullable NSString *)mode completion:(ESCJSONCompletion)completion; // POST /v1/beta-feedback

@end

NS_ASSUME_NONNULL_END

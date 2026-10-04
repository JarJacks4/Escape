//  ESCSoundscapesAPIClient.m

#import "ESCSoundscapesAPIClient.h"

NSErrorDomain const ESCAPIErrorDomain = @"ESCAPIErrorDomain";
NSString *const ESCAPIErrorCodeKey = @"ESCAPIErrorCode";
NSString *const ESCAPIErrorStatusKey = @"ESCAPIErrorStatus";

@interface ESCSoundscapesAPIClient ()
@property (nonatomic, copy, nullable) ESCTokenProvider tokenProvider;
@property (nonatomic, strong) NSURLSession *session;
@end

@implementation ESCSoundscapesAPIClient

- (instancetype)initWithBaseURL:(NSURL *)baseURL tokenProvider:(ESCTokenProvider)tokenProvider session:(NSURLSession *)session {
    if ((self = [super init])) {
        _baseURL = baseURL;
        _tokenProvider = [tokenProvider copy];
        _session = session ?: NSURLSession.sharedSession;
    }
    return self;
}

+ (instancetype)devClientWithUid:(NSString *)uid {
    NSString *token = [@"dev:" stringByAppendingString:uid];
    return [[self alloc] initWithBaseURL:[NSURL URLWithString:@"http://localhost:8080"]
                           tokenProvider:^(void (^done)(NSString *)) { done(token); }
                                 session:nil];
}

+ (BOOL)isPremiumRequired:(NSError *)error {
    return [error.domain isEqualToString:ESCAPIErrorDomain] && error.code == 402;
}

static NSString *ESCEscape(NSString *s) {
    NSMutableCharacterSet *allowed = [NSCharacterSet.URLPathAllowedCharacterSet mutableCopy];
    [allowed removeCharactersInString:@"/"];
    return [s stringByAddingPercentEncodingWithAllowedCharacters:allowed] ?: s;
}

static void ESCDone(ESCJSONCompletion completion, id _Nullable json, NSError *_Nullable error) {
    dispatch_async(dispatch_get_main_queue(), ^{ completion(json, error); });
}

- (nullable NSURLSessionDataTask *)requestMethod:(NSString *)method path:(NSString *)path query:(NSDictionary<NSString *, NSString *> *)query
                                   body:(id)body completion:(ESCJSONCompletion)completion {
    // Path segments are already percent-escaped (ESCEscape), so set the encoded path directly.
    NSURLComponents *comps = [NSURLComponents componentsWithURL:self.baseURL resolvingAgainstBaseURL:NO];
    NSString *basePath = [comps.percentEncodedPath hasSuffix:@"/"] ? [comps.percentEncodedPath substringToIndex:comps.percentEncodedPath.length - 1] : comps.percentEncodedPath;
    comps.percentEncodedPath = [NSString stringWithFormat:@"%@/%@", basePath ?: @"", path];
    if (query.count) {
        NSMutableArray<NSURLQueryItem *> *items = [NSMutableArray array];
        for (NSString *key in [query.allKeys sortedArrayUsingSelector:@selector(compare:)]) {
            [items addObject:[NSURLQueryItem queryItemWithName:key value:query[key]]];
        }
        comps.queryItems = items;
    }
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:comps.URL];
    req.HTTPMethod = method;
    req.timeoutInterval = 20;
    [req setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    if (body) {
        NSError *jsonError = nil;
        req.HTTPBody = [NSJSONSerialization dataWithJSONObject:body options:0 error:&jsonError];
        if (jsonError) { ESCDone(completion, nil, jsonError); return nil; }
        [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    }

    __block NSURLSessionDataTask *task = nil;
    void (^send)(NSString *_Nullable) = ^(NSString *_Nullable token) {
        if (token.length) [req setValue:[@"Bearer " stringByAppendingString:token] forHTTPHeaderField:@"Authorization"];
        task = [self.session dataTaskWithRequest:req completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if (error) { ESCDone(completion, nil, error); return; }
            NSInteger status = [response isKindOfClass:NSHTTPURLResponse.class] ? ((NSHTTPURLResponse *)response).statusCode : 0;
            id json = data.length ? [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingFragmentsAllowed error:nil] : nil;
            if (status < 200 || status >= 300) {
                NSDictionary *err = [json isKindOfClass:NSDictionary.class] ? json[@"error"] : nil;
                NSString *code = [err[@"code"] isKindOfClass:NSString.class] ? err[@"code"] : [NSString stringWithFormat:@"http_%ld", (long)status];
                NSString *message = [err[@"message"] isKindOfClass:NSString.class] ? err[@"message"] : [NSHTTPURLResponse localizedStringForStatusCode:status];
                ESCDone(completion, nil, [NSError errorWithDomain:ESCAPIErrorDomain code:status
                                                         userInfo:@{NSLocalizedDescriptionKey: message, ESCAPIErrorCodeKey: code, ESCAPIErrorStatusKey: @(status)}]);
                return;
            }
            ESCDone(completion, json ?: NSNull.null, nil);
        }];
        [task resume];
    };
    if (self.tokenProvider) self.tokenProvider(send); else send(nil);
    return task;
}

// Shorthands
- (void)get:(NSString *)path query:(NSDictionary *)q completion:(ESCJSONCompletion)c { [self requestMethod:@"GET" path:path query:q body:nil completion:c]; }
- (void)send:(NSString *)method path:(NSString *)path body:(id)body completion:(ESCJSONCompletion)c {
    [self requestMethod:method path:path query:nil body:body ?: @{} completion:c];
}

static NSDictionary *ESCWeatherQuery(NSString *tz, NSNumber *lat, NSNumber *lon, NSNumber *bpm) {
    NSMutableDictionary *q = [NSMutableDictionary dictionary];
    q[@"tz"] = tz ?: NSTimeZone.localTimeZone.name;
    if (lat) q[@"lat"] = lat.stringValue;
    if (lon) q[@"lon"] = lon.stringValue;
    if (bpm) q[@"heartBpm"] = bpm.stringValue;
    return q;
}

#pragma mark Home
- (void)fetchContent:(ESCJSONCompletion)c { [self get:@"v1/content" query:nil completion:c]; }
- (void)fetchHomeWithTimeZone:(NSString *)tz latitude:(NSNumber *)lat longitude:(NSNumber *)lon heartBpm:(NSNumber *)bpm completion:(ESCJSONCompletion)c {
    [self get:@"v1/home" query:ESCWeatherQuery(tz, lat, lon, bpm) completion:c];
}
- (void)fetchInputsNowWithTimeZone:(NSString *)tz latitude:(NSNumber *)lat longitude:(NSNumber *)lon heartBpm:(NSNumber *)bpm completion:(ESCJSONCompletion)c {
    [self get:@"v1/inputs/now" query:ESCWeatherQuery(tz, lat, lon, bpm) completion:c];
}

#pragma mark Me
- (void)fetchMe:(ESCJSONCompletion)c { [self get:@"v1/me" query:nil completion:c]; }
- (void)updateProfileFirstName:(NSString *)firstName timeZone:(NSString *)tz completion:(ESCJSONCompletion)c {
    NSMutableDictionary *b = [NSMutableDictionary dictionary];
    if (firstName) b[@"firstName"] = firstName;
    if (tz) b[@"tz"] = tz;
    [self send:@"PATCH" path:@"v1/me" body:b completion:c];
}
- (void)deleteAccount:(ESCJSONCompletion)c { [self requestMethod:@"DELETE" path:@"v1/me" query:nil body:nil completion:c]; }
- (void)fetchExperiments:(ESCJSONCompletion)c { [self get:@"v1/experiments" query:nil completion:c]; }
- (void)fetchPreferences:(ESCJSONCompletion)c { [self get:@"v1/me/preferences" query:nil completion:c]; }
- (void)updatePreferences:(NSDictionary *)patch completion:(ESCJSONCompletion)c { [self send:@"PATCH" path:@"v1/me/preferences" body:patch completion:c]; }
- (void)completeOnboarding:(ESCJSONCompletion)c { [self send:@"POST" path:@"v1/me/onboarding/complete" body:nil completion:c]; }

#pragma mark Inputs
- (void)fetchInputs:(ESCJSONCompletion)c { [self get:@"v1/me/inputs" query:nil completion:c]; }
- (void)setInput:(NSString *)inputId enabled:(BOOL)enabled completion:(ESCJSONCompletion)c {
    [self send:@"PUT" path:[@"v1/me/inputs/" stringByAppendingString:ESCEscape(inputId)] body:@{@"enabled": @(enabled)} completion:c];
}
- (void)deleteInputHistory:(ESCJSONCompletion)c { [self requestMethod:@"DELETE" path:@"v1/me/inputs/history" query:nil body:nil completion:c]; }
- (void)postMoodCheckInValue:(double)value tags:(NSArray<NSString *> *)tags source:(NSString *)source completion:(ESCJSONCompletion)c {
    [self send:@"POST" path:@"v1/me/mood-checkins" body:@{@"value": @(value), @"tags": tags ?: @[], @"source": source ?: @"manual"} completion:c];
}
- (void)fetchLatestMoodCheckIn:(ESCJSONCompletion)c { [self get:@"v1/me/mood-checkins/latest" query:nil completion:c]; }
- (void)fetchLatestMoodScan:(ESCJSONCompletion)c { [self get:@"v1/me/mood-scan/latest" query:nil completion:c]; }

#pragma mark Catalog
- (void)fetchModes:(ESCJSONCompletion)c { [self get:@"v1/modes" query:nil completion:c]; }
- (void)fetchBrowse:(NSString *)mode completion:(ESCJSONCompletion)c { [self get:[@"v1/browse/" stringByAppendingString:ESCEscape(mode)] query:nil completion:c]; }
- (void)fetchCatalogForMode:(NSString *)mode completion:(ESCJSONCompletion)c { [self get:@"v1/catalog" query:@{@"mode": mode} completion:c]; }
- (void)fetchJourneys:(ESCJSONCompletion)c { [self get:@"v1/journeys" query:nil completion:c]; }
- (void)fetchJourney:(NSString *)journeyId completion:(ESCJSONCompletion)c { [self get:[@"v1/journeys/" stringByAppendingString:ESCEscape(journeyId)] query:nil completion:c]; }
- (void)startJourney:(NSString *)journeyId completion:(ESCJSONCompletion)c {
    [self send:@"POST" path:[NSString stringWithFormat:@"v1/journeys/%@/start", ESCEscape(journeyId)] body:nil completion:c];
}
- (void)fetchWhisperTopics:(ESCJSONCompletion)c { [self get:@"v1/whisper/topics" query:nil completion:c]; }
- (void)fetchVisualPresetsForMode:(NSString *)mode completion:(ESCJSONCompletion)c { [self get:@"v1/visual-presets" query:mode ? @{@"mode": mode} : nil completion:c]; }
- (void)fetchPremiumPlans:(ESCJSONCompletion)c { [self get:@"v1/premium/plans" query:nil completion:c]; }

#pragma mark Compositions
- (void)fetchDailyDrop:(ESCJSONCompletion)c { [self get:@"v1/daily-drop" query:nil completion:c]; }
- (void)compose:(NSDictionary *)request completion:(ESCJSONCompletion)c { [self send:@"POST" path:@"v1/compose" body:request completion:c]; }
- (void)fetchMyCompositionsLimit:(NSInteger)limit completion:(ESCJSONCompletion)c {
    [self get:@"v1/compositions" query:@{@"limit": [NSString stringWithFormat:@"%ld", (long)limit]} completion:c];
}
- (void)fetchComposition:(NSString *)compositionId completion:(ESCJSONCompletion)c {
    [self get:[@"v1/compositions/" stringByAppendingString:ESCEscape(compositionId)] query:nil completion:c];
}
- (void)variationOf:(NSString *)compositionId completion:(ESCJSONCompletion)c {
    [self send:@"POST" path:[NSString stringWithFormat:@"v1/compositions/%@/variation", ESCEscape(compositionId)] body:nil completion:c];
}
- (void)retune:(NSString *)compositionId energy:(double)energy texture:(double)texture completion:(ESCJSONCompletion)c {
    [self send:@"POST" path:[NSString stringWithFormat:@"v1/compositions/%@/retune", ESCEscape(compositionId)]
          body:@{@"moodField": @{@"energy": @(energy), @"texture": @(texture)}} completion:c];
}
- (void)waitForComposition:(NSString *)compositionId interval:(NSTimeInterval)interval timeout:(NSTimeInterval)timeout completion:(ESCJSONCompletion)completion {
    NSDate *deadline = [NSDate dateWithTimeIntervalSinceNow:timeout];
    __weak typeof(self) weakSelf = self;
    __block void (^poll)(void);
    void (^pollBlock)(void) = ^{
        [weakSelf fetchComposition:compositionId completion:^(id json, NSError *error) {
            NSString *status = [json isKindOfClass:NSDictionary.class] ? json[@"status"] : nil;
            if ([status isEqualToString:@"ready"] || [status isEqualToString:@"failed"]) { completion(json, nil); poll = nil; return; }
            if (deadline.timeIntervalSinceNow <= 0) {
                completion(json, error ?: [NSError errorWithDomain:ESCAPIErrorDomain code:408 userInfo:@{NSLocalizedDescriptionKey: @"Lucille is taking longer than usual."}]);
                poll = nil;
                return;
            }
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(interval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ if (poll) poll(); });
        }];
    };
    poll = pollBlock;
    poll();
}

#pragma mark Library + playlists
- (void)fetchLibraryKind:(NSString *)kind completion:(ESCJSONCompletion)c { [self get:@"v1/library" query:kind ? @{@"kind": kind} : nil completion:c]; }
- (void)saveComposition:(NSString *)compositionId offline:(BOOL)offline completion:(ESCJSONCompletion)c {
    [self send:@"POST" path:@"v1/library" body:@{@"compositionId": compositionId, @"kind": @"saved", @"offline": @(offline)} completion:c];
}
- (void)setLibraryItem:(NSString *)itemId offline:(BOOL)offline completion:(ESCJSONCompletion)c {
    [self send:@"PATCH" path:[@"v1/library/" stringByAppendingString:ESCEscape(itemId)] body:@{@"offline": @(offline)} completion:c];
}
- (void)removeLibraryItem:(NSString *)itemId completion:(ESCJSONCompletion)c {
    [self requestMethod:@"DELETE" path:[@"v1/library/" stringByAppendingString:ESCEscape(itemId)] query:nil body:nil completion:c];
}
- (void)saveMemoryForSession:(NSString *)sessionId title:(NSString *)title completion:(ESCJSONCompletion)c {
    NSMutableDictionary *b = [NSMutableDictionary dictionaryWithObject:sessionId forKey:@"sessionId"];
    if (title) b[@"title"] = title;
    [self send:@"POST" path:@"v1/memories" body:b completion:c];
}
- (void)fetchPlaylists:(ESCJSONCompletion)c { [self get:@"v1/playlists" query:nil completion:c]; }
- (void)fetchPlaylist:(NSString *)playlistId completion:(ESCJSONCompletion)c { [self get:[@"v1/playlists/" stringByAppendingString:ESCEscape(playlistId)] query:nil completion:c]; }
- (void)setLikePlaylist:(NSString *)playlistId track:(NSString *)trackId liked:(BOOL)liked completion:(ESCJSONCompletion)c {
    [self send:@"PUT" path:[NSString stringWithFormat:@"v1/playlists/%@/tracks/%@/like", ESCEscape(playlistId), ESCEscape(trackId)] body:@{@"liked": @(liked)} completion:c];
}

#pragma mark Circles
- (void)fetchCircles:(ESCJSONCompletion)c { [self get:@"v1/circles" query:nil completion:c]; }
- (void)joinCircle:(NSString *)circleId completion:(ESCJSONCompletion)c { [self send:@"POST" path:[NSString stringWithFormat:@"v1/circles/%@/join", ESCEscape(circleId)] body:nil completion:c]; }
- (void)leaveCircle:(NSString *)circleId completion:(ESCJSONCompletion)c { [self send:@"POST" path:[NSString stringWithFormat:@"v1/circles/%@/leave", ESCEscape(circleId)] body:nil completion:c]; }
- (void)setCircleReminder:(NSString *)circleId on:(BOOL)on completion:(ESCJSONCompletion)c {
    [self send:@"PUT" path:[NSString stringWithFormat:@"v1/circles/%@/reminder", ESCEscape(circleId)] body:@{@"on": @(on)} completion:c];
}

#pragma mark Sessions
- (void)startSessionMode:(NSString *)mode compositionId:(NSString *)compositionId startedFrom:(NSString *)origin completion:(ESCJSONCompletion)c {
    [self send:@"POST" path:@"v1/sessions/start"
          body:@{@"mode": mode, @"compositionId": compositionId ?: NSNull.null, @"startedFrom": origin ?: @"mode"} completion:c];
}
- (void)completeSession:(NSString *)sessionId minutes:(NSNumber *)minutes moodAfter:(NSNumber *)moodAfter completion:(ESCJSONCompletion)c {
    NSMutableDictionary *b = [NSMutableDictionary dictionaryWithObject:NSTimeZone.localTimeZone.name forKey:@"tz"];
    if (minutes) b[@"minutes"] = minutes;
    b[@"moodAfter"] = moodAfter ?: NSNull.null;
    [self send:@"POST" path:[NSString stringWithFormat:@"v1/sessions/%@/complete", ESCEscape(sessionId)] body:b completion:c];
}
- (void)sendBetaFeedbackCalm:(NSInteger)calmRating visual:(NSString *)visual note:(NSString *)note sessionId:(NSString *)sessionId mode:(NSString *)mode completion:(ESCJSONCompletion)c {
    [self send:@"POST" path:@"v1/beta-feedback" body:@{
        @"calmRating": @(calmRating), @"visual": visual ?: NSNull.null, @"note": note ?: NSNull.null,
        @"sessionId": sessionId ?: NSNull.null, @"mode": mode ?: NSNull.null,
    } completion:c];
}

@end

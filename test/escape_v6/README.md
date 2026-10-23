# Escape v6 tests

Automated tests for the v6 redesign (`lib/escape_v6/`), plus the manual device plan for what
cannot run in `flutter test`.

## Running

```sh
flutter pub get
flutter test test/escape_v6                       # everything (unit + widget)
flutter test test/escape_v6/unit                  # fast logic checks only
flutter test test/escape_v6/widget/v6_checkin_test.dart
flutter test test/escape_v6 --plain-name "distress"   # one behaviour across files
```

Run from the repository root: the data-integrity tests read `lib/` and `assets/` with `dart:io`,
and the harness loads the real Work Sans / Gilda Display fonts from `assets/fonts/` so layout
checks measure the same text widths as a phone. No new packages: everything used is already in
`pubspec.yaml` (`flutter_test`, `shared_preferences`, and the platform-interface packages the app
already depends on).

Tests marked `skip:` document a confirmed bug (see the skip reason); un-skip them once it is
fixed.

## How the widget tests work

`helpers/v6_test_harness.dart` is shared by every suite:

| Faked | How |
| --- | --- |
| Lucille v1 API | `V6Api.transport` is replaced by `FakeApi`: every call is recorded, `onlineApi()` answers with realistic payloads (`/v1/home`, progress, consents, …), `FakeApi(offline: true)` answers `{'ok': false, 'status': 0}`. |
| `/chat` (package:http) | `installNoNetwork()` installs `HttpOverrides` that count clients and fail like airplane mode, so "no network call was made" is asserted directly. |
| Firebase | `setupFirebaseCoreMocks()` + a `FirebaseAuthPlatform` with nobody signed in. |
| Video (Mood Orb, ambient loops) | A `VideoPlayerPlatform` that refuses to create decoders: orbs stay on their bundled poster, the pool's error path runs, nothing hangs. Most tests also run with Reduce Motion on, so no decoder is even requested. |
| url_launcher | A `UrlLauncherPlatform` that records `tel:`, `sms:`, `mailto:` URLs (`launchedUrls`). |
| Platform channels | Haptics, path_provider, audio_session, just_audio, permission_handler (denied), local notifications, flutter_timezone, `escape_health` (per test). Mocked with `TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler`. |
| Navigation | A real `GoRouter` with every v6 route, built with the same `V6TransitionPage` as `nav.dart`; the tab shell, old FF pages, voice chat and the body player (model-viewer WebView) are stubs. `pumpV6(..., overShell: true)` pushes the page over the shell like the app does. |

Every screen is pumped at **360 × 640 logical px** (`tester.view`), **1.3× text**
(`MediaQuery.textScaler`) and, unless the test is about motion, OS **reduce motion** on. A
RenderFlex overflow anywhere fails the test; `scrollThrough()` drags each page to the end so lazily
built items are laid out too. `expectCta()` checks a primary CTA exists, is enabled/disabled as
expected and is at least 48 px tall. Loops never settle (orbs breathe, glows drift), so tests use
`tester.pump(duration)` / `settle()`, never `pumpAndSettle`. `endV6Test()` unmounts the app and
flushes the timers v6 leaves behind (video pool linger, debounced save, rise-in delays).

## What each file covers

| File | Covers |
| --- | --- |
| `unit/v6_store_test.dart` | Check-in save/restore round trip and API body; `sync: false`; accounts isolated; JSON models; corrupt state; day rollover of tasks / water / minutes / plan steps; `needsDailyCheckIn` + skip for today; palette priority activity > preview > mood takeover > time of day; 05:59 / 06:00 / 17:59 / 18:00; toggleDayNight; AI-notice cadence adult 3 h / 12 turns and teen 1 h / 5 turns (turn and time based, persisted); `/v1/home` plan merge (`plan_<itemId>`, `planId`, deeplink params, no duplicates); coins/streak null until loaded; plan step completion awards coins; sessions online/offline; negative mood shift → gentle support; `deleteLocalData`; sign-out; help-tour flags. |
| `unit/v6_safety_test.dart` | `detectDistress` positives (incl. curly apostrophes, no apostrophe, caps) and negatives ("I'm dying to see it", "this workout is killing me"…); crisis lines; `ageFrom` / `bandForAge` edges 12 / 13 / 17 / 18. |
| `unit/v6_data_integrity_test.dart` | Every exercise: steps, valid palette, group listed on its page, breath pattern for breath sessions, script for meditations, 5 cards for grounding, https images, task ids; mood → session / energy centers / Lucille notes resolve; orb posters and offline loops exist in `assets/orbs`; palettes complete; every help-tour target is a `V6HelpTarget(id: …)` in `lib/escape_v6` and every tour can be opened; every `V6Routes` name is registered in `lib/flutter_flow/nav/nav.dart`; legacy deeplinks land on real routes; Body: 4 sections × 10 moves, unique names, GLB urls https `.glb`, routine minutes > 0, every `_pick` name exists, `full-<section>` exists; reminder time math. |
| `unit/v6_api_test.dart` | `V6Api` with a fake `transport`: ok / offline / server error / non-map / throwing transport; request shapes (clamping, 12-tag cap, note trim, pulse, paths, query encoding); consent retry: asks once, PUTs the consent, retries once; "Not now"; no prompt installed; throwing prompt. |
| `widget/v6_entry_test.dart` | Onboarding: age gate required, under-13 screen (nothing saved, 988 call), teen notice + Lucille's teen line, adult full flow to All Set (profile, consents, first mood), "Save my check-ins" off keeps the mood local; All Set copy and Enter Escape. |
| `widget/v6_checkin_test.dart` | Daily check-in copy, CTA disabled until a mood, choosing a mood previews the palette, "I'm really struggling" → urgent Support sheet (988 launch, close), "Not now", full save (API body, result, suggestion, Start → detail), distress note never sent, low mood → gentle sheet, offline save, same-day re-check. |
| `widget/v6_mind_reset_test.dart` | Mind: copy, Lucille's pick with reason, every session listed, chip filter, energy-center sheet → practice. Reset: Start now, support card → urgent sheet, Start now → player. |
| `widget/v6_sessions_test.dart` | Exercise detail (copy, steps, sheet, unknown id), player start / pause / resume / end early without saving / keep going, grounding to completion → mood shift → reward with server coins and streak → Home; negative shift → reward then gentle sheet; Skip; reward without session / offline; Hero continuity Reset → detail → player with motion on, and no Hero with reduce motion. |
| `widget/v6_body_test.dart` | Body hub (Health card, Lucille's pick + "Try another", section cards, routines), Yoga section (move preview sheet without GLB, move rows ≥ 48 px, Start all 10), the other three sections' layout, routine detail (expand a move, moves sheet, Start), unknown routine, body reflection. |
| `widget/v6_productivity_test.dart` | Daily plan: add / complete / progress, all-done state, swipe-to-remove own tasks, server plan steps not removable and award coins, distressing task blocked, tapping a task opens it. Progress: empty week, today's local check-in, offline with retry. |
| `widget/v6_lucille_test.dart` | Text chat opens with the AI notice; distress path (typed or seeded) shows the safe reply + urgent sheet and makes **no** network call; offline turn shows a retry, never a fake reply; teen notice every 5 turns. |
| `widget/v6_profile_test.dart` | Settings: appearance tiles, mood takeover, reduce motion, personalise, speak replies, reminder off/on without permission, Health unsupported vs available. Privacy: what Lucille knows, consent change saved, delete conversations (Keep them / Clear), delete mood history, delete account cancel, offline retry. Help: crisis lines (988 launch), FAQ, contact mail, page tour Next / Skip, replay tours. |

Not covered by `flutter test` (device plan below): the native Soundscapes module, Mood Scan
camera, voice chat (microphone + audio), real video decoding, model-viewer 3D moves, HealthKit /
Health Connect sheets, real notifications, VoiceOver / TalkBack.

## Manual device regression plan (iOS + Android)

Run on one small phone (iPhone SE 3rd gen or a 360 × 640 dp Android) and one large phone, on a
release build, signed in with a fresh test account unless a step says otherwise. Each step: iOS
and Android.

**Entry**

1. Fresh install, create an account: onboarding opens. Continue is disabled until a month and year are picked; swiping never skips a step.
2. Pick a birth year that makes you 12: "Escape is for people 13 and older", "Call or text 988" opens the dialer/SMS sheet, Sign out returns to sign-in and nothing is kept (sign in again: onboarding starts at the age gate).
3. Pick an age of 15: teen notice, Lucille says she reminds more often; in chat the AI notice repeats after 5 replies or 1 hour.
4. Adult: pick a mood (the whole app recolours as you tap orbs), enter a name, goals, daily goal, energy type; Reminders: turning the reminder on shows the OS permission prompt once; deny → copy explains, allow → time picker works.
5. Privacy step: all consents start off. Finish → All Set shows your name and mood → Enter Escape lands on Home with the tab bar. Kill the app mid-onboarding and relaunch: onboarding resumes, the age gate is not skipped.
6. Existing pre-v6 account on a new phone: no onboarding, daily check-in appears once.

**Daily check-in**

7. First open of the day: check-in appears; "Not now" hides it until tomorrow (relaunch the same day: not shown again).
8. Each mood orb plays its loop and the background cross-fades (1.2 s); energy slider haptics on step changes; tags; note; "Here's what I noticed…"; "Tuning your space…"; result with Lucille's line and the suggested session with its reason; Start opens that session.
9. Type "I don't want to wake up" in the note (also with the iOS smart apostrophe): the urgent Support sheet opens, the note is not saved (check Privacy > What Lucille knows / server).
10. "I'm really struggling": urgent sheet; 988 call, 741741 text, 911 and findahelpline.com each open the right app; the sheet cannot be swiped away, "I'm okay for now" closes it.
11. Check in "Low": gentle sheet after the result. Re-check later the same day: answers are pre-filled, CTA says "Update my day".
12. Mood Scan: "Use Mood Scan instead" opens the native scan; camera permission prompt once; the pulse ring tracks the fingertip; result feeds the check-in. Deny camera → clear fallback, no crash.

**Mind, Reset, sessions**

13. Mind: Lucille's pick follows today's mood and says why; chips filter; every energy-center orb is the real tinted Mood Orb, opens its sheet and starts its practice.
14. Reset: One-Minute Reset starts at once; breathing tiles; grounding; nature cards (photos load, then fade in); "I need support now" opens the urgent sheet.
15. Orb / photo Hero: tapping a session row flies its orb or photo into the detail page and on into the player without a flash or a restart of the loop; Back reverses it smoothly. No other element flies.
16. Player (breath): the orb grows on the inhale and shrinks on the exhale in time with the labels; haptics on each phase (toggle off works); pause shows "Take your time" and hides the timer; resume continues the phase; leaving the app pauses; "Lucille's voice" speaks each cue (and falls back to captions offline).
17. Player (meditation, grounding): script lines cross-fade; 5·4·3·2·1 cards with Next / Finish.
18. End early before 30 s: only Keep going / Leave; after 30 s also Finish and reflect. Back gesture opens the same sheet, never leaves silently.
19. Finish: mood shift (slider + mood grid) → reward with coins and streak from the server; Back from the reward never returns into the finished session. A negative shift opens the gentle sheet on top of the reward page. Apple Health / Health Connect gets a mindful session (when connected).

**Body**

20. Body hub: Health card (connect flow below), Lucille's pick + "Try another", four sections, routines carousel (cards peek in from the right).
21. Each section: 10 moves; moves with a GLB show the 3D model (rotate / pinch, Start / End switch); moves without one show the silhouette and "3D move coming soon".
22. Routine detail → Start → body player: model per move, timer, haptics, pause, next; reflection → reward.

**Productivity, progress**

23. Daily plan: add a task, tick it, swipe it away; Lucille's plan steps carry a spark, cannot be swiped, ticking one adds coins; "end it all" as a task opens the urgent sheet and is not added. After midnight (or change the device date) done tasks clear, unfinished ones roll over, water resets.
24. Progress: minutes, streak, coins, energy level, this week's mood orbs match the server; a brand-new account shows the honest empty state.

**Lucille**

25. Text chat opens with the AI notice; replies arrive; link chips open the right pages; "I feel hopeless" never reaches the server (proxy/Charles shows no /chat request) and opens the urgent sheet.
26. Voice chat: microphone permission prompt once; the orb listens / thinks / speaks; deny mic → clear fallback to text.

**Native Soundscapes module**

27. Sound tab and "soundscapes" deeplinks open the native module on iOS and Android; playback continues with the screen locked and from the lock-screen / notification controls; returning to Escape keeps the v6 palette; when the module is missing the fallback page opens.

**Profile, settings, privacy, help**

28. Settings: Auto / Day / Night tiles; mood takeover off keeps the time-of-day palette; reduce motion stops drifting backgrounds and orb pulses; speak replies; reminder time picker; personalise toggle.
29. HealthKit (iOS) / Health Connect (Android): connect shows the system sheet once; Android without Health Connect opens the Play Store; disconnect stops reads; heart rate older than 2 h is never shown.
30. Notifications: the daily reminder arrives at the chosen time (also after a reboot and a time-zone change) and opens the check-in; turning it off cancels it.
31. Privacy: consents mirror the server; download my data (save as file / copy); delete conversations / mood / journal / listening history each ask first; delete account erases and signs out.
32. Help: crisis lines dial / text; FAQs expand; page guides replay; "Replay every tour" shows each page's tour once more.

**Cross-cutting**

33. Offline mode (airplane mode): every page opens, check-in and sessions save locally, server numbers show "—" (never 0), retries appear; back online, numbers fill in without a restart.
34. Day / night: at 06:00 and 18:00 the palette flips while the app is open and after resuming from background; the sun/moon toggle pins the opposite mode and a second tap returns to Auto.
35. Reduce motion (iOS Settings > Accessibility > Motion; Android Remove animations): no Hero flights, no pulsing orbs, no drifting glows, fades only.
36. VoiceOver / TalkBack: every page's title is a header; all buttons have labels ("Mark … done", "Pause", "End session"); mood orbs announce their mood and hint; the Support sheet is reachable and readable in order; live regions announce phase changes and Lucille's newest reply only.
37. Small phone (360 × 640) at the largest text size (iOS Larger Text, Android font size Largest): no clipped text or overflow stripes on any page (Settings Appearance tiles are a known issue), CTAs stay in the thumb zone.
38. Sign out, sign in as another user on the same phone: none of the first user's check-in, plan, chat, theme or age band appears; sign back in as the first user: their state returns. Under-13 sign-out leaves nothing behind.

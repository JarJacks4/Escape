# Walkthrough fixes

## What changed

- Startup/navigation: corrected nested routes, removed a duplicate route, retained visited bottom tabs, and isolated inactive tab animations, focus, and Heroes.
- iOS: moved plugin registration to the scene engine callback and added the scene manifest. Existing permission values and background audio support are preserved.
- Home/Lucille: repaired scroll layouts, fitted headers and action cards to smaller screens, guarded asynchronous Home callbacks after disposal, and made Lucille transition/splash animations use the actual available screen size instead of fixed desktop-sized heights.
- Profile/sidebar: corrected Back navigation, made cards and menus fit narrow/short screens, added photo fallbacks, and removed placeholder profile values. Help remains a full-height panel on the right with scrolling content.
- Explore: enabled scrolling, made card arrows visible, and repaired Reset Mood, Quests, Journal, and Mood Scan layouts.
- Explore small-screen layouts: removed invalid nested vertical scrolling/flex combinations, bounded the Explore viewport correctly, and made ExploreScreen own its vertical scrolling.
- Explore Rituals: repaired the horizontally scrolling ritual cards so artwork adapts to the remaining card height, increased card height where required, and allowed text blocks to size naturally on smaller devices.
- Explore "For Your Journey": removed rigid maximum card heights, retained minimum visual sizing, and allowed all four journey cards to expand when text or font metrics require additional space.
- Rewards/confetti: made the confetti/reward component responsive instead of relying on fixed ~800 px layouts, allowing the content to scroll only when necessary on short screens.
- Rewards splash: removed the fixed ~875 px animation layout, made the animation fill the available viewport, guarded navigation after asynchronous work, and disposed its audio player correctly.
- Rendering/Impeller: removed the problematic fade wrapper from the Rewards splash animation while keeping the actual animation intact, reducing the Impeller inherited-opacity validation errors associated with that transition.
- Journal: removed vertical flex from content inside `SingleChildScrollView`, fixed the SafeArea/full-screen height conflict, and prevented the large RenderBox layout-error cascade seen on small iPhones.
- Mind: removed vertical `Expanded`/`Flexible` widgets from unbounded scroll layouts, removed competing nested vertical scroll views, and made cards use content-aware/minimum sizing instead of rigid heights.
- Mind choices: constrained Meditation and Binaural Beats sheets to the available device height and made their content scrollable when necessary instead of assuming ~770–810 px of vertical space.
- Habits: removed vertical flex from unbounded scroll layouts, removed fixed full-page height assumptions, and made habit/stat/quick-action cards expand naturally when translated or larger text requires more room.
- Habits header/profile: improved small-screen header constraints and added a safe fallback for empty or invalid user-photo URLs instead of attempting `Image.network` with an unusable URI.
- Habits progress indicators: aligned the Drink Water progress-bar container with the 120 px `LinearPercentIndicator`, removing the 20 px horizontal overflow while preserving the other habit indicators.
- Sound/Market: reduced competing scroll views and fixed available-height layouts. Player artwork and spacing adapt to short screens; long titles truncate.
- Body: repaired Collection scrolling, category and Begin Session layouts, added movement-list navigation back to Body, removed repeated movement Hero tags, and reduced active-session content on short screens.
- Media: disposed Home/Profile audio players, guarded interrupted loads, and added image fallbacks for invalid URLs, failed artwork downloads, and missing Body backgrounds.
- Web content: constrained the Lucille voice-chat WebView to its actual LayoutBuilder dimensions and avoids creating it while its viewport has invalid or zero dimensions.
- Team integration: preserves the preview-unlock flow so Start Session becomes available after returning from a movement preview.

## Still needs testing

Use a small physical iPhone, especially an iPhone 6s-class 375×667 device, to check:

1. Cold launch, sign-in/deep links, and repeated switching among all five bottom tabs.
2. Home/Lucille content, Lucille transition animations, Profile Back/editing, and the scrolling side menu and right-side Help panel.
3. Every Explore card, including both horizontally scrolling Explore Ritual cards and all four "For Your Journey" cards.
4. Reset Mood, Quests, Journal, Mood Scan, and Market scrolling completely to the bottom and back.
5. Mind and all Mind cards, including Meditation and Binaural Beats choice sheets, with short and long localized text.
6. Habits cards, Quick Actions, progress indicators, profile-photo fallback behavior, and longer localized labels.
7. Rewards/confetti and Rewards splash from a cold launch as well as after hot restart.
8. Sound categories and See All scrolling, all six player screens, long titles, and empty/invalid/unreachable artwork URLs.
9. Body categories and Collections, Begin Session, movement preview return via close/back gesture, Start Session unlock, and navigation back to Body.
10. Repetition and timer sessions, including long exercise descriptions and larger text settings.
11. Audio behavior and memory use after repeated navigation and sign-out.
12. Lucille voice chat/WebView sizing and navigation on iOS 15.

## Known open items

- Profile progress: the backend user-identifier contract remains unresolved; request and cache behavior were not changed.
- Firebase Analytics failed-request retries remain outside this work.
- Firebase App Check / Analytics configuration issues seen in device logs were intentionally not changed as part of these layout fixes.
- Impeller inherited-opacity validation messages should still be monitored on a true cold launch. The application-side transition known to trigger them was reduced, but no engine or dependency-level workaround was introduced.
- Full device regression and memory profiling remain outstanding.
- The repository analyzer reports an unresolved `preload_videos` import in the TikTok dependency; see the integration report for the baseline comparison and test results.

Future FlutterFlow exports may overwrite these fixes; check them when integrating generated code. In particular, review generated fixed heights, `Expanded`/`Flexible` widgets inside vertical scroll views, nested vertical scrollables, and rigid card dimensions on small devices.
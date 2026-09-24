# Walkthrough fixes

## What changed

- Startup/navigation: corrected nested routes, removed a duplicate route, retained visited bottom tabs, and isolated inactive tab animations, focus, and Heroes.
- iOS: moved plugin registration to the scene engine callback and added the scene manifest. Existing permission values and background audio support are preserved.
- Home/Lucille: repaired scroll layouts, fitted headers and action cards to smaller screens, and guarded asynchronous Home callbacks after disposal.
- Profile/sidebar: corrected Back navigation, made cards and menus fit narrow/short screens, added photo fallbacks, and removed placeholder profile values. Help remains a full-height panel on the right with scrolling content.
- Explore: enabled scrolling, made card arrows visible, and repaired Reset Mood, Quests, Journal, and Mood Scan layouts.
- Sound/Market: reduced competing scroll views and fixed available-height layouts. Player artwork and spacing adapt to short screens; long titles truncate.
- Body: repaired Collection scrolling, category and Begin Session layouts, added movement-list navigation back to Body, removed repeated movement Hero tags, and reduced active-session content on short screens.
- Media: disposed Home/Profile audio players, guarded interrupted loads, and added image fallbacks for invalid URLs, failed artwork downloads, and missing Body backgrounds.
- Team integration: preserves the preview-unlock flow so Start Session becomes available after returning from a movement preview.

## Still needs testing

Use a small physical iPhone to check:

1. Cold launch, sign-in/deep links, and repeated switching among all five bottom tabs.
2. Home/Lucille content, Profile Back/editing, and the scrolling side menu and right-side Help panel.
3. Every Explore card, Reset Mood, Quests, Journal, Mood Scan, and Market scrolling to the bottom and back.
4. Sound categories and See All scrolling, all six player screens, long titles, and empty/invalid/unreachable artwork URLs.
5. Body categories and Collections, Begin Session, movement preview return via close/back gesture, Start Session unlock, and navigation back to Body.
6. Repetition and timer sessions, including long exercise descriptions and larger text settings.
7. Audio behavior and memory use after repeated navigation and sign-out.

## Known open items

- Profile progress: the backend user-identifier contract remains unresolved; request and cache behavior were not changed.
- Firebase Analytics failed-request retries remain outside this work.
- Full device regression and memory profiling remain outstanding.
- The repository analyzer reports an unresolved `preload_videos` import in the TikTok dependency; see the integration report for the baseline comparison and test results.

Future FlutterFlow exports may overwrite these fixes; check them when integrating generated code.

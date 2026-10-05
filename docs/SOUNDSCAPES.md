# Soundscapes integration

The native Soundscapes module (SwiftUI + Objective-C) from Jared's handoff, wrapped as a local Flutter plugin so the Escape app can open it full screen. Branch: `feature/soundscapes`.

## Important: edit the module in the plugin

The plugin holds a **copy** of the module's sources from the handoff Xcode project, in `dependencies/escape_soundscapes/ios/Classes/`. The app only builds what's in that folder, so changes made in the standalone `EscapeSoundscapes.xcodeproj` (e.g. new tab bar, hiding Compose) **won't reach the app** unless they're applied there too. Please make module changes in `dependencies/escape_soundscapes/ios/Classes/` (or tell me and I'll sync them).

## How it's wired

| Piece | Where | What it does |
|---|---|---|
| Plugin | `dependencies/escape_soundscapes/` | Native sources, resources, podspec, Dart API. Added to `pubspec.yaml` with `path: dependencies/escape_soundscapes`. |
| Dart API | `dependencies/escape_soundscapes/lib/escape_soundscapes.dart` | `EscapeSoundscapes.configure / isSupported / open / close` |
| Native entry | `dependencies/escape_soundscapes/ios/Classes/EscapeSoundscapesPlugin.swift` | Presents the SwiftUI module full screen with `UIHostingController`. |
| App launcher | `lib/soundscapes/soundscapes_launcher.dart` | `SoundscapesLauncher.configure()` (called in `main.dart`), `open()` (pauses the old audio player first), exit routing, and the Home pill `SoundscapesBetaPill`. |
| Home entry | `lib/home_version5/home_version5_widget.dart` | "AI Soundscapes BETA" pill right after the Sounds pill. |

Method channel `escape_soundscapes`:

- Dart → native: `isSupported` (iOS 17+), `open` (`mock`, `baseUrl`), `close`
- Native → Dart: `getIdToken` (fresh Firebase ID token for API calls), `onExit(tab)` (user tapped a non-Soundscapes tab; Flutter routes there)

## Beta flag

The pill only shows when the app is built with `--dart-define=SOUNDSCAPES_BETA=true` (TestFlight beta builds only). Without it, `isSupported()` returns false and nothing is shown.

- `flutter run` / `flutter build ipa`: add `--dart-define=SOUNDSCAPES_BETA=true`.
- Running or archiving from Xcode: first run `flutter build ios --config-only --dart-define=SOUNDSCAPES_BETA=true`. Xcode reads it from `ios/Flutter/Generated.xcconfig` (`DART_DEFINES`).
- App Store builds: run `flutter build ios --config-only` (no flag) before archiving.

## iOS versions

- The app's minimum stays **iOS 14**. The podspec platform is 14.0.
- The module needs iOS 17 (Observation framework), so every top-level Swift declaration is marked `@available(iOS 17.0, *)` and `libswiftObservation` is **weak-linked** (`-weak-lswiftObservation` in the podspec's `user_target_xcconfig`). iOS 14–16 devices launch normally and just don't see the pill.
- The plugin is statically linked into `Runner`. Check with `otool -l build/ios/iphoneos/Runner.app/Runner | grep -B2 libswiftObservation`, which should show `LC_LOAD_WEAK_DYLIB`.

## Changes from the original handoff sources

- **Not copied:** `EscapeSoundscapesApp.swift` (its `@main` clashes with Flutter), the bridging header, `ESCSoundscapesViewController`, the AppIcon.
- **Resources** live in their own bundle (`EscapeSoundscapes.bundle`). Code uses `Bundle.soundscapes` instead of `Bundle.main` (images, seed JSON, samples). Fonts are registered with `CTFontManager`. The Metal shader loads the precompiled `.metallib` via `ShaderLibrary(url:)` (`dependencies/escape_soundscapes/ios/metal/build_metallib.sh` rebuilds it).
- **Exit to Flutter:** `AppStore.onExitToHost` and `SoundscapesHostingFactory.setExitHandler` were added; selecting a non-Soundscapes tab calls them.
- **HealthKit and EventKit removed** from `ESCPlatformServices.m` (Apple rejects uploads that reference them without purpose strings). Health and calendar permissions always report not granted; heart rate returns 0.
- `#Preview` blocks removed.

## Not done yet

- Bottom tabs → Home, Lucille, Explore, Sound, Market (waiting on who owns this: plugin copy vs Sara's S3).
- Hide Compose / Generating / Variation (Daniel's D3; needs to land in `dependencies/escape_soundscapes/ios/Classes/`).
- Real data: `SoundscapesLauncher.useMock = true`, `apiBaseUrl = null` until the staging API is deployed. `LucilleSoundscapesClient.swift` from the updated handoff isn't in the plugin yet.
- Launch test on iOS 16, Android build check.

## FlutterFlow note

`lib/soundscapes/`, the `SoundscapesLauncher.configure()` line in `main.dart`, the Home pill and the `pubspec.yaml` path line are hand edits. A FlutterFlow export can overwrite `main.dart`, the Home widget and `pubspec.yaml`, so keep these lines when merging an export.

## Run

    flutter run --release --dart-define=SOUNDSCAPES_BETA=true

The simulator can't run release builds; use a real device (or debug mode on a simulator).

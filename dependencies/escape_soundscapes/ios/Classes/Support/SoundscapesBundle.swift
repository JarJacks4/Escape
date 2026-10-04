import CoreText
import Foundation

private final class SoundscapesBundleToken {}

extension Bundle {
    /// The plugin's resource bundle (images, fonts, seed, samples, shaders).
    public static let soundscapes: Bundle = {
        let candidates = [Bundle(for: SoundscapesBundleToken.self), Bundle.main]
        for host in candidates {
            if let url = host.url(forResource: "EscapeSoundscapes", withExtension: "bundle"),
               let bundle = Bundle(url: url) {
                return bundle
            }
        }
        return .main
    }()
}

enum SoundscapesFonts {
    private static var done = false

    /// Registers the bundled fonts once (replaces Info.plist UIAppFonts).
    static func register() {
        guard !done else { return }
        done = true
        for ext in ["ttf", "otf"] {
            for url in Bundle.soundscapes.urls(forResourcesWithExtension: ext, subdirectory: nil) ?? [] {
                CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
            }
        }
    }
}

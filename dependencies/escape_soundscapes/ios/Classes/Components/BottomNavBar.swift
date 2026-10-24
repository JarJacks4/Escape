import CoreText
import SwiftUI

// Ported from shared.tsx: BottomNavBar, EscapeLogo, EscapeWordmark.
// (File is not called Navigation.swift: Store/Navigation.swift exists and Swift forbids duplicate
// file names in one target.)

// MARK: - BottomNavBar

/// The Escape v6 floating glass tab bar (lib/escape_v6/ui/v6_nav.dart), so moving between the
/// app and Soundscapes doesn't swap tab bars: Home · Explore · raised Lucille orb · Sounds · Profile.
/// 72 pt glass bar 8 pt above the safe-area bottom; the orb rises 20 pt above it. Place it in a
/// bottom overlay inside the safe area (RootView).
@available(iOS 17.0, *)
public struct BottomNavBar: View {
    let activeTab: NavTab
    let onTabChange: (NavTab) -> Void

    public init(activeTab: NavTab, onTabChange: @escaping (NavTab) -> Void) {
        self.activeTab = activeTab
        self.onTabChange = onTabChange
    }

    // v6 night palette (V6Brand / _dark* in v6_palettes.dart).
    private static let fill = Color(hex: 0x101E43, opacity: 0.62)
    private static let border = Color(hex: 0xE6EAF4, opacity: 0.16)
    private static let ink = Color(hex: 0xE6EAF4)
    private static let inkFaint = Color(hex: 0xE6EAF4, opacity: 0.55)

    public var body: some View {
        ZStack(alignment: .bottom) {
            HStack(spacing: 0) {
                tabButton(.home, icon: "house", activeIcon: "house.fill")
                tabButton(.explore, icon: "safari", activeIcon: "safari.fill")
                Color.clear.frame(maxWidth: .infinity)
                tabButton(.soundscapes, icon: "waveform", activeIcon: "waveform")
                tabButton(.profile, icon: "person", activeIcon: "person.fill")
            }
            .frame(height: 72)
            .background {
                RoundedRectangle(cornerRadius: 28, style: .continuous)
                    .fill(.ultraThinMaterial)
                    .overlay(RoundedRectangle(cornerRadius: 28, style: .continuous).fill(Self.fill))
                    .overlay(RoundedRectangle(cornerRadius: 28, style: .continuous).strokeBorder(Self.border, lineWidth: 1))
                    .shadow(color: Color(hex: 0x05081A, opacity: 0.28), radius: 20, y: 12)
            }
            lucilleOrb
                .frame(maxHeight: .infinity, alignment: .top)
        }
        .frame(height: 92)
        .padding(.horizontal, 12)
        .padding(.bottom, 8)
        .accessibilityElement(children: .contain)
    }

    private var lucilleOrb: some View {
        let active = activeTab == .lucille
        return Button { onTabChange(.lucille) } label: {
            VStack(spacing: 2) {
                LucilleOrb(size: 54, pulse: true)
                    .frame(width: 66, height: 66)
                    .background(Circle().fill(Self.fill))
                    .overlay(Circle().strokeBorder(active ? Self.ink : Self.border, lineWidth: 1))
                Text(NavTab.lucille.label)
                    .font(EscFont.ui(10, active ? .semibold : .medium))
                    .foregroundStyle(active ? Self.ink : Self.inkFaint)
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(EscPressStyle())
        .accessibilityLabel("Talk to Lucille")
        .accessibilityAddTraits(active ? .isSelected : [])
    }

    private func tabButton(_ tab: NavTab, icon: String, activeIcon: String) -> some View {
        let active = tab == activeTab
        let tint = active ? Self.ink : Self.inkFaint
        return Button { onTabChange(tab) } label: {
            VStack(spacing: 4) {
                Image(systemName: active ? activeIcon : icon)
                    .font(.system(size: 21, weight: active ? .semibold : .regular))
                    .frame(height: 24)
                Text(tab.label)
                    .font(EscFont.ui(10, active ? .semibold : .medium))
                    .lineLimit(1)
                    .fixedSize()
            }
            .foregroundStyle(tint)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .contentShape(Rectangle())
        }
        .buttonStyle(EscPressStyle())
        .accessibilityLabel(tab.label)
        .accessibilityAddTraits(active ? .isSelected : [])
    }
}

// MARK: - AppTabGlyph

/// The Escape app's tab-bar glyphs for Lucille (FFIcons.ksparkleStarAi), Explore (Flutter
/// Icons.explore) and Market (FFIcons.kmarket), drawn from the same font files the Flutter app uses. The font is loaded
/// straight from its file (not looked up by name), so a missing file shows up immediately.
@available(iOS 17.0, *)
struct AppTabGlyph: View {
    enum Kind { case lucille, explore, market }
    let kind: Kind
    init(_ kind: Kind) { self.kind = kind }

    /// (font file, extension, codepoint)
    private var spec: (String, String, UInt32) {
        switch kind {
        case .lucille: return ("basicons-appgenz", "ttf", 0xEA8B)  // FFIcons.ksparkleStarAi
        case .explore: return ("MaterialIcons-Regular", "otf", 0xE248)  // Icons.explore
        case .market: return ("iconia-regular-appgenz", "ttf", 0xF969)  // FFIcons.kmarket
        }
    }

    var body: some View {
        let (file, ext, code) = spec
        if let font = Self.font(file, ext), let scalar = UnicodeScalar(code) {
            Text(String(Character(scalar))).font(font)
        } else {
            // Font file missing from the bundle: fall back to a system symbol.
            Image(systemName: kind == .explore ? "safari" : kind == .market ? "bag" : "sparkles").font(.system(size: 19, weight: .light))
        }
    }

    private static var cache: [String: Font] = [:]

    private static func font(_ name: String, _ ext: String) -> Font? {
        if let f = cache[name] { return f }
        guard let url = Bundle.soundscapes.url(forResource: name, withExtension: ext)
                ?? Bundle.soundscapes.url(forResource: name, withExtension: ext, subdirectory: "Fonts"),
              let descs = CTFontManagerCreateFontDescriptorsFromURL(url as CFURL) as? [CTFontDescriptor],
              let desc = descs.first else {
            print("[Soundscapes] tab icon font missing: \(name).\(ext)")
            return nil
        }
        let f = Font(CTFontCreateWithFontDescriptor(desc, 22, nil))
        cache[name] = f
        return f
    }
}

// MARK: - EscapeLogo

@available(iOS 17.0, *)
public struct EscapeLogo: View {
    let size: CGFloat

    public init(size: CGFloat = 36) {
        self.size = size
    }

    public var body: some View {
        Image("escape-logo", bundle: .soundscapes)
            .resizable()
            .scaledToFit()
            .frame(width: size * 0.72, height: size * 0.72)
            .frame(width: size, height: size)
            .background(Esc.ink, in: RoundedRectangle(cornerRadius: 10))
            .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(Esc.hairline, lineWidth: 1))
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Escape")
            .accessibilityAddTraits(.isImage)
    }
}

// MARK: - EscapeWordmark

@available(iOS 17.0, *)
public struct EscapeWordmark: View {
    let height: CGFloat

    public init(height: CGFloat = 20) {
        self.height = height
    }

    public var body: some View {
        Image("escape-wordmark", bundle: .soundscapes)
            .resizable()
            .scaledToFit()
            .frame(height: height)
            .accessibilityLabel("Escape")
    }
}

// MARK: - Previews

@available(iOS 17.0, *)
private struct BottomNavBarPreview: View {
    @State private var tab: NavTab = .soundscapes

    var body: some View {
        VStack(spacing: 24) {
            HStack(spacing: 16) {
                EscapeLogo()
                EscapeWordmark(height: 16)
            }
            Spacer()
        }
        .padding(.top, 24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Esc.night.ignoresSafeArea())
        .safeAreaInset(edge: .bottom, spacing: 0) {
            BottomNavBar(activeTab: tab) { tab = $0 }
        }
    }
}



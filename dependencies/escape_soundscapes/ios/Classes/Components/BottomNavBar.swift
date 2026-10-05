import CoreText
import SwiftUI

// Ported from shared.tsx: BottomNavBar, EscapeLogo, EscapeWordmark.
// (File is not called Navigation.swift: Store/Navigation.swift exists and Swift forbids duplicate
// file names in one target.)

// MARK: - BottomNavBar

/// 72 pt tall bar; its background extends under the home indicator by itself. Place it at the bottom
/// of the safe area (e.g. `.safeAreaInset(edge: .bottom, spacing: 0) { BottomNavBar(...) }`).
@available(iOS 17.0, *)
public struct BottomNavBar: View {
    let activeTab: NavTab
    let onTabChange: (NavTab) -> Void

    public init(activeTab: NavTab, onTabChange: @escaping (NavTab) -> Void) {
        self.activeTab = activeTab
        self.onTabChange = onTabChange
    }

    public var body: some View {
        HStack(alignment: .top, spacing: 0) {
            ForEach(NavTab.allCases, id: \.self) { tab in
                tabButton(tab)
            }
        }
        .padding(.top, 9) // 1px top border + 8px padding
        .frame(maxWidth: .infinity)
        .frame(height: Esc.Metrics.navHeight, alignment: .top)
        .background { barBackground }
        .overlay(alignment: .top) {
            Rectangle()
                .fill(Color(hex: 0xE6EAF4, opacity: 0.08))
                .frame(height: 1)
        }
        .accessibilityElement(children: .contain)
    }

    private var barBackground: some View {
        ZStack {
            Rectangle().fill(.ultraThinMaterial)
            Esc.navBar
        }
        .ignoresSafeArea(edges: .bottom)
    }

    private func tabButton(_ tab: NavTab) -> some View {
        let active = tab == activeTab
        let tint = active ? Esc.lilac : Esc.haze
        return Button { onTabChange(tab) } label: {
            VStack(spacing: 3) {
                // Tab icons use the tint; the Soundwave icon keeps its
                // own default #A9B3D6 even when active (as in the Figma).
                Self.tabIcon(tab, tint: tint)
                Text(tab.rawValue)
                    .font(EscFont.ui(10, .medium))
                    .tracking(10 * 0.04)
                    .foregroundStyle(tint)
                    .lineLimit(1)
                    .fixedSize()
            }
            .opacity(active ? 1 : 0.5)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .contentShape(Rectangle())
        }
        .buttonStyle(EscPressStyle())
        .accessibilityLabel(tab.rawValue)
        .accessibilityAddTraits(active ? .isSelected : [])
    }

    /// Home and Sound use the module's own icons. Lucille, Explore and Market use the Escape app's
    /// tab-bar glyphs (see AppTabGlyph), in the module's colors and size.
    @ViewBuilder
    private static func tabIcon(_ tab: NavTab, tint: Color) -> some View {
        switch tab {
        case .home: Icon(.home, size: 22, color: tint)
        case .lucille: AppTabGlyph(.lucille).foregroundStyle(tint).frame(width: 22, height: 22)
        case .soundscapes: Icon(.soundwave, size: 22, color: Esc.haze)
        case .explore: AppTabGlyph(.explore).foregroundStyle(tint).frame(width: 22, height: 22)
        case .market: AppTabGlyph(.market).foregroundStyle(tint).frame(width: 22, height: 22)
        }
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



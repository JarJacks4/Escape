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
                // Home/Realms/Lucille/Profile icons use currentColor; the Soundwave icon keeps its
                // own default #A9B3D6 even when active (as in the Figma).
                Icon(Self.icon(for: tab), size: 22, color: tab == .soundscapes ? Esc.haze : tint)
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

    private static func icon(for tab: NavTab) -> EscIcon {
        switch tab {
        case .home: .home
        case .realms: .realm
        case .soundscapes: .soundwave
        case .lucille: .lucille
        case .profile: .profile
        }
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



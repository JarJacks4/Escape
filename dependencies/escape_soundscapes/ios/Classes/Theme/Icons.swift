import SwiftUI

/// Every icon in the Figma (shared.tsx `*Icon` + the mode icons in SoundscapesHome/NowPlaying).
/// They are SVG template images in Assets.xcassets/Icons, exported 1:1 from the prototype's paths,
/// so they tint with `color` like the React `color` prop.
@available(iOS 17.0, *)
public enum EscIcon: String, CaseIterable, Sendable {
    case play, pause, soundwave, timer, lock, shuffle, bookmark, share
    case chevronDown = "chevron-down", chevronRight = "chevron-right"
    case home, realm, lucille, profile, info, mic, heart, sun, cloud, mood
    case layers, blend, shield, whisper, download, check, moon, sunrise, more
    case modePicks = "mode-picks", modeFocus = "mode-focus", modeCalm = "mode-calm"
    case modeSleep = "mode-sleep", modeMove = "mode-move", modeRealms = "mode-realms"

    public var assetName: String { "icon-\(rawValue)" }

    /// Icon for a mode orb. Noise uses the soundwave (as in the Figma).
    public static func mode(_ m: ModeId) -> EscIcon {
        switch m {
        case .picks: .modePicks
        case .focus: .modeFocus
        case .calm: .modeCalm
        case .sleep: .modeSleep
        case .move: .modeMove
        case .noise: .soundwave
        case .realms: .modeRealms
        }
    }
}

/// `<PlayIcon size={24} color="#E6EAF4" />` → `Icon(.play, size: 24, color: Esc.mist)`.
@available(iOS 17.0, *)
public struct Icon: View {
    let icon: EscIcon
    var size: CGFloat
    var color: Color
    public init(_ icon: EscIcon, size: CGFloat = 24, color: Color = Esc.mist) {
        self.icon = icon; self.size = size; self.color = color
    }
    public var body: some View {
        Image(icon.assetName, bundle: .soundscapes)
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
            .foregroundStyle(color)
            .accessibilityHidden(true)
    }
}



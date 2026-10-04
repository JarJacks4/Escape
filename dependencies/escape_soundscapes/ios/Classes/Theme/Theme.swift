import SwiftUI
import UIKit

// Escape design tokens, taken from the Figma Make source (index.css + inline styles).
// Port rule: a Figma px is a SwiftUI point. rgba(r,g,b,a) → Color(hex: 0xRRGGBB, opacity: a).

@available(iOS 17.0, *)
public enum Esc {
    // MARK: Palette (hex values used in the Figma)
    public static let night = Color(hex: 0x0B1230)        // app background
    public static let sleepNight = Color(hex: 0x05081A)   // Night UI background
    public static let ink = Color(hex: 0x101E43)          // nav bar, pads
    public static let surface = Color(hex: 0x18224A)      // sheet base
    public static let raised = Color(hex: 0x212C5A)       // cards, orbs (usually at 0.6–0.8)
    public static let royal = Color(hex: 0x39519F)        // toggles on, secondary accents
    public static let deepBlue = Color(hex: 0x164395)
    public static let ember = Color(hex: 0xEF7702)        // primary CTA start
    public static let ember2 = Color(hex: 0xF08A1D)       // primary CTA end
    public static let emberDim = Color(hex: 0x9C4F07)     // Night UI CTA
    public static let lilac = Color(hex: 0xB9A3F0)        // active, Lucille
    public static let violet = Color(hex: 0x8E7CD9)
    public static let mist = Color(hex: 0xE6EAF4)         // primary text
    public static let haze = Color(hex: 0xA9B3D6)         // secondary text
    public static let rose = Color(hex: 0xC9A3B8)
    public static let periwinkle = Color(hex: 0x8E8FD0)

    // MARK: Frequent translucent fills
    public static let hairline = Color(hex: 0xE6EAF4, opacity: 0.12)       // borders
    public static let hairlineSoft = Color(hex: 0xE6EAF4, opacity: 0.06)
    public static let card = Color(hex: 0x212C5A, opacity: 0.8)            // rgba(33,44,90,0.8)
    public static let cardSoft = Color(hex: 0x212C5A, opacity: 0.6)
    public static let navBar = Color(hex: 0x101E43, opacity: 0.95)         // BottomNavBar
    public static let sheet = Color(hex: 0x18224A, opacity: 0.75)          // BottomSheet (with blur 48)
    public static let dim = Color.black.opacity(0.6)                       // sheet backdrop
    public static let pad = Color(hex: 0x101E43, opacity: 0.8)             // MoodFieldPad

    // MARK: Gradients
    /// PrimaryButton / PlayNowButton: linear-gradient(135deg, #EF7702, #F08A1D).
    public static let primaryGradient = LinearGradient(colors: [ember, ember2], startPoint: .topLeading, endPoint: .bottomTrailing)
    /// Daily Drop hero: #EF7702 → #C9A3B8 → #8E8FD0 → #164395 at 135deg.
    public static let signature = GradientSpec(colors: ["#EF7702", "#C9A3B8", "#8E8FD0", "#164395"], stops: [0, 0.35, 0.7, 1], angle: 135).linear

    // MARK: Metrics (px in the Figma = pt here)
    public enum Metrics {
        public static let screenPadding: CGFloat = 24
        public static let headerHeight: CGFloat = 52
        public static let navHeight: CGFloat = 72
        public static let sheetRadius: CGFloat = 28
        public static let cardRadius: CGFloat = 20
        public static let inputRadius: CGFloat = 16
        public static let primaryButtonHeight: CGFloat = 56
        public static let playNowHeight: CGFloat = 64
        public static let modeOrb: CGFloat = 64
        public static let ringTimer: CGFloat = 260
        public static let moodPad: CGFloat = 300
        public static let touchTarget: CGFloat = 44
        public static let nightTouchTarget: CGFloat = 56
    }
}

// MARK: - Fonts

/// Gilda Display (display) + Work Sans (UI), bundled in Resources/Fonts and listed in Info.plist UIAppFonts.
@available(iOS 17.0, *)
public enum EscFont {
    public static let displayName = "GildaDisplay-Regular"
    static let ui: [Font.Weight: String] = [
        .light: "WorkSans-Light", .regular: "WorkSans-Regular", .medium: "WorkSans-Medium",
        .semibold: "WorkSans-SemiBold", .bold: "WorkSans-Bold",
    ]

    /// `font-family: var(--font-display)`.
    public static func display(_ size: CGFloat) -> Font {
        UIFont(name: displayName, size: size) != nil ? .custom(displayName, size: size) : .system(size: size, design: .serif)
    }

    /// `font-family: var(--font-ui)` with fontWeight 300/400/500/600/700.
    public static func ui(_ size: CGFloat, _ weight: Font.Weight = .regular) -> Font {
        if let name = ui[weight], UIFont(name: name, size: size) != nil { return .custom(name, size: size) }
        return .system(size: size, weight: weight)
    }
}

@available(iOS 17.0, *)
extension View {
    /// Figma "label" style: 11px, 600, letter-spacing 0.12em, uppercase.
    public func escLabel(_ color: Color = Esc.haze) -> some View {
        font(EscFont.ui(11, .semibold)).tracking(11 * 0.12).textCase(.uppercase).foregroundStyle(color)
    }
}

// MARK: - Colors from hex

@available(iOS 17.0, *)
extension Color {
    public init(hex: UInt32, opacity: Double = 1) {
        self.init(.sRGB, red: Double((hex >> 16) & 0xFF) / 255, green: Double((hex >> 8) & 0xFF) / 255,
                  blue: Double(hex & 0xFF) / 255, opacity: opacity)
    }

    /// "#RRGGBB", "#RRGGBBAA" or "rgba(r,g,b,a)" from the API/seed. Falls back to night blue.
    public init(css: String) {
        let s = css.trimmingCharacters(in: .whitespaces)
        if s.hasPrefix("rgba(") || s.hasPrefix("rgb(") {
            let nums = s.drop(while: { $0 != "(" }).dropFirst().dropLast().split(separator: ",").compactMap { Double($0.trimmingCharacters(in: .whitespaces)) }
            if nums.count >= 3 {
                self.init(.sRGB, red: nums[0] / 255, green: nums[1] / 255, blue: nums[2] / 255, opacity: nums.count > 3 ? nums[3] : 1)
                return
            }
        }
        var hex = s.hasPrefix("#") ? String(s.dropFirst()) : s
        if hex.count == 3 { hex = hex.map { "\($0)\($0)" }.joined() }
        guard let v = UInt64(hex, radix: 16) else { self = Esc.night; return }
        if hex.count == 8 {
            self.init(.sRGB, red: Double((v >> 24) & 0xFF) / 255, green: Double((v >> 16) & 0xFF) / 255,
                      blue: Double((v >> 8) & 0xFF) / 255, opacity: Double(v & 0xFF) / 255)
        } else {
            self.init(hex: UInt32(v & 0xFFFFFF))
        }
    }
}

// MARK: - CSS gradients

@available(iOS 17.0, *)
extension GradientSpec {
    /// `linear-gradient(<angle>deg, …)` with CSS angle semantics (0 = up, 90 = right, 135 = down-right).
    public var linear: LinearGradient {
        let rad = angle * .pi / 180
        let dx = sin(rad) / 2, dy = -cos(rad) / 2
        let start = UnitPoint(x: 0.5 - dx, y: 0.5 - dy), end = UnitPoint(x: 0.5 + dx, y: 0.5 + dy)
        let cs = colors.map { Color(css: $0) }
        if let stops, stops.count == cs.count {
            return LinearGradient(stops: zip(cs, stops).map { .init(color: $0, location: min(1, max(0, $1))) }, startPoint: start, endPoint: end)
        }
        return LinearGradient(colors: cs, startPoint: start, endPoint: end)
    }
}

@available(iOS 17.0, *)
extension LinearGradient {
    /// `linear-gradient(135deg, a, b)` shorthand for inline Figma gradients.
    public static func css(_ angle: Double, _ colors: [Color], stops: [Double]? = nil) -> LinearGradient {
        let rad = angle * .pi / 180
        let dx = sin(rad) / 2, dy = -cos(rad) / 2
        let start = UnitPoint(x: 0.5 - dx, y: 0.5 - dy), end = UnitPoint(x: 0.5 + dx, y: 0.5 + dy)
        if let stops, stops.count == colors.count {
            return LinearGradient(stops: zip(colors, stops).map { .init(color: $0, location: $1) }, startPoint: start, endPoint: end)
        }
        return LinearGradient(colors: colors, startPoint: start, endPoint: end)
    }
}

@available(iOS 17.0, *)
extension RadialGradient {
    /// `radial-gradient(circle, a, transparent 70%)` for a box of `diameter`.
    public static func css(_ colors: [Color], stops: [Double]? = nil, diameter: CGFloat, center: UnitPoint = .center) -> RadialGradient {
        let r = diameter / 2
        if let stops, stops.count == colors.count {
            return RadialGradient(stops: zip(colors, stops).map { .init(color: $0, location: $1) }, center: center, startRadius: 0, endRadius: r)
        }
        return RadialGradient(colors: colors, center: center, startRadius: 0, endRadius: r)
    }
}

// MARK: - Animations (index.css keyframes)

@available(iOS 17.0, *)
extension View {
    /// `.animate-breathe`: 8s ease-in-out infinite, scale 1 → 1.08, opacity .6 → 1.
    public func breathe(_ active: Bool = true) -> some View { modifier(Keyframe(active: active, duration: 8, scale: 1.08, opacityFrom: 0.6)) }
    /// `.animate-breathe-ring`: 8s, scale 1 → 1.12.
    public func breatheRing(_ active: Bool = true) -> some View { modifier(Keyframe(active: active, duration: 8, scale: 1.12, opacityFrom: 1)) }
    /// `.animate-pulse-orb`: 3s, scale 1 → 1.06, opacity .7 → 1.
    public func pulseOrb(_ active: Bool = true) -> some View { modifier(Keyframe(active: active, duration: 3, scale: 1.06, opacityFrom: 0.7)) }
    /// `.animate-spin-slow`.
    public func spinSlow(_ active: Bool = true, period: Double = 20) -> some View { modifier(Spin(active: active, period: period)) }
}

/// Half-period ease-in-out autoreverse = the CSS 0% → 50% → 100% keyframes.
@available(iOS 17.0, *)
struct Keyframe: ViewModifier {
    let active: Bool
    let duration: Double
    let scale: CGFloat
    let opacityFrom: Double
    @State private var on = false
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    func body(content: Content) -> some View {
        let animate = active && !reduceMotion
        content
            .scaleEffect(animate && on ? scale : 1)
            .opacity(animate ? (on ? 1 : opacityFrom) : 1)
            .onAppear { if animate { withAnimation(.easeInOut(duration: duration / 2).repeatForever(autoreverses: true)) { on = true } } }
            .onChange(of: animate) { _, now in
                if now { withAnimation(.easeInOut(duration: duration / 2).repeatForever(autoreverses: true)) { on = true } }
                else { withAnimation(.easeOut(duration: 0.3)) { on = false } }
            }
    }
}

@available(iOS 17.0, *)
struct Spin: ViewModifier {
    let active: Bool
    let period: Double
    @State private var angle: Double = 0
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(angle)).onAppear {
            guard active, !reduceMotion else { return }
            withAnimation(.linear(duration: period).repeatForever(autoreverses: false)) { angle = 360 }
        }
    }
}

/// `.eq-bar-1/2/3`: the three bouncing equalizer bars (MiniPlayer, playing rows).
@available(iOS 17.0, *)
public struct EqualizerBars: View {
    var color: Color = Esc.lilac
    var active: Bool = true
    @State private var on = false
    public init(color: Color = Esc.lilac, active: Bool = true) { self.color = color; self.active = active }
    public var body: some View {
        HStack(alignment: .bottom, spacing: 2) {
            bar(from: 4, to: 12, period: 0.8)
            bar(from: 8, to: 4, period: 0.6)
            bar(from: 6, to: 14, period: 1.0)
        }
        .frame(height: 14, alignment: .bottom)
        .onAppear { on = active }
        .onChange(of: active) { _, v in on = v }
        .accessibilityHidden(true)
    }
    private func bar(from: CGFloat, to: CGFloat, period: Double) -> some View {
        RoundedRectangle(cornerRadius: 1.5)
            .fill(color)
            .frame(width: 3, height: on ? to : from)
            .animation(on ? .easeInOut(duration: period / 2).repeatForever(autoreverses: true) : .default, value: on)
    }
}

// MARK: - Haptics

@available(iOS 17.0, *)
public enum Haptics {
    public static func tap() { UIImpactFeedbackGenerator(style: .light).impactOccurred() }
    public static func select() { UISelectionFeedbackGenerator().selectionChanged() }
}

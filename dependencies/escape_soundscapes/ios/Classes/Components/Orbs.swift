import SwiftUI

// Ported from shared.tsx: VisualLayer, ModeOrb, BreathRing, LucilleOrb.

// MARK: - VisualLayer

/// Full-screen decorative background: base color, breathing glow + rings, bottom scrim.
/// Fills the whole screen (ignores safe areas) and never takes touches.
@available(iOS 17.0, *)
public struct VisualLayer: View {
    let isSleep: Bool

    public init(isSleep: Bool = false) {
        self.isSleep = isSleep
    }

    public var body: some View {
        ZStack {
            isSleep ? Esc.sleepNight : Esc.night
            circles
                .breathe()
            LinearGradient(colors: [Color(hex: 0x0B1230, opacity: 0), Color(hex: 0x0B1230, opacity: 0.85)],
                           startPoint: .top, endPoint: .bottom)
        }
        .ignoresSafeArea()
        .allowsHitTesting(false)
        .accessibilityHidden(true)
    }

    private var circles: some View {
        ZStack {
            Circle()
                .fill(glow)
                .frame(width: 320, height: 320)
            Circle()
                .strokeBorder(isSleep ? Color(hex: 0x9C4F07, opacity: 0.15) : Color(hex: 0xB9A3F0, opacity: 0.25), lineWidth: 1)
                .frame(width: 280, height: 280)
                .breatheRing()
            Circle()
                .strokeBorder(isSleep ? Color(hex: 0x9C4F07, opacity: 0.08) : Color(hex: 0xB9A3F0, opacity: 0.12), lineWidth: 1)
                .frame(width: 200, height: 200)
                .breatheDelayed(2)
        }
    }

    private var glow: RadialGradient {
        if isSleep {
            return RadialGradient.cssCircle(
                [Color(hex: 0x0E1432, opacity: 0.9), Color(hex: 0x05081A, opacity: 0)],
                stops: [0, 0.7], box: 320)
        }
        return RadialGradient.cssCircle(
            [Color(hex: 0x8E7CD9, opacity: 0.18), Color(hex: 0xB9A3F0, opacity: 0.06), Color(hex: 0x0B1230, opacity: 0)],
            stops: [0, 0.4, 0.7], box: 320)
    }
}

// MARK: - ModeOrb

@available(iOS 17.0, *)
public struct ModeOrb<IconContent: View>: View {
    let label: String
    let active: Bool
    let locked: Bool
    let size: CGFloat
    let onPress: (() -> Void)?
    let icon: IconContent

    public init(label: String, active: Bool = false, locked: Bool = false, size: CGFloat = 64,
                onPress: (() -> Void)? = nil, @ViewBuilder icon: () -> IconContent) {
        self.label = label
        self.active = active
        self.locked = locked
        self.size = size
        self.onPress = onPress
        self.icon = icon()
    }

    public var body: some View {
        Button { onPress?() } label: {
            VStack(spacing: 8) {
                orb
                Text(label)
                    .font(EscFont.ui(11, .medium))
                    .tracking(11 * 0.05)
                    .foregroundStyle(active ? Esc.mist : Esc.haze)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: max(size, 64))
            }
            .frame(minWidth: 64)
            .contentShape(Rectangle())
        }
        .buttonStyle(EscPressStyle(scale: 0.96, pressedOpacity: 1))
        .accessibilityLabel(label)
        .accessibilityValue(locked ? "Locked" : "")
        .accessibilityAddTraits(active ? .isSelected : [])
    }

    private var orb: some View {
        Circle()
            .fill(orbFill)
            .overlay(Circle().strokeBorder(active ? Color(hex: 0xB9A3F0, opacity: 0.6) : Esc.hairline, lineWidth: 1.5))
            .overlay { icon }
            .overlay(alignment: .bottomTrailing) {
                if locked {
                    lockBadge.padding(1.5)
                }
            }
            .frame(width: size, height: size)
    }

    private var orbFill: AnyShapeStyle {
        active
            ? AnyShapeStyle(RadialGradient.cssCircle(
                [Color(hex: 0xB9A3F0, opacity: 0.25), Color(hex: 0x8E7CD9, opacity: 0.1)], box: size))
            : AnyShapeStyle(Esc.card)
    }

    private var lockBadge: some View {
        Circle()
            .fill(Esc.night)
            .overlay(Circle().strokeBorder(Color(hex: 0xE6EAF4, opacity: 0.2), lineWidth: 1))
            .overlay(Icon(.lock, size: 10, color: Esc.haze))
            .frame(width: 18, height: 18)
    }
}

@available(iOS 17.0, *)
extension ModeOrb where IconContent == Icon {
    /// Orb with an asset icon (22 pt, as the Figma mode icons).
    public init(label: String, icon: EscIcon, iconColor: Color = Esc.mist, active: Bool = false, locked: Bool = false,
                size: CGFloat = 64, onPress: (() -> Void)? = nil) {
        self.init(label: label, active: active, locked: locked, size: size, onPress: onPress,
                  icon: { Icon(icon, size: 22, color: iconColor) })
    }

    /// Orb for a mode: `EscIcon.mode(mode)`, lilac for Lucille Picks, mist otherwise. Label defaults to `mode.title`
    /// (Home); Now Playing passes `mode.shortTitle`.
    public init(mode: ModeId, label: String? = nil, active: Bool = false, locked: Bool = false,
                size: CGFloat = 64, onPress: (() -> Void)? = nil) {
        self.init(label: label ?? mode.title, icon: EscIcon.mode(mode),
                  iconColor: mode == .picks ? Esc.lilac : Esc.mist,
                  active: active, locked: locked, size: size, onPress: onPress)
    }
}

// MARK: - BreathRing

@available(iOS 17.0, *)
public struct BreathRing: View {
    public init() {}

    public var body: some View {
        ZStack {
            Circle()
                .strokeBorder(Color(hex: 0xB9A3F0, opacity: 0.5), lineWidth: 1.5)
                .frame(width: 200, height: 200)
                .breatheRing()
            Circle()
                .fill(RadialGradient.cssCircle(
                    [Color(hex: 0xB9A3F0, opacity: 0.2), Color(hex: 0x8E7CD9, opacity: 0.05)], box: 160))
                .frame(width: 160, height: 160)
                .overlay(
                    Text("Breathe")
                        .font(EscFont.ui(13))
                        .foregroundStyle(Esc.haze)
                )
                .breatheDelayed(1)
        }
        .frame(width: 260, height: 260)
        .accessibilityElement(children: .combine)
    }
}

// MARK: - LucilleOrb

@available(iOS 17.0, *)
public struct LucilleOrb: View {
    let size: CGFloat
    let pulse: Bool

    public init(size: CGFloat = 40, pulse: Bool = false) {
        self.size = size
        self.pulse = pulse
    }

    public var body: some View {
        Circle()
            .fill(RadialGradient.cssCircle(
                [Color(hex: 0xB9A3F0, opacity: 0.5), Color(hex: 0x8E7CD9, opacity: 0.2), Color(hex: 0x8E7CD9, opacity: 0)],
                stops: [0, 0.6, 1], box: size))
            .overlay(Circle().strokeBorder(Color(hex: 0xB9A3F0, opacity: 0.4), lineWidth: 1.5))
            .overlay(
                Circle()
                    .fill(RadialGradient.cssCircle(
                        [Color(hex: 0xB9A3F0, opacity: 0.8), Color(hex: 0x8E7CD9, opacity: 0.4)], box: size * 0.5))
                    .frame(width: size * 0.5, height: size * 0.5)
            )
            .frame(width: size, height: size)
            .pulseOrb(pulse)
            .accessibilityHidden(true)
    }
}

// MARK: - Previews





import SwiftUI

// Escape "frosty" system: translucent, glassy, futuristic. Frosted panels over the live orb,
// hairline light edges, soft glow. Reused by every scan screen so the look is one system.

@available(iOS 17.0, *)
extension View {
    /// A frosted-glass panel: blurred translucency, a bright top hairline, a cool rim.
    func glass(_ radius: CGFloat = 22, strong: Bool = false) -> some View {
        modifier(GlassPanel(radius: radius, strong: strong))
    }
    /// A small frosted pill (chips, badges).
    func glassPill() -> some View {
        padding(.horizontal, 13).padding(.vertical, 8).glass(999)
    }
}

@available(iOS 17.0, *)
struct GlassPanel: ViewModifier {
    var radius: CGFloat
    var strong: Bool
    func body(content: Content) -> some View {
        content
            .background(strong ? AnyShapeStyle(.regularMaterial) : AnyShapeStyle(.ultraThinMaterial),
                        in: RoundedRectangle(cornerRadius: radius, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: radius, style: .continuous)
                    .strokeBorder(LinearGradient(colors: [.white.opacity(0.35), .white.opacity(0.05)],
                                                 startPoint: .top, endPoint: .bottom), lineWidth: 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
            .shadow(color: .black.opacity(0.25), radius: 18, y: 8)
    }
}

/// Primary action — the brand ember, kept glassy with a top sheen.
@available(iOS 17.0, *)
struct PrimaryCTA: View {
    var title: String
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(EscFont.ui(16, .semibold)).foregroundStyle(.white)
                .frame(maxWidth: .infinity).frame(height: 56)
                .background(Esc.primaryGradient, in: RoundedRectangle(cornerRadius: 28, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 28, style: .continuous)
                        .strokeBorder(.white.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: Esc.ember.opacity(0.35), radius: 16, y: 6)
        }
        .buttonStyle(.plain)
    }
}

/// Secondary action — frosted glass, no fill.
@available(iOS 17.0, *)
struct GlassButton: View {
    var title: String
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            Text(title).font(EscFont.ui(14, .medium)).foregroundStyle(Esc.mist)
                .frame(maxWidth: .infinity).frame(height: 48).glass(24)
        }
        .buttonStyle(.plain)
    }
}

/// A round frosted icon button (close, back, mic).
@available(iOS 17.0, *)
struct GlassIconButton: View {
    var systemName: String
    var label: String
    var size: CGFloat = 44
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: systemName).font(.system(size: size * 0.36, weight: .medium))
                .foregroundStyle(Esc.mist).frame(width: size, height: size).glass(size / 2)
        }
        .buttonStyle(.plain).accessibilityLabel(label)
    }
}

/// The coins badge, frosted.
@available(iOS 17.0, *)
struct CoinBadge: View {
    var coins: Int
    var delta: String?
    var body: some View {
        HStack(spacing: 8) {
            Circle().fill(RadialGradient(colors: [Color(hex: 0xFFD6A3), Esc.ember], center: .topLeading, startRadius: 0, endRadius: 16))
                .frame(width: 14, height: 14)
            Text(coins, format: .number).font(EscFont.ui(13, .semibold)).foregroundStyle(Esc.mist)
            if let delta { Text(delta).font(EscFont.ui(13, .semibold)).foregroundStyle(Esc.ember) }
            else { Text("Escape Coins").font(EscFont.ui(13)).foregroundStyle(Esc.haze) }
        }
        .glassPill()
    }
}

/// Small uppercase eyebrow label.
@available(iOS 17.0, *)
struct Eyebrow: View {
    var text: String
    var color: Color = Esc.lilac
    var body: some View {
        Text(text.uppercased()).font(EscFont.ui(12, .semibold)).tracking(1.6).foregroundStyle(color)
    }
}

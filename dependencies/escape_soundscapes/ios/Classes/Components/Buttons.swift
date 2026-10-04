import SwiftUI

// Ported from shared.tsx: PrimaryButton, GhostButton, PlayNowButton, ActionPill, Toggle (EscToggle),
// SegmentedTabs. CSS borders are inside the box (border-box), so paddings include the border width.

// MARK: - PrimaryButton

@available(iOS 17.0, *)
public struct PrimaryButton: View {
    let label: String
    let disabled: Bool
    let onPress: (() -> Void)?

    public init(label: String, disabled: Bool = false, onPress: (() -> Void)? = nil) {
        self.label = label
        self.disabled = disabled
        self.onPress = onPress
    }

    public var body: some View {
        Button { onPress?() } label: {
            Text(label)
                .font(EscFont.ui(16, .semibold))
                .foregroundStyle(Color.white)
                .lineLimit(1)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(fill, in: Capsule())
                .contentShape(Capsule())
        }
        .buttonStyle(EscPressStyle())
        .disabled(disabled)
    }

    private var fill: AnyShapeStyle {
        disabled
            ? AnyShapeStyle(Color(hex: 0xEF7702, opacity: 0.3))
            : AnyShapeStyle(LinearGradient.css(90, [Esc.ember, Esc.ember2]))
    }
}

// MARK: - GhostButton

@available(iOS 17.0, *)
public struct GhostButton: View {
    let label: String
    let onPress: (() -> Void)?

    public init(label: String, onPress: (() -> Void)? = nil) {
        self.label = label
        self.onPress = onPress
    }

    public var body: some View {
        Button { onPress?() } label: {
            Text(label)
                .font(EscFont.ui(15, .medium))
                .foregroundStyle(Esc.haze)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .contentShape(Rectangle())
        }
        .buttonStyle(EscPressStyle())
    }
}

// MARK: - PlayNowButton

/// Tap = `onPress`; holding 600 ms = `onLongPress` (the tap is then suppressed on release).
@available(iOS 17.0, *)
public struct PlayNowButton: View {
    let subtitle: String?
    let onPress: (() -> Void)?
    let onLongPress: (() -> Void)?
    @State private var suppressTap = false

    public init(subtitle: String? = nil, onPress: (() -> Void)? = nil, onLongPress: (() -> Void)? = nil) {
        self.subtitle = subtitle
        self.onPress = onPress
        self.onLongPress = onLongPress
    }

    public var body: some View {
        Button {
            if suppressTap {
                suppressTap = false
                return
            }
            onPress?()
        } label: {
            label
        }
        .buttonStyle(PressBeganStyle(onPressBegan: { suppressTap = false }))
        .simultaneousGesture(
            LongPressGesture(minimumDuration: 0.6).onEnded { _ in
                guard let onLongPress else { return }
                suppressTap = true
                onLongPress()
            }
        )
        .accessibilityLabel("Play for right now")
        .accessibilityHint(subtitle ?? "")
        .accessibilityActions {
            if let onLongPress {
                Button("Compose with Lucille", action: onLongPress)
            }
        }
    }

    private var label: some View {
        HStack(spacing: 12) {
            Circle()
                .fill(Color.white.opacity(0.2))
                .frame(width: 36, height: 36)
                .overlay(Icon(.play, size: 16, color: .white))
            VStack(alignment: .leading, spacing: 0) {
                Text("Play for right now")
                    .font(EscFont.ui(16, .semibold))
                    .foregroundStyle(Color.white)
                if let subtitle {
                    Text(subtitle)
                        .font(EscFont.ui(13))
                        .foregroundStyle(Color.white.opacity(0.8))
                }
            }
            .lineLimit(1)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .frame(height: 64)
        .background(LinearGradient.css(90, [Esc.ember, Esc.ember2]), in: Capsule())
        .shadow(color: Color(hex: 0xEF7702, opacity: 0.35), radius: 10, y: 4)
        .contentShape(Capsule())
    }
}

/// Reports the start of each press so PlayNowButton can reset its long-press tap suppression.
@available(iOS 17.0, *)
private struct PressBeganStyle: ButtonStyle {
    let onPressBegan: () -> Void

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.9 : 1)
            .onChange(of: configuration.isPressed) { _, pressed in
                if pressed { onPressBegan() }
            }
    }
}

// MARK: - ActionPill

@available(iOS 17.0, *)
public struct ActionPill<IconContent: View>: View {
    let label: String
    let active: Bool
    let onPress: (() -> Void)?
    let icon: IconContent

    public init(label: String, active: Bool = false, onPress: (() -> Void)? = nil,
                @ViewBuilder icon: () -> IconContent) {
        self.label = label
        self.active = active
        self.onPress = onPress
        self.icon = icon()
    }

    public var body: some View {
        Button { onPress?() } label: {
            HStack(spacing: 6) {
                icon
                Text(label)
                    .font(EscFont.ui(13, .medium))
                    .foregroundStyle(active ? Esc.mist : Esc.haze)
                    .lineLimit(1)
            }
            .padding(.vertical, 9.5)
            .padding(.horizontal, 15.5)
            .background(active ? Color(hex: 0x39519F, opacity: 0.5) : Color(hex: 0x212C5A, opacity: 0.7), in: Capsule())
            .overlay(Capsule().strokeBorder(active ? Color(hex: 0x39519F, opacity: 0.8) : Esc.hairline, lineWidth: 1.5))
            .fixedSize()
            .contentShape(Capsule())
        }
        .buttonStyle(EscPressStyle())
        .accessibilityAddTraits(active ? .isSelected : [])
    }
}

@available(iOS 17.0, *)
extension ActionPill where IconContent == Icon {
    /// `icon={<MoodIcon size={14} />}`: 14 pt, default icon color #A9B3D6.
    public init(label: String, icon: EscIcon, active: Bool = false, onPress: (() -> Void)? = nil) {
        self.init(label: label, active: active, onPress: onPress, icon: { Icon(icon, size: 14, color: Esc.haze) })
    }
}

// MARK: - EscToggle (shared.tsx `Toggle`)

@available(iOS 17.0, *)
public struct EscToggle: View {
    let on: Bool
    let onToggle: () -> Void

    public init(on: Bool, onToggle: @escaping () -> Void) {
        self.on = on
        self.onToggle = onToggle
    }

    public init(isOn: Binding<Bool>) {
        self.init(on: isOn.wrappedValue, onToggle: { isOn.wrappedValue.toggle() })
    }

    public var body: some View {
        Button(action: onToggle) {
            Capsule()
                .fill(on ? Esc.royal : Esc.card)
                .overlay(Capsule().strokeBorder(on ? Esc.royal : Esc.hairline, lineWidth: 1.5))
                .overlay(alignment: .topLeading) {
                    // top: 2 / left: 2 or 22, measured inside the 1.5 border.
                    Circle()
                        .fill(Esc.mist)
                        .frame(width: 20, height: 20)
                        .offset(x: on ? 23.5 : 3.5, y: 3.5)
                }
                .frame(width: 48, height: 28)
                .animation(.cssEase(0.2), value: on)
                .contentShape(Rectangle())
        }
        .buttonStyle(EscPressStyle(pressedOpacity: 1))
        .accessibilityValue(on ? "On" : "Off")
        .accessibilityAddTraits(.isButton)
    }
}

// MARK: - SegmentedTabs

@available(iOS 17.0, *)
public struct SegmentedTabs: View {
    let tabs: [String]
    let active: String
    let onChange: (String) -> Void

    public init(tabs: [String], active: String, onChange: @escaping (String) -> Void) {
        self.tabs = tabs
        self.active = active
        self.onChange = onChange
    }

    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 4) {
                ForEach(tabs, id: \.self) { tab in
                    tabButton(tab)
                }
            }
            .padding(5) // 1px border + 4px padding
        }
        .scrollBounceBehavior(.basedOnSize, axes: .horizontal)
        .background(Esc.pad, in: Capsule())
        .clipShape(Capsule())
        .overlay(Capsule().strokeBorder(Color(hex: 0xE6EAF4, opacity: 0.08), lineWidth: 1))
    }

    private func tabButton(_ tab: String) -> some View {
        let selected = tab == active
        return Button { onChange(tab) } label: {
            Text(tab)
                .font(EscFont.ui(13, selected ? .semibold : .regular))
                .foregroundStyle(selected ? Esc.mist : Esc.haze)
                .lineLimit(1)
                .fixedSize()
                .padding(.vertical, 6)
                .padding(.horizontal, 14)
                .background(selected ? Esc.royal : Color.clear, in: Capsule())
                .contentShape(Capsule())
        }
        .buttonStyle(EscPressStyle())
        .accessibilityAddTraits(selected ? .isSelected : [])
    }
}

// MARK: - Previews

@available(iOS 17.0, *)
private struct ButtonsPreview: View {
    @State private var tab = "Now"
    @State private var toggle = true
    @State private var blend = false

    var body: some View {
        VStack(spacing: 20) {
            SegmentedTabs(tabs: ["Now", "Focus", "Calm", "Sleep", "Move"], active: tab) { tab = $0 }
            PlayNowButton(subtitle: "Lucille picks Focus for your afternoon", onPress: {}, onLongPress: {})
            PrimaryButton(label: "Update soundscape") {}
            PrimaryButton(label: "Composing...", disabled: true)
            GhostButton(label: "Cancel") {}
            HStack(spacing: 8) {
                ActionPill(label: "Mood Field", icon: .mood)
                ActionPill(label: "Blend", icon: .blend, active: blend) { blend.toggle() }
            }
            HStack(spacing: 16) {
                EscToggle(isOn: $toggle)
                EscToggle(on: false) {}
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Esc.night)
    }
}



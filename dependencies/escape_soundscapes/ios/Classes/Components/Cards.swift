import SwiftUI

// Ported from shared.tsx: SoundscapeCard, JourneyChip (JourneyChipView), InnerWeatherTile, StatTile,
// BetaFeedbackCard. CSS borders are inside the box, so paddings include the border width.

// MARK: - SoundscapeCard

@available(iOS 17.0, *)
public struct SoundscapeCard: View {
    let title: String
    let description: String
    let posterGradient: GradientSpec
    let isPremium: Bool
    let isNew: Bool
    let seasonal: Bool
    let onPress: (() -> Void)?

    /// `isNew` is accepted for parity with the TSX, which never renders a badge for it.
    public init(title: String, description: String, posterGradient: GradientSpec, isPremium: Bool = false,
                isNew: Bool = false, seasonal: Bool = false, onPress: (() -> Void)? = nil) {
        self.title = title
        self.description = description
        self.posterGradient = posterGradient
        self.isPremium = isPremium
        self.isNew = isNew
        self.seasonal = seasonal
        self.onPress = onPress
    }

    public var body: some View {
        Button { onPress?() } label: {
            ZStack(alignment: .bottomLeading) {
                posterGradient.linear
                LinearGradient(stops: [.init(color: Color(hex: 0x0B1230, opacity: 0), location: 0.4),
                                       .init(color: Color(hex: 0x0B1230, opacity: 0.85), location: 1)],
                               startPoint: .top, endPoint: .bottom)
                text
            }
            .frame(width: 240, height: 320)
            .overlay(alignment: .topTrailing) {
                // Tailwind `top-12 right-12` = 48 px.
                badges
                    .padding(.top, 48)
                    .padding(.trailing, 48)
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .contentShape(RoundedRectangle(cornerRadius: 20))
        }
        .buttonStyle(EscPressStyle())
        .accessibilityElement(children: .combine)
        .accessibilityAddTraits(.isButton)
    }

    private var text: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(EscFont.display(20))
                .foregroundStyle(Esc.mist)
            Text(description)
                .font(EscFont.ui(13))
                .foregroundStyle(Esc.haze)
                .lineSpacing(3)
        }
        .multilineTextAlignment(.leading)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
    }

    @ViewBuilder private var badges: some View {
        if isPremium || seasonal {
            HStack(spacing: 4) {
                if isPremium {
                    badge("Premium", fill: Color(hex: 0x0B1230, opacity: 0.7),
                          border: Color(hex: 0xE6EAF4, opacity: 0.2), color: Esc.mist)
                }
                if seasonal {
                    badge("Limited", fill: Color(hex: 0xEF7702, opacity: 0.15),
                          border: Color(hex: 0xEF7702, opacity: 0.4), color: Esc.ember2)
                }
            }
        }
    }

    private func badge(_ label: String, fill: Color, border: Color, color: Color) -> some View {
        Text(label)
            .font(EscFont.ui(10, .semibold))
            .tracking(10 * 0.08)
            .foregroundStyle(color)
            .padding(.vertical, 4)
            .padding(.horizontal, 9)
            .background(fill, in: Capsule())
            .overlay(Capsule().strokeBorder(border, lineWidth: 1))
    }
}

// MARK: - JourneyChipView (shared.tsx `JourneyChip`; the name `JourneyChip` is the API model)

@available(iOS 17.0, *)
public struct JourneyChipView: View {
    let label: String
    let duration: String?
    let onPress: (() -> Void)?

    public init(label: String, duration: String? = nil, onPress: (() -> Void)? = nil) {
        self.label = label
        self.duration = duration
        self.onPress = onPress
    }

    /// From the `home.journeyChips` model.
    public init(_ chip: JourneyChip, onPress: (() -> Void)? = nil) {
        self.init(label: chip.title, duration: chip.chipDuration, onPress: onPress)
    }

    public var body: some View {
        Button { onPress?() } label: {
            HStack(spacing: 6) {
                Text(label)
                    .font(EscFont.ui(14, .medium))
                    .foregroundStyle(Esc.mist)
                if let duration, !duration.isEmpty {
                    Text(duration)
                        .font(EscFont.ui(12))
                        .foregroundStyle(Esc.haze)
                }
            }
            .lineLimit(1)
            .fixedSize()
            .padding(.vertical, 11.5)
            .padding(.horizontal, 17.5)
            .background(Esc.card, in: Capsule())
            .overlay(Capsule().strokeBorder(Esc.hairline, lineWidth: 1.5))
            .contentShape(Capsule())
        }
        .buttonStyle(EscPressStyle())
    }
}

// MARK: - InnerWeatherTile

@available(iOS 17.0, *)
public struct InnerWeatherTile<IconContent: View>: View {
    let label: String
    let value: String
    let onPress: (() -> Void)?
    let icon: IconContent

    public init(label: String, value: String, onPress: (() -> Void)? = nil, @ViewBuilder icon: () -> IconContent) {
        self.label = label
        self.value = value
        self.onPress = onPress
        self.icon = icon()
    }

    public var body: some View {
        Button { onPress?() } label: {
            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: 6) {
                    icon
                    Text(label).escLabel()
                }
                Text(value)
                    .font(EscFont.ui(14, .medium))
                    .foregroundStyle(Esc.mist)
                    .multilineTextAlignment(.leading)
            }
            .lineLimit(1)
            .fixedSize()
            .padding(.vertical, 13.5)
            .padding(.horizontal, 15.5)
            .frame(minWidth: 140, alignment: .leading)
            .background(Esc.card, in: RoundedRectangle(cornerRadius: 16))
            .overlay(RoundedRectangle(cornerRadius: 16).strokeBorder(Esc.hairline, lineWidth: 1.5))
            .contentShape(RoundedRectangle(cornerRadius: 16))
        }
        .buttonStyle(EscPressStyle())
        .accessibilityElement(children: .combine)
        .accessibilityAddTraits(.isButton)
    }
}

@available(iOS 17.0, *)
extension InnerWeatherTile where IconContent == Icon {
    /// `icon={<SunIcon size={14} color="#EF7702" />}` → `icon: .sun, iconColor: Esc.ember`.
    public init(label: String, value: String, icon: EscIcon, iconColor: Color = Esc.haze, onPress: (() -> Void)? = nil) {
        self.init(label: label, value: value, onPress: onPress, icon: { Icon(icon, size: 14, color: iconColor) })
    }
}

// MARK: - StatTile

/// Stretches to fill its row (`flex: 1`). For equal heights in a row, give the HStack
/// `.fixedSize(horizontal: false, vertical: true)`.
@available(iOS 17.0, *)
public struct StatTile<Value: View>: View {
    let label: String
    let sub: String?
    let value: Value

    public init(label: String, sub: String? = nil, @ViewBuilder value: () -> Value) {
        self.label = label
        self.sub = sub
        self.value = value()
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label).escLabel()
            value
                .font(EscFont.display(28))
                .foregroundStyle(Esc.mist)
            if let sub {
                Text(sub)
                    .font(EscFont.ui(12))
                    .foregroundStyle(Esc.haze)
            }
        }
        .padding(17.5)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Esc.card, in: RoundedRectangle(cornerRadius: 16))
        .overlay(RoundedRectangle(cornerRadius: 16).strokeBorder(Color(hex: 0xE6EAF4, opacity: 0.1), lineWidth: 1.5))
        .accessibilityElement(children: .combine)
    }
}

@available(iOS 17.0, *)
extension StatTile where Value == Text {
    public init(label: String, value: String, sub: String? = nil) {
        self.init(label: label, sub: sub, value: { Text(value) })
    }
}

// MARK: - BetaFeedbackCard

/// Keeps its own rating / visual / note state (as the TSX) and hands them to `onSend`
/// (`store.sendBetaFeedback(calmRating:visual:note:)`). `note` is nil when empty.
@available(iOS 17.0, *)
public struct BetaFeedbackCard: View {
    let copy: ContentBundle.BetaFeedbackCopy?
    let onSend: ((_ calmRating: Int, _ visual: String?, _ note: String?) -> Void)?

    @State private var calmRating = 0
    @State private var visualRating: String?
    @State private var note = ""

    public init(copy: ContentBundle.BetaFeedbackCopy? = nil,
                onSend: ((_ calmRating: Int, _ visual: String?, _ note: String?) -> Void)? = nil) {
        self.copy = copy
        self.onSend = onSend
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(copy?.title ?? "Beta Feedback")
                .font(EscFont.ui(13, .semibold))
                .tracking(13 * 0.06)
                .textCase(.uppercase)
                .foregroundStyle(Esc.haze)
                .accessibilityAddTraits(.isHeader)
            question(copy?.calmQuestion ?? "How calm did that feel?") { ratingRow }
            question(copy?.visualQuestion ?? "Did the visual help?") { visualRow }
            noteField
            sendButton
        }
        .padding(21.5)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Esc.cardSoft, in: RoundedRectangle(cornerRadius: 20))
        .overlay(RoundedRectangle(cornerRadius: 20).strokeBorder(Color(hex: 0xE6EAF4, opacity: 0.1), lineWidth: 1.5))
    }

    private func question<Row: View>(_ text: String, @ViewBuilder row: () -> Row) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(text)
                .font(EscFont.ui(14))
                .foregroundStyle(Esc.mist)
            row()
        }
    }

    private var ratingRow: some View {
        HStack(spacing: 8) {
            ForEach(1...5, id: \.self) { n in
                ratingButton(n)
            }
        }
    }

    private func ratingButton(_ n: Int) -> some View {
        let on = calmRating >= n
        return Button { calmRating = n } label: {
            Text("\(n)")
                .font(EscFont.ui(14, .semibold))
                .foregroundStyle(on ? Esc.mist : Esc.haze)
                .frame(width: 40, height: 40)
                .background(on ? Color(hex: 0x8E7CD9, opacity: 0.4) : Esc.card, in: Circle())
                .overlay(Circle().strokeBorder(on ? Color(hex: 0xB9A3F0, opacity: 0.6) : Esc.hairline, lineWidth: 1.5))
                .contentShape(Circle())
        }
        .buttonStyle(EscPressStyle())
        .accessibilityLabel("\(n) of 5")
        .accessibilityAddTraits(calmRating == n ? .isSelected : [])
    }

    private var visualRow: some View {
        HStack(spacing: 8) {
            ForEach(copy?.visualOptions ?? ["Helped", "Neutral", "Distracted"], id: \.self) { option in
                visualButton(option)
            }
        }
    }

    private func visualButton(_ option: String) -> some View {
        let on = visualRating == option
        return Button { visualRating = option } label: {
            Text(option)
                .font(EscFont.ui(13, .medium))
                .foregroundStyle(on ? Esc.mist : Esc.haze)
                .lineLimit(1)
                .fixedSize()
                .padding(.vertical, 9.5)
                .padding(.horizontal, 15.5)
                .background(on ? Color(hex: 0x39519F, opacity: 0.5) : Esc.card, in: Capsule())
                .overlay(Capsule().strokeBorder(on ? Color(hex: 0x39519F, opacity: 0.8) : Esc.hairline, lineWidth: 1.5))
                .contentShape(Capsule())
        }
        .buttonStyle(EscPressStyle())
        .accessibilityAddTraits(on ? .isSelected : [])
    }

    private var noteField: some View {
        TextField("", text: $note,
                  prompt: Text(copy?.notePlaceholder ?? "Optional note...").foregroundColor(Esc.mist.opacity(0.5)),
                  axis: .vertical)
            .font(EscFont.ui(14))
            .foregroundStyle(Esc.mist)
            .tint(Esc.lilac)
            .lineLimit(1...2)
            .padding(.vertical, 13.5)
            .padding(.horizontal, 15.5)
            .frame(maxWidth: .infinity, minHeight: 72, maxHeight: 72, alignment: .topLeading)
            .background(Esc.pad, in: RoundedRectangle(cornerRadius: 16))
            .overlay(RoundedRectangle(cornerRadius: 16).strokeBorder(Esc.hairline, lineWidth: 1.5))
    }

    private var sendButton: some View {
        Button {
            let trimmed = note.trimmingCharacters(in: .whitespacesAndNewlines)
            onSend?(calmRating, visualRating, trimmed.isEmpty ? nil : trimmed)
        } label: {
            Text(copy?.cta ?? "Send to the team")
                .font(EscFont.ui(14, .medium))
                .foregroundStyle(Esc.haze)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 13.5)
                .padding(.horizontal, 21.5)
                .background(Esc.card, in: Capsule())
                .overlay(Capsule().strokeBorder(Esc.hairline, lineWidth: 1.5))
                .contentShape(Capsule())
        }
        .buttonStyle(EscPressStyle())
    }
}

// MARK: - Previews



import SwiftUI

// Ported from screens/LucilleCompose.tsx (LucilleCompose + ChipRow).
//
// The draft (prompt, mode, length, brainwave, inner weather) lives in AppStore so it survives
// navigating to ComposeGenerating and back ("New variation").

@available(iOS 17.0, *)
struct LucilleComposeView: View {
    @Environment(AppStore.self) private var store
    @FocusState private var promptFocused: Bool

    private var copy: ContentBundle.ComposeCopy? { store.content?.compose }

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                header
                scrollContent
            }
            cta
                .ignoresSafeArea(.keyboard, edges: .bottom)
        }
        .background(alignment: .top) { backdrop }
    }

    // MARK: Background

    /// #0B1230 + the 300 pt lilac radial orb at top: -60 (measured from the top of the phone).
    private var backdrop: some View {
        ZStack(alignment: .top) {
            Esc.night
            Circle()
                .fill(RadialGradient.css([Color(hex: 0xB9A3F0, opacity: 0.08), .clear], stops: [0, 0.7], diameter: 300))
                .frame(width: 300, height: 300)
                .offset(y: -60)
        }
        .ignoresSafeArea()
        .allowsHitTesting(false)
    }

    // MARK: Header

    private var header: some View {
        HStack(spacing: 0) {
            Button {
                promptFocused = false
                store.setScreen(.soundscapesHome)
            } label: {
                Text("Cancel")
                    .font(EscFont.ui(16))
                    .foregroundStyle(Esc.haze)
                    .padding(.vertical, 8)
                    .frame(minHeight: 44)
                    .contentShape(Rectangle())
            }
            .buttonStyle(EscPressStyle())
            Text("Compose")
                .font(EscFont.display(20))
                .foregroundStyle(Esc.mist)
                .frame(maxWidth: .infinity)
                .accessibilityAddTraits(.isHeader)
            Color.clear.frame(width: 60, height: 1)
        }
        .padding(.horizontal, 24)
        .frame(height: 52)
    }

    // MARK: Scroll content

    private var scrollContent: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                intro
                    .padding(.bottom, 28)
                ComposePromptField(placeholder: copy?.placeholder ?? "Rain on a cabin roof. I'm wired after a late shift and need to sleep.",
                                   focused: $promptFocused)
                    .padding(.bottom, 24)
                modeRow
                ComposeChipRow(label: "Length", options: copy?.lengths ?? ["15 min", "30 min", "60 min", "Endless"],
                               isSelected: { $0 == store.composeLength }) { option in
                    promptFocused = false
                    store.composeLength = option
                }
                ComposeChipRow(label: "Brainwave", options: copy?.brainwaves ?? ["Off", "Alpha", "Theta", "Delta"],
                               isSelected: { Brainwave(loose: $0) == store.composeBrainwave }) { option in
                    promptFocused = false
                    if let wave = Brainwave(loose: option) { store.composeBrainwave = wave }
                }
                innerWeatherRow
                    .padding(.bottom, 8)
            }
            .padding(.top, 16)
            .padding(.horizontal, 24)
            .padding(.bottom, 120)
            .background {
                // Tapping empty space closes the keyboard.
                Color.clear
                    .contentShape(Rectangle())
                    .onTapGesture { promptFocused = false }
            }
        }
        .scrollDismissesKeyboard(.interactively)
    }

    private var intro: some View {
        VStack(spacing: 16) {
            LucilleOrb(size: 80, pulse: true)
            Text(copy?.prompt ?? "Tell me where you want to be.")
                .font(EscFont.display(22))
                .foregroundStyle(Esc.mist)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
    }

    private var modeRow: some View {
        ComposeChipRow(label: "Mode", options: copy?.modes ?? ["Focus", "Calm", "Sleep", "Move"],
                       isSelected: { ModeId(loose: $0) == store.composeMode },
                       isLocked: { option in ModeId(loose: option).map { store.isLocked($0) } ?? false }) { option in
            promptFocused = false
            guard let mode = ModeId(loose: option) else { return }
            if store.isLocked(mode) {
                store.setSheet(.premium)
            } else {
                store.composeMode = mode
            }
        }
    }

    private var innerWeatherRow: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 2) {
                Text(copy?.innerWeatherLabel ?? "Use my inner weather")
                    .font(EscFont.ui(15, .medium))
                    .foregroundStyle(Esc.mist)
                Text(copy?.innerWeatherSub ?? "Mood, time of day, and weather data")
                    .font(EscFont.ui(13))
                    .foregroundStyle(Esc.haze)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            EscToggle(on: store.composeUseInnerWeather) {
                promptFocused = false
                store.composeUseInnerWeather.toggle()
            }
            .accessibilityLabel(copy?.innerWeatherLabel ?? "Use my inner weather")
        }
        .padding(.vertical, 15.5)
        .padding(.horizontal, 17.5)
        .background(Color(hex: 0x212C5A, opacity: 0.5), in: RoundedRectangle(cornerRadius: 16))
        .overlay(RoundedRectangle(cornerRadius: 16).strokeBorder(Color(hex: 0xE6EAF4, opacity: 0.1), lineWidth: 1.5))
    }

    // MARK: CTA

    private var cta: some View {
        VStack(spacing: 8) {
            PrimaryButton(label: store.isBusy ? (copy?.ctaBusy ?? "Composing...") : (copy?.cta ?? "Compose with Lucille"),
                          disabled: store.isBusy) {
                promptFocused = false
                Task { await store.compose() }
            }
            Text(copy?.eta ?? "Takes about a minute")
                .font(EscFont.ui(12))
                .foregroundStyle(Esc.haze)
                .frame(maxWidth: .infinity)
        }
        .padding(.top, 16)
        .padding(.horizontal, 24)
        .padding(.bottom, 16)
        .background {
            // linear-gradient(to top, #0B1230 60%, transparent)
            LinearGradient(stops: [.init(color: Esc.night.opacity(0), location: 0),
                                   .init(color: Esc.night, location: 0.4)],
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(edges: .bottom)
                .allowsHitTesting(false)
        }
    }
}

// MARK: - Prompt field (the TSX <textarea> + mic button)

@available(iOS 17.0, *)
private struct ComposePromptField: View {
    @Environment(AppStore.self) private var store
    let placeholder: String
    var focused: FocusState<Bool>.Binding

    var body: some View {
        @Bindable var store = store
        ZStack(alignment: .topLeading) {
            if store.composePrompt.isEmpty {
                Text(placeholder)
                    .font(EscFont.ui(16))
                    .lineSpacing(6)
                    .foregroundStyle(Color(hex: 0xA9B3D6, opacity: 0.7))
                    .padding(.top, 17.5)
                    .padding(.leading, 17.5)
                    .padding(.trailing, 53.5)
                    .allowsHitTesting(false)
                    .accessibilityHidden(true)
            }
            TextEditor(text: $store.composePrompt)
                .font(EscFont.ui(16))
                .lineSpacing(6)
                .foregroundStyle(Esc.mist)
                .tint(Esc.lilac)
                .scrollContentBackground(.hidden)
                .focused(focused)
                // TextEditor adds ~5 pt side and ~8 pt top insets of its own.
                .padding(.top, 9.5)
                .padding(.bottom, 9.5)
                .padding(.leading, 12.5)
                .padding(.trailing, 48.5)
                .accessibilityLabel(placeholder)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 120)
        .background(Esc.cardSoft, in: RoundedRectangle(cornerRadius: 16))
        .overlay(RoundedRectangle(cornerRadius: 16).strokeBorder(Esc.hairline, lineWidth: 1.5))
        .overlay(alignment: .bottomTrailing) { micButton }
    }

    /// The prototype's mic button has no handler; here it opens the keyboard, whose mic key dictates.
    private var micButton: some View {
        Button { focused.wrappedValue = true } label: {
            Circle()
                .fill(Color(hex: 0x39519F, opacity: 0.4))
                .overlay(Circle().strokeBorder(Color(hex: 0x39519F, opacity: 0.6), lineWidth: 1.5))
                .overlay(Icon(.mic, size: 16, color: Esc.lilac))
                .frame(width: 36, height: 36)
                .frame(width: 44, height: 44)
                .contentShape(Rectangle())
        }
        .buttonStyle(EscPressStyle())
        .padding(.trailing, 10)
        .padding(.bottom, 10)
        .accessibilityLabel("Use microphone")
    }
}

// MARK: - ChipRow

/// TSX `ChipRow`: an uppercase label and wrapping pill chips. Locked options get a lock glyph.
@available(iOS 17.0, *)
private struct ComposeChipRow: View {
    let label: String
    let options: [String]
    let isSelected: (String) -> Bool
    var isLocked: (String) -> Bool = { _ in false }
    let onSelect: (String) -> Void

    init(label: String, options: [String], isSelected: @escaping (String) -> Bool,
         isLocked: @escaping (String) -> Bool = { _ in false }, onSelect: @escaping (String) -> Void) {
        self.label = label
        self.options = options
        self.isSelected = isSelected
        self.isLocked = isLocked
        self.onSelect = onSelect
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(label)
                .escLabel()
                .accessibilityAddTraits(.isHeader)
            ComposeFlowLayout(spacing: 8) {
                ForEach(options, id: \.self) { option in
                    chip(option)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 20)
    }

    private func chip(_ option: String) -> some View {
        let selected = isSelected(option)
        let locked = isLocked(option)
        return Button { onSelect(option) } label: {
            HStack(spacing: 6) {
                Text(option)
                    .font(EscFont.ui(14, selected ? .semibold : .regular))
                    .foregroundStyle(selected ? Esc.mist : Esc.haze)
                if locked {
                    Icon(.lock, size: 12, color: Esc.haze)
                }
            }
            .lineLimit(1)
            .fixedSize()
            .padding(.vertical, 10.5)
            .padding(.horizontal, 17.5)
            .background(selected ? Color(hex: 0x39519F, opacity: 0.5) : Esc.card, in: Capsule())
            .overlay(Capsule().strokeBorder(selected ? Color(hex: 0x39519F, opacity: 0.8) : Esc.hairline, lineWidth: 1.5))
            .contentShape(Capsule())
        }
        .buttonStyle(EscPressStyle())
        .animation(.easeOut(duration: 0.2), value: selected)
        .accessibilityLabel(option)
        .accessibilityValue(locked ? "Premium, locked" : "")
        .accessibilityAddTraits(selected ? .isSelected : [])
    }
}

// MARK: - Flow layout (CSS flex-wrap)

@available(iOS 17.0, *)
private struct ComposeFlowLayout: Layout {
    var spacing: CGFloat

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let rows = arrange(width: proposal.width ?? .infinity, subviews: subviews)
        let width = rows.map(\.width).max() ?? 0
        let height = rows.reduce(0) { $0 + $1.height } + spacing * CGFloat(max(rows.count - 1, 0))
        return CGSize(width: proposal.width ?? width, height: height)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        var y = bounds.minY
        for row in arrange(width: bounds.width, subviews: subviews) {
            var x = bounds.minX
            for index in row.indices {
                let size = subviews[index].sizeThatFits(.unspecified)
                subviews[index].place(at: CGPoint(x: x, y: y + (row.height - size.height) / 2), proposal: ProposedViewSize(size))
                x += size.width + spacing
            }
            y += row.height + spacing
        }
    }

    private struct Row { var indices: [Int] = []; var width: CGFloat = 0; var height: CGFloat = 0 }

    private func arrange(width: CGFloat, subviews: Subviews) -> [Row] {
        var rows: [Row] = []
        var current = Row()
        for index in subviews.indices {
            let size = subviews[index].sizeThatFits(.unspecified)
            let needed = current.indices.isEmpty ? size.width : current.width + spacing + size.width
            if needed > width, !current.indices.isEmpty {
                rows.append(current)
                current = Row()
            }
            current.width = current.indices.isEmpty ? size.width : current.width + spacing + size.width
            current.height = max(current.height, size.height)
            current.indices.append(index)
        }
        if !current.indices.isEmpty { rows.append(current) }
        return rows
    }
}

// MARK: - Previews



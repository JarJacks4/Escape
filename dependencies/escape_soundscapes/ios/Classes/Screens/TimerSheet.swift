import SwiftUI

// Ported from screens/SupportingScreens.tsx: TimerSheet.
//
// Options come from `content.timer.options` (minutes as strings, plus "Custom"). The prototype never
// read its Custom input; here it does (1…customMax minutes). "Set timer" → `store.setTimer`.

@available(iOS 17.0, *)
struct TimerSheet: View {
    @Environment(AppStore.self) private var store
    @State private var selected = ""
    @State private var customText = ""
    @State private var fadeOut = true
    @State private var sunriseWake = false
    @State private var loaded = false
    @FocusState private var customFocused: Bool

    private static let customOption = "Custom"

    private var copy: ContentBundle.TimerCopy? { store.content?.timer }
    private var options: [String] { copy?.options ?? ["5", "15", "25", "50", "90", "Custom"] }
    private var customMax: Int { copy?.customMax ?? 240 }
    private var isCustom: Bool { selected == Self.customOption }

    /// The minutes "Set timer" will apply (the prototype fell back to 25).
    private var minutes: Int {
        if isCustom, let m = Int(customText.trimmingCharacters(in: .whitespaces)) { return min(customMax, max(1, m)) }
        return Int(selected) ?? 25
    }

    var body: some View {
        BottomSheet(title: "Timer", onClose: { store.closeSheet() }) {
            VStack(alignment: .leading, spacing: 20) {
                TimerFlowLayout(spacing: 8) {
                    ForEach(options, id: \.self) { option in
                        chip(option)
                    }
                }
                if isCustom { customField }
                toggleRow(label: copy?.fadeOutLabel ?? "Fade out over 5 min",
                          sub: copy?.fadeOutSub ?? "Gentle wind-down at the end",
                          on: fadeOut) { fadeOut.toggle() }
                if store.currentMode == .sleep {
                    toggleRow(label: copy?.sunriseLabel ?? "Sunrise wake",
                              sub: copy?.sunriseSub ?? "Soft alarm at your chosen time",
                              on: sunriseWake) { sunriseWake.toggle() }
                }
                PrimaryButton(label: "Set timer") {
                    customFocused = false
                    store.setTimer(minutes: minutes, fadeOut: fadeOut,
                                   sunriseWake: store.currentMode == .sleep ? sunriseWake : nil)
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 24)
            .animation(.easeOut(duration: 0.2), value: isCustom)
        }
        .onAppear(perform: loadInitialValues)
    }

    // MARK: Pieces

    private func chip(_ option: String) -> some View {
        let isSelected = option == selected
        return Button {
            selected = option
            if option == Self.customOption { customFocused = true } else { customFocused = false }
        } label: {
            Text(option == Self.customOption ? option : "\(option) min")
                .font(EscFont.ui(14, isSelected ? .semibold : .regular))
                .foregroundStyle(isSelected ? Esc.mist : Esc.haze)
                .lineLimit(1)
                .fixedSize()
                .padding(.vertical, 11.5)
                .padding(.horizontal, 21.5)
                .background(isSelected ? Color(hex: 0x39519F, opacity: 0.5) : Esc.card, in: Capsule())
                .overlay(Capsule().strokeBorder(isSelected ? Color(hex: 0x39519F, opacity: 0.8) : Esc.hairline, lineWidth: 1.5))
                .contentShape(Capsule())
        }
        .buttonStyle(EscPressStyle())
        .animation(.easeOut(duration: 0.2), value: isSelected)
        .accessibilityLabel(option == Self.customOption ? "Custom length" : "\(option) minutes")
        .accessibilityAddTraits(isSelected ? .isSelected : [])
    }

    private var customField: some View {
        HStack(spacing: 12) {
            TextField("", text: $customText, prompt: Text("60").foregroundStyle(Color(hex: 0xA9B3D6, opacity: 0.7)))
                .keyboardType(.numberPad)
                .focused($customFocused)
                .font(EscFont.ui(16))
                .foregroundStyle(Esc.mist)
                .tint(Esc.lilac)
                .padding(.vertical, 13.5)
                .padding(.horizontal, 17.5)
                .background(Esc.cardSoft, in: RoundedRectangle(cornerRadius: 16))
                .overlay(RoundedRectangle(cornerRadius: 16).strokeBorder(Esc.hairline, lineWidth: 1.5))
                .onChange(of: customText) { _, new in
                    let digits = String(new.filter(\.isNumber).prefix(3))
                    if digits != new { customText = digits }
                }
                .accessibilityLabel("Custom minutes")
            Text("min (max \(customMax))")
                .font(EscFont.ui(14))
                .foregroundStyle(Esc.haze)
                .fixedSize()
        }
    }

    private func toggleRow(label: String, sub: String, on: Bool, onToggle: @escaping () -> Void) -> some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 0) {
                Text(label)
                    .font(EscFont.ui(15, .medium))
                    .foregroundStyle(Esc.mist)
                Text(sub)
                    .font(EscFont.ui(13))
                    .foregroundStyle(Esc.haze)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            EscToggle(on: on, onToggle: onToggle)
                .accessibilityLabel(label)
        }
        .padding(.vertical, 4)
    }

    // MARK: Initial state

    private func loadInitialValues() {
        guard !loaded else { return }
        loaded = true
        let prefs = store.preferences?.timer
        fadeOut = prefs?.fadeOut ?? copy?.fadeOut ?? true
        sunriseWake = prefs?.sunriseWake ?? copy?.sunriseWake ?? false
        if let m = prefs?.minutes {
            if options.contains(String(m)) {
                selected = String(m)
            } else {
                selected = Self.customOption
                customText = String(m)
            }
        } else {
            selected = copy?.default ?? "25"
        }
    }
}

// MARK: - Flow layout (CSS flex-wrap)

@available(iOS 17.0, *)
private struct TimerFlowLayout: Layout {
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





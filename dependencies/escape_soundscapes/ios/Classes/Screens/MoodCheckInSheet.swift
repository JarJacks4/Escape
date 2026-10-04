import SwiftUI

// Ported from screens/MoodCheckIn.tsx (MoodCheckInSheet).
//
// Heavy → Bright slider with a colour orb, multi-select mood tags, the latest Mood Scan row,
// "Tune my soundscape" (records the check-in, nudges the Mood Field, opens NowPlaying) and Skip.

@available(iOS 17.0, *)
struct MoodCheckInSheet: View {
    @Environment(AppStore.self) private var store
    @State private var sliderValue = 0.4
    @State private var selectedTags: [String] = ["Restless"]
    @State private var didApplyDefaults = false
    @State private var submitting = false

    private var copy: ContentBundle.MoodCheckInCopy? { store.content?.moodCheckIn }
    private var tags: [String] { copy?.tags ?? ["Restless", "Foggy", "Wired", "Low", "Steady", "Open"] }

    private var moodLabel: String { sliderValue < 0.33 ? "Heavy" : sliderValue < 0.66 ? "Mixed" : "Bright" }
    private var orbHex: UInt32 { sliderValue < 0.33 ? 0x39519F : sliderValue < 0.66 ? 0x8E7CD9 : 0xB9A3F0 }

    var body: some View {
        BottomSheet(title: copy?.title ?? "How's your inner weather?", onClose: { store.closeSheet() }) {
            VStack(spacing: 24) {
                orbAndSlider
                tagCloud
                latestScan
                PrimaryButton(label: copy?.cta ?? "Tune my soundscape", disabled: submitting) { submit() }
                GhostButton(label: "Skip") { store.closeSheet() }
                    .frame(maxWidth: .infinity)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 32)
        }
        .onAppear(perform: applyDefaults)
        .onChange(of: store.content?.version) { _, _ in applyDefaults() }
    }

    // MARK: - Actions

    private func applyDefaults() {
        guard !didApplyDefaults, let c = store.content?.moodCheckIn else { return }
        didApplyDefaults = true
        sliderValue = min(1, max(0, c.defaultValue))
        selectedTags = c.defaultTags
    }

    private func toggle(_ tag: String) {
        if let i = selectedTags.firstIndex(of: tag) { selectedTags.remove(at: i) } else { selectedTags.append(tag) }
    }

    /// "Use my latest Mood Scan": take the scan's value and mood word.
    private func useLatestScan() {
        let scan = store.moodScan ?? copy?.latestMoodScan
        guard let scan else { return }
        if let v = scan.value { sliderValue = min(1, max(0, v)) }
        if let tag = tags.first(where: { $0.caseInsensitiveCompare(scan.mood) == .orderedSame }), !selectedTags.contains(tag) {
            selectedTags.append(tag)
        }
    }

    private func submit() {
        guard !submitting else { return }
        submitting = true
        let ordered = tags.filter { selectedTags.contains($0) }
        let value = sliderValue
        Task {
            await store.submitMoodCheckIn(value: value, tags: ordered)
            submitting = false
        }
    }

    // MARK: - Orb + slider

    private var orbAndSlider: some View {
        VStack(spacing: 16) {
            Circle()
                .fill(RadialGradient.cssCircle([Color(hex: orbHex, opacity: 0x60 / 255.0),
                                                Color(hex: orbHex, opacity: 0x20 / 255.0)], box: 80))
                .overlay(Circle().strokeBorder(Color(hex: orbHex, opacity: 0x80 / 255.0), lineWidth: 1.5))
                .frame(width: 80, height: 80)
                .animation(.easeInOut(duration: 0.3), value: orbHex)
                .accessibilityHidden(true)
            VStack(spacing: 8) {
                HStack {
                    Text("Heavy").font(EscFont.ui(13)).foregroundStyle(Esc.haze)
                    Spacer()
                    Text(moodLabel).font(EscFont.ui(13, .semibold)).foregroundStyle(Esc.mist)
                    Spacer()
                    Text("Bright").font(EscFont.ui(13)).foregroundStyle(Esc.haze)
                }
                .accessibilityHidden(true)
                MoodSlider(value: $sliderValue, tint: Color(hex: orbHex), valueLabel: moodLabel)
            }
        }
        .frame(maxWidth: .infinity)
    }

    // MARK: - Tags

    private var tagCloud: some View {
        MoodTagFlow(spacing: 8) {
            ForEach(tags, id: \.self) { tag in
                tagChip(tag)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func tagChip(_ tag: String) -> some View {
        let on = selectedTags.contains(tag)
        return Button { toggle(tag) } label: {
            Text(tag)
                .font(EscFont.ui(14, on ? .semibold : .regular))
                .foregroundStyle(on ? Esc.mist : Esc.haze)
                .lineLimit(1)
                .fixedSize()
                .padding(.vertical, 11.5)   // 10 + 1.5 px border
                .padding(.horizontal, 19.5) // 18 + 1.5 px border
                .background(on ? Color(hex: 0x39519F, opacity: 0.5) : Esc.card, in: Capsule())
                .overlay(Capsule().strokeBorder(on ? Color(hex: 0x39519F, opacity: 0.8) : Esc.hairline, lineWidth: 1.5))
                .contentShape(Capsule())
        }
        .buttonStyle(EscPressStyle())
        .accessibilityAddTraits(on ? .isSelected : [])
    }

    // MARK: - Latest Mood Scan

    private var scanLine: String {
        store.moodScan?.label ?? copy?.latestMoodScan.label ?? "2 h ago: Restless"
    }

    private var latestScan: some View {
        Button(action: useLatestScan) {
            HStack(spacing: 12) {
                Circle()
                    .fill(Color(hex: 0x8E7CD9, opacity: 0.3))
                    .overlay(Circle().strokeBorder(Color(hex: 0x8E7CD9, opacity: 0.4), lineWidth: 1))
                    .frame(width: 32, height: 32)
                VStack(alignment: .leading, spacing: 0) {
                    Text("Use my latest Mood Scan")
                        .font(EscFont.ui(13, .medium))
                        .foregroundStyle(Esc.mist)
                    Text(scanLine)
                        .font(EscFont.ui(12))
                        .foregroundStyle(Esc.haze)
                }
                .multilineTextAlignment(.leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 13.5)   // 12 + 1.5 px border
            .padding(.horizontal, 17.5) // 16 + 1.5 px border
            .background(Color(hex: 0x212C5A, opacity: 0.5), in: RoundedRectangle(cornerRadius: 16))
            .overlay(RoundedRectangle(cornerRadius: 16).strokeBorder(Color(hex: 0xE6EAF4, opacity: 0.1), lineWidth: 1.5))
            .contentShape(RoundedRectangle(cornerRadius: 16))
        }
        .buttonStyle(EscPressStyle())
        .accessibilityElement(children: .combine)
        .accessibilityAddTraits(.isButton)
    }
}

// MARK: - Slider (`<input type="range">` with accentColor = orb colour)

@available(iOS 17.0, *)
private struct MoodSlider: View {
    @Binding var value: Double
    let tint: Color
    let valueLabel: String

    private let thumb: CGFloat = 16
    private let track: CGFloat = 4

    var body: some View {
        GeometryReader { geo in
            let usable = max(1, geo.size.width - thumb)
            let x = CGFloat(value) * usable
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Esc.mist)
                    .frame(height: track)
                Capsule()
                    .fill(tint)
                    .frame(width: x + thumb / 2, height: track)
                Circle()
                    .fill(tint)
                    .frame(width: thumb, height: thumb)
                    .offset(x: x)
            }
            .frame(maxHeight: .infinity)
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { g in
                        let v = (g.location.x - thumb / 2) / usable
                        value = Double(min(1, max(0, v)))
                    }
            )
        }
        .frame(height: 28)
        .animation(.easeInOut(duration: 0.3), value: tint)
        .accessibilityElement()
        .accessibilityLabel("Inner weather, Heavy to Bright")
        .accessibilityValue("\(valueLabel), \(Int((value * 100).rounded())) percent")
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment: value = min(1, value + 0.05)
            case .decrement: value = max(0, value - 0.05)
            @unknown default: break
            }
        }
    }
}

// MARK: - Wrapping row (`display: flex; flexWrap: wrap; gap: 8`)

@available(iOS 17.0, *)
private struct MoodTagFlow: Layout {
    var spacing: CGFloat = 8

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let rows = arrange(width: proposal.width ?? .infinity, subviews: subviews)
        let width = rows.map(\.width).max() ?? 0
        let height = rows.map(\.height).reduce(0, +) + spacing * CGFloat(max(0, rows.count - 1))
        return CGSize(width: proposal.width ?? width, height: height)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        var y = bounds.minY
        for row in arrange(width: bounds.width, subviews: subviews) {
            var x = bounds.minX
            for i in row.indices {
                let size = subviews[i].sizeThatFits(.unspecified)
                subviews[i].place(at: CGPoint(x: x, y: y), proposal: ProposedViewSize(size))
                x += size.width + spacing
            }
            y += row.height + spacing
        }
    }

    private struct Row { var indices: [Int] = []; var width: CGFloat = 0; var height: CGFloat = 0 }

    private func arrange(width: CGFloat, subviews: Subviews) -> [Row] {
        var rows: [Row] = []
        var current = Row()
        for i in subviews.indices {
            let size = subviews[i].sizeThatFits(.unspecified)
            let needed = current.indices.isEmpty ? size.width : current.width + spacing + size.width
            if !current.indices.isEmpty && needed > width {
                rows.append(current)
                current = Row()
            }
            current.width = current.indices.isEmpty ? size.width : current.width + spacing + size.width
            current.height = max(current.height, size.height)
            current.indices.append(i)
        }
        if !current.indices.isEmpty { rows.append(current) }
        return rows
    }
}

// MARK: - Previews





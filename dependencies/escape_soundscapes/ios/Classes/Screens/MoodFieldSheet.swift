import SwiftUI

// Ported from MoodFieldSheet.tsx.
//
// The pad writes store.moodField live (the background orb follows it). "Update soundscape" saves it
// and asks Lucille to retune the current track; Cancel / backdrop restore the value from when the
// sheet opened. Axes follow the pad labels (energy = vertical, texture = horizontal), so the
// readout of the Figma default reads "Energy 35 · Texture 72".

@available(iOS 17.0, *)
struct MoodFieldSheet: View {
    @Environment(AppStore.self) private var store
    @State private var original: MoodField?

    private var copy: ContentBundle.MoodFieldCopy? { store.content?.moodField }

    private var dots: [MoodFieldPad.Dot] {
        guard let padDots = copy?.padDots, !padDots.isEmpty else { return MoodFieldPad.Dot.figma }
        return padDots.map { MoodFieldPad.Dot($0) }
    }

    private var presets: [ContentBundle.MoodFieldCopy.Preset] {
        if let p = copy?.presets, !p.isEmpty { return p }
        return [
            .init(label: "Lucille's pick", energy: 0.65, texture: 0.5),
            .init(label: "Yesterday 3 PM", energy: 0.55, texture: 0.65),
            .init(label: "Your best focus", energy: 0.7, texture: 0.7),
        ]
    }

    var body: some View {
        @Bindable var store = store
        BottomSheet(title: "Mood Field", onClose: cancel) {
            VStack(alignment: .leading, spacing: 20) {
                Text(copy?.helper ?? "Drag to reshape the energy and feel of your soundscape.")
                    .font(EscFont.ui(14))
                    .foregroundStyle(Esc.haze)
                    .lineSpacing(4.5)
                    .fixedSize(horizontal: false, vertical: true)

                MoodFieldPad(value: $store.moodField, dots: dots)
                    .frame(maxWidth: .infinity)

                readout
                    .frame(maxWidth: .infinity)

                presetChips

                PrimaryButton(label: copy?.cta ?? "Update soundscape") {
                    Task { await store.applyMoodField() }
                }

                GhostButton(label: "Cancel", onPress: cancel)
                    .frame(maxWidth: .infinity)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 24)
        }
        .onAppear {
            if original == nil { original = store.moodField }
        }
    }

    // MARK: Pieces

    private var readout: some View {
        let energy = Int((store.moodField.energy * 100).rounded())
        let texture = Int((store.moodField.texture * 100).rounded())
        return (Text("Energy ")
            + Text("\(energy)").font(EscFont.ui(14, .semibold)).foregroundStyle(Esc.mist)
            + Text(" · Texture ")
            + Text("\(texture)").font(EscFont.ui(14, .semibold)).foregroundStyle(Esc.mist))
            .font(EscFont.ui(14))
            .foregroundStyle(Esc.haze)
            .multilineTextAlignment(.center)
            .accessibilityLabel("Energy \(energy), Texture \(texture)")
    }

    private var presetChips: some View {
        PresetFlowLayout(spacing: 8, lineSpacing: 8).callAsFunction {
            ForEach(presets, id: \.label) { preset in
                presetChip(preset)
            }
        }
    }

    private func presetChip(_ preset: ContentBundle.MoodFieldCopy.Preset) -> some View {
        Button {
            withAnimation(.easeOut(duration: 0.2)) {
                store.setMoodField(MoodField(energy: preset.energy, texture: preset.texture))
            }
        } label: {
            Text(preset.label)
                .font(EscFont.ui(13))
                .foregroundStyle(Esc.haze)
                .lineLimit(1)
                .padding(.vertical, 9.5)   // 8 + 1.5 border
                .padding(.horizontal, 15.5) // 14 + 1.5 border
                .background(Esc.card, in: Capsule())
                .overlay(Capsule().strokeBorder(Esc.hairline, lineWidth: 1.5))
                .fixedSize()
                .contentShape(Capsule())
        }
        .buttonStyle(EscPressStyle())
        .accessibilityHint("Moves the Mood Field to this preset")
    }

    // MARK: Actions

    private func cancel() {
        if let original { store.setMoodField(original) }
        store.closeSheet()
    }
}

// MARK: - Wrapping chip row (flexWrap: wrap, left aligned)

@available(iOS 17.0, *)
private struct PresetFlowLayout: Layout {
    var spacing: CGFloat = 8
    var lineSpacing: CGFloat = 8

    private struct Row {
        var indices: [Int] = []
        var width: CGFloat = 0
        var height: CGFloat = 0
    }

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        var maxWidth: CGFloat?
        if let w = proposal.width, w.isFinite { maxWidth = w }
        let rows = arrange(maxWidth: maxWidth ?? .infinity, subviews: subviews)
        let height = rows.reduce(0) { $0 + $1.height } + lineSpacing * CGFloat(max(0, rows.count - 1))
        let width = maxWidth ?? rows.map(\.width).max() ?? 0
        return CGSize(width: width, height: height)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let rows = arrange(maxWidth: bounds.width, subviews: subviews)
        var y = bounds.minY
        for row in rows {
            var x = bounds.minX
            for index in row.indices {
                let size = subviews[index].sizeThatFits(.unspecified)
                subviews[index].place(at: CGPoint(x: x, y: y + (row.height - size.height) / 2),
                                      anchor: .topLeading,
                                      proposal: ProposedViewSize(size))
                x += size.width + spacing
            }
            y += row.height + lineSpacing
        }
    }

    private func arrange(maxWidth: CGFloat, subviews: Subviews) -> [Row] {
        var rows: [Row] = []
        var current = Row()
        for index in subviews.indices {
            let size = subviews[index].sizeThatFits(.unspecified)
            let needed = current.indices.isEmpty ? size.width : current.width + spacing + size.width
            if !current.indices.isEmpty && needed > maxWidth {
                rows.append(current)
                current = Row(indices: [index], width: size.width, height: size.height)
            } else {
                current.indices.append(index)
                current.width = needed
                current.height = max(current.height, size.height)
            }
        }
        if !current.indices.isEmpty { rows.append(current) }
        return rows
    }
}

// MARK: - Previews



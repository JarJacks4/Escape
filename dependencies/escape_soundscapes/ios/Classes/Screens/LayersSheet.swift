import SwiftUI

// Ported from LayersSheet.tsx.
//
// Rows come from store.preferences.layers (Figma literals before bootstrap). Edits live in a local
// copy and are saved with store.updateLayers(_:) when a slider is released, a toggle flips or a
// chip is tapped, never on every drag tick. The TSX has no premium lock here, so everyone can edit.

@available(iOS 17.0, *)
struct LayersSheet: View {
    @Environment(AppStore.self) private var store

    @State private var layers: [LayerSetting] = []
    @State private var isDragging = false

    private var sourceLayers: [LayerSetting] {
        if let l = store.preferences?.layers, !l.isEmpty { return l }
        return Self.figmaLayers
    }

    private var displayLayers: [LayerSetting] { layers.isEmpty ? sourceLayers : layers }

    var body: some View {
        BottomSheet(title: "Layers", onClose: { store.closeSheet() }) {
            VStack(alignment: .leading, spacing: 4) {
                ForEach(displayLayers) { layer in
                    row(layer)
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 32)
        }
        .onChange(of: store.preferences?.layers) { _, new in
            guard !isDragging, let new, !new.isEmpty, new != layers else { return }
            layers = new
        }
    }

    // MARK: Row

    private func row(_ layer: LayerSetting) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 12) {
                glyph(layer.glyph)
                Text(layer.label)
                    .font(EscFont.ui(15, .medium))
                    .foregroundStyle(layer.muted ? Esc.haze : Esc.mist)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                LayerSlider(value: layer.value,
                            disabled: layer.muted,
                            label: layer.label,
                            onChange: { v in _ = mutate(layer.id) { $0.value = v } },
                            onEditingChanged: { editing in
                                isDragging = editing
                                if !editing { persist() }
                            })
                EscToggle(on: !layer.muted) {
                    persist(mutate(layer.id) { $0.muted.toggle() })
                }
                .accessibilityLabel(layer.label)
            }
            if let chips = layer.chips, !chips.isEmpty {
                chipsBlock(layer, chips: chips)
            }
        }
        .padding(.vertical, 14)
        .padding(.bottom, 1)
        .overlay(alignment: .bottom) {
            Rectangle()
                .fill(Esc.hairlineSoft)
                .frame(height: 1)
        }
    }

    private func glyph(_ text: String) -> some View {
        Text(text)
            .font(EscFont.ui(14))
            .foregroundStyle(Esc.haze)
            .frame(width: 32, height: 32)
            .background(Esc.card, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(hex: 0xE6EAF4, opacity: 0.1), lineWidth: 1))
            .accessibilityHidden(true)
    }

    private func chipsBlock(_ layer: LayerSetting, chips: [String]) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 6) {
                ForEach(chips, id: \.self) { chip in
                    chipButton(layer, chip: chip)
                }
            }
            if let note = layer.chipNote, !note.isEmpty {
                Text(note)
                    .font(EscFont.ui(11))
                    .italic()
                    .foregroundStyle(Esc.haze)
            }
        }
        .padding(.leading, 44)
    }

    private func chipButton(_ layer: LayerSetting, chip: String) -> some View {
        let selected = layer.selectedChip == chip
        return Button {
            persist(mutate(layer.id) { $0.selectedChip = chip })
        } label: {
            Text(chip)
                .font(EscFont.ui(12, .medium))
                .foregroundStyle(selected ? Esc.mist : Esc.haze)
                .lineLimit(1)
                .padding(.vertical, 7)    // 6 + 1 border
                .padding(.horizontal, 13) // 12 + 1 border
                .background(selected ? Color(hex: 0x39519F, opacity: 0.5) : Esc.card, in: Capsule())
                .overlay(Capsule().strokeBorder(selected ? Color(hex: 0x39519F, opacity: 0.8) : Esc.hairline, lineWidth: 1))
                .fixedSize()
                .contentShape(Capsule())
        }
        .buttonStyle(EscPressStyle())
        .accessibilityLabel("\(layer.label) \(chip)")
        .accessibilityAddTraits(selected ? .isSelected : [])
    }

    // MARK: State

    /// Applies `change` to one layer in the local copy and returns the new list.
    @discardableResult
    private func mutate(_ id: String, _ change: (inout LayerSetting) -> Void) -> [LayerSetting] {
        var list = displayLayers
        guard let i = list.firstIndex(where: { $0.id == id }) else { return list }
        change(&list[i])
        layers = list
        return list
    }

    private func persist(_ list: [LayerSetting]? = nil) {
        store.updateLayers(list ?? displayLayers)
    }

    /// INITIAL_LAYERS in LayersSheet.tsx.
    private static let figmaLayers: [LayerSetting] = [
        LayerSetting(id: "ambience", label: "Ambience", glyph: "~", value: 0.75, muted: false,
                     chips: nil, selectedChip: nil, chipNote: nil),
        LayerSetting(id: "melody", label: "Melody", glyph: "♪", value: 0.5, muted: false,
                     chips: nil, selectedChip: nil, chipNote: nil),
        LayerSetting(id: "pulse", label: "Pulse", glyph: "●", value: 0.4, muted: false,
                     chips: nil, selectedChip: nil, chipNote: nil),
        LayerSetting(id: "nature", label: "Nature", glyph: "❧", value: 0.6, muted: false,
                     chips: nil, selectedChip: nil, chipNote: nil),
        LayerSetting(id: "brainwave", label: "Brainwave", glyph: "⌇", value: 0.5, muted: false,
                     chips: ["Delta", "Theta", "Alpha", "Beta"], selectedChip: "Alpha", chipNote: "Use headphones"),
        LayerSetting(id: "voice", label: "Lucille's Voice", glyph: "◎", value: 0.3, muted: true,
                     chips: nil, selectedChip: nil, chipNote: nil),
    ]
}

// MARK: - LayerSlider (Chrome `<input type="range">` with accentColor #8E7CD9, width 100)

@available(iOS 17.0, *)
private struct LayerSlider: View {
    let value: Double
    let disabled: Bool
    let label: String
    let onChange: (Double) -> Void
    let onEditingChanged: (Bool) -> Void

    @State private var dragging = false

    private let width: CGFloat = 100
    private let height: CGFloat = 32
    private let trackInset: CGFloat = 1
    private let trackHeight: CGFloat = 8
    private let thumb: CGFloat = 15

    private var travel: CGFloat { width - thumb }
    private var thumbCenter: CGFloat { thumb / 2 + CGFloat(min(1, max(0, value))) * travel }
    private var accent: Color { disabled ? Color(hex: 0xCBC8C9) : Esc.violet }

    var body: some View {
        ZStack(alignment: .leading) {
            Capsule()
                .fill(disabled ? Color.white.opacity(0.24) : Color(hex: 0xEFEFEF))
                .overlay(Capsule().strokeBorder(disabled ? Color.clear : Color(hex: 0xB2B2B2), lineWidth: 0.5))
                .frame(width: width - trackInset * 2, height: trackHeight)
                .padding(.leading, trackInset)
            Capsule()
                .fill(accent)
                .frame(width: max(trackHeight, thumbCenter - trackInset), height: trackHeight)
                .padding(.leading, trackInset)
            Circle()
                .fill(accent)
                .frame(width: thumb, height: thumb)
                .offset(x: thumbCenter - thumb / 2)
        }
        .frame(width: width, height: height)
        .contentShape(Rectangle())
        .opacity(disabled ? 0.3 : 1)
        .gesture(drag)
        .allowsHitTesting(!disabled)
        .accessibilityElement()
        .accessibilityLabel("\(label) level")
        .accessibilityValue("\(Int((value * 100).rounded())) percent")
        .accessibilityAdjustableAction { direction in
            guard !disabled else { return }
            switch direction {
            case .increment: onChange(min(1, value + 0.05))
            case .decrement: onChange(max(0, value - 0.05))
            @unknown default: return
            }
            onEditingChanged(false)
        }
    }

    private var drag: some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { g in
                if !dragging {
                    dragging = true
                    onEditingChanged(true)
                }
                onChange(fraction(at: g.location.x))
            }
            .onEnded { g in
                onChange(fraction(at: g.location.x))
                dragging = false
                onEditingChanged(false)
            }
    }

    /// step 0.01, like the range input.
    private func fraction(at x: CGFloat) -> Double {
        let raw = Double((x - thumb / 2) / travel)
        return (min(1, max(0, raw)) * 100).rounded() / 100
    }
}

// MARK: - Previews



import SwiftUI

// Ported from shared.tsx: MoodFieldPad.
//
// Semantic fix vs. the TSX: the TSX maps energy = x and texture = 1 - y, but its axis labels say
// CHARGED (top) / CALM (bottom) / GROUNDED (left) / DREAMY (right). This port follows the labels:
//   energy  = 1 - y   (top = charged, bottom = calm)
//   texture = x       (left = grounded, right = dreamy)
// Everything drawn (pad, grid, glow, dots, knob, labels) is identical to the Figma.

@available(iOS 17.0, *)
public struct MoodFieldPad: View {
    /// A decorative dot on the pad, in pad fractions (x from the left, y from the top).
    public struct Dot: Hashable {
        public var x: CGFloat
        public var y: CGFloat
        public var size: CGFloat
        public var color: Color
        public var opacity: Double

        public init(x: CGFloat, y: CGFloat, size: CGFloat, color: Color, opacity: Double) {
            self.x = x
            self.y = y
            self.size = size
            self.color = color
            self.opacity = opacity
        }

        /// From `content.moodField.padDots`.
        public init(_ dot: ContentBundle.MoodFieldCopy.Dot) {
            self.init(x: CGFloat(dot.x), y: CGFloat(dot.y), size: CGFloat(dot.size),
                      color: Color(css: dot.color), opacity: dot.opacity)
        }

        /// The three dots hard-coded in the Figma.
        public static var figma: [Dot] {
            [
                Dot(x: 0.5, y: 0.35, size: 8, color: Color(hex: 0x8E7CD9), opacity: 0.7),
                Dot(x: 0.65, y: 0.55, size: 6, color: Color(hex: 0xA9B3D6), opacity: 0.5),
                Dot(x: 0.7, y: 0.3, size: 6, color: Color(hex: 0xEF7702), opacity: 0.7),
            ]
        }
    }

    let value: MoodField
    let dots: [Dot]
    let onChange: (MoodField) -> Void

    private let size: CGFloat = 300
    /// The CSS 1.5 px border: absolutely positioned children are placed from the padding box.
    private let inset: CGFloat = 1.5

    public init(value: MoodField, dots: [Dot] = Dot.figma, onChange: @escaping (MoodField) -> Void) {
        self.value = value
        self.dots = dots
        self.onChange = onChange
    }

    public init(value: Binding<MoodField>, dots: [Dot] = Dot.figma) {
        self.init(value: value.wrappedValue, dots: dots, onChange: { value.wrappedValue = $0 })
    }

    public var body: some View {
        VStack(spacing: 8) {
            Text("CHARGED").escLabel()
            HStack(spacing: 8) {
                verticalLabel("GROUNDED", degrees: -90)
                pad
                verticalLabel("DREAMY", degrees: 90)
            }
            Text("CALM").escLabel()
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Mood Field")
        .accessibilityValue("Energy \(percent(value.energy))%, Texture \(percent(value.texture))%")
        .accessibilityHint("Swipe up or down to change energy.")
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment: onChange(MoodField(energy: value.energy + 0.05, texture: value.texture))
            case .decrement: onChange(MoodField(energy: value.energy - 0.05, texture: value.texture))
            @unknown default: break
            }
        }
        .accessibilityAction(named: "More dreamy") {
            onChange(MoodField(energy: value.energy, texture: value.texture + 0.05))
        }
        .accessibilityAction(named: "More grounded") {
            onChange(MoodField(energy: value.energy, texture: value.texture - 0.05))
        }
    }

    // MARK: Pieces

    /// `writingMode: vertical-rl` (DREAMY, reads top→bottom) and the same + rotate(180deg)
    /// (GROUNDED, reads bottom→top).
    private func verticalLabel(_ text: String, degrees: Double) -> some View {
        Text(text)
            .escLabel()
            .fixedSize()
            .rotationEffect(.degrees(degrees))
            .frame(width: 13, height: size)
    }

    private var knobCenter: CGPoint {
        CGPoint(x: inset + CGFloat(value.texture) * size,
                y: inset + CGFloat(1 - value.energy) * size)
    }

    private var pad: some View {
        ZStack(alignment: .topLeading) {
            grid
            glow
            dotsLayer
            knob
        }
        .frame(width: size, height: size)
        .background(Esc.pad, in: RoundedRectangle(cornerRadius: 20))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(RoundedRectangle(cornerRadius: 20).strokeBorder(Esc.hairline, lineWidth: 1.5))
        .contentShape(RoundedRectangle(cornerRadius: 20))
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { drag in update(drag.location) }
        )
    }

    private var grid: some View {
        Canvas { context, _ in
            let inner = size - inset * 2
            for i in 1...5 {
                let p = inset + inner * CGFloat(i) / 6
                context.fill(Path(CGRect(x: p, y: inset, width: 1, height: inner)), with: .color(Esc.hairlineSoft))
                context.fill(Path(CGRect(x: inset, y: p, width: inner, height: 1)), with: .color(Esc.hairlineSoft))
            }
        }
        .frame(width: size, height: size)
        .allowsHitTesting(false)
    }

    private var glow: some View {
        Circle()
            .fill(RadialGradient.cssCircle([Color(hex: 0x8E7CD9, opacity: 0.25), Color(hex: 0x8E7CD9, opacity: 0)],
                                           stops: [0, 0.7], box: 120))
            .frame(width: 120, height: 120)
            .position(knobCenter)
            .allowsHitTesting(false)
    }

    private var dotsLayer: some View {
        ZStack(alignment: .topLeading) {
            ForEach(Array(dots.enumerated()), id: \.offset) { _, dot in
                Circle()
                    .fill(dot.color)
                    .frame(width: dot.size, height: dot.size)
                    .opacity(dot.opacity)
                    .position(x: inset + size * dot.x, y: inset + size * dot.y)
            }
        }
        .frame(width: size, height: size)
        .allowsHitTesting(false)
    }

    private var knob: some View {
        Circle()
            .fill(Color(hex: 0xE6EAF4, opacity: 0.15))
            .overlay(Circle().strokeBorder(Color(hex: 0xE6EAF4, opacity: 0.6), lineWidth: 1.5))
            .overlay(Circle().fill(Esc.mist).frame(width: 6, height: 6))
            .frame(width: 56, height: 56)
            .position(knobCenter)
            .allowsHitTesting(false)
    }

    // MARK: Logic

    private func update(_ location: CGPoint) {
        let x = min(1, max(0, location.x / size))
        let y = min(1, max(0, location.y / size))
        onChange(MoodField(energy: Double(1 - y), texture: Double(x)))
    }

    private func percent(_ v: Double) -> Int {
        Int((v * 100).rounded())
    }
}

// MARK: - Previews

@available(iOS 17.0, *)
private struct MoodFieldPadPreview: View {
    @State private var field = MoodField.figmaDefault

    var body: some View {
        VStack(spacing: 24) {
            MoodFieldPad(value: $field)
            Text("Energy \(Int(field.energy * 100)) · Texture \(Int(field.texture * 100))")
                .font(EscFont.ui(15))
                .foregroundStyle(Esc.haze)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Esc.night)
    }
}



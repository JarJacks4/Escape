import SwiftUI

// Small helpers shared by the ported shared.tsx components.

/// Button style for every Figma button: draws the label exactly as styled (no system tint, no
/// automatic disabled dimming), with an optional press scale (ModeOrb uses 0.96 / 150 ms).
@available(iOS 17.0, *)
public struct EscPressStyle: ButtonStyle {
    public var scale: CGFloat
    public var pressedOpacity: Double

    public init(scale: CGFloat = 1, pressedOpacity: Double = 0.85) {
        self.scale = scale
        self.pressedOpacity = pressedOpacity
    }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scale : 1)
            .opacity(configuration.isPressed ? pressedOpacity : 1)
            .animation(.cssEase(0.15), value: configuration.isPressed)
    }
}

@available(iOS 17.0, *)
extension Animation {
    /// CSS `transition-timing-function: ease`.
    static func cssEase(_ duration: Double) -> Animation {
        .timingCurve(0.25, 0.1, 0.25, 1, duration: duration)
    }
}

@available(iOS 17.0, *)
extension RadialGradient {
    /// `radial-gradient(circle, …)` with no size keyword = `farthest-corner`: on a square box of side
    /// `box` the 100% stop sits at box/2·√2 (the element is then clipped to a circle by border-radius).
    static func cssCircle(_ colors: [Color], stops: [Double]? = nil, box: CGFloat) -> RadialGradient {
        .css(colors, stops: stops, diameter: box * CGFloat(2).squareRoot())
    }
}

/// `.animate-breathe` with `animation-delay`: un-animated until the delay ends, then breathes.
@available(iOS 17.0, *)
struct DelayedBreathe: ViewModifier {
    let delay: Double
    @State private var started = false

    func body(content: Content) -> some View {
        content
            .breathe(started)
            .task {
                try? await Task.sleep(for: .seconds(delay))
                started = true
            }
    }
}

@available(iOS 17.0, *)
extension View {
    /// `className="animate-breathe" style={{ animationDelay: "<delay>s" }}`.
    func breatheDelayed(_ delay: Double) -> some View {
        modifier(DelayedBreathe(delay: delay))
    }
}

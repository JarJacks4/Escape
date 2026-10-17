import SwiftUI

/// The reactive Mood Orb. One instance lives through the whole scan flow; the parent animates
/// its frame so every screen change is a hero move. It recolours to the mood and, while a
/// pulse is being read, beats with it.
///
/// - reading: the live mood (energy, valence, bpm, word → tint).
/// - beatStrength: 0 none … 1 full heartbeat throb. The flow sends ~1 during the pulse read
///   and the energy scan, a soft value elsewhere so the orb stays alive without thumping.
@available(iOS 17.0, *)
public struct MoodOrbView: View {
    public var reading: MoodReading
    public var beatStrength: Double
    public var recolorStrength: Double

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var start = Date()

    public init(reading: MoodReading, beatStrength: Double = 0.25,
                recolorStrength: Double = 1) {
        self.reading = reading
        self.beatStrength = beatStrength
        self.recolorStrength = recolorStrength
    }

    /// A 0…1 heartbeat envelope for `t` seconds at `bpm`: a quick "lub", a smaller "dub",
    /// then rest. Matches what the pulse read is seeing.
    static func beatEnvelope(_ t: Double, bpm: Int) -> Double {
        let period = 60.0 / Double(max(40, min(180, bpm)))
        let p = (t.truncatingRemainder(dividingBy: period)) / period      // 0…1 through one beat
        let lub = exp(-pow((p - 0.06) / 0.05, 2))
        let dub = 0.5 * exp(-pow((p - 0.26) / 0.06, 2))
        return min(1, lub + dub)
    }

    public var body: some View {
        let colors = UIColor(reading.tint).rgb
        TimelineView(.animation(minimumInterval: 1.0 / 30.0, paused: reduceMotion)) { context in
            let t = reduceMotion ? 2.0 : context.date.timeIntervalSince(start)
            let beat = reduceMotion ? 0 : MoodOrbView.beatEnvelope(t, bpm: reading.bpm) * beatStrength
            GeometryReader { geo in
                Rectangle()
                    .colorEffect(ShaderLibrary.scan.moodOrb(
                        .float2(geo.size.width, geo.size.height),
                        .float(t),
                        .float(reading.energy),
                        .float(reading.valence),
                        .float(beat),
                        .float(reading.valence),                 // texture tracks "dreamy" = pleasant here
                        .float(recolorStrength),
                        .float3(colors.r, colors.g, colors.b)))
            }
        }
        .drawingGroup()
        .animation(.easeInOut(duration: 0.6), value: reading.tint)
        .animation(.easeInOut(duration: 0.6), value: recolorStrength)
    }
}

extension UIColor {
    /// Linear-ish 0…1 RGB for passing to the shader.
    var rgb: (r: Float, g: Float, b: Float) {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        return (Float(r), Float(g), Float(b))
    }
}

@available(iOS 17.0, *)
extension ShaderLibrary {
    /// MoodOrb compiled ahead of time (ios/metal/build_metallib.sh), loaded from the plugin bundle.
    static let scan: ShaderLibrary = {
        #if targetEnvironment(simulator)
        let name = "MoodOrb-iphonesimulator"
        #else
        let name = "MoodOrb-iphoneos"
        #endif
        if let url = Bundle.soundscapes.url(forResource: name, withExtension: "metallib") {
            return ShaderLibrary(url: url)
        }
        return .default
    }()
}

import AVFoundation
import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

/// The reactive Mood Orb. One instance lives through the whole scan flow; the parent animates
/// its frame so every screen change is a hero move. It recolours to the mood and, while a
/// pulse is being read, beats with it.
///
/// Looks like the Calm soundscape orb (the purple-blue mesh sphere): it plays the bundled Calm
/// loop, keys out the loop's dark background so the scan backgrounds show through, tints it
/// toward the mood colour and brightens/swells on each heartbeat. Falls back to the shader orb
/// if the loop isn't in the bundle.
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
    @State private var video: OrbVideoSource?
    @State private var videoMissing = false

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

    /// Loop speed follows energy: drained ≈ 0.7×, charged ≈ 1.5×.
    private var playbackRate: Float { Float(0.7 + 0.8 * reading.energy) }

    public var body: some View {
        Group {
            if let video {
                videoOrb(video)
            } else if videoMissing {
                shaderOrb
            } else {
                Color.clear
            }
        }
        .onAppear {
            if video == nil && !videoMissing {
                if let source = OrbVideoSource.make() {
                    video = source
                } else {
                    videoMissing = true
                }
            }
            video?.play(rate: playbackRate, still: reduceMotion)
        }
        .onDisappear { video?.pause() }
        .onChange(of: reading.energy) { _, _ in video?.setRate(playbackRate) }
    }

    private func videoOrb(_ source: OrbVideoSource) -> some View {
        TimelineView(.animation(minimumInterval: 1.0 / 30.0, paused: false)) { context in
            let t = context.date.timeIntervalSince(start)
            let beat = reduceMotion ? 0 : MoodOrbView.beatEnvelope(t, bpm: reading.bpm) * beatStrength
            let frame = source.frame(tint: UIColor(reading.tint),
                                     recolor: recolorStrength,
                                     beat: beat)
            ZStack {
                if let frame {
                    Image(decorative: frame, scale: 1)
                        .resizable()
                        .interpolation(.high)
                        .aspectRatio(1, contentMode: .fit)
                }
            }
            .scaleEffect(1 + 0.07 * beat)
        }
    }

    /// The original shader orb (used only if the Calm loop is missing from the bundle).
    private var shaderOrb: some View {
        let colors = UIColor(reading.tint).rgb
        return TimelineView(.animation(minimumInterval: 1.0 / 30.0, paused: reduceMotion)) { context in
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

/// Plays the bundled Calm orb loop muted and hands out processed frames: centre crop, tinted
/// toward the mood colour (eased, so colour changes glide), dark background keyed to
/// transparent, soft round edge, brighter on each beat.
@available(iOS 17.0, *)
final class OrbVideoSource {
    static let fileName = "escape_calm_e50_t50_v3_540_offline.mp4"

    static func make() -> OrbVideoSource? {
        guard let url = OrbLoops.bundled(fileName) else {
            print("[Scan] orb loop missing from bundle: \(fileName)")
            return nil
        }
        return OrbVideoSource(url: url)
    }

    private static let context = CIContext(options: [.cacheIntermediates: false])

    private let player: AVPlayer
    private let output = AVPlayerItemVideoOutput(pixelBufferAttributes: [
        kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA,
    ])
    private var endObserver: NSObjectProtocol?
    private var rate: Float = 1
    private var last: CGImage?
    /// Current tint (eased toward the target each frame). Starts at the orb's own lilac-blue.
    private var color = SIMD3<Double>(0.62, 0.56, 0.95)

    private init(url: URL) {
        let item = AVPlayerItem(url: url)
        item.add(output)
        player = AVPlayer(playerItem: item)
        player.isMuted = true
        player.preventsDisplaySleepDuringVideoPlayback = false
        player.actionAtItemEnd = .none
        endObserver = NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime, object: item, queue: .main
        ) { [weak self] _ in
            guard let self else { return }
            self.player.seek(to: .zero)
            self.player.rate = self.rate
        }
    }

    deinit {
        if let endObserver { NotificationCenter.default.removeObserver(endObserver) }
        player.pause()
    }

    func play(rate: Float, still: Bool) {
        self.rate = rate
        if still {
            player.seek(to: CMTime(seconds: 2, preferredTimescale: 600))
            player.pause()
        } else {
            player.playImmediately(atRate: rate)
        }
    }

    func setRate(_ newRate: Float) {
        rate = newRate
        if player.rate != 0 { player.rate = newRate }
    }

    func pause() { player.pause() }

    func frame(tint: UIColor, recolor: Double, beat: Double) -> CGImage? {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        tint.getRed(&r, green: &g, blue: &b, alpha: &a)
        color += (SIMD3(Double(r), Double(g), Double(b)) - color) * 0.08

        let time = output.itemTime(forHostTime: CACurrentMediaTime())
        guard output.hasNewPixelBuffer(forItemTime: time),
              let buffer = output.copyPixelBuffer(forItemTime: time, itemTimeForDisplay: nil)
        else { return last }

        var image = CIImage(cvPixelBuffer: buffer)
        // Centre square, zoomed a little so the sphere fills the orb frame.
        let e = image.extent
        let side = min(e.width, e.height) * 0.8
        let square = CGRect(x: e.midX - side / 2, y: e.midY - side / 2, width: side, height: side)
        image = image.cropped(to: square)

        // Mood colour.
        let mono = CIFilter.colorMonochrome()
        mono.inputImage = image
        mono.color = CIColor(red: CGFloat(color.x), green: CGFloat(color.y), blue: CGFloat(color.z))
        mono.intensity = Float(0.8 * max(0, min(1, recolor)))
        image = mono.outputImage ?? image

        // Dark navy background -> transparent (alpha from brightness).
        let key = CIFilter.colorMatrix()
        key.inputImage = image
        key.aVector = CIVector(x: 1.6, y: 1.6, z: 1.6, w: 0)
        key.biasVector = CIVector(x: 0, y: 0, z: 0, w: -0.7)
        image = key.outputImage ?? image
        let clamp = CIFilter.colorClamp()
        clamp.inputImage = image
        clamp.minComponents = CIVector(x: 0, y: 0, z: 0, w: 0)
        clamp.maxComponents = CIVector(x: 1, y: 1, z: 1, w: 1)
        image = clamp.outputImage ?? image

        // Heartbeat glow.
        let glow = CIFilter.exposureAdjust()
        glow.inputImage = image
        glow.ev = Float(0.2 + 0.9 * beat)
        image = glow.outputImage ?? image

        // Soft round edge so the crop never shows.
        let ring = CIFilter.radialGradient()
        ring.center = CGPoint(x: square.midX, y: square.midY)
        ring.radius0 = Float(side * 0.38)
        ring.radius1 = Float(side * 0.5)
        ring.color0 = CIColor(red: 1, green: 1, blue: 1, alpha: 1)
        ring.color1 = CIColor(red: 0, green: 0, blue: 0, alpha: 0)
        if let mask = ring.outputImage?.cropped(to: square) {
            let blend = CIFilter.blendWithAlphaMask()
            blend.inputImage = image
            blend.backgroundImage = CIImage.empty().cropped(to: square)
            blend.maskImage = mask
            image = blend.outputImage ?? image
        }

        guard let cg = OrbVideoSource.context.createCGImage(image, from: square) else { return last }
        last = cg
        return cg
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

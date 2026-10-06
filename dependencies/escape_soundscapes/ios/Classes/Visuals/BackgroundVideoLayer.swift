import AVFoundation
import CryptoKit
import SwiftUI
import UIKit

// MARK: - BackgroundVideoLayer

/// The TouchDesigner loop behind NowPlaying: poster → cached looping video (or the live orb
/// shader when there's no preset) → scrim. Never makes a sound. The Figma's breathing circles
/// (`VisualLayer` in Components) draw on top of this.
@available(iOS 17.0, *)
public struct BackgroundVideoLayer: View {
    public var preset: VisualPreset?
    public var moodField: MoodField
    /// Night UI: fade to 20% after a minute of no touches.
    public var dimmed: Bool

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var localVideo: URL?

    public init(preset: VisualPreset?, moodField: MoodField = .neutral, dimmed: Bool = false) {
        self.preset = preset
        self.moodField = moodField
        self.dimmed = dimmed
    }

    public var body: some View {
        ZStack {
            Esc.night

            if let poster = preset?.poster {
                Color.clear.overlay {
                    AsyncImage(url: poster) { image in
                        image.resizable().scaledToFill()
                    } placeholder: {
                        Color.clear
                    }
                }
                .clipped()
            }

            if !reduceMotion {
                if let localVideo {
                    LoopingVideoView(fileURL: localVideo)
                        .id(localVideo)
                        .transition(.opacity)
                } else if preset == nil {
                    OrbShaderView(energy: moodField.energy, dream: moodField.texture)
                }
            }

            LinearGradient(stops: [.init(color: Esc.night.opacity(0), location: 0),
                                   .init(color: Esc.night.opacity(0), location: 0.45),
                                   .init(color: Esc.night.opacity(0.85), location: 1)],
                           startPoint: .top, endPoint: .bottom)
        }
        .opacity(dimmed ? 0.2 : 1)
        .animation(.easeInOut(duration: 0.8), value: localVideo)
        .animation(.easeInOut(duration: 1.2), value: dimmed)
        .task(id: preset?.preferredVideoURL) {
            guard let url = preset?.preferredVideoURL else {
                localVideo = nil
                return
            }
            if let local = try? await VideoCache.shared.localURL(for: url) {
                localVideo = local
            } else if let p = preset, let offline = OrbLoops.offlineURL(for: p) {
                localVideo = offline  // no network: the mode's bundled loop
            }
            if let p = preset { OrbLoops.prefetchNeighbours(of: p) }
        }
        .ignoresSafeArea()
        .accessibilityHidden(true)
    }
}

// MARK: - Looping video

/// Silent, aspect-fill, seamlessly looping video (AVPlayerLooper). Muted, so it never
/// takes over the audio session or interrupts Lucille's music.
@available(iOS 17.0, *)
struct LoopingVideoView: UIViewRepresentable {
    let fileURL: URL

    func makeCoordinator() -> Coordinator { Coordinator() }

    func makeUIView(context: Context) -> PlayerView {
        let view = PlayerView()
        view.playerLayer.videoGravity = .resizeAspectFill
        view.backgroundColor = .clear
        context.coordinator.attach(to: view, url: fileURL)
        return view
    }

    func updateUIView(_ view: PlayerView, context: Context) {
        if context.coordinator.url != fileURL {
            context.coordinator.attach(to: view, url: fileURL)
        }
    }

    static func dismantleUIView(_ view: PlayerView, coordinator: Coordinator) {
        coordinator.stop()
    }

    final class PlayerView: UIView {
        override class var layerClass: AnyClass { AVPlayerLayer.self }
        var playerLayer: AVPlayerLayer { layer as! AVPlayerLayer }
    }

    final class Coordinator {
        private(set) var url: URL?
        private let player = AVQueuePlayer()
        private var looper: AVPlayerLooper?

        init() {
            player.isMuted = true
            player.preventsDisplaySleepDuringVideoPlayback = false
            player.audiovisualBackgroundPlaybackPolicy = .pauses
        }

        func attach(to view: PlayerView, url: URL) {
            self.url = url
            looper?.disableLooping()
            looper = AVPlayerLooper(player: player, templateItem: AVPlayerItem(url: url))
            view.playerLayer.player = player
            player.play()
        }

        func stop() {
            player.pause()
            looper?.disableLooping()
            looper = nil
        }
    }
}

// MARK: - Video cache

/// Downloads each loop once into Caches/EscapeVisuals and serves the local file after that.
@available(iOS 17.0, *)
public actor VideoCache {
    public static let shared = VideoCache()

    private let directory: URL
    private var inFlight: [URL: Task<URL, Error>] = [:]

    public init() {
        directory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("EscapeVisuals", isDirectory: true)
        try? FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
    }

    public func localURL(for remote: URL) async throws -> URL {
        if remote.isFileURL { return remote }
        let digest = SHA256.hash(data: Data(remote.absoluteString.utf8))
        let name = digest.map { String(format: "%02x", $0) }.joined()
        let ext = remote.pathExtension.isEmpty ? "mp4" : remote.pathExtension
        let destination = directory.appendingPathComponent("\(name).\(ext)")
        if FileManager.default.fileExists(atPath: destination.path) { return destination }

        if let running = inFlight[remote] { return try await running.value }
        let task = Task<URL, Error> {
            let (temp, response) = try await URLSession.shared.download(from: remote)
            if let http = response as? HTTPURLResponse, !(200..<300).contains(http.statusCode) {
                throw APIError.server(status: http.statusCode, code: "video_download", message: remote.lastPathComponent)
            }
            try? FileManager.default.removeItem(at: destination)
            try FileManager.default.moveItem(at: temp, to: destination)
            return destination
        }
        inFlight[remote] = task
        defer { inFlight[remote] = nil }
        return try await task.value
    }

    /// Clears cached loops (e.g. from a settings screen).
    public func clear() {
        try? FileManager.default.removeItem(at: directory)
        try? FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
    }
}

// MARK: - Orb shader

/// Live orb (zero download). Same look as escape_orb.frag in the FlutterFlow kit.
/// energy and dream are 0–1 (the Mood Field).
@available(iOS 17.0, *)
public struct OrbShaderView: View {
    public var energy: Double
    public var dream: Double

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var start = Date()

    public init(energy: Double, dream: Double) {
        self.energy = energy
        self.dream = dream
    }

    public var body: some View {
        TimelineView(.animation(minimumInterval: 1.0 / 30.0, paused: reduceMotion)) { context in
            let t = reduceMotion ? 2.0 : context.date.timeIntervalSince(start)
            GeometryReader { geo in
                Rectangle()
                    .colorEffect(ShaderLibrary.soundscapes.escapeOrb(
                        .float2(geo.size.width, geo.size.height),
                        .float(t),
                        .float(energy * 10),
                        .float(dream * 10)))
            }
        }
        .ignoresSafeArea()
    }
}


@available(iOS 17.0, *)
extension VisualPreset {
    /// HEVC when the device decodes it in hardware (every iOS 17 device does), else H.264.
    public var preferredVideoURL: URL { videoHevc ?? videoH264 }
}


@available(iOS 17.0, *)
extension ShaderLibrary {
    /// EscapeOrb compiled ahead of time (ios/metal/build_metallib.sh), loaded from the plugin bundle.
    static let soundscapes: ShaderLibrary = {
        #if targetEnvironment(simulator)
        let name = "EscapeOrb-iphonesimulator"
        #else
        let name = "EscapeOrb-iphoneos"
        #endif
        if let url = Bundle.soundscapes.url(forResource: name, withExtension: "metallib") {
            return ShaderLibrary(url: url)
        }
        return .default
    }()
}

import Foundation

/// What the store needs from audio. `SoundscapePlayer` (AVFoundation) is the real one;
/// `SilentAudioEngine` is for tests and previews.
@available(iOS 17.0, *)
@MainActor
public protocol AudioEngine: AnyObject {
    /// Starts a composition: intro → shuffled bodies (crossfaded) → outro on finish.
    func play(_ composition: Composition, blend: Bool, startOffset: TimeInterval)
    /// Equal-power crossfade into another composition (mode switch, retune, variation).
    func crossfade(to composition: Composition)
    func pause()
    func resume()
    /// Plays the outro, then stops (session end, timer end).
    func finishGracefully()
    func stop()
    /// Blend = mix with other apps' audio (AVAudioSession .mixWithOthers).
    func setBlend(_ on: Bool)
    /// 0…1, for the timer's fade-out.
    func setVolume(_ volume: Float)
    var onFinished: (() -> Void)? { get set }
}

@available(iOS 17.0, *)
@MainActor
public final class SilentAudioEngine: AudioEngine {
    public private(set) var log: [String] = []
    public var onFinished: (() -> Void)?
    public init() {}
    public func play(_ c: Composition, blend: Bool, startOffset: TimeInterval) { log.append("play \(c.compositionId) @\(Int(startOffset))") }
    public func crossfade(to c: Composition) { log.append("crossfade \(c.compositionId)") }
    public func pause() { log.append("pause") }
    public func resume() { log.append("resume") }
    public func finishGracefully() { log.append("finish"); onFinished?() }
    public func stop() { log.append("stop") }
    public func setBlend(_ on: Bool) { log.append("blend \(on)") }
    public func setVolume(_ v: Float) { log.append("volume \(v)") }
}

import AVFoundation
import Observation
import SwiftUI

/// Reads the heart rate from a fingertip on the back camera (photoplethysmography, PPG).
///
/// How it works: with the flash on, light shines through the fingertip. Each heartbeat pushes a
/// little more blood into the tiny vessels there, which absorbs a little more light, so the
/// camera image gets slightly darker red on every beat. We average the red of each frame
/// (~30 per second), remove the slow drift, find the beat peaks and turn the time between
/// them into beats per minute. Only these averages are kept: no image or video is stored or
/// sent anywhere.
@available(iOS 17.0, *)
@Observable
final class CameraPulseReader {
    // All state changes happen on the main thread (camera frames are hopped over), so SwiftUI
    // can observe them directly. Kept free of actor annotations so views can call it anywhere.
    enum Status: Equatable {
        case idle            // not started
        case starting        // asking for the camera / turning it on
        case denied          // camera permission refused
        case unavailable     // no back camera or flash (e.g. simulator)
        case placeFinger     // camera on, no fingertip over the lens yet
        case reading         // fingertip detected, collecting beats
    }

    private(set) var status: Status = .idle
    /// Latest heart rate, once enough clean beats were seen. nil until then.
    private(set) var bpm: Int?
    /// 0…1: how steady the beat-to-beat timing is (higher = more trustworthy).
    private(set) var quality: Double = 0
    /// Seconds of clean fingertip signal collected so far (resets if the finger lifts).
    private(set) var secondsOfSignal: Double = 0
    /// The last ~4 s of the normalised pulse wave, for the live trace on screen.
    private(set) var wave: [Double] = []

    private var capture: PulseCapture?
    /// False once stop() is called, so a start() still waiting on permission never turns the camera on.
    private var wanted = false
    private var samples: [(t: Double, v: Double)] = []

    /// Asks for the camera if needed, then starts reading. Safe to call more than once.
    func start() async {
        let alreadyRunning = await MainActor.run { () -> Bool in
            if capture != nil { return true }
            wanted = true
            status = .starting
            bpm = nil; quality = 0; secondsOfSignal = 0; wave = []; samples = []
            return false
        }
        if alreadyRunning { return }

        var allowed = AVCaptureDevice.authorizationStatus(for: .video) == .authorized
        if AVCaptureDevice.authorizationStatus(for: .video) == .notDetermined {
            allowed = await AVCaptureDevice.requestAccess(for: .video)
        }
        guard allowed else {
            await MainActor.run { status = .denied }
            return
        }

        let cap = PulseCapture { [weak self] t, r, g, b in
            DispatchQueue.main.async { self?.ingest(t: t, r: r, g: g, b: b) }
        }
        guard cap.configure() else {
            await MainActor.run { status = .unavailable }
            return
        }
        await MainActor.run {
            guard wanted else { return }
            capture = cap
            cap.run()
            status = .placeFinger
        }
    }

    /// Turns the camera and flash off.
    func stop() {
        wanted = false
        capture?.halt()
        capture = nil
        if status != .denied && status != .unavailable { status = .idle }
    }

    // MARK: Signal processing

    private func ingest(t: Double, r: Double, g: Double, b: Double) {
        guard capture != nil else { return }
        // A fingertip over the lens with the flash on fills the frame with bright, saturated red.
        let fingerOn = r > 0.35 && g < r * 0.65 && b < r * 0.65
        if !fingerOn {
            if status == .reading { status = .placeFinger }
            samples.removeAll(); wave = []; secondsOfSignal = 0
            return
        }
        if status != .reading { status = .reading }

        samples.append((t, r))
        // Keep the last 12 s.
        while let first = samples.first, t - first.t > 12 { samples.removeFirst() }
        secondsOfSignal = (samples.last?.t ?? t) - (samples.first?.t ?? t)
        analyse()
    }

    private func analyse() {
        let n = samples.count
        guard n > 45 else { return }   // ~1.5 s
        let times = samples.map { $0.t }
        let raw = samples.map { $0.v }

        // 1. Remove slow drift (pressure, exposure): subtract a ~1 s moving average.
        // 2. Smooth frame noise with a short (~0.1 s) moving average.
        // More blood absorbs more light, so invert: peaks of `wave` are heartbeats.
        let fps = Double(n - 1) / max(0.001, times[n - 1] - times[0])
        let slow = movingAverage(raw, window: max(3, Int(fps)))
        let detrended = zip(raw, slow).map { -( $0 - $1) }
        let smooth = movingAverage(detrended, window: max(1, Int(fps / 10)))

        // Live trace: last ~4 s, scaled to -1…1.
        let tail = Array(smooth.suffix(Int(fps * 4)))
        let peak = max(tail.map { abs($0) }.max() ?? 1, 1e-6)
        wave = tail.map { $0 / peak }

        // Beat peaks: local maxima above the running mean, at least 0.33 s apart (≤ 180 bpm).
        let mean = smooth.reduce(0, +) / Double(smooth.count)
        let minGap = 0.33
        var beats: [Double] = []
        if smooth.count > 2 {
            for i in 1..<(smooth.count - 1) where smooth[i] > mean && smooth[i] >= smooth[i - 1] && smooth[i] > smooth[i + 1] {
                if let last = beats.last, times[i] - last < minGap { continue }
                beats.append(times[i])
            }
        }
        guard beats.count >= 6 else { return }

        // Median beat-to-beat interval → bpm; spread of intervals → quality.
        let intervals = zip(beats.dropFirst(), beats).map { $0 - $1 }.filter { $0 > 0.33 && $0 < 1.5 }
        guard intervals.count >= 5 else { return }
        let sorted = intervals.sorted()
        let median = sorted[sorted.count / 2]
        let avg = intervals.reduce(0, +) / Double(intervals.count)
        let sd = sqrt(intervals.map { ($0 - avg) * ($0 - avg) }.reduce(0, +) / Double(intervals.count))
        let q = max(0, min(1, 1 - (sd / avg) * 4))
        let value = Int((60 / median).rounded())
        guard (40...180).contains(value) else { return }
        quality = q
        // Only publish a reading once the rhythm is reasonably steady.
        if q >= 0.35 { bpm = value }
    }

    private func movingAverage(_ x: [Double], window w: Int) -> [Double] {
        guard w > 1, x.count > 1 else { return x }
        var out = [Double](repeating: 0, count: x.count)
        var sum = 0.0
        for i in 0..<x.count {
            sum += x[i]
            if i >= w { sum -= x[i - w] }
            out[i] = sum / Double(min(i + 1, w))
        }
        return out
    }
}

/// The AVFoundation side: back wide camera at ~30 fps with the torch on, and per-frame average
/// red/green/blue (0…1) over the centre of the image. Frames are processed and dropped.
@available(iOS 17.0, *)
final class PulseCapture: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate, @unchecked Sendable {
    typealias Sample = (_ t: Double, _ r: Double, _ g: Double, _ b: Double) -> Void

    private let session = AVCaptureSession()
    private let queue = DispatchQueue(label: "escape.pulse.capture")
    private var device: AVCaptureDevice?
    private let onSample: Sample

    init(onSample: @escaping Sample) {
        self.onSample = onSample
        super.init()
    }

    func configure() -> Bool {
        guard let cam = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back),
              let input = try? AVCaptureDeviceInput(device: cam) else { return false }
        session.beginConfiguration()
        session.sessionPreset = .low
        guard session.canAddInput(input) else { session.commitConfiguration(); return false }
        session.addInput(input)

        let output = AVCaptureVideoDataOutput()
        output.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA]
        output.alwaysDiscardsLateVideoFrames = true
        output.setSampleBufferDelegate(self, queue: queue)
        guard session.canAddOutput(output) else { session.commitConfiguration(); return false }
        session.addOutput(output)
        session.commitConfiguration()

        do {
            try cam.lockForConfiguration()
            let fps = CMTime(value: 1, timescale: 30)
            if cam.activeFormat.videoSupportedFrameRateRanges.contains(where: { $0.maxFrameRate >= 30 && $0.minFrameRate <= 30 }) {
                cam.activeVideoMinFrameDuration = fps
                cam.activeVideoMaxFrameDuration = fps
            }
            cam.unlockForConfiguration()
        } catch { }
        device = cam
        return true
    }

    func run() {
        queue.async { [self] in
            session.startRunning()
            setTorch(on: true)
        }
    }

    func halt() {
        queue.async { [self] in
            setTorch(on: false)
            session.stopRunning()
        }
    }

    private func setTorch(on: Bool) {
        guard let cam = device, cam.hasTorch else { return }
        do {
            try cam.lockForConfiguration()
            defer { cam.unlockForConfiguration() }
            if on {
                try cam.setTorchModeOn(level: AVCaptureDevice.maxAvailableTorchLevel)
            } else {
                cam.torchMode = .off
            }
        } catch { }
    }

    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let px = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        let t = CMTimeGetSeconds(CMSampleBufferGetPresentationTimeStamp(sampleBuffer))
        CVPixelBufferLockBaseAddress(px, .readOnly)
        defer { CVPixelBufferUnlockBaseAddress(px, .readOnly) }
        guard let base = CVPixelBufferGetBaseAddress(px) else { return }
        let w = CVPixelBufferGetWidth(px), h = CVPixelBufferGetHeight(px)
        let rowBytes = CVPixelBufferGetBytesPerRow(px)
        let ptr = base.assumingMemoryBound(to: UInt8.self)

        // Centre half of the frame, every 4th pixel: plenty for an average, cheap per frame.
        var r = 0, g = 0, b = 0, count = 0
        var y = h / 4
        while y < h * 3 / 4 {
            let row = ptr + y * rowBytes
            var x = w / 4
            while x < w * 3 / 4 {
                let p = row + x * 4          // BGRA
                b += Int(p[0]); g += Int(p[1]); r += Int(p[2])
                count += 1
                x += 4
            }
            y += 4
        }
        guard count > 0 else { return }
        let d = Double(count) * 255
        onSample(t, Double(r) / d, Double(g) / d, Double(b) / d)
    }
}

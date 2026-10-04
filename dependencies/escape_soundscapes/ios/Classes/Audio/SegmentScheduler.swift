import Foundation

/// Decides the play order of a Lucille segment set: intro, then body segments in shuffled
/// order with no segment twice in a row, then the outro when the session ends.
/// Pure logic, unit-tested in SegmentSchedulerTests.
@available(iOS 17.0, *)
public struct SegmentScheduler: Sendable {
    public let intro: AudioSegment?
    public let bodies: [AudioSegment]
    public let outro: AudioSegment?

    private var bag: [Int] = []
    private var lastBody: Int?
    private var startedIntro = false
    private let shuffle: @Sendable ([Int]) -> [Int]

    public init(segments: [AudioSegment], shuffle: @escaping @Sendable ([Int]) -> [Int] = { $0.shuffled() }) {
        intro = segments.first { $0.role == .intro }
        bodies = segments.filter { $0.role == .body }
        outro = segments.first { $0.role == .outro }
        self.shuffle = shuffle
    }

    /// First segment to play: the intro if there is one, otherwise a body.
    public mutating func first() -> AudioSegment? {
        if let intro, !startedIntro {
            startedIntro = true
            return intro
        }
        return nextBody()
    }

    /// Next body segment. Loops forever; never repeats the previous body when there are two or more.
    public mutating func nextBody() -> AudioSegment? {
        guard !bodies.isEmpty else { return nil }
        if bodies.count == 1 { return bodies[0] }
        if bag.isEmpty {
            bag = shuffle(Array(bodies.indices))
            if bag.first == lastBody { bag.swapAt(0, bag.count - 1) }
        }
        let index = bag.removeFirst()
        lastBody = index
        return bodies[index]
    }

    /// Unique audio in the set, for download-size estimates (≈ 1.2 MB per minute at 160 kb/s).
    public var uniqueSeconds: Double {
        (intro?.durationSec ?? 0) + bodies.reduce(0) { $0 + $1.durationSec } + (outro?.durationSec ?? 0)
    }
}

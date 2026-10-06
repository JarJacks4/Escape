import XCTest
@testable import escape_soundscapes
@available(iOS 17.0, *)
final class LucilleClientTests: XCTestCase {
    final class Stub: URLProtocol {
        nonisolated(unsafe) static var seen: [URLRequest] = []
        override class func canInit(with request: URLRequest) -> Bool { true }
        override class func canonicalRequest(for request: URLRequest) -> URLRequest { request }
        override func startLoading() {
            Stub.seen.append(request)
            let body: String
            switch request.url!.path {
            case let p where p.hasSuffix("/start"): body = #"{"session_id":"s9"}"#
            case let p where p.contains("/recommend/"): body = #"{"user_id":"u 1","detected_emotion":"anxious","recommendations":[{"soundscape_id":"a","title":"A"}]}"#
            default: body = #"{"soundscapes":[{"soundscape_id":"nature_rain","category":"nature","title":"Rain","duration_seconds":600,"target_contexts":["sleep"],"audio_url":"https://x/y.mp3"}]}"#
            }
            let r = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            client?.urlProtocol(self, didReceive: r, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: Data(body.utf8))
            client?.urlProtocolDidFinishLoading(self)
        }
        override func stopLoading() {}
    }
    func testPathsAndMapping() async throws {
        let cfg = URLSessionConfiguration.ephemeral; cfg.protocolClasses = [Stub.self]
        let c = LucilleSoundscapesClient(session: URLSession(configuration: cfg), userId: { "u 1" })
        let list = try await c.soundscapes(category: "nature")
        XCTAssertEqual(Stub.seen.last?.url?.absoluteString, "https://lucille-861854898360.us-central1.run.app/soundscapes?category=nature")
        XCTAssertEqual(list.first?.asComposition(client: c).mode, .sleep)
        let rec = try await c.recommended(emotion: "anxious")
        XCTAssertEqual(rec.recommendations.count, 1)
        XCTAssertEqual(Stub.seen.last?.url?.path, "/soundscapes/recommend/u 1")
        XCTAssertTrue(Stub.seen.last!.url!.absoluteString.contains("/recommend/u%201?emotion=anxious"))
        let sid = try await c.start("nature_rain")
        XCTAssertEqual(sid, "s9")
        XCTAssertEqual(Stub.seen.last?.httpMethod, "POST")
        XCTAssertEqual(c.audioURL("nature_rain").absoluteString, "https://lucille-861854898360.us-central1.run.app/soundscapes/nature_rain/audio")
    }
}

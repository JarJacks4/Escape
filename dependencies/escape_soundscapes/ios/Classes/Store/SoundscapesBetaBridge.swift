import Foundation

/// Hooks the host app sets for the mock-backed beta.
@available(iOS 17.0, *)
public enum SoundscapesBetaBridge {
    /// Set by EscapeSoundscapesPlugin on open: forwards beta feedback to Flutter, which writes it to
    /// Firestore. Nil in previews and tests, where feedback is only validated.
    nonisolated(unsafe) public static var sendFeedback: (([String: Any]) async throws -> Void)?

    /// Set by EscapeSoundscapesPlugin: hands a Lucille memory to Flutter, which saves it with the
    /// person's consent (POST /users/{uid}/memories). Nil in previews and tests.
    nonisolated(unsafe) public static var saveMemory: (([String: Any]) -> Void)?

    /// Set by EscapeSoundscapesPlugin: tells Flutter a Mood Scan was saved, so the app's own mood
    /// (v6 Home, palette, suggestions) follows the scan. Nil in previews and tests.
    nonisolated(unsafe) public static var moodScanned: (([String: Any]) -> Void)?

    /// One plain sentence about what the person just did, e.g. "Listened to Slow Bloom (Calm)
    /// for about 12 minutes."
    public static func remember(_ text: String, kind: String, tags: [String] = [], importance: Int = 5) {
        saveMemory?(["text": text, "kind": kind, "tags": tags, "importance": importance])
    }
}

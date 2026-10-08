import Foundation

/// Hooks the host app sets for the mock-backed beta.
@available(iOS 17.0, *)
public enum SoundscapesBetaBridge {
    /// Set by EscapeSoundscapesPlugin on open: forwards beta feedback to Flutter, which writes it to
    /// Firestore. Nil in previews and tests, where feedback is only validated.
    nonisolated(unsafe) public static var sendFeedback: (([String: Any]) async throws -> Void)?
}

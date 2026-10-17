import Foundation

/// Switches for parts of Soundscapes that aren't backed by the live Lucille API yet.
/// Off in this release, so people never see sample content, a purchase flow that can't
/// complete, or a feedback form that goes nowhere. Turn one on when its backend ships.
public enum SoundscapesFeatures {
    /// Journeys (multi-phase sessions). Content and playback still come from the bundled seed.
    public static let journeys = false
    /// Premium plans and locked modes. No StoreKit / RevenueCat handler is set in the app yet.
    public static let purchases = false
    /// The beta feedback card after a session. Not sent anywhere yet.
    public static let betaFeedback = false
}

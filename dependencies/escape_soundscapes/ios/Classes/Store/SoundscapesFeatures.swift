import Foundation

/// Switches for parts of Soundscapes that aren't backed by the live Lucille API yet.
/// Off in this release, so people never see sample content, a purchase flow that can't
/// complete, or a feedback form that goes nowhere. Turn one on when its backend ships.
public enum SoundscapesFeatures {
    /// Journeys (timed multi-phase sessions). The journey plan comes from the bundled seed; the
    /// sound is a Lucille catalog track picked for the journey's mode and energy.
    public static let journeys = true
    /// Premium plans and locked modes. No StoreKit / RevenueCat handler is set in the app yet.
    public static let purchases = false
    /// The beta feedback card after a session. Not sent anywhere yet.
    public static let betaFeedback = false
}

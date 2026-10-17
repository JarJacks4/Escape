import SwiftUI

/// Screen.moodScan: the Mood & Energy Scan flow, wired to the store and the host app.
@available(iOS 17.0, *)
struct MoodScanScreen: View {
    @Environment(AppStore.self) private var store

    var body: some View {
        ScanFlowView(
            coins: 0,
            moodBg: ScanVisuals.url(ScanVisuals.moodBg),
            moodBgNight: ScanVisuals.url(ScanVisuals.moodBgNight),
            energyBg: ScanVisuals.url(ScanVisuals.energyBg),
            energyBgNight: ScanVisuals.url(ScanVisuals.energyBgNight),
            isNight: ScanVisuals.isNight(),
            host: scanHost)
    }

    private var scanHost: ScanHost {
        let store = store
        var h = ScanHost()
        h.haptic = { soft in Task { @MainActor in store.host.haptic(soft ? .light : .medium) } }
        h.open = { link in Task { @MainActor in await store.openScanLink(link) } }
        h.playSoundscape = { mode in Task { @MainActor in await store.play(mode: mode) } }
        h.close = { Task { @MainActor in store.closeMoodScan() } }
        h.saveCheckIn = { reading, words in Task { @MainActor in store.saveMoodScan(reading, words: words) } }
        h.submitCheckIn = { reading, words in await store.submitMoodScan(reading, words: words) }
        h.loadCoins = { await store.loadLifetimeCoins() }
        h.grantMoodConsent = { await store.grantMoodConsent() }
        return h
    }
}

/// Scan background loops in Firebase Storage (visuals bucket, public read) and the
/// placeholders this release uses until the backend has coins.
@available(iOS 17.0, *)
enum ScanVisuals {
    static let folder = "visuals/scan/"
    static let moodBg = "escape_scan_mood_bg_v1_720_hevc.mp4"
    static let moodBgNight = "escape_scan_mood_bg_v1_night_720_hevc.mp4"
    static let energyBg = "escape_scan_energy_bg_v1_720_hevc.mp4"
    static let energyBgNight = "escape_scan_energy_bg_v1_night_720_hevc.mp4"


    static func url(_ file: String) -> URL {
        let allowed = CharacterSet.alphanumerics.union(CharacterSet(charactersIn: "-._~"))
        let path = (folder + file).addingPercentEncoding(withAllowedCharacters: allowed) ?? file
        return URL(string: OrbLoops.storageBase + path + "?alt=media")!
    }

    /// Night backgrounds from 20:00 to 06:00 local (the handoff's fallback when there's no sunset).
    static func isNight(_ date: Date = Date()) -> Bool {
        let hour = Calendar.current.component(.hour, from: date)
        return hour >= 20 || hour < 6
    }
}

/// The consent purpose the server last asked for (e.g. "camera_scan"); empty when none.
@MainActor private var pendingConsent = ""

@available(iOS 17.0, *)
extension AppStore {
    /// Home "Mood" tile, and the host app's Mood Scan entry points.
    public func openMoodScan() {
        setSheet(nil)
        setScreen(.moodScan)
    }

    /// Close: back to the host page if the host opened the scan, else Soundscapes Home.
    public func closeMoodScan() {
        if scanOpenedFromHost, let close = onCloseToHost {
            scanOpenedFromHost = false
            close()
            return
        }
        setScreen(hasOnboarded ? .soundscapesHome : .onboardingSoundscapes)
    }

    /// Saves the result as a Lucille v1 mood check-in (fire and forget).
    public func saveMoodScan(_ reading: MoodReading, words: String) {
        Task { _ = await submitMoodScan(reading, words: words) }
    }


    /// Saves the result as a Lucille v1 mood check-in, with the camera pulse when it was really
    /// measured. Returns the Escape Coins the server awarded, or nil if it couldn't save.
    public func submitMoodScan(_ reading: MoodReading, words: String) async -> ScanSaveResult {
        guard let lucille = api as? LucilleBackedAPI else { return .failed }
        let text = words.trimmingCharacters(in: .whitespacesAndNewlines)
        do {
            let coins = try await lucille.checkIn(word: reading.word, valence: reading.valence, energy: reading.energy,
                                                  text: text.isEmpty ? nil : text,
                                                  bpm: reading.pulseMeasured ? reading.bpm : nil)
            return .saved(coins: coins)
        } catch APIError.server(_, let code, let message) where code.hasPrefix("consent_required") || message.contains("consent_required") {
            // The v1 API returns "lucille_403" with the consent details nested in the message:
            // {"code":"consent_required","purpose":"wellbeing_data",...}
            if code.hasPrefix("consent_required:") {
                pendingConsent = String(code.dropFirst("consent_required:".count))
            } else {
                let parts = message.components(separatedBy: "\"purpose\":\"")
                pendingConsent = parts.count > 1 ? (parts[1].components(separatedBy: "\"").first ?? "wellbeing_data") : "wellbeing_data"
            }
            return .needsConsent
        } catch {
            print("[Scan] save failed: \(error)")
            return .failed
        }
    }

    /// Records the person's OK to store mood check-ins (GDPR purpose `wellbeing_data`).
    public func grantMoodConsent() async -> Bool {
        guard let lucille = api as? LucilleBackedAPI else { return false }
        // Storing check-ins needs `wellbeing_data`; a measured pulse also needs `camera_scan`.
        var flags = ["wellbeing_data": true, "camera_scan": true]
        if !pendingConsent.isEmpty { flags[pendingConsent] = true }
        return (try? await lucille.grantConsents(flags)) != nil
    }

    /// The person's lifetime Escape Coins from Lucille v1 (nil offline / on the mock).
    public func loadLifetimeCoins() async -> Int? {
        guard let lucille = api as? LucilleBackedAPI else { return nil }
        return try? await lucille.lifetimeCoins()
    }

    /// Lucille's suggestions on the scan result ("escape://…" deeplinks from ScanModels).
    public func openScanLink(_ link: String) async {
        scanOpenedFromHost = false
        let parts = link.replacingOccurrences(of: "escape://", with: "")
            .split(separator: "/").map(String.init)
        let arg = parts.dropFirst().first ?? ""
        switch parts.first ?? "" {
        case "lucille": selectTab(.lucille)
        case "journal": onOpenHostRoute?("Journal")
        case "mode":
            let mode = ModeId(loose: arg) ?? .calm
            if mode == .move, let open = onOpenHostRoute { open("Body"); return }
            await play(mode: mode)
        case "realms": await play(mode: .realms)
        case "sleep": setScreen(.sleepSetup)
        // Circles and Journeys still run on sample data, so their links play a soundscape instead.
        case "circles": await play(mode: .calm)
        case "journey": await play(mode: arg.contains("work") || arg.contains("exam") ? .focus : .calm)
        default: await play(mode: .calm)   // breathwork: a calm soundscape until it lands in the module
        }
    }
}

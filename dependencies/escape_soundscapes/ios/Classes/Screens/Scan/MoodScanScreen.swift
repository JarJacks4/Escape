import SwiftUI

/// Screen.moodScan: the Mood & Energy Scan flow, wired to the store and the host app.
@available(iOS 17.0, *)
struct MoodScanScreen: View {
    @Environment(AppStore.self) private var store

    var body: some View {
        ScanFlowView(
            coins: ScanVisuals.coinsPlaceholder,
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

    /// Local balance until the backend has a coins field (the prototype's 975, so the
    /// first scan's +25 unlocks the Energy Scan).
    static let coinsPlaceholder = 975

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

    /// Saves the result as a Lucille v1 mood check-in. The pulse is simulated for now, so it isn't sent.
    public func saveMoodScan(_ reading: MoodReading, words: String) {
        guard let lucille = api as? LucilleBackedAPI else { return }
        let text = words.trimmingCharacters(in: .whitespacesAndNewlines)
        Task {
            try? await lucille.checkIn(word: reading.word, valence: reading.valence,
                                       energy: reading.energy, text: text.isEmpty ? nil : text)
        }
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
        case "mode": await play(mode: ModeId(loose: arg) ?? .calm)
        case "realms": await play(mode: .realms)
        case "sleep": setScreen(.sleepSetup)
        case "circles": await openCircles()
        case "journey":
            setScreen(.soundscapesHome)
            openJourney(arg)
        default: await play(mode: .calm)   // breathwork: a calm soundscape until it lands in the module
        }
    }
}

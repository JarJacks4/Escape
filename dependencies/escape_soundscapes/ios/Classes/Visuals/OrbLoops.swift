import Foundation

/// Escape Mood Orbs v3: 4 modes x a 3x3 Mood Field (energy 15/50/85 up, texture 15/50/85 right).
/// Lucille soundscapes carry no visual, so the app picks the loop itself: the nearest of the
/// 9 cells for the current mode and Mood Field. Videos stream from Firebase Storage
/// (visuals/v3/, public read, ?alt=media); posters and the four e50_t50 offline loops are
/// bundled in Resources/Orbs.
@available(iOS 17.0, *)
public enum OrbLoops {
    static let storageBase = "https://firebasestorage.googleapis.com/v0/b/escape-self-care-505618.firebasestorage.app/o/"
    static let folder = "visuals/v3/"
    static let levels = [15, 50, 85]

    /// Dedicated loops exist for focus, calm, sleep and picks; other modes borrow a grid.
    static func grid(_ m: ModeId) -> String {
        switch m {
        case .focus, .move: return "focus"
        case .calm, .noise: return "calm"
        case .sleep: return "sleep"
        default: return "picks"  // picks, realms and anything new
        }
    }

    static func level(_ v: Double) -> Int {
        levels.min { abs(Double($0) / 100 - v) < abs(Double($1) / 100 - v) } ?? 50
    }

    static func name(_ grid: String, _ e: Int, _ t: Int) -> String { "escape_\(grid)_e\(e)_t\(t)_v3" }

    static func remote(_ file: String) -> URL {
        let allowed = CharacterSet.alphanumerics.union(CharacterSet(charactersIn: "-._~"))
        let path = (folder + file).addingPercentEncoding(withAllowedCharacters: allowed) ?? file
        return URL(string: storageBase + path + "?alt=media")!
    }

    static func bundled(_ file: String) -> URL? {
        let base = (file as NSString).deletingPathExtension, ext = (file as NSString).pathExtension
        return Bundle.soundscapes.url(forResource: base, withExtension: ext)
            ?? Bundle.soundscapes.url(forResource: base, withExtension: ext, subdirectory: "Orbs")
    }

    static func preset(_ grid: String, _ e: Int, _ t: Int) -> VisualPreset {
        let n = name(grid, e, t)
        return VisualPreset(id: n, mode: ModeId(rawValue: grid) ?? .picks, name: n,
                            videoH264: remote("\(n)_720_h264.mp4"), videoHevc: remote("\(n)_720_hevc.mp4"),
                            poster: bundled("\(n)_poster.webp") ?? remote("\(n)_poster.webp"),
                            loopSec: 20, energy: Double(e) / 100, texture: Double(t) / 100)
    }

    /// Nearest of the 9 cells. Same cell -> same URL, so the player only switches when the cell changes.
    public static func nearest(mode: ModeId, field: MoodField) -> VisualPreset {
        preset(grid(mode), level(field.energy), level(field.texture))
    }

    /// The mode's bundled 540p centre loop, used when the streamed loop can't load (offline).
    public static func offlineURL(for p: VisualPreset) -> URL? {
        bundled("escape_\(grid(p.mode))_e50_t50_v3_540_offline.mp4")
    }

    /// Warms the cache for the up/down/left/right cells, so a switch doesn't show the poster first.
    public static func prefetchNeighbours(of p: VisualPreset) {
        let g = grid(p.mode)
        guard let ei = levels.firstIndex(of: level(p.energy)), let ti = levels.firstIndex(of: level(p.texture)) else { return }
        let cells = [(ei - 1, ti), (ei + 1, ti), (ei, ti - 1), (ei, ti + 1)].filter { levels.indices.contains($0.0) && levels.indices.contains($0.1) }
        for (e, t) in cells {
            let url = preset(g, levels[e], levels[t]).preferredVideoURL
            Task(priority: .background) { _ = try? await VideoCache.shared.localURL(for: url) }
        }
    }
}

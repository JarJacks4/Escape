import SwiftUI

// Ported from SupportingScreens.tsx: Playlist ("Your Playlist").
//
// Data: `store.playlist` (GET /v1/playlists/{id}, loaded by `store.openPlaylist(id)`). While it is
// nil the Figma literals are shown. Track tap plays that track; the heart likes it (optimistic,
// rolled back by the store on failure); the playing row shows the equalizer bars.

@available(iOS 17.0, *)
struct PlaylistView: View {
    @Environment(AppStore.self) private var store
    @State private var shuffleOn = false

    private var data: Playlist { store.playlist ?? Self.figmaPlaylist }

    var body: some View {
        VStack(spacing: 0) {
            SubHeader(title: "Your Playlist") { store.setScreen(.soundscapesHome) }
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
                    PlaylistSummaryCard(playlist: data)
                    actions
                    sectionLabel("Tracks")
                    trackList
                }
                .padding(.top, 8)
                .padding(.horizontal, 24)
                .padding(.bottom, 96 + (store.showsMiniPlayer ? 72 : 0))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Esc.night.ignoresSafeArea())
    }

    // MARK: Actions

    private var actions: some View {
        HStack(spacing: 12) {
            PrimaryButton(label: "Play all") { playAll() }
            shuffleButton
        }
        .padding(.top, 16)
    }

    private var shuffleButton: some View {
        Button { toggleShuffle() } label: {
            Icon(.shuffle, size: 22, color: shuffleOn ? Esc.lilac : Esc.mist)
                .frame(width: 56, height: 56)
                .background(shuffleOn ? Color(hex: 0xB9A3F0, opacity: 0.18) : Color.clear, in: Circle())
                .overlay(Circle().strokeBorder(shuffleOn ? Color(hex: 0xB9A3F0, opacity: 0.5) : Color(hex: 0xE6EAF4, opacity: 0.2), lineWidth: 1))
                .contentShape(Circle())
        }
        .buttonStyle(EscPressStyle())
        .animation(.cssEase(0.2), value: shuffleOn)
        .accessibilityLabel("Shuffle")
        .accessibilityValue(shuffleOn ? "On" : "Off")
    }

    /// "Play all": first track, or a random one while shuffle is on.
    private func playAll() {
        if shuffleOn, let t = data.tracks.randomElement() {
            Task { await store.play(t) }
        } else {
            Task { await store.playPlaylist() }
        }
    }

    /// Shuffle toggles (as in the Figma); turning it on starts a random track.
    private func toggleShuffle() {
        shuffleOn.toggle()
        guard shuffleOn, let t = data.tracks.randomElement() else { return }
        Task { await store.play(t) }
    }

    // MARK: Tracks

    private var trackList: some View {
        VStack(spacing: 0) {
            ForEach(Array(data.tracks.enumerated()), id: \.element.id) { i, t in
                TrackRow(index: i + 1, track: t, isPlaying: isPlaying(t),
                         onPlay: { Task { await store.play(t) } },
                         onLike: { Task { await store.toggleLike(t) } })
            }
        }
    }

    private func isPlaying(_ t: Track) -> Bool {
        store.isPlaying && store.nowPlaying?.compositionId == t.compositionId
    }

    private func sectionLabel(_ text: String) -> some View {
        Text(text)
            .escLabel()
            .padding(.top, 28)
            .padding(.bottom, 12)
            .accessibilityAddTraits(.isHeader)
    }

    // MARK: Figma fallback (shown until GET /v1/playlists/{id} answers)

    private static let figmaPlaylist = Playlist(
        id: "evening-wind-down",
        title: "Evening Wind-Down",
        summary: "5 soundscapes · 1 hr 49 min",
        credit: "Composed by Lucille",
        artGradient: GradientSpec(colors: ["#B9A3F0", "#39519F", "#EF7702"], stops: [0, 0.55, 1.3], angle: 135),
        tracks: [
            Track(id: "p1", compositionId: "mine_1", title: "Cabin Rain, 11 PM", mode: "Sleep", duration: "32 min",
                  gradient: GradientSpec(colors: ["#164395", "#05081A"]), liked: true),
            Track(id: "p2", compositionId: "mine_2", title: "Morning Clarity", mode: "Focus", duration: "45 min",
                  gradient: GradientSpec(colors: ["#EF7702", "#8E7CD9"]), liked: false),
            Track(id: "p3", compositionId: "daily_drop_thu", title: "Thursday Drizzle", mode: "Calm", duration: "Endless",
                  gradient: GradientSpec(colors: ["#39519F", "#101E43"]), liked: false),
            Track(id: "p4", compositionId: "move_golden_hour_walk", title: "Golden Hour Walk", mode: "Energize", duration: "20 min",
                  gradient: GradientSpec(colors: ["#F08A1D", "#B9A3F0"]), liked: false),
            Track(id: "p5", compositionId: "calm_low_tide", title: "Low Tide Breathing", mode: "Calm", duration: "12 min",
                  gradient: GradientSpec(colors: ["#8E7CD9", "#164395"]), liked: false),
        ]
    )
}

// MARK: - Summary card

@available(iOS 17.0, *)
private struct PlaylistSummaryCard: View {
    let playlist: Playlist

    var body: some View {
        HStack(spacing: 16) {
            RoundedRectangle(cornerRadius: 20)
                .fill(cssLinear(playlist.artGradient))
                .frame(width: 88, height: 88)
                .overlay(Icon(.soundwave, size: 34, color: Esc.mist))
                .accessibilityHidden(true)
            VStack(alignment: .leading, spacing: 0) {
                Text(playlist.title)
                    .font(EscFont.display(22))
                    .foregroundStyle(Esc.mist)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom, 6)
                    .accessibilityAddTraits(.isHeader)
                Text(playlist.summary)
                    .font(EscFont.ui(12))
                    .foregroundStyle(Esc.haze)
                    .padding(.bottom, 8)
                AITagPill(label: playlist.credit)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(17) // 16 px + 1 px border (border-box)
        .background(cardFill, in: .rect(cornerRadius: 24))
        .overlay(RoundedRectangle(cornerRadius: 24).strokeBorder(Color(hex: 0xE6EAF4, opacity: 0.1), lineWidth: 1))
    }

    /// linear-gradient(160deg, rgba(57,81,159,0.4) 0%, rgba(24,34,74,0.9) 100%)
    private var cardFill: LinearGradient {
        LinearGradient.css(160, [Color(hex: 0x39519F, opacity: 0.4), Color(hex: 0x18224A, opacity: 0.9)])
    }

    /// `GradientSpec.linear`, but a last stop past 100% (the art's `#EF7702 130%`) is cut at 100% the
    /// way CSS does it — with the colour interpolated at 100% — instead of being clamped to 100%.
    private func cssLinear(_ spec: GradientSpec) -> LinearGradient {
        guard let stops = spec.stops, stops.count == spec.colors.count, stops.count >= 2,
              let last = stops.last, last > 1,
              let a = rgb(spec.colors[stops.count - 2]), let b = rgb(spec.colors[stops.count - 1]) else {
            return spec.linear
        }
        let prev = stops[stops.count - 2]
        let t = prev < last ? (1 - prev) / (last - prev) : 1
        let mid = Color(.sRGB, red: a.r + (b.r - a.r) * t, green: a.g + (b.g - a.g) * t, blue: a.b + (b.b - a.b) * t, opacity: 1)
        let colors = spec.colors.dropLast().map { Color(css: $0) } + [mid]
        return LinearGradient.css(spec.angle, colors, stops: Array(stops.dropLast()) + [1])
    }

    /// "#RRGGBB" → 0…1 components (nil for anything else).
    private func rgb(_ css: String) -> (r: Double, g: Double, b: Double)? {
        let hex = css.hasPrefix("#") ? String(css.dropFirst()) : css
        guard hex.count == 6, let v = UInt32(hex, radix: 16) else { return nil }
        return (Double((v >> 16) & 0xFF) / 255, Double((v >> 8) & 0xFF) / 255, Double(v & 0xFF) / 255)
    }
}

// MARK: - Track row

@available(iOS 17.0, *)
private struct TrackRow: View {
    let index: Int
    let track: Track
    let isPlaying: Bool
    let onPlay: () -> Void
    let onLike: () -> Void

    private var liked: Bool { track.liked ?? false }

    var body: some View {
        HStack(spacing: 14) {
            Button(action: onPlay) { rowLabel }
                .buttonStyle(EscPressStyle())
                .accessibilityLabel("\(track.title), \(track.mode), \(track.duration)")
                .accessibilityValue(isPlaying ? "Playing" : "")
                .accessibilityHint("Plays this soundscape")
            likeButton
        }
        .padding(.vertical, 12)
        .overlay(alignment: .bottom) {
            Rectangle().fill(Esc.hairlineSoft).frame(height: 1)
        }
    }

    private var rowLabel: some View {
        HStack(spacing: 14) {
            ZStack {
                if isPlaying {
                    EqualizerBars()
                } else {
                    Text("\(index)")
                        .font(EscFont.ui(12))
                        .foregroundStyle(Esc.haze)
                        .opacity(0.6)
                }
            }
            .frame(width: 14)
            RoundedRectangle(cornerRadius: 12)
                .fill(track.gradient.linear)
                .frame(width: 48, height: 48)
            VStack(alignment: .leading, spacing: 2) {
                Text(track.title)
                    .font(EscFont.ui(15, .medium))
                    .foregroundStyle(isPlaying ? Esc.lilac : Esc.mist)
                Text("\(track.mode) · \(track.duration)")
                    .font(EscFont.ui(12))
                    .foregroundStyle(Esc.haze)
            }
            .lineLimit(1)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .contentShape(Rectangle())
    }

    private var likeButton: some View {
        Button(action: onLike) {
            Icon(.heart, size: 20, color: liked ? Esc.ember : Esc.haze)
                .opacity(liked ? 1 : 0.6)
                .padding(8)
                .contentShape(Rectangle().inset(by: -4))
        }
        .buttonStyle(EscPressStyle())
        .animation(.cssEase(0.2), value: liked)
        .accessibilityLabel("Favorite")
        .accessibilityValue(liked ? "On" : "Off")
        .accessibilityAddTraits(liked ? .isSelected : [])
    }
}

// MARK: - AI tag (`aiTag` in the TSX)

@available(iOS 17.0, *)
private struct AITagPill: View {
    let label: String

    var body: some View {
        Text(label)
            .font(EscFont.ui(10, .semibold))
            .tracking(10 * 0.06)
            .foregroundStyle(Esc.lilac)
            .lineLimit(1)
            .padding(.vertical, 3)
            .padding(.horizontal, 9)
            .background(Color(hex: 0xB9A3F0, opacity: 0.14), in: Capsule())
            .overlay(Capsule().strokeBorder(Color(hex: 0xB9A3F0, opacity: 0.28), lineWidth: 1))
            .fixedSize()
    }
}

// MARK: - Previews





import SwiftUI

/// Floating button (lower right) on Library and Playlist that opens the list of playlists.
@available(iOS 17.0, *)
struct PlaylistsFAB: View {
    @Environment(AppStore.self) private var store
    @State private var open = false

    var body: some View {
        Button { open = true } label: {
            Image(systemName: "music.note.list")
                .font(.system(size: 22, weight: .semibold))
                .foregroundStyle(.white)
                .frame(width: 56, height: 56)
                .background(Circle().fill(Esc.ember))
                .shadow(color: .black.opacity(0.35), radius: 10, y: 4)
        }
        .buttonStyle(EscPressStyle())
        .accessibilityLabel("Playlists")
        .accessibilityHint("Opens your playlists")
        .padding(.trailing, 24)
        .padding(.bottom, 24 + (store.showsMiniPlayer ? 72 : 0))
        .sheet(isPresented: $open) {
            PlaylistsPickerSheet()
                .environment(store)
                .presentationDetents([.medium, .large])
        }
    }
}

@available(iOS 17.0, *)
struct PlaylistsPickerSheet: View {
    @Environment(AppStore.self) private var store
    @Environment(\.dismiss) private var dismiss
    @State private var loaded = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Playlists")
                .font(EscFont.display(26))
                .foregroundStyle(Esc.mist)
                .padding(.top, 24)
                .padding(.horizontal, 24)
                .accessibilityAddTraits(.isHeader)
            Text("Collections from Lucille's catalog. Tap one to listen.")
                .font(EscFont.ui(13))
                .foregroundStyle(Esc.haze)
                .padding(.horizontal, 24)
                .padding(.top, 4)
                .padding(.bottom, 12)
            if store.playlistSummaries.isEmpty {
                Text(loaded ? "Playlists aren't available right now. Try again in a moment." : "Loading playlists…")
                    .font(EscFont.ui(14))
                    .foregroundStyle(Esc.haze)
                    .padding(.horizontal, 24)
                    .padding(.top, 16)
                Spacer()
            } else {
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(store.playlistSummaries) { p in
                            Button {
                                dismiss()
                                Task { await store.openPlaylist(p.id) }
                            } label: { row(p) }
                            .buttonStyle(EscPressStyle())
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 24)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Esc.night.ignoresSafeArea())
        .task {
            await store.loadPlaylists()
            loaded = true
        }
    }

    private func row(_ p: PlaylistSummary) -> some View {
        HStack(spacing: 14) {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(LinearGradient(colors: p.artGradient.colors.map { Color(css: $0) },
                                     startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 52, height: 52)
            VStack(alignment: .leading, spacing: 2) {
                Text(p.title).font(EscFont.ui(16, .semibold)).foregroundStyle(Esc.mist)
                Text("\(p.trackCount) tracks · \(p.summary)")
                    .font(EscFont.ui(12)).foregroundStyle(Esc.haze).lineLimit(1)
            }
            Spacer(minLength: 0)
            Image(systemName: "chevron.right").foregroundStyle(Esc.haze)
        }
        .padding(12)
        .frame(maxWidth: .infinity)
        .background(RoundedRectangle(cornerRadius: 16, style: .continuous).fill(Color.white.opacity(0.06)))
        .accessibilityElement(children: .combine)
    }
}

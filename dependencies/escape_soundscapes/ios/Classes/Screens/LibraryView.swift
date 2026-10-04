import SwiftUI

// Ported from SupportingScreens.tsx `Library`.
// Header (← Back · Library) → Saved / Downloads / Memories pill tabs → rows of saved soundscapes.
// Rows come from `store.libraryItems` (GET /v1/library?filter=…); tabs from `content.library.tabs`.

@available(iOS 17.0, *)
struct LibraryView: View {
    @Environment(AppStore.self) private var store
    /// The filter whose results have arrived (so the empty state doesn't flash while loading).
    @State private var loadedFilter: LibraryFilter?

    var body: some View {
        VStack(spacing: 0) {
            header
            LibraryTabs(tabs: tabTitles, active: activeTitle) { select($0) }
                .padding(.horizontal, 24)
            list
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Esc.night.ignoresSafeArea())
        .task {
            let filter = store.libraryFilter
            await store.loadLibrary(filter)
            loadedFilter = filter
        }
    }

    // MARK: Header

    private var header: some View {
        HStack(spacing: 0) {
            Button { store.setScreen(.soundscapesHome) } label: {
                Text("← Back")
                    .font(EscFont.ui(15))
                    .foregroundStyle(Esc.haze)
                    .frame(minHeight: 44)
                    .contentShape(Rectangle())
            }
            .buttonStyle(EscPressStyle())
            .accessibilityLabel("Back")

            Text("Library")
                .font(EscFont.display(22))
                .foregroundStyle(Esc.mist)
                .frame(maxWidth: .infinity)
                .accessibilityAddTraits(.isHeader)

            Color.clear.frame(width: 60, height: 1)
        }
        .padding(.horizontal, 24)
        .frame(height: 52)
    }

    // MARK: Tabs ↔ LibraryFilter

    private var tabTitles: [String] {
        let tabs = store.content?.library.tabs ?? []
        return tabs.count == LibraryFilter.allCases.count ? tabs : LibraryFilter.allCases.map(\.title)
    }

    private var activeTitle: String {
        let i = LibraryFilter.allCases.firstIndex(of: store.libraryFilter) ?? 0
        return tabTitles.indices.contains(i) ? tabTitles[i] : store.libraryFilter.title
    }

    private func select(_ title: String) {
        guard let i = tabTitles.firstIndex(of: title), LibraryFilter.allCases.indices.contains(i) else { return }
        let filter = LibraryFilter.allCases[i]
        guard filter != store.libraryFilter else { return }
        Task {
            await store.loadLibrary(filter)
            loadedFilter = filter
        }
    }

    // MARK: List

    private var list: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 0) {
                if store.libraryFilter == .saved {
                    playlistRow
                }
                ForEach(store.libraryItems) { item in
                    itemRow(item)
                }
                if store.libraryItems.isEmpty && loadedFilter == store.libraryFilter {
                    emptyState
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 16)
            .padding(.bottom, 16 + Esc.Metrics.navHeight + (store.showsMiniPlayer ? Esc.Metrics.navHeight : 0))
        }
    }

    private func itemRow(_ item: LibraryItem) -> some View {
        LibraryRow(title: item.title,
                   meta: "\(item.mode) · \(item.duration)",
                   offline: item.offline,
                   gradient: item.gradient,
                   onPress: { Task { await store.play(item) } }) {
            Menu {
                itemActions(item)
            } label: {
                Icon(.more, size: 20, color: Esc.haze)
                    .padding(8)
                    .contentShape(Rectangle())
            }
            .menuIndicator(.hidden)
            .tint(Esc.haze)
            .accessibilityLabel("More options for \(item.title)")
        }
        .contextMenu { itemActions(item) }
    }

    /// The TSX "more" button had no handler; it now holds the offline toggle (a 402 opens
    /// PremiumSheet via the store) and Remove (the list is a ScrollView, so no swipe-to-delete).
    @ViewBuilder
    private func itemActions(_ item: LibraryItem) -> some View {
        Button {
            Task { await store.toggleOffline(item) }
        } label: {
            if item.offline {
                Label("Remove download", systemImage: "arrow.down.circle.fill")
            } else {
                Label("Download for offline", systemImage: "arrow.down.circle")
            }
        }
        Button(role: .destructive) {
            Task { await store.remove(item) }
        } label: {
            Label("Remove", systemImage: "trash")
        }
    }

    /// Not in the Figma Library: the entry point to the Playlist screen, styled as a row.
    @ViewBuilder
    private var playlistRow: some View {
        let playlist = store.playlist?.id == Self.windDownId ? store.playlist : nil
        let count = playlist?.tracks.count ?? 5
        LibraryRow(title: playlist?.title ?? "Evening Wind-Down",
                   meta: "Playlist · \(count) soundscapes",
                   offline: false,
                   gradient: playlist?.artGradient ?? Self.windDownGradient,
                   onPress: { Task { await store.openPlaylist(Self.windDownId) } }) {
            Icon(.chevronRight, size: 20, color: Esc.haze)
                .padding(8)
        }
    }

    private var emptyState: some View {
        VStack(spacing: 6) {
            Text(emptyCopy.title)
                .font(EscFont.display(20))
                .foregroundStyle(Esc.mist)
            Text(emptyCopy.body)
                .font(EscFont.ui(14))
                .foregroundStyle(Esc.haze)
                .multilineTextAlignment(.center)
                .lineSpacing(14 * 0.5)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 48)
        .accessibilityElement(children: .combine)
    }

    private var emptyCopy: (title: String, body: String) {
        switch store.libraryFilter {
        case .saved:
            return (title: "Nothing saved yet", body: "Tap the bookmark on Now Playing to keep a soundscape here.")
        case .downloads:
            return (title: "No downloads yet", body: "Download a soundscape to listen without a connection.")
        case .memory:
            return (title: "No memories yet", body: "Save a finished session as a Memory to find it here.")
        }
    }

    private static let windDownId = "evening-wind-down"
    private static let windDownGradient = GradientSpec(colors: ["#B9A3F0", "#39519F", "#EF7702"], stops: [0, 0.55, 1.3], angle: 135)
}

// MARK: - Tabs (the Library's own pill: equal-width tabs, padding 8/24/16 inside a 1px border)

@available(iOS 17.0, *)
private struct LibraryTabs: View {
    let tabs: [String]
    let active: String
    let onChange: (String) -> Void

    var body: some View {
        HStack(spacing: 4) {
            ForEach(tabs, id: \.self) { tab in
                tabButton(tab)
            }
        }
        .padding(EdgeInsets(top: 9, leading: 25, bottom: 17, trailing: 25))
        .background(Esc.pad, in: Capsule())
        .overlay(Capsule().strokeBorder(Color(hex: 0xE6EAF4, opacity: 0.08), lineWidth: 1))
    }

    private func tabButton(_ tab: String) -> some View {
        let selected = tab == active
        return Button { onChange(tab) } label: {
            Text(tab)
                .font(EscFont.ui(13, selected ? .semibold : .regular))
                .foregroundStyle(selected ? Esc.mist : Esc.haze)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
                .frame(maxWidth: .infinity)
                .frame(height: 35.5) // padding 8 + 13px × line-height 1.5
                .background(selected ? Esc.royal : Color.clear, in: Capsule())
                .contentShape(Capsule())
        }
        .buttonStyle(EscPressStyle())
        .accessibilityAddTraits(selected ? .isSelected : [])
    }
}

// MARK: - Row

@available(iOS 17.0, *)
private struct LibraryRow<Trailing: View>: View {
    let title: String
    let meta: String
    let offline: Bool
    let gradient: GradientSpec
    let onPress: () -> Void
    let trailing: Trailing

    init(title: String, meta: String, offline: Bool, gradient: GradientSpec, onPress: @escaping () -> Void,
         @ViewBuilder trailing: () -> Trailing) {
        self.title = title
        self.meta = meta
        self.offline = offline
        self.gradient = gradient
        self.onPress = onPress
        self.trailing = trailing()
    }

    var body: some View {
        HStack(spacing: 14) {
            Button(action: onPress) {
                HStack(spacing: 14) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(gradient.linear)
                        .frame(width: 52, height: 52)
                    text
                }
                .contentShape(Rectangle())
            }
            .buttonStyle(EscPressStyle())
            .accessibilityElement(children: .combine)
            .accessibilityAddTraits(.isButton)
            .accessibilityHint("Plays this soundscape")

            trailing
        }
        .padding(.vertical, 14)
        .overlay(alignment: .bottom) {
            Rectangle()
                .fill(Esc.hairlineSoft)
                .frame(height: 1)
        }
    }

    private var text: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(EscFont.ui(15, .medium))
                .foregroundStyle(Esc.mist)
                .lineLimit(1)
            HStack(spacing: 8) {
                Text(meta)
                    .font(EscFont.ui(12))
                    .foregroundStyle(Esc.haze)
                    .lineLimit(1)
                if offline {
                    Text("Offline")
                        .font(EscFont.ui(10, .semibold))
                        .tracking(10 * 0.06)
                        .foregroundStyle(Esc.haze)
                        .padding(.vertical, 2)
                        .padding(.horizontal, 8)
                        .background(Color(hex: 0x39519F, opacity: 0.3), in: Capsule())
                        .fixedSize()
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Previews





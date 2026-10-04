import SwiftUI

// Ported from screens/SupportingScreens.tsx: ModeBrowse.
//
// The page (title, tagline, background, chips label, journeys, cards) is `store.browsePage`, loaded
// for `store.browseMode`. Free Sleep cards open SleepSetup, as in the prototype.

@available(iOS 17.0, *)
struct ModeBrowseView: View {
    @Environment(AppStore.self) private var store

    var body: some View {
        Group {
            if let page = store.browsePage {
                content(page)
            } else {
                loading
            }
        }
        .task(id: store.browseMode) {
            _ = try? await store.loadBrowse(store.browseMode)
        }
    }

    // MARK: Loading

    private var loading: some View {
        VStack(spacing: 0) {
            backButton
                .padding(.top, 8)
                .padding(.horizontal, 24)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            ProgressView()
                .tint(Esc.haze)
            Spacer()
        }
        .background((store.browseMode == .sleep ? Esc.sleepNight : Esc.night).ignoresSafeArea())
    }

    // MARK: Page

    private func content(_ page: BrowsePage) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                backButton
                    .padding(.top, 8)
                    .padding(.horizontal, 24)
                titleBlock(page)
                    .padding(.top, 16)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 4)
                cardsRow(page)
                    .padding(.top, 20)
                journeysBlock(page)
                    .padding(.top, 24)
                    .padding(.horizontal, 24)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 96 + (store.showsMiniPlayer ? 72 : 0))
        }
        .background(Color(css: page.background).ignoresSafeArea())
    }

    private var backButton: some View {
        Button { store.setScreen(.soundscapesHome) } label: {
            Text("← Back")
                .font(EscFont.ui(15))
                .foregroundStyle(Esc.haze)
                .padding(.vertical, 8)
                .frame(minHeight: 44)
                .contentShape(Rectangle())
        }
        .buttonStyle(EscPressStyle())
        .accessibilityLabel("Back")
    }

    private func titleBlock(_ page: BrowsePage) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(page.title)
                .font(EscFont.display(34))
                .foregroundStyle(Esc.mist)
                .accessibilityAddTraits(.isHeader)
            Text(page.tagline)
                .font(EscFont.ui(16))
                .foregroundStyle(Esc.haze)
                .fixedSize(horizontal: false, vertical: true)
        }
    }

    private func cardsRow(_ page: BrowsePage) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(page.cards) { card in
                    SoundscapeCard(title: card.title, description: card.description, posterGradient: card.gradient,
                                   isPremium: card.isPremium, isNew: card.isNew ?? false, seasonal: card.seasonal ?? false) {
                        open(card, in: page)
                    }
                    .accessibilityValue(card.locked ? "Premium, locked" : "")
                }
            }
            .padding(.horizontal, 24)
        }
    }

    private func open(_ card: BrowseCard, in page: BrowsePage) {
        if page.mode == .sleep && !card.locked {
            store.currentMode = .sleep
            store.setScreen(.sleepSetup)
        } else {
            // Locked cards open PremiumSheet inside play(card:).
            Task { await store.play(card: card) }
        }
    }

    private func journeysBlock(_ page: BrowsePage) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(page.chipsLabel)
                .escLabel()
                .accessibilityAddTraits(.isHeader)
            BrowseFlowLayout(spacing: 8) {
                ForEach(Array(page.journeys.enumerated()), id: \.offset) { _, link in
                    journeyChip(link)
                }
            }
        }
    }

    private func journeyChip(_ link: BrowsePage.JourneyLink) -> some View {
        Button {
            if let id = link.journeyId { store.openJourney(id) }
        } label: {
            Text(link.title)
                .font(EscFont.ui(14, .medium))
                .foregroundStyle(Esc.mist)
                .lineLimit(1)
                .fixedSize()
                .padding(.vertical, 11.5)
                .padding(.horizontal, 17.5)
                .background(Esc.card, in: Capsule())
                .overlay(Capsule().strokeBorder(Esc.hairline, lineWidth: 1.5))
                .contentShape(Capsule())
        }
        .buttonStyle(EscPressStyle())
    }
}

// MARK: - Flow layout (CSS flex-wrap)

@available(iOS 17.0, *)
private struct BrowseFlowLayout: Layout {
    var spacing: CGFloat

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let rows = arrange(width: proposal.width ?? .infinity, subviews: subviews)
        let width = rows.map(\.width).max() ?? 0
        let height = rows.reduce(0) { $0 + $1.height } + spacing * CGFloat(max(rows.count - 1, 0))
        return CGSize(width: proposal.width ?? width, height: height)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        var y = bounds.minY
        for row in arrange(width: bounds.width, subviews: subviews) {
            var x = bounds.minX
            for index in row.indices {
                let size = subviews[index].sizeThatFits(.unspecified)
                subviews[index].place(at: CGPoint(x: x, y: y + (row.height - size.height) / 2), proposal: ProposedViewSize(size))
                x += size.width + spacing
            }
            y += row.height + spacing
        }
    }

    private struct Row { var indices: [Int] = []; var width: CGFloat = 0; var height: CGFloat = 0 }

    private func arrange(width: CGFloat, subviews: Subviews) -> [Row] {
        var rows: [Row] = []
        var current = Row()
        for index in subviews.indices {
            let size = subviews[index].sizeThatFits(.unspecified)
            let needed = current.indices.isEmpty ? size.width : current.width + spacing + size.width
            if needed > width, !current.indices.isEmpty {
                rows.append(current)
                current = Row()
            }
            current.width = current.indices.isEmpty ? size.width : current.width + spacing + size.width
            current.height = max(current.height, size.height)
            current.indices.append(index)
        }
        if !current.indices.isEmpty { rows.append(current) }
        return rows
    }
}

// MARK: - Previews





import SwiftUI
import UIKit

// Ported from NowPlaying.tsx.
//
// Layers, back to front: Night base → BackgroundVideoLayer (TouchDesigner loop / orb shader) →
// content → "Why this sound" pull-up. The Figma VisualLayer (breathing circles) is no longer drawn
// here: the Mood Orbs video is the visual, and the circles didn't line up with the orb.
//
// Layout: header + title pinned to the top, the timer centred on the orb (the orb sits at the centre
// of the full-screen video, so the timer is centred on the full screen, not the safe area), and the
// mode switcher + pills sitting just above the control bar. Falls back to a scrolling column when the
// screen is too short for that (e.g. iPhone SE).
//
// Sleep (Night UI): #05081A base, visuals fade to 20% after 60 s without a touch (any tap resets),
// no white text (content is colour-multiplied by haze, which also turns the ember CTA into the dim
// Night ember) and 56 pt touch targets on the header and the action pills.

@available(iOS 17.0, *)
struct NowPlayingView: View {
    @Environment(AppStore.self) private var store
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    @State private var showWhy = false
    @State private var showShare = false
    @State private var idle = false
    @State private var touchCount = 0
    @State private var safeInsets = EdgeInsets()
    @State private var screenHeight: CGFloat = 0

    /// Where the orb's centre sits in the loops, as a fraction of the video height (measured on device:
    /// the orb is above the frame centre). The video aspect-fills by height on every iPhone, so this
    /// fraction maps straight onto the full screen height.
    private let orbCenterFraction: CGFloat = 0.384

    // MARK: Derived

    private var isSleep: Bool { store.isSleepUI }
    private var dimmed: Bool { isSleep && idle }
    private var copy: ContentBundle.NowPlayingCopy? { store.content?.nowPlaying }
    private var target: CGFloat { isSleep ? Esc.Metrics.nightTouchTarget : Esc.Metrics.touchTarget }
    private var moreWidth: CGFloat { isSleep ? Esc.Metrics.nightTouchTarget : 36 }
    private var idleKey: String { "\(isSleep)-\(touchCount)" }

    private var title: String { store.nowPlaying?.title ?? store.currentMode.title }
    private var subtitle: String { copy?.subtitle ?? "Afternoon Lift · composed by Lucille" }
    private var credit: String { store.nowPlaying?.creditLine ?? copy?.aiCredit ?? "Composed by Lucille (AI)" }
    private var whyHeadline: String {
        store.nowPlaying?.whyHeadline ?? copy?.whyHeadline ?? "I tuned this for your afternoon slump."
    }
    private var whyBody: String {
        store.nowPlaying?.whyThisSound ?? copy?.whyBody
            ?? "Drizzle outside + restless mood = slower pulse, warmer pads, a 10 Hz alpha layer."
    }
    private var shareText: String { "Listening to \(title) on Escape — composed by Lucille (AI)" }
    private var isSaved: Bool { store.isSaved(store.nowPlaying?.compositionId) }

    private var switcherModes: [ModeId] {
        let fromContent = copy?.switcherModes.compactMap { ModeId(loose: $0) } ?? []
        return fromContent.isEmpty ? [.picks, .focus, .calm, .sleep, .move] : fromContent
    }

    /// TSX: RingTimer while time remains, BreathRing at 0. Sleep with Breath Sync on also breathes.
    private var showsBreathRing: Bool {
        store.timerSeconds <= 0 || (isSleep && store.preferences?.sleep.breathSync == true)
    }

    /// A variation / retune of the current track is rendering.
    private var isReshaping: Bool {
        guard let g = store.generating, let current = store.nowPlaying else { return false }
        return !g.status.isFinished && g.parentId == current.compositionId
    }

    /// The orb's centre in the safe-area content's coordinates (nil until the screen is measured).
    private var orbCenterY: CGFloat? {
        guard screenHeight > 0 else { return nil }
        return screenHeight * orbCenterFraction - safeInsets.top
    }

    // MARK: Body

    var body: some View {
        ZStack {
            visuals
            foreground
                .colorMultiply(isSleep ? Esc.haze : Color.white)
        }
        .background((isSleep ? Esc.sleepNight : Esc.night).ignoresSafeArea())
        .background(safeAreaReader)
        .simultaneousGesture(TapGesture().onEnded { registerTouch() })
        .onChange(of: store.sheet) { _, _ in registerTouch() }
        .task(id: idleKey) { await watchIdle() }
        .sheet(isPresented: $showShare) {
            NowPlayingShareSheet(items: [shareText])
                .presentationDetents([.medium, .large])
                .ignoresSafeArea()
        }
    }

    /// Reads the full screen height and the safe-area insets (the reader ignores the safe area).
    private var safeAreaReader: some View {
        GeometryReader { proxy in
            Color.clear
                .onAppear {
                    safeInsets = proxy.safeAreaInsets
                    screenHeight = proxy.size.height
                }
                .onChange(of: proxy.safeAreaInsets) { _, insets in safeInsets = insets }
                .onChange(of: proxy.size.height) { _, height in screenHeight = height }
        }
        .ignoresSafeArea()
    }

    // MARK: Background

    private var visuals: some View {
        ZStack {
            (isSleep ? Esc.sleepNight : Esc.night)
                .ignoresSafeArea()
            // Mood Orbs v3: nearest of the 9 cells for this mode and the Mood Field (OrbLoops).
            BackgroundVideoLayer(preset: store.nowPlaying.map { OrbLoops.nearest(mode: $0.mode, field: store.moodField) },
                                 moodField: store.moodField, dimmed: dimmed)
        }
        .allowsHitTesting(false)
        .accessibilityHidden(true)
    }

    // MARK: Content

    private var foreground: some View {
        ZStack(alignment: .bottom) {
            ViewThatFits(in: .vertical) {
                OrbCenteredLayout(centerY: orbCenterY, spacing: 16).callAsFunction {
                    header
                    timerView
                    bottomColumn
                }
                compactLayout
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .animation(.easeOut(duration: 0.2), value: isReshaping)

            if showWhy {
                whyPanel
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
            }
        }
    }

    /// Mode switcher + pills, sitting just above the control bar.
    private var bottomColumn: some View {
        VStack(spacing: 20) {
            modeSwitcher
            actionPills
                .padding(.horizontal, 24)
            VStack(spacing: 0) {
                if isReshaping {
                    reshapingLine
                        .transition(.opacity)
                }
                controlBar
            }
        }
        .frame(maxWidth: .infinity)
    }

    /// Short screens: the previous stacked layout, with the middle scrolling.
    private var compactLayout: some View {
        VStack(spacing: 0) {
            header
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 24) {
                    timerView
                    modeSwitcher
                    actionPills
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity)
            }
            if isReshaping {
                reshapingLine
                    .transition(.opacity)
            }
            controlBar
        }
    }

    // MARK: Header

    /// Buttons on their own row so the title block can sit in the true horizontal centre.
    private var header: some View {
        VStack(spacing: 4) {
            HStack(spacing: 0) {
                Button { store.minimizePlayer() } label: {
                    Icon(.chevronDown, size: 24, color: Esc.mist)
                        .frame(width: target, height: target)
                        .contentShape(Rectangle())
                }
                .buttonStyle(EscPressStyle())
                .accessibilityLabel("Close player")

                Spacer(minLength: 0)

                Button { setWhy(!showWhy) } label: {
                    Icon(.info, size: 24, color: Esc.haze)
                        .frame(width: target, height: target)
                        .contentShape(Rectangle())
                }
                .buttonStyle(EscPressStyle())
                .accessibilityLabel("Why this sound")
                .accessibilityValue(showWhy ? "Expanded" : "Collapsed")

                moreMenu
            }
            .frame(minHeight: Esc.Metrics.headerHeight)

            titleBlock
                .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 16)
    }

    private var titleBlock: some View {
        VStack(spacing: 2) {
            Text(title)
                .font(EscFont.display(22))
                .foregroundStyle(Esc.mist)
            Text(subtitle)
                .font(EscFont.ui(13))
                .foregroundStyle(Esc.haze)
            Text(credit)
                .font(EscFont.ui(11))
                .tracking(11 * 0.04)
                .foregroundStyle(Color(hex: 0xB9A3F0, opacity: 0.8))
        }
        .lineLimit(1)
        .minimumScaleFactor(0.8)
        .multilineTextAlignment(.center)
        .accessibilityElement(children: .combine)
        .accessibilityAddTraits(.isHeader)
    }

    /// Not in the Figma: the app needs a way to end the session from the player.
    private var moreMenu: some View {
        Menu {
            Button("End session", role: .destructive) { Task { await store.endSession() } }
            if isSaved {
                Button("Saved") {}
                    .disabled(true)
            } else {
                Button("Save to Library") { Task { await store.saveCurrent() } }
            }
        } label: {
            Icon(.more, size: 24, color: Esc.haze)
                .frame(width: moreWidth, height: target)
                .contentShape(Rectangle())
        }
        .accessibilityLabel("More options")
    }

    // MARK: Timer, modes, pills

    private var timerView: some View {
        Button { store.setSheet(.timer) } label: {
            if showsBreathRing {
                BreathRing()
            } else {
                RingTimer(seconds: store.timerSeconds,
                          totalSeconds: (store.preferences?.timer.minutes ?? 25) * 60,
                          caption: copy?.timerCaption ?? "Short break at 12:11 PM")
            }
        }
        .buttonStyle(EscPressStyle(pressedOpacity: 0.9))
        .accessibilityHint("Opens the timer")
    }

    private var modeSwitcher: some View {
        HStack(spacing: 12) {
            ForEach(switcherModes) { mode in
                ModeOrb(mode: mode,
                        label: mode.shortTitle,
                        active: store.currentMode == mode,
                        locked: store.isLocked(mode),
                        onPress: { Task { await store.switchMode(mode) } })
            }
        }
        .fixedSize()
    }

    private var actionPills: some View {
        PillFlowLayout(spacing: 8, lineSpacing: 8).callAsFunction {
            pill("Mood Field", icon: .mood) { store.setSheet(.moodField) }
            pill("Layers", icon: .layers) { store.setSheet(.layers) }
            pill("Blend", icon: .blend, toggle: store.blendOn) { store.toggleBlend() }
            pill("Focus Shield", icon: .shield, toggle: store.focusShieldOn) { store.toggleFocusShield() }
            pill("Lucille Whisper", icon: .whisper) { store.setSheet(.lucilleWhisper) }
        }
    }

    /// ActionPill drawn as-is; the outer button owns the tap so Night UI can grow the target to 56 pt.
    private func pill(_ label: String, icon: EscIcon, toggle: Bool? = nil, action: @escaping () -> Void) -> some View {
        let active = toggle ?? false
        let stateValue: String = toggle.map { $0 ? "On" : "Off" } ?? ""
        return Button(action: action) {
            ActionPill(label: label, icon: icon, active: active)
                .allowsHitTesting(false)
                .accessibilityHidden(true)
                .frame(minHeight: isSleep ? Esc.Metrics.nightTouchTarget : nil)
                .contentShape(Rectangle())
        }
        .buttonStyle(EscPressStyle())
        .accessibilityLabel(label)
        .accessibilityValue(stateValue)
        .accessibilityAddTraits(active ? .isSelected : [])
    }

    // MARK: Status + controls

    private var reshapingLine: some View {
        HStack(spacing: 8) {
            LucilleOrb(size: 14, pulse: true)
            Text("Lucille is reshaping…")
                .font(EscFont.ui(12, .medium))
                .foregroundStyle(Esc.haze)
        }
        .padding(.bottom, 8)
        .accessibilityElement(children: .combine)
    }

    private var controlBar: some View {
        ControlBar(isPlaying: store.isPlaying,
                   isSaved: isSaved,
                   onPlayPause: { store.togglePlay() },
                   onTimer: { store.setSheet(.timer) },
                   onModeChange: { Task { await store.variation() } },
                   onSave: isSaved ? nil : { Task { await store.saveCurrent() } },
                   onShare: { showShare = true })
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
    }

    // MARK: "Why this sound" pull-up

    private var whyPanel: some View {
        let shape = UnevenRoundedRectangle(topLeadingRadius: 28, topTrailingRadius: 28, style: .circular)
        return VStack(alignment: .leading, spacing: 0) {
            Capsule()
                .fill(Color(hex: 0xE6EAF4, opacity: 0.2))
                .frame(width: 36, height: 4)
                .frame(maxWidth: .infinity)
                .padding(.bottom, 16)
            Text("Why this sound")
                .escLabel()
                .padding(.bottom, 12)
            HStack(alignment: .top, spacing: 12) {
                LucilleOrb(size: 36)
                VStack(alignment: .leading, spacing: 8) {
                    Text(whyHeadline)
                        .font(EscFont.display(18))
                        .foregroundStyle(Esc.mist)
                    Text(whyBody)
                        .font(EscFont.ui(15))
                        .foregroundStyle(Esc.haze)
                        .lineSpacing(6)
                }
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.top, 20)
        .padding(.horizontal, 24)
        .padding(.bottom, 14) // 48 in the Figma, 34 of which is the home-indicator safe area
        .frame(maxWidth: .infinity, alignment: .leading)
        .background {
            shape
                .fill(Color(hex: 0x18224A, opacity: 0.97))
                .background(.ultraThinMaterial, in: shape)
                .overlay(shape.stroke(Color(hex: 0xE6EAF4, opacity: 0.1), lineWidth: 1))
                .ignoresSafeArea(edges: .bottom)
        }
        .contentShape(Rectangle())
        .onTapGesture { setWhy(false) }
        .accessibilityElement(children: .combine)
        .accessibilityAddTraits(.isButton)
        .accessibilityHint("Double-tap to close")
    }

    // MARK: Actions

    private func setWhy(_ on: Bool) {
        withAnimation(reduceMotion ? nil : .easeOut(duration: 0.28)) { showWhy = on }
    }

    private func registerTouch() {
        touchCount &+= 1
    }

    /// Night UI: dim the visuals after a minute without touches.
    private func watchIdle() async {
        idle = false
        guard isSleep else { return }
        try? await Task.sleep(for: .seconds(60))
        guard !Task.isCancelled else { return }
        idle = true
    }
}

// MARK: - Header / orb-centred timer / bottom column

/// Three subviews: [top, timer, bottom]. Top is pinned to the top, bottom to the bottom, and the
/// timer is centred at `centerY` (the orb, measured from the top of the bounds; nil = bounds centre),
/// clamped so it never overlaps either. Its ideal height is the stacked minimum, so ViewThatFits
/// falls back when the screen is too short.
@available(iOS 17.0, *)
private struct OrbCenteredLayout: Layout {
    var centerY: CGFloat?
    var spacing: CGFloat = 16

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let width = finite(proposal.width) ?? subviews.map { $0.sizeThatFits(.unspecified).width }.max() ?? 0
        let child = ProposedViewSize(width: width, height: nil)
        let needed = subviews.reduce(0) { $0 + $1.sizeThatFits(child).height }
            + spacing * CGFloat(max(0, subviews.count - 1))
        if let height = finite(proposal.height) {
            return CGSize(width: width, height: max(height, needed))
        }
        return CGSize(width: width, height: needed)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        guard subviews.count == 3 else { return }
        let child = ProposedViewSize(width: bounds.width, height: nil)
        let top = subviews[0], timer = subviews[1], bottom = subviews[2]
        let topHeight = top.sizeThatFits(child).height
        let timerHeight = timer.sizeThatFits(child).height
        let bottomHeight = bottom.sizeThatFits(child).height

        top.place(at: CGPoint(x: bounds.midX, y: bounds.minY), anchor: .top, proposal: child)
        bottom.place(at: CGPoint(x: bounds.midX, y: bounds.maxY), anchor: .bottom, proposal: child)

        let minY = bounds.minY + topHeight + spacing
        let maxY = max(minY, bounds.maxY - bottomHeight - spacing - timerHeight)
        let centred = bounds.minY + (centerY ?? bounds.height / 2) - timerHeight / 2
        let y = min(max(centred, minY), maxY)
        timer.place(at: CGPoint(x: bounds.midX, y: y), anchor: .top, proposal: child)
    }

    private func finite(_ value: CGFloat?) -> CGFloat? {
        guard let value, value.isFinite else { return nil }
        return value
    }
}

// MARK: - Wrapping pill row (flexWrap: wrap; justifyContent: center)

@available(iOS 17.0, *)
private struct PillFlowLayout: Layout {
    var spacing: CGFloat = 8
    var lineSpacing: CGFloat = 8

    private struct Row {
        var indices: [Int] = []
        var width: CGFloat = 0
        var height: CGFloat = 0
    }

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let maxWidth = finite(proposal.width)
        let rows = arrange(maxWidth: maxWidth ?? .infinity, subviews: subviews)
        let height = rows.reduce(0) { $0 + $1.height } + lineSpacing * CGFloat(max(0, rows.count - 1))
        let width = maxWidth ?? rows.map(\.width).max() ?? 0
        return CGSize(width: width, height: height)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let rows = arrange(maxWidth: bounds.width, subviews: subviews)
        var y = bounds.minY
        for row in rows {
            var x = bounds.minX + (bounds.width - row.width) / 2
            for index in row.indices {
                let size = subviews[index].sizeThatFits(.unspecified)
                subviews[index].place(at: CGPoint(x: x, y: y + (row.height - size.height) / 2),
                                      anchor: .topLeading,
                                      proposal: ProposedViewSize(size))
                x += size.width + spacing
            }
            y += row.height + lineSpacing
        }
    }

    private func finite(_ value: CGFloat?) -> CGFloat? {
        guard let value, value.isFinite else { return nil }
        return value
    }

    private func arrange(maxWidth: CGFloat, subviews: Subviews) -> [Row] {
        var rows: [Row] = []
        var current = Row()
        for index in subviews.indices {
            let size = subviews[index].sizeThatFits(.unspecified)
            let needed = current.indices.isEmpty ? size.width : current.width + spacing + size.width
            if !current.indices.isEmpty && needed > maxWidth {
                rows.append(current)
                current = Row(indices: [index], width: size.width, height: size.height)
            } else {
                current.indices.append(index)
                current.width = needed
                current.height = max(current.height, size.height)
            }
        }
        if !current.indices.isEmpty { rows.append(current) }
        return rows
    }
}

// MARK: - Share sheet

@available(iOS 17.0, *)
private struct NowPlayingShareSheet: UIViewControllerRepresentable {
    let items: [String]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: items, applicationActivities: nil)
    }

    func updateUIViewController(_ controller: UIActivityViewController, context: Context) {}
}

// MARK: - Previews


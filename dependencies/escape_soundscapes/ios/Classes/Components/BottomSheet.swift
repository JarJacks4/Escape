import SwiftUI

// Ported from shared.tsx: BottomSheet.
//
// A full-screen overlay: dim backdrop (taps close) + a panel anchored to the bottom that slides up
// (0.28 s ease-out) when it appears. Put it in an overlay/ZStack that covers the screen and respects
// the safe area (the default): the backdrop and the panel background extend under the home indicator
// by themselves, while the panel's content stays above it. Max height 90%; taller content scrolls.

@available(iOS 17.0, *)
public struct BottomSheet<Content: View>: View {
    let title: String?
    let onClose: () -> Void
    let content: Content

    @State private var presented = false
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    public init(title: String? = nil, onClose: @escaping () -> Void, @ViewBuilder content: () -> Content) {
        self.title = title
        self.onClose = onClose
        self.content = content()
    }

    public var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottom) {
                backdrop
                if presented {
                    panel(maxHeight: geo.size.height * 0.9)
                        .transition(.move(edge: .bottom))
                }
            }
            .frame(width: geo.size.width, height: geo.size.height, alignment: .bottom)
        }
        .onAppear {
            if reduceMotion {
                presented = true
            } else {
                withAnimation(.easeOut(duration: 0.28)) { presented = true }
            }
        }
    }

    // MARK: Pieces

    private var backdrop: some View {
        Esc.dim
            .ignoresSafeArea()
            .contentShape(Rectangle())
            .onTapGesture { onClose() }
            .accessibilityLabel("Close")
            .accessibilityAddTraits(.isButton)
    }

    private func panel(maxHeight: CGFloat) -> some View {
        BottomSheetHeightLayout(maxHeight: maxHeight) {
            ViewThatFits(in: .vertical) {
                sheetBody
                    .fixedSize(horizontal: false, vertical: true)
                ScrollView(.vertical, showsIndicators: false) {
                    sheetBody
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background { panelBackground }
        .accessibilityAddTraits(.isModal)
        .accessibilityAction(.escape) { onClose() }
    }

    private var sheetBody: some View {
        VStack(alignment: .leading, spacing: 0) {
            handle
            if let title {
                Text(title)
                    .font(EscFont.display(22))
                    .foregroundStyle(Esc.mist)
                    .padding(.top, 4)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 16)
                    .accessibilityAddTraits(.isHeader)
            }
            content
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 1) // 1px top border
    }

    private var handle: some View {
        Capsule()
            .fill(Color(hex: 0xE6EAF4, opacity: 0.2))
            .frame(width: 36, height: 4)
            .frame(maxWidth: .infinity)
            .padding(.top, 12)
            .padding(.bottom, 8)
            .accessibilityHidden(true)
    }

    private var panelBackground: some View {
        let shape = UnevenRoundedRectangle(topLeadingRadius: Esc.Metrics.sheetRadius,
                                           topTrailingRadius: Esc.Metrics.sheetRadius,
                                           style: .circular)
        return shape
            .fill(Esc.sheet)
            .background(.ultraThinMaterial, in: shape)
            .overlay(shape.stroke(Color(hex: 0xE6EAF4, opacity: 0.15), lineWidth: 1))
            .shadow(color: Color.black.opacity(0.4), radius: 16, y: -8)
            .padding(.bottom, -2) // push the (CSS-less) bottom border off-screen
            .ignoresSafeArea(edges: .bottom)
    }
}

/// Gives the sheet its natural height while capping the proposal passed to
/// `ViewThatFits`. Content that exceeds the cap therefore selects its scrolling
/// fallback instead of making every short sheet fill 90% of the screen.
@available(iOS 17.0, *)
private struct BottomSheetHeightLayout: Layout {
    let maxHeight: CGFloat

    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) -> CGSize {
        guard let subview = subviews.first else { return .zero }
        let constrainedProposal = ProposedViewSize(
            width: proposal.width,
            height: min(proposal.height ?? maxHeight, maxHeight)
        )
        let size = subview.sizeThatFits(constrainedProposal)
        return CGSize(
            width: proposal.width ?? size.width,
            height: min(size.height, maxHeight)
        )
    }

    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) {
        guard let subview = subviews.first else { return }
        subview.place(
            at: bounds.origin,
            anchor: .topLeading,
            proposal: ProposedViewSize(width: bounds.width, height: bounds.height)
        )
    }
}

// MARK: - Previews


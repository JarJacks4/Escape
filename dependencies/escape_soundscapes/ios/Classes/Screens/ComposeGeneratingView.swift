import SwiftUI

// Ported from screens/ComposeGenerating.tsx.
//
// The prototype faked the four steps with timeouts; here they follow `store.generationStep`, which the
// store advances while it polls the composition (0 reading · 1 composing · 2 painting · 3 ready).

@available(iOS 17.0, *)
struct ComposeGeneratingView: View {
    @Environment(AppStore.self) private var store

    private var copy: ContentBundle.ComposeCopy? { store.content?.compose }
    private var failed: Bool { store.generating?.status == .failed }
    private var isReady: Bool { !failed && store.generationStep >= 3 }

    private var steps: [String] {
        copy?.steps ?? ["Reading your inner weather", "Composing your soundscape", "Painting the visuals", "Ready"]
    }

    var body: some View {
        VStack(spacing: 0) {
            LucilleOrb(size: isReady ? 120 : 100, pulse: !isReady && !failed)
                .padding(.bottom, 40)
            Group {
                if failed {
                    failedState
                } else if isReady {
                    readyHeader
                        .padding(.bottom, 40)
                    readyActions
                } else {
                    stepList
                        .padding(.bottom, 40)
                    workingFooter
                }
            }
            .transition(.opacity)
        }
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Esc.night.ignoresSafeArea())
        .animation(.easeInOut(duration: 0.4), value: isReady)
        .animation(.easeInOut(duration: 0.4), value: failed)
    }

    // MARK: Working

    private var stepList: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(Array(steps.enumerated()), id: \.offset) { index, label in
                GeneratingStepRow(label: label, state: state(of: index))
            }
        }
        .frame(maxWidth: 320, alignment: .leading)
        .frame(maxWidth: .infinity)
    }

    private func state(of index: Int) -> GeneratingStepRow.StepState {
        let step = store.generationStep
        if step >= steps.count - 1 || index < step { return .done }
        return index == step ? .active : .pending
    }

    private var workingFooter: some View {
        VStack(spacing: 12) {
            Text(copy?.eta ?? "Takes about a minute")
                .font(EscFont.ui(13))
                .foregroundStyle(Esc.haze)
            Text(copy?.leaveNote ?? "I'll send you a notification if you leave.")
                .font(EscFont.ui(13))
                .foregroundStyle(Esc.haze)
            Button { store.setScreen(.soundscapesHome) } label: {
                Text("Cancel")
                    .font(EscFont.ui(14))
                    .underline()
                    .foregroundStyle(Esc.haze)
                    .frame(minWidth: 44, minHeight: 44)
                    .contentShape(Rectangle())
            }
            .buttonStyle(EscPressStyle())
        }
        .multilineTextAlignment(.center)
    }

    // MARK: Ready

    private var readyHeader: some View {
        VStack(spacing: 8) {
            Text(steps.last ?? "Ready")
                .font(EscFont.ui(13, .semibold))
                .tracking(13 * 0.1)
                .textCase(.uppercase)
                .foregroundStyle(Esc.lilac)
                .padding(.bottom, 4)
            Text(store.generating?.title ?? "Cabin Rain, 11 PM")
                .font(EscFont.display(28))
                .foregroundStyle(Esc.mist)
                .accessibilityAddTraits(.isHeader)
            Text(store.generating?.creditLine ?? "Composed by Lucille (AI)")
                .font(EscFont.ui(14))
                .foregroundStyle(Esc.haze)
        }
        .multilineTextAlignment(.center)
        .accessibilityElement(children: .combine)
    }

    private var readyActions: some View {
        VStack(spacing: 12) {
            PrimaryButton(label: "Play") { store.playGenerated() }
            Button { Task { await store.saveGenerated() } } label: {
                HStack(spacing: 8) {
                    Icon(.bookmark, size: 18, color: Esc.haze)
                    Text("Save to Library")
                        .font(EscFont.ui(15, .medium))
                        .foregroundStyle(Esc.haze)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 52)
                .background(Esc.card, in: Capsule())
                .overlay(Capsule().strokeBorder(Esc.hairline, lineWidth: 1.5))
                .contentShape(Capsule())
            }
            .buttonStyle(EscPressStyle())
            Button { store.setScreen(.lucilleCompose) } label: {
                Text("New variation")
                    .font(EscFont.ui(14))
                    .foregroundStyle(Esc.haze)
                    .frame(minHeight: 44)
                    .padding(.horizontal, 8)
                    .contentShape(Rectangle())
            }
            .buttonStyle(EscPressStyle())
        }
        .frame(maxWidth: .infinity)
    }

    // MARK: Failed

    private var failedState: some View {
        VStack(spacing: 12) {
            Text(store.generating?.failReason ?? "Lucille couldn't finish this one.")
                .font(EscFont.ui(15))
                .foregroundStyle(Esc.mist)
                .multilineTextAlignment(.center)
                .padding(.bottom, 28)
            PrimaryButton(label: "Try again", disabled: store.isBusy) {
                Task { await store.compose() }
            }
            Button { store.setScreen(.lucilleCompose) } label: {
                Text("Back")
                    .font(EscFont.ui(14))
                    .foregroundStyle(Esc.haze)
                    .frame(minWidth: 44, minHeight: 44)
                    .contentShape(Rectangle())
            }
            .buttonStyle(EscPressStyle())
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Step row

@available(iOS 17.0, *)
private struct GeneratingStepRow: View {
    enum StepState { case pending, active, done }

    let label: String
    let state: StepState

    var body: some View {
        HStack(spacing: 14) {
            Circle()
                .fill(fill)
                .overlay(Circle().strokeBorder(border, lineWidth: 1.5))
                .overlay { marker }
                .frame(width: 28, height: 28)
            Text(label)
                .font(EscFont.ui(15, state == .active ? .semibold : .regular))
                .foregroundStyle(state == .pending ? Esc.haze : Esc.mist)
        }
        .animation(.easeInOut(duration: 0.4), value: state)
        .accessibilityElement(children: .combine)
        .accessibilityValue(state == .done ? "Done" : state == .active ? "In progress" : "Pending")
    }

    private var fill: Color {
        switch state {
        case .done: Color(hex: 0xB9A3F0, opacity: 0.2)
        case .active: Color(hex: 0x39519F, opacity: 0.4)
        case .pending: Esc.cardSoft
        }
    }

    private var border: Color {
        switch state {
        case .done: Color(hex: 0xB9A3F0, opacity: 0.5)
        case .active: Color(hex: 0x39519F, opacity: 0.8)
        case .pending: Color(hex: 0xE6EAF4, opacity: 0.1)
        }
    }

    @ViewBuilder private var marker: some View {
        switch state {
        case .done:
            Icon(.check, size: 14, color: Esc.lilac)
        case .active:
            Circle().fill(Esc.lilac).frame(width: 6, height: 6).pulseOrb()
        case .pending:
            Circle().fill(Color(hex: 0xE6EAF4, opacity: 0.2)).frame(width: 6, height: 6)
        }
    }
}

// MARK: - Previews



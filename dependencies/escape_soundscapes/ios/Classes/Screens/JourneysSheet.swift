import SwiftUI

// Ported from screens/SupportingScreens.tsx: JourneysSheet.
//
// Shows `store.selectedJourney` (set by `store.openJourney(_:)`), falling back to the first journey,
// then to the Figma's Deep Work 50/10.

@available(iOS 17.0, *)
struct JourneysSheet: View {
    @Environment(AppStore.self) private var store
    @State private var starting = false

    private var journey: Journey {
        store.selectedJourney ?? store.journeys.first ?? Self.figmaJourney
    }

    private var totalMinutes: Int {
        journey.totalMinutes ?? journey.phases.reduce(0) { $0 + $1.minutes }
    }

    var body: some View {
        BottomSheet(title: journey.sheetTitle, onClose: { store.closeSheet() }) {
            VStack(alignment: .leading, spacing: 20) {
                Text("\(journey.summary) · \(totalMinutes) min total")
                    .font(EscFont.ui(14))
                    .foregroundStyle(Esc.haze)
                    .fixedSize(horizontal: false, vertical: true)
                timeline
                PrimaryButton(label: "Start Journey", disabled: starting) {
                    starting = true
                    Task {
                        await store.startJourney()
                        starting = false
                    }
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 24)
        }
    }

    private var timeline: some View {
        VStack(spacing: 0) {
            ForEach(Array(journey.phases.enumerated()), id: \.offset) { index, phase in
                JourneyPhaseRow(phase: phase, isLast: index == journey.phases.count - 1)
            }
        }
        .accessibilityElement(children: .contain)
        .accessibilityLabel("Phases")
    }

    /// The prototype's hard-coded journey.
    static let figmaJourney = Journey(
        id: "deep-work", title: "Deep Work", chipDuration: "50/10", mode: "focus", placeholder: nil,
        sheetTitle: "Deep Work 50/10", summary: "50 min focused work + 10 min active break",
        phases: [
            Journey.Phase(label: "Arrive", minutes: 3, energy: 0.3, startsAtSec: nil),
            Journey.Phase(label: "Settle", minutes: 10, energy: 0.5, startsAtSec: nil),
            Journey.Phase(label: "Deepen", minutes: 25, energy: 0.7, startsAtSec: nil),
            Journey.Phase(label: "Return", minutes: 2, energy: 0.4, startsAtSec: nil),
        ],
        totalMinutes: 40)
}

// MARK: - Phase row

@available(iOS 17.0, *)
private struct JourneyPhaseRow: View {
    let phase: Journey.Phase
    let isLast: Bool

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            rail
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(phase.label)
                        .font(EscFont.ui(15, .medium))
                        .foregroundStyle(Esc.mist)
                    Spacer(minLength: 8)
                    Text("\(phase.minutes) min")
                        .font(EscFont.ui(13))
                        .foregroundStyle(Esc.haze)
                }
                energyTrack
            }
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("\(phase.label), \(phase.minutes) minutes")
        .accessibilityValue("Energy \(Int((phase.energy * 100).rounded())) percent")
    }

    /// 10 pt violet dot + 1 × 28 connector (none after the last phase).
    private var rail: some View {
        VStack(spacing: 0) {
            Circle()
                .fill(Esc.violet)
                .frame(width: 10, height: 10)
            if !isLast {
                Rectangle()
                    .fill(Color(hex: 0x8E7CD9, opacity: 0.3))
                    .frame(width: 1, height: 28)
            }
        }
        .frame(width: 20)
    }

    /// Mood Field dot: 120 × 4 track with an 8 pt dot at `energy` along it.
    private var energyTrack: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(Esc.card)
            .frame(width: 120, height: 4)
            .overlay(alignment: .leading) {
                Circle()
                    .fill(Esc.violet)
                    .frame(width: 8, height: 8)
                    .offset(x: 120 * min(1, max(0, phase.energy)) - 4)
            }
    }
}

// MARK: - Previews



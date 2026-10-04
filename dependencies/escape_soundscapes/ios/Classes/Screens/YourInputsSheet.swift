import SwiftUI

// Ported from SupportingScreens.tsx: YourInputsSheet.
//
// The inputs Lucille may read (time, weather, heart rate, Mood Scan, calendar). Rows come from
// `store.inputs` (GET /v1/me/inputs, loaded by bootstrap). Turning on an input that needs an OS
// permission goes through `store.toggleInput`, which shows the PermissionPrimer first.

@available(iOS 17.0, *)
struct YourInputsSheet: View {
    @Environment(AppStore.self) private var store
    @State private var confirmDelete = false

    var body: some View {
        BottomSheet(title: "Your Inputs", onClose: { store.closeSheet() }) {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(store.inputs) { input in
                    InputRow(input: input) {
                        Task { await store.toggleInput(input.id) }
                    }
                }
                footer
                deleteButton
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 32)
        }
    }

    // MARK: Footer

    private var footerText: String {
        if !store.inputsFooter.isEmpty { return store.inputsFooter }
        return store.content?.inputsFooter ?? "Used only to shape your soundscape. Never sold."
    }

    private var footer: some View {
        Text(footerText)
            .font(EscFont.ui(12))
            .foregroundStyle(Esc.haze)
            .lineSpacing(12 * 0.6)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.top, 20)
            .padding(.bottom, 8)
    }

    private var deleteButton: some View {
        Button { confirmDelete = true } label: {
            Text("Delete my input history")
                .font(EscFont.ui(14))
                .foregroundStyle(Esc.haze)
                .underline()
                .padding(.vertical, 8)
                .contentShape(Rectangle())
        }
        .buttonStyle(EscPressStyle())
        .confirmationDialog("Delete your input history?", isPresented: $confirmDelete, titleVisibility: .visible) {
            Button("Delete", role: .destructive) {
                Task { await store.deleteInputHistory() }
            }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Lucille will forget the weather, heart rate and mood readings she has stored. This can't be undone.")
        }
    }
}

// MARK: - Row

@available(iOS 17.0, *)
private struct InputRow: View {
    let input: InputSetting
    let onToggle: () -> Void

    private var comingSoon: Bool { input.comingSoon == true }
    /// Time of day is always on and Calendar isn't available yet: both show a disabled toggle.
    private var locked: Bool { input.alwaysOn || comingSoon }
    private var isOn: Bool { input.alwaysOn || input.enabled }

    var body: some View {
        HStack(spacing: 14) {
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 8) {
                    Text(input.label)
                        .font(EscFont.ui(15, .medium))
                        .foregroundStyle(comingSoon ? Esc.haze : Esc.mist)
                    if comingSoon { soonBadge }
                }
                Text(input.sub)
                    .font(EscFont.ui(13))
                    .foregroundStyle(Esc.haze)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            EscToggle(on: isOn, onToggle: onToggle)
                .disabled(locked)
                .opacity(locked ? 0.5 : 1)
                .accessibilityLabel(input.label)
                .accessibilityHint(locked ? (comingSoon ? "Coming soon" : "Always on") : "")
        }
        .padding(.vertical, 16)
        .overlay(alignment: .bottom) {
            Rectangle().fill(Esc.hairlineSoft).frame(height: 1)
        }
    }

    private var soonBadge: some View {
        Text("Soon")
            .font(EscFont.ui(10))
            .foregroundStyle(Esc.haze)
            .padding(.vertical, 3)
            .padding(.horizontal, 9)
            .background(Esc.card, in: Capsule())
            .overlay(Capsule().strokeBorder(Color(hex: 0xE6EAF4, opacity: 0.1), lineWidth: 1))
    }
}

// MARK: - Previews



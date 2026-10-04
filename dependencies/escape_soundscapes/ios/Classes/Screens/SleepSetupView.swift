import SwiftUI

// Ported from screens/SupportingScreens.tsx: SleepSetup + SleepRow.
//
// Night UI: #05081A, no pure white, 56 pt touch targets, dimmed ember CTA (#9C4F07).
// Every change is saved through `store.updateSleep(_:)`; values read back from `store.preferences?.sleep`.

@available(iOS 17.0, *)
struct SleepSetupView: View {
    @Environment(AppStore.self) private var store
    @State private var showsTimePicker = false

    private var copy: ContentBundle.SleepSetupCopy? { store.content?.sleepSetup }
    private var prefs: Preferences.Sleep? { store.preferences?.sleep }

    private var whisperIntro: Bool { prefs?.whisperIntro ?? copy?.whisperIntro ?? true }
    private var sleepTimer: String { prefs?.timer ?? copy?.timer ?? "45 min" }
    private var sunriseTime: String { prefs?.sunriseTime ?? copy?.sunriseTime ?? "07:00" }
    private var breathSync: Bool { prefs?.breathSync ?? copy?.breathSync ?? false }

    var body: some View {
        ZStack {
            VisualLayer(isSleep: true)
            VStack(spacing: 0) {
                header
                rows
                    .padding(.vertical, 8)
                    .padding(.horizontal, 24)
                Spacer(minLength: 16)
                startButton
                    .padding(.horizontal, 24)
                    .padding(.bottom, 16)
            }
        }
        .background(Esc.sleepNight.ignoresSafeArea())
    }

    // MARK: Header

    private var header: some View {
        HStack(spacing: 0) {
            Button { store.setScreen(.soundscapesHome) } label: {
                Icon(.chevronDown, size: 24, color: Esc.haze)
                    .frame(width: 56, height: 56, alignment: .leading)
                    .contentShape(Rectangle())
            }
            .buttonStyle(EscPressStyle())
            .accessibilityLabel("Close")
            Text("Sleep")
                .font(EscFont.display(22))
                .foregroundStyle(Esc.mist.opacity(0.8))
                .frame(maxWidth: .infinity)
                .accessibilityAddTraits(.isHeader)
            Color.clear.frame(width: 56, height: 1)
        }
        .padding(.horizontal, 24)
        .frame(height: 56)
    }

    // MARK: Rows

    private var rows: some View {
        VStack(spacing: 2) {
            SleepRow(label: copy?.rows.whisper.label ?? "Lucille Whisper intro",
                     sub: copy?.rows.whisper.sub ?? "Gentle guidance as you drift off",
                     onTap: toggleWhisper) {
                LucilleOrb(size: 28)
            } right: {
                EscToggle(on: whisperIntro, onToggle: toggleWhisper)
                    .accessibilityLabel(copy?.rows.whisper.label ?? "Lucille Whisper intro")
            }
            SleepRow(label: copy?.rows.timer.label ?? "Sleep timer",
                     sub: copy?.rows.timer.sub ?? "Audio will fade out after this time") {
                Icon(.moon, size: 22, color: Esc.haze)
            } right: {
                timerMenu
            }
            SleepRow(label: copy?.rows.sunrise.label ?? "Sunrise Wake",
                     sub: copy?.rows.sunrise.sub ?? "Soft alarm wakes you gently") {
                Icon(.sunrise, size: 22, color: Esc.haze)
            } right: {
                sunriseControl
            }
            SleepRow(label: copy?.rows.breath.label ?? "Breath Sync 4-7-8",
                     sub: copy?.rows.breath.sub ?? "Guided breathing to help you unwind",
                     onTap: toggleBreath) {
                Icon(.soundwave, size: 22, color: Esc.haze)
            } right: {
                EscToggle(on: breathSync, onToggle: toggleBreath)
                    .accessibilityLabel(copy?.rows.breath.label ?? "Breath Sync 4-7-8")
            }
        }
    }

    private func toggleWhisper() {
        store.updateSleep(PreferencesPatch.SleepPatch(whisperIntro: !whisperIntro))
    }

    private func toggleBreath() {
        store.updateSleep(PreferencesPatch.SleepPatch(breathSync: !breathSync))
    }

    // MARK: Sleep timer (the TSX <select>)

    private var timerMenu: some View {
        Menu {
            ForEach(copy?.timerOptions ?? ["20 min", "30 min", "45 min", "60 min", "90 min"], id: \.self) { option in
                Button {
                    store.updateSleep(PreferencesPatch.SleepPatch(timer: option))
                } label: {
                    if option == sleepTimer {
                        Label(option, systemImage: "checkmark")
                    } else {
                        Text(option)
                    }
                }
            }
        } label: {
            HStack(spacing: 8) {
                Text(sleepTimer)
                    .font(EscFont.ui(14))
                    .foregroundStyle(Esc.mist.opacity(0.8))
                Image(systemName: "chevron.down")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(Esc.mist.opacity(0.8))
            }
            .modifier(NightFieldStyle())
        }
        .accessibilityLabel(copy?.rows.timer.label ?? "Sleep timer")
        .accessibilityValue(sleepTimer)
    }

    // MARK: Sunrise Wake (the TSX <input type="time">)

    private var sunriseControl: some View {
        Button { showsTimePicker = true } label: {
            HStack(spacing: 10) {
                Text(Self.displayTime(sunriseTime))
                    .font(EscFont.ui(14))
                    .foregroundStyle(Esc.mist.opacity(0.8))
                    .monospacedDigit()
                Image(systemName: "clock")
                    .font(.system(size: 12))
                    .foregroundStyle(Esc.mist.opacity(0.8))
            }
            .modifier(NightFieldStyle())
        }
        .buttonStyle(EscPressStyle())
        .accessibilityLabel(copy?.rows.sunrise.label ?? "Sunrise Wake")
        .accessibilityValue(Self.displayTime(sunriseTime))
        .popover(isPresented: $showsTimePicker) {
            DatePicker("", selection: sunriseBinding, displayedComponents: .hourAndMinute)
                .datePickerStyle(.wheel)
                .labelsHidden()
                .environment(\.colorScheme, .dark)
                .frame(width: 260)
                .padding(12)
                .presentationCompactAdaptation(.popover)
                .presentationBackground(Esc.ink)
        }
    }

    /// "HH:mm" in the store ↔ Date for the picker.
    private var sunriseBinding: Binding<Date> {
        Binding(
            get: { Self.date(from: sunriseTime) },
            set: { store.updateSleep(PreferencesPatch.SleepPatch(sunriseTime: Self.storeFormatter.string(from: $0))) }
        )
    }

    private static let storeFormatter: DateFormatter = {
        let f = DateFormatter()
        f.locale = Locale(identifier: "en_US_POSIX")
        f.dateFormat = "HH:mm"
        return f
    }()

    private static let displayFormatter: DateFormatter = {
        let f = DateFormatter()
        f.locale = Locale(identifier: "en_US_POSIX")
        f.dateFormat = "hh:mm a"
        return f
    }()

    private static func date(from hhmm: String) -> Date {
        let parts = hhmm.split(separator: ":").compactMap { Int($0) }
        let hour = parts.first ?? 7
        let minute = parts.count > 1 ? parts[1] : 0
        return Calendar.current.date(bySettingHour: hour, minute: minute, second: 0, of: Date()) ?? Date()
    }

    /// "07:00" → "07:00 AM" (as the prototype's time input shows it).
    private static func displayTime(_ hhmm: String) -> String {
        displayFormatter.string(from: date(from: hhmm))
    }

    // MARK: CTA

    private var startButton: some View {
        Button { Task { await store.startSleep() } } label: {
            Text(copy?.cta ?? "Start sleep")
                .font(EscFont.ui(17, .semibold))
                .foregroundStyle(Esc.mist)
                .frame(maxWidth: .infinity)
                .frame(height: 64)
                .background(Esc.emberDim, in: Capsule())
                .contentShape(Capsule())
        }
        .buttonStyle(EscPressStyle())
    }
}

// MARK: - Night field (select / time input chrome)

/// rgba(16,30,67,0.8) fill, 1px rgba(230,234,244,0.1) border, radius 8, padding 6×10;
/// the tap area grows to 56 pt for the Night UI without changing the look.
@available(iOS 17.0, *)
private struct NightFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 7)
            .padding(.horizontal, 11)
            .background(Color(hex: 0x101E43, opacity: 0.8), in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(hex: 0xE6EAF4, opacity: 0.1), lineWidth: 1))
            .frame(minWidth: 56, minHeight: 56)
            .contentShape(Rectangle())
    }
}

// MARK: - SleepRow

@available(iOS 17.0, *)
private struct SleepRow<IconContent: View, Right: View>: View {
    let label: String
    let sub: String
    let onTap: (() -> Void)?
    let icon: IconContent
    let right: Right

    init(label: String, sub: String, onTap: (() -> Void)? = nil,
         @ViewBuilder icon: () -> IconContent, @ViewBuilder right: () -> Right) {
        self.label = label
        self.sub = sub
        self.onTap = onTap
        self.icon = icon()
        self.right = right()
    }

    var body: some View {
        HStack(spacing: 14) {
            icon
                .accessibilityHidden(true)
            VStack(alignment: .leading, spacing: 2) {
                Text(label)
                    .font(EscFont.ui(16, .medium))
                    .foregroundStyle(Esc.mist.opacity(0.8))
                Text(sub)
                    .font(EscFont.ui(13))
                    .foregroundStyle(Esc.haze.opacity(0.7))
                    .fixedSize(horizontal: false, vertical: true)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            right
        }
        .padding(.vertical, 16)
        .frame(minHeight: 56)
        .contentShape(Rectangle())
        // Toggle rows: the whole row is the (56 pt+) target; the toggle's own button still wins.
        .onTapGesture { onTap?() }
        .overlay(alignment: .bottom) {
            Rectangle()
                .fill(Esc.hairlineSoft)
                .frame(height: 1)
        }
    }
}

// MARK: - Previews



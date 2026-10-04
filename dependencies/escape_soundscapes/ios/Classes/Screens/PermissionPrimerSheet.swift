import SwiftUI

// Ported from SupportingScreens.tsx: PermissionPrimer.
//
// Shown before the system permission dialog when the user turns on an input in YourInputsSheet.
// Copy comes from `content.permissionPrimer[weather|heart|calendar]` for `store.permissionTarget`.
// "Allow" triggers the OS prompt (store.allowPermission); "Not now" goes back to Your Inputs.

@available(iOS 17.0, *)
struct PermissionPrimerSheet: View {
    @Environment(AppStore.self) private var store

    var body: some View {
        BottomSheet(onClose: { store.declinePermission() }) {
            VStack(spacing: 20) {
                art
                copy
                PrimaryButton(label: "Allow") {
                    Task { await store.allowPermission() }
                }
                notNowButton
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 24)
            .padding(.bottom, 40)
        }
    }

    // MARK: Copy

    private var key: String {
        switch store.permissionTarget {
        case .heart: "heart"
        case .calendar: "calendar"
        default: "weather"
        }
    }

    private var primer: ContentBundle.PrimerCopy {
        if let c = store.content?.permissionPrimer[key] { return c }
        switch key {
        case "heart":
            return .init(title: "Let Lucille follow your heartbeat",
                         body: "Heart rate helps Lucille slow the pulse when your body is racing.", placeholder: true)
        case "calendar":
            return .init(title: "Let Lucille plan around your day",
                         body: "Your calendar lets Lucille switch to Focus for deep-work blocks.", placeholder: true)
        default:
            return .init(title: "Let Lucille match today's weather",
                         body: "Your location helps Lucille reflect the outside world in your soundscape.", placeholder: nil)
        }
    }

    // MARK: Pieces

    /// 80 pt circle: radial-gradient(circle, rgba(185,163,240,0.3), rgba(57,81,159,0.1)), 1.5 px lilac border.
    private var art: some View {
        Circle()
            .fill(RadialGradient.cssCircle([Color(hex: 0xB9A3F0, opacity: 0.3), Color(hex: 0x39519F, opacity: 0.1)], box: 80))
            .overlay(Circle().strokeBorder(Color(hex: 0xB9A3F0, opacity: 0.3), lineWidth: 1.5))
            .overlay(Icon(.soundwave, size: 36, color: Esc.lilac))
            .frame(width: 80, height: 80)
            .accessibilityHidden(true)
    }

    private var copy: some View {
        let p = primer
        return VStack(spacing: 8) {
            Text(p.title)
                .font(EscFont.display(22))
                .foregroundStyle(Esc.mist)
                .accessibilityAddTraits(.isHeader)
            Text(p.body)
                .font(EscFont.ui(15))
                .foregroundStyle(Esc.haze)
                .lineSpacing(15 * 0.6)
        }
        .multilineTextAlignment(.center)
        .fixedSize(horizontal: false, vertical: true)
    }

    private var notNowButton: some View {
        Button { store.declinePermission() } label: {
            Text("Not now")
                .font(EscFont.ui(15))
                .foregroundStyle(Esc.haze)
                .padding(.vertical, 1)
                .padding(.horizontal, 6)
                .contentShape(Rectangle().inset(by: -12))
        }
        .buttonStyle(EscPressStyle())
    }
}

// MARK: - Previews





import ManagedSettings
import ManagedSettingsUI
import UIKit

/// Escape-branded screen iOS shows on an app Focus Shield is blocking.
/// Template class name kept so the Info.plist principal class still matches.
class ShieldConfigurationExtension: ShieldConfigurationDataSource {

    // Escape palette (matches the Soundscapes module).
    private let night = UIColor(red: 0x12 / 255, green: 0x0D / 255, blue: 0x24 / 255, alpha: 1)
    private let ember = UIColor(red: 0xEF / 255, green: 0x77 / 255, blue: 0x02 / 255, alpha: 1)
    private let lilac = UIColor(red: 0xB9 / 255, green: 0xA3 / 255, blue: 0xF0 / 255, alpha: 1)
    private let mist = UIColor(white: 1, alpha: 0.78)

    override func configuration(shielding application: Application) -> ShieldConfiguration {
        escape(name: application.localizedDisplayName)
    }

    override func configuration(shielding application: Application, in category: ActivityCategory) -> ShieldConfiguration {
        escape(name: application.localizedDisplayName)
    }

    override func configuration(shielding webDomain: WebDomain) -> ShieldConfiguration {
        escape(name: webDomain.domain)
    }

    override func configuration(shielding webDomain: WebDomain, in category: ActivityCategory) -> ShieldConfiguration {
        escape(name: webDomain.domain)
    }

    private func escape(name: String?) -> ShieldConfiguration {
        let what = (name?.isEmpty == false) ? name! : "This app"
        let icon = UIImage(systemName: "sparkles",
                           withConfiguration: UIImage.SymbolConfiguration(pointSize: 44, weight: .light))?
            .withTintColor(ember, renderingMode: .alwaysOriginal)
        return ShieldConfiguration(
            backgroundBlurStyle: .systemUltraThinMaterialDark,
            backgroundColor: night.withAlphaComponent(0.92),
            icon: icon,
            title: ShieldConfiguration.Label(text: "Lucille is holding this space", color: .white),
            subtitle: ShieldConfiguration.Label(
                text: "You're in an Escape soundscape. \(what) opens again when your session ends. Take a slow breath and come back to the sound.",
                color: mist),
            primaryButtonLabel: ShieldConfiguration.Label(text: "Close", color: .white),
            primaryButtonBackgroundColor: ember,
            secondaryButtonLabel: nil)
    }
}

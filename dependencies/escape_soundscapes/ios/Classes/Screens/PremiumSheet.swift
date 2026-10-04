import SwiftUI

// Ported from SupportingScreens.tsx `PremiumSheet`.
// Title + body → selectable plan cards (radio, "Best value" badge, price) → Subscribe → Restore → legal.
// Copy and plans come from `content.premium`; the selection is `store.premiumPlanId`.

@available(iOS 17.0, *)
struct PremiumSheet: View {
    @Environment(AppStore.self) private var store
    @State private var purchasing = false
    @State private var restoring = false

    private var copy: ContentBundle.PremiumCopy? { store.content?.premium }
    private var plans: [PremiumPlan] { copy?.plans ?? Self.figmaPlans }

    var body: some View {
        BottomSheet(onClose: { store.closeSheet() }) {
            VStack(spacing: 20) {
                intro
                ForEach(plans) { plan in
                    PlanCard(plan: plan, selected: plan.id == store.premiumPlanId) {
                        store.premiumPlanId = plan.id
                    }
                }
                subscribeButton
                restoreButton
                Text(copy?.legal ?? "Cancel anytime. No lock-in. Billed by the App Store.")
                    .font(EscFont.ui(11))
                    .foregroundStyle(Esc.haze)
                    .multilineTextAlignment(.center)
                    .lineSpacing(11 * 0.6)
                    .frame(maxWidth: .infinity)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 32)
        }
        .onAppear {
            // useState("yearly") in the TSX: every opening starts on the default plan.
            store.premiumPlanId = copy?.defaultPlan ?? "yearly"
        }
    }

    // MARK: Pieces

    private var intro: some View {
        VStack(spacing: 8) {
            Text(copy?.title ?? "Escape Premium")
                .font(EscFont.display(26))
                .foregroundStyle(Esc.mist)
                .accessibilityAddTraits(.isHeader)
            Text(copy?.body ?? "Unlimited compositions, every Realm, offline downloads, and Layers.")
                .font(EscFont.ui(15))
                .foregroundStyle(Esc.haze)
                .lineSpacing(15 * 0.5)
                .fixedSize(horizontal: false, vertical: true)
        }
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity)
    }

    private var subscribeButton: some View {
        PrimaryButton(label: purchasing ? "" : (copy?.cta ?? "Subscribe"),
                      disabled: purchasing || restoring || store.isBusy) {
            Task {
                purchasing = true
                await store.purchase()
                purchasing = false
            }
        }
        .overlay {
            if purchasing {
                ProgressView()
                    .tint(.white)
                    .accessibilityLabel("Purchasing")
            }
        }
    }

    private var restoreButton: some View {
        Button {
            Task {
                restoring = true
                await store.restorePurchases()
                restoring = false
            }
        } label: {
            Text(copy?.restore ?? "Restore purchases")
                .font(EscFont.ui(14))
                .foregroundStyle(Esc.haze)
                .opacity(restoring ? 0.5 : 1)
                .contentShape(Rectangle())
        }
        .buttonStyle(EscPressStyle())
        .disabled(purchasing || restoring)
        .frame(maxWidth: .infinity)
    }

    /// The Figma's plans, used only before the content bundle has loaded.
    private static let figmaPlans: [PremiumPlan] = [
        PremiumPlan(id: "monthly", label: "Monthly", price: "$9.99/mo", description: "Billed monthly",
                    recommended: false, productId: "escape.premium.monthly"),
        PremiumPlan(id: "yearly", label: "Yearly", price: "$59.99/yr", description: "Billed annually · save 50%",
                    recommended: true, productId: "escape.premium.yearly"),
    ]
}

// MARK: - Plan card

@available(iOS 17.0, *)
private struct PlanCard: View {
    let plan: PremiumPlan
    let selected: Bool
    let onSelect: () -> Void

    var body: some View {
        Button(action: onSelect) {
            HStack(spacing: 16) {
                radio
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 8) {
                        Text(plan.label)
                            .font(EscFont.ui(15, .semibold))
                            .foregroundStyle(Esc.mist)
                        if plan.recommended { badge }
                    }
                    Text(plan.description)
                        .font(EscFont.ui(13))
                        .foregroundStyle(Esc.haze)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                // Display string from the content bundle. In production show StoreKit's localized
                // price instead (`Product.products(for: [plan.productId]).first?.displayPrice`).
                Text(plan.price)
                    .font(EscFont.display(18))
                    .foregroundStyle(Esc.mist)
                    .lineLimit(1)
                    .fixedSize()
            }
            .padding(17.5) // 16px padding inside a 1.5px border
            .background(selected ? Color(hex: 0x39519F, opacity: 0.3) : Esc.cardSoft,
                        in: RoundedRectangle(cornerRadius: 16))
            .overlay(RoundedRectangle(cornerRadius: 16)
                .strokeBorder(selected ? Color(hex: 0x39519F, opacity: 0.8) : Color(hex: 0xE6EAF4, opacity: 0.1),
                              lineWidth: 1.5))
            .contentShape(RoundedRectangle(cornerRadius: 16))
        }
        .buttonStyle(EscPressStyle())
        .accessibilityElement(children: .combine)
        .accessibilityAddTraits(selected ? [.isButton, .isSelected] : .isButton)
    }

    private var radio: some View {
        Circle()
            .strokeBorder(selected ? Esc.lilac : Color(hex: 0xE6EAF4, opacity: 0.3), lineWidth: 1.5)
            .frame(width: 20, height: 20)
            .overlay {
                if selected {
                    Circle()
                        .fill(Esc.lilac)
                        .frame(width: 10, height: 10)
                }
            }
    }

    private var badge: some View {
        Text("Best value")
            .font(EscFont.ui(10, .semibold))
            .tracking(10 * 0.06)
            .foregroundStyle(Esc.ember)
            .padding(.vertical, 3)   // 2px + 1px border
            .padding(.horizontal, 9) // 8px + 1px border
            .background(Color(hex: 0xEF7702, opacity: 0.2), in: Capsule())
            .overlay(Capsule().strokeBorder(Color(hex: 0xEF7702, opacity: 0.4), lineWidth: 1))
            .fixedSize()
    }
}

// MARK: - Previews



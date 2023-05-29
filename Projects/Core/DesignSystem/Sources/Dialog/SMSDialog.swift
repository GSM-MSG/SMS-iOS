import SwiftUI
import ViewUtil

public extension View {
    func smsAlert(
        title: String,
        description: String,
        alertAction: [SMSAlertButtonType],
        isShowing: Binding<Bool>
    ) -> some View {
        modifier(
            SMSAlertModifier(
                title: title,
                description: description,
                alertAction: alertAction,
                isShowing: isShowing
            )
        )
    }
}

struct SMSAlertModifier: ViewModifier {
    var title: String
    var description: String
    var alertAction: [SMSAlertButtonType]
    @Binding var isShowing: Bool

    public init(
        title: String,
        description: String,
        alertAction: [SMSAlertButtonType],
        isShowing: Binding<Bool>
    ) {
        self.title = title
        self.description = description
        self.alertAction = alertAction
        _isShowing = isShowing
    }

    func body(content: Content) -> some View {
        ZStack {
            content

            if isShowing {
                Color.sms(.system(.black))
                    .opacity(0.25)
                    .ignoresSafeArea()

                smsAlert()
                    .padding(40)
                    .transition(
                        .asymmetric(
                            insertion: AnyTransition.move(edge: .bottom),
                            removal: .move(edge: .bottom).combined(with: .opacity)
                        )
                    )
            }
        }
        .animation(.spring(response: 0.3, dampingFraction: isShowing ? 0.7 : 0.6, blendDuration: 40), value: isShowing)
    }

    @ViewBuilder
    func smsAlert() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .smsFont(.title2, color: .system(.black))

                Text(description)
                    .smsFont(.body1, color: .neutral(.n40))
            }
            .padding(.bottom, 36)

            HStack(spacing: 8) {
                ForEach(alertAction, id: \.self) { button in
                    CTAButton(text: button.text ?? "", style: button.style ?? .default, action: button.action ?? { })
                }
            }
        }
        .padding(24)
        .background(Color.sms(.system(.white)))
        .cornerRadius(16)
    }
}

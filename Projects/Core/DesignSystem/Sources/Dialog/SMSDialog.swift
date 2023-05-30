import SwiftUI
import ViewUtil

public extension View {
    func smsAlert(
        title: String,
        description: String,
        isShowing: Binding<Bool>,
        alertActions: [SMSAlertButtonType]
    ) -> some View {
        modifier(
            SMSAlertModifier(
                title: title,
                description: description,
                isShowing: isShowing,
                alertActions: alertActions
            )
        )
    }
}

struct SMSAlertModifier: ViewModifier {
    var title: String
    var description: String
    @Binding var isShowing: Bool
    var alertActions: [SMSAlertButtonType]

    public init(
        title: String,
        description: String,
        isShowing: Binding<Bool>,
        alertActions: [SMSAlertButtonType]
    ) {
        self.title = title
        self.description = description
        _isShowing = isShowing
        self.alertActions = alertActions
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
                ForEach(alertActions, id: \.id) { button in
                    CTAButton(text: button.text, style: button.style, action: button.action)
                }
            }
        }
        .padding(24)
        .background(Color.sms(.system(.white)))
        .cornerRadius(16)
    }
}

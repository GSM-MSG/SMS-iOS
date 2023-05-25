import SwiftUI
import ViewUtil

public extension View {
    func smsDialog(
        title: String,
        description: String,
        checkText: String,
        cancelText: String,
        checkAction: @escaping () -> Void = {},
        cancelAction: @escaping () -> Void = {},
        isShowing: Binding<Bool>
    ) -> some View {
        modifier(
            SMSDialogModifier(
                title: title,
                description: description,
                checkText: checkText,
                cancelText: cancelText,
                checkAction: checkAction,
                cancelAction: cancelAction,
                isShowing: isShowing
            )
        )
    }
}

struct SMSDialogModifier: ViewModifier {
    var title: String
    var description: String
    var checkText: String
    var cancelText: String
    var checkAction: () -> Void
    var cancelAction: () -> Void
    @Binding var isShowing: Bool

    public init(
        title: String,
        description: String,
        checkText: String,
        cancelText: String,
        checkAction: @escaping () -> Void = {},
        cancelAction: @escaping () -> Void = {},
        isShowing: Binding<Bool>
    ) {
        self.title = title
        self.description = description
        self.checkText = checkText
        self.cancelText = cancelText
        self.checkAction = checkAction
        self.cancelAction = cancelAction
        _isShowing = isShowing
    }

    func body(content: Content) -> some View {
        ZStack {
            content
                .background(Color.blue)
            if isShowing {
                Rectangle().foregroundColor(Color.black.opacity(0.6))
                    .ignoresSafeArea()

                ZStack {
                    smsDialog()
                }
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
    func smsDialog() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .smsFont(.title2, color: .system(.black))

                Text(description)
                    .smsFont(.body1, color: .neutral(.n40))
            }
            .padding(.bottom, 36)

            HStack(spacing: 8) {
                CTAButton(text: cancelText, style: .outline, action: cancelAction)

                CTAButton(text: checkText, style: .default, action: checkAction)
            }
        }
        .padding(24)
        .background(Color.sms(.system(.white)))
        .cornerRadius(16)
    }
}

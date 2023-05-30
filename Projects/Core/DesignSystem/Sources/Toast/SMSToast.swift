import SwiftUI
import ViewUtil

public extension View {
    func smsToast<IconView: View>(
        text: String,
        isShowing: Binding<Bool>,
        @ViewBuilder iconView: @escaping () -> IconView = { SMSIcon(.check) }
    ) -> some View {
        self.modifier(SMSToast(text: text, isShowing: isShowing, iconView: iconView))
    }
}

public struct SMSToast<IconView: View>: ViewModifier {
    var text: String
    @Binding var isShowing: Bool
    var iconView: () -> IconView

    public init(
        text: String,
        isShowing: Binding<Bool>,
        @ViewBuilder iconView: @escaping () -> IconView = { SMSIcon(.check) }
    ) {
        self.text = text
        _isShowing = isShowing
        self.iconView = iconView
    }

    public func body(content: Content) -> some View {
        ZStack {
            content

            toastView()
        }
        .onChange(of: isShowing) { _ in
            if isShowing {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        isShowing = false
                    }
                }
            }
        }
    }

    @ViewBuilder
    func toastView() -> some View {
        VStack {
            if isShowing {
                HStack(spacing: 4) {
                    iconView()

                    SMSText(text, font: .body1)
                        .foregroundColor(.sms(.system(.black)))
                }
                .padding(.vertical, 13.5)
                .padding(.horizontal, 16)
                .background {
                    Capsule()
                        .fill(Color.sms(.system(.white)))
                }
                .shadow(color: .sms(.system(.black)).opacity(0.08), radius: 16, y: 2)
                .opacity(isShowing ? 1 : 0)
                .transition(.move(edge: .top).combined(with: AnyTransition.opacity.animation(.easeInOut)))
                .onTapGesture {
                    withAnimation {
                        isShowing = false
                    }
                }
            }

            Spacer()
        }
        .animation(.interactiveSpring(response: 0.7, dampingFraction: 1, blendDuration: 0), value: isShowing)
    }
}

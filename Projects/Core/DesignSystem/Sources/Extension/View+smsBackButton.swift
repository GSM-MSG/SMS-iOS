import SwiftUI

struct SMSBackButtonModifier: ViewModifier {
    let dismiss: DismissAction
    let willDismiss: () -> Void

    init(
        dismiss: DismissAction,
        willDismiss: @escaping () -> Void = {}
    ) {
        self.dismiss = dismiss
        self.willDismiss = willDismiss
    }

    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        willDismiss()
                        dismiss()
                    } label: {
                        SMSIcon(.leftArrow, width: 24, height: 24)
                    }
                }
            }
    }
}

public extension View {
    func smsBackButton(
        dismiss: DismissAction,
        willDismiss: @escaping () -> Void = {}
    ) -> some View {
        self
            .modifier(SMSBackButtonModifier(dismiss: dismiss, willDismiss: willDismiss))
    }
}

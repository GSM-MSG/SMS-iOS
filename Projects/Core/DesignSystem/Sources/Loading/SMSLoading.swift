import SwiftUI

public extension View {
    func smsLoading(
        isLoading: Binding<Bool>
    ) -> some View {
        self.modifier(SMSLoadingModifier(isLoading: isLoading))
    }
}

struct SMSLoadingModifier: ViewModifier {
    @Binding var isLoading: Bool

    func body(content: Content) -> some View {
        content
            .overlay {
                ZStack {
                    Color.sms(.neutral(.n40))
                        .opacity(0.3)
                        .ignoresSafeArea()

                    ProgressView()
                        .progressViewStyle(.circular)
                }
                .conditional(isLoading)
            }
    }
}

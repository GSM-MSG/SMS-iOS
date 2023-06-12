import SwiftUI
import ViewUtil

public extension View {
    func smsLoading(
        isLoading: Bool
    ) -> some View {
        self.modifier(SMSLoadingModifier(isLoading: isLoading))
    }
}

struct SMSLoadingModifier: ViewModifier {
    var isLoading: Bool

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

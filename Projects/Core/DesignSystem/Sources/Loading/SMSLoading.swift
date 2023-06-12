import SwiftUI
import ViewUtil
import Lottie

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
        ZStack {
            content

            if isLoading {
                Color.sms(.neutral(.n40))
                    .opacity(0.3)
                    .ignoresSafeArea()

                LottieView(asset: AnimationAsset.smsLoading, contentMode: .scaleAspectFit)
                    .frame(width: 80, height: 80)
            }
        }
    }
}

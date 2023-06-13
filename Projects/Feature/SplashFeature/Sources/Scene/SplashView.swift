import BaseFeature
import DesignSystem
import SwiftUI

struct SplashView: View {
    @StateObject var container: MVIContainer<SplashIntentProtocol, SplashStateProtocol>
    var intent: any SplashIntentProtocol { container.intent }
    var state: any SplashStateProtocol { container.model }

    var body: some View {
        DesignSystemAsset.Icons.smsSplashLogo.swiftUIImage
            .frame(width: 88, height: 88)
            .onAppear {
                intent.onAppear()
            }
    }
}

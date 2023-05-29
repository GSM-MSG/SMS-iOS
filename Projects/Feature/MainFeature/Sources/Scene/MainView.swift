import SwiftUI
import BaseFeature
import ViewUtil
import DesignSystem

struct MainView: View {
    @StateObject var container: MVIContainer<MainIntentProtocol, MainStateProtocol>
    var intent: any MainIntentProtocol { container.intent }
    var state: any MainStateProtocol { container.model }

    var body: some View {
        HStack(spacing: 16) {
            SMSImage(.smsLogo)
            Spacer()
            SMSIcon(.filter)
            SMSIcon(.profile)
        }
        .padding(.horizontal, 20)
    }
}

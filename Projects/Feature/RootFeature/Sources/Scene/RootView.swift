import BaseFeature
import SwiftUI

struct RootView: View {
    @StateObject var container: MVIContainer<RootIntentProtocol, RootStateProtocol>
    var intent: any RootIntentProtocol { container.intent }
    var state: any RootStateProtocol { container.model }

    var body: some View {
        EmptyView()
    }
}

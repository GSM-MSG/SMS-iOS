import SwiftUI
import BaseFeature
import ViewUtil

struct MainView: View {
    @StateObject var container: MVIContainer<MainIntentProtocol, MainStateProtocol>
    var intent: any MainIntentProtocol { container.intent }
    var state: any MainStateProtocol { container.model }

    var body: some View {
        Text("asdf")
    }
}

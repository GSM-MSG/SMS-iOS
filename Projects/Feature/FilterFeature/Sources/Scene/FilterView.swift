import SwiftUI
import BaseFeature
import ViewUtil

struct FilterView: View {
    @StateObject var container: MVIContainer<FilterIntentProtocol, FilterStateProtocol>
    var intent: any FilterIntentProtocol { container.intent }
    var state: any FilterStateProtocol { container.model }

    var body: some View {
        Text("Filter")
    }
}

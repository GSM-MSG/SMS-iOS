import BaseFeature
import SwiftUI

struct TechStackAppendView: View {
    @StateObject var container: MVIContainer<TechStackAppendIntentProtocol, TechStackAppendStateProtocol>
    var intent: any TechStackAppendIntentProtocol { container.intent }
    var state: any TechStackAppendStateProtocol { container.model }

    var body: some View {
        EmptyView()
    }
}

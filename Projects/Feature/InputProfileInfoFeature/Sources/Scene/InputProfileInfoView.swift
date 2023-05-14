import BaseFeature
import SwiftUI

struct InputProfileInfoView: View {
    @StateObject var container: MVIContainer<InputProfileInfoIntentProtocol, InputProfileInfoStateProtocol>
    var intent: any InputProfileInfoIntentProtocol { container.intent }
    var state: any InputProfileInfoStateProtocol { container.model }

    var body: some View {
        Text("Hello, World!")
    }
}

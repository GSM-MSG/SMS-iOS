import BaseFeature
import SwiftUI

struct InputWorkInfoView: View {
    @StateObject var container: MVIContainer<InputWorkInfoIntentProtocol, InputWorkInfoStateProtocol>
    var intent: any InputWorkInfoIntentProtocol { container.intent }
    var state: any InputWorkInfoStateProtocol { container.model }

    var body: some View {
        Text("Hello, World!")
    }
}

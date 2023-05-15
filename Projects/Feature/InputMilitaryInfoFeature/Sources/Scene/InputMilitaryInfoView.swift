import BaseFeature
import SwiftUI

struct InputMilitaryInfoView: View {
    @StateObject var container: MVIContainer<InputMilitaryInfoIntentProtocol, InputMilitaryInfoStateProtocol>
    var intent: any InputMilitaryInfoIntentProtocol { container.intent }
    var state: any InputMilitaryInfoStateProtocol { container.model }

    var body: some View {
        Text("Hello, World!")
    }
}

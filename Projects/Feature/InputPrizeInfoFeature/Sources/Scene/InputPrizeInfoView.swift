import SwiftUI
import BaseFeature
import DesignSystem
import ViewUtil

struct InputPrizeInfoView: View {
    @StateObject var container: MVIContainer<InputPrizeInfoIntentProtocol, InputPrizeInfoStateProtocol>
    var intent: any InputPrizeInfoIntentProtocol { container.intent }
    var state: any InputPrizeInfoStateProtocol { container.model }

    var body: some View {
        Text("Adf")
    }
}

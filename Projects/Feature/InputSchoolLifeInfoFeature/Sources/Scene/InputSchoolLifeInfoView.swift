import BaseFeature
import SwiftUI

struct InputSchoolLifeInfoView: View {
    @StateObject var container: MVIContainer<InputSchoolLifeInfoIntentProtocol, InputSchoolLifeInfoStateProtocol>
    var intent: any InputSchoolLifeInfoIntentProtocol { container.intent }
    var state: any InputSchoolLifeInfoStateProtocol { container.model }

    var body: some View {
        Text("Hello, World!")
    }
}

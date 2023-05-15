import BaseFeature
import SwiftUI

struct InputCertificateInfoView: View {
    @StateObject var container: MVIContainer<InputCertificateInfoIntentProtocol, InputCertificateInfoStateProtocol>
    var intent: any InputCertificateInfoIntentProtocol { container.intent }
    var state: any InputCertificateInfoStateProtocol { container.model }

    var body: some View {
        Text("Hello, World!")
    }
}

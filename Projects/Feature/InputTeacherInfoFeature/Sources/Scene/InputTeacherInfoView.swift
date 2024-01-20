import BaseFeature
import SwiftUI

struct InputTeacherInfoView: View {
    @StateObject var container: MVIContainer<InputTeacherInfoIntentProtocol, InputTeacherInfoStateProtocol>
    var intent: any InputTeacherInfoIntentProtocol { container.intent }
    var state: any InputTeacherInfoStateProtocol { container.model }
    
    var body: some View {
        Text("Hello, World!")
    }
}
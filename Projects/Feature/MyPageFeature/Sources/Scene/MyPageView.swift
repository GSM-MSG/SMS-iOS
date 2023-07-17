import BaseFeature
import SwiftUI

struct MyPageView: View {
    @StateObject var container: MVIContainer<MyPageIntentProtocol, MyPageStateProtocol>
    var intent: any MyPageIntentProtocol { container.intent }
    var state: any MyPageStateProtocol { container.model }

    var body: some View {
        EmptyView()
    }
}

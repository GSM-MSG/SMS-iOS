import SwiftUI
import BaseFeature
import DesignSystem
import GlobalThirdPartyLibrary
import ViewUtil
import UtilityModule

struct SigninView: View {
    @StateObject var container: MVIContainer<SigninIntentProtocol, SigninStateProtocol>
    var intent: any SigninIntentProtocol { container.intent }
    var state: any SigninStateProtocol { container.model }

    var body: some View {
        HStack {
            Text("Student\nManagement\nService")
                .multilineTextAlignment(.center)

            GAuthButtonView { code in
                container.intent.signin(code: code)
            }
        }
//        .alert("title", isPresented: Binding(get: { state.isError }, set: { _ in intent.showAlert() })) {
//            Button("OK", role: .destructive) { print("asdf") }
//            Button("cancel", role: .cancel) { print("qw1wqe")}
//        }
//        .alert(isPresented: Binding(get: { state.isError }, set: { _ in intent.showAlert() })) {
//            Button("OK", role: .cancel) {
//                print("Asdf")
//            }
//        }
    }
}

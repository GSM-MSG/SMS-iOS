import DesignSystem
import SwiftUI

public struct DemoView: View {
    @State var isShowing = false

    public var body: some View {
        VStack {
            Button {
                self.isShowing = true
            } label: {
                Text("A")
            }
        }
        .smsToast(text: "ASDF", isShowing: $isShowing)
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DemoView()
        }
    }
}

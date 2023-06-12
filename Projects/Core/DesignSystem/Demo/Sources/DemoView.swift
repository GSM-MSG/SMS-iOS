import DesignSystem
import SwiftUI

public struct DemoView: View {
    @State var isLoading = false

    public var body: some View {
        VStack {
            Button {
                withAnimation {
                    self.isLoading = true
                }
            } label: {
                Text("A")
            }
        }
        .smsLoading(isLoading: isLoading)
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DemoView()
        }
    }
}

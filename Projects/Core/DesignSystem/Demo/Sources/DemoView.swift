import DesignSystem
import SwiftUI

public struct DemoView: View {
    @State var isLoading = false

    public var body: some View {
        VStack {
            SMSTextField(text: .constant("asd"))
        }
        .padding(.horizontal, 20)
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DemoView()
        }
    }
}

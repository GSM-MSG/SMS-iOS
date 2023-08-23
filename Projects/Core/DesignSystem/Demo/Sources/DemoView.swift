import DesignSystem
import SwiftUI

public struct DemoView: View {
    @State var isLoading = false

    public var body: some View {
        VStack {
            SMSPageControl(pageCount: 8, selectedPage: 2)
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

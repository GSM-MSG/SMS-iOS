import DesignSystem
import SwiftUI

public struct DemoView: View {
    @State var isShowing = false

    public var body: some View {
        VStack {
            SMSCheckbox(isSelected: $isShowing)
        }
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DemoView()
        }
    }
}

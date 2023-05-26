import DesignSystem
import SwiftUI

public struct DemoView: View {
    @State var text = ""

    public var body: some View {
        VStack {
            Group {
                SMSTextField("ASDF", text: $text)
            }
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
